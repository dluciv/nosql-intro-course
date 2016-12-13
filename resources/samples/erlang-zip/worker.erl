%% -*- erlang -*-

-module(worker).
-export([start/1]).

worker(Master) ->
  iamfree(Master).

iamfree(Master) ->
  erlang:register(worker, self()), % new process each time
  { master, Master } ! { freeworker, node() },
  receive
    { trypass, From, To } ->
      io:format("Got new job: '~s'--'~s'~n", [From, To]),
      spawn(fun () -> iambusy(From, To, Master) end)
  end.

iambusy(From, To, Master) ->
  { 'master', Master } ! { busyworker, node() },
  io:format("Going to try passwords from \"~s\" to \"~s\"...~n", [From, To]),
  FCZ = erlang:open_port(
    {spawn, io_lib:format("fcrackzip -c a -v -p ~s a.zip", [From])}, % bash will let us to kill it properly...
    [stderr_to_stdout, in, out, exit_status, {line, 255}]
  ),
  runfcz(FCZ, To, Master).

runfcz(FCZ, To, Master) ->
  receive
    {FCZ, {data, {eol, Data}}} ->
      io:format("fcrackzip output: <<<~p>>>~n", [Data]),
      Ppfo = string:str(Data, "possible pw found: ") == 1,
      if
        Ppfo ->
          case re:run(Data, "possible pw found: (.+) \(.*\)", []) of
            {match, [{0,_}, {S,L}, {_,_}]} -> begin
              Ppw = string:substr(Data, S + 1, L),
              Killfcz = fun () -> % kill fcrackzip then http://stackoverflow.com/a/13912771/539470
                {os_pid, OsPid} = erlang:port_info(FCZ, os_pid),
                Kfm = case os:type() of
                  {_, nt} -> "kill -9 -f ~p"; % oh Windows... ...
                  _ -> "kill -9 ~p"
                end,
                Ko = os:cmd(io_lib:format(Kfm, [OsPid])),
                io:format("killing fcrackzip result: ~p.~n", [Ko])
              end,
              if
                Ppw > To -> % beyound upper bound
                  { master, Master } ! { notfound },
                  Killfcz(),
                  iamfree(Master)
              ;
                true -> % test unzip ourselves
                  GoodMess = "No errors detected in compressed data of a.zip.",
                  Ccm = io_lib:format("unzip -t -P ~s a.zip | grep '~s'", [Ppw, GoodMess]),
                  Uo = os:cmd(Ccm),
                  Cor = string:str(Uo, GoodMess) =/= 0, % unzipped!
                  if
                    Cor ->
                      { master, Master } ! { foundpass, Ppw },
                      Killfcz(),
                      iamfree(Master)
                  ;
                    true -> runfcz(FCZ, To, Master)
                  end
              end
            end;
            _ -> throw(io_lib:format("Bad data received: ~p", [Data])) % malformed possible password line
          end
      ;
        true -> runfcz(FCZ, To, Master) % ignore other output
      end
  ;
    {FCZ, {exit_status, EC}} ->
      io:format("fcrackzip exited with code: ~p~n", [EC]),
      iamfree(Master)
  end
  .

start(Args) ->
  Master = hd(Args),
  io:format("Starting with master specified: ~p~n", [Master]),
  net_adm:ping(Master),
  spawn(fun () -> worker(Master) end).
