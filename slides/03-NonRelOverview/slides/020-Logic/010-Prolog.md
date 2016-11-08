## Prolog

### База фактов

    родитель('Жучка','Шарик').
    родитель('Жучка','Бобик').
    родитель('Барбос','Шарик').
    родитель('Барбос','Бобик').
    родитель('Мушка','Тишка').
    родитель('Барбос','Тишка').

### База правил

    родной_сиб(X, Y) :-
        родитель(A, X), родитель(B, X),
        A \== B,
        !,
        родитель(A, Y), родитель(B, Y),
        X \== Y.

[Попробуйте](http://swish.swi-prolog.org/) с [отсечением](https://en.wikipedia.org/wiki/Cut_(logic_programming%29) и без