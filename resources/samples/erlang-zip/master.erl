#!/usr/bin/env escript
%% -*- erlang -*-
%%! -smp enable -name m1@127.0.0.1 -setcookie qazwsx123 

-module(master).
-export([main/1]).

master() ->
  erlang:register('master', self()),
  Abc = lists:seq(hd("a"), hd("z")),
  JobPrefixes = [[X, Y, Z] || X <- Abc, Y <- Abc, Z <- Abc],
  manage(JobPrefixes).

manage(JobPrefixes) ->
  receive
    { freeworker, WorkerNode } ->
      if
        length(JobPrefixes) > 0 ->
          Hd = hd(JobPrefixes),
          Stt = string:concat(Hd, "aaa"),
          Fin = string:concat(Hd, "zzz"),
          io:format("Free worker @ ~p node, assigning it \"~s\"-\"~s\" ~n", [WorkerNode, Stt, Fin]),
          { worker, WorkerNode } ! { trypass, Stt, Fin },
          manage(tl(JobPrefixes))
      ;
        true ->
          io:format("No more work to give, goodbye.~n", [])
      end
  ;
    { busyworker, WorkerNode } ->
      io:format("Busy worker @ ~p node~n", [WorkerNode]),
      manage(JobPrefixes)
  ;
    { foundpass, Data } ->
      io:format("Found password: ~s~n", [Data]),
      manage([])
  ;
    AnythingElse ->
      io:format("Got message: ~p~n", [AnythingElse]),
      manage(JobPrefixes)
  end
.      

main(_) ->
  master().
