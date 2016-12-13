start "" cmd /k escript master.erl


del wprker.beam
erlc worker.erl
:: erl -noshell -s program main foo bar -s init stop
:: http://stackoverflow.com/a/31872530/539470

set MYIP=127.0.0.1
set MASTERNODE=m1@127.0.0.1

start "" erl -name w1@%MYIP% -smp enable -setcookie qazwsx123 -s worker start %MASTERNODE%
start "" erl -name w2@%MYIP% -smp enable -setcookie qazwsx123 -s worker start %MASTERNODE%
start "" erl -name w3@%MYIP% -smp enable -setcookie qazwsx123 -s worker start %MASTERNODE%
start "" erl -name w4@%MYIP% -smp enable -setcookie qazwsx123 -s worker start %MASTERNODE%
start "" erl -name w5@%MYIP% -smp enable -setcookie qazwsx123 -s worker start %MASTERNODE%
start "" erl -name w6@%MYIP% -smp enable -setcookie qazwsx123 -s worker start %MASTERNODE%
