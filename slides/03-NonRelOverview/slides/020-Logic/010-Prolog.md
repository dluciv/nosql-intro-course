## Prolog

### База фактов

    parent('Шарик', 'Бобик').
    parent('Жучка', 'Бобик').

### База правил

    brother_or_sister(A, B) :-
      parent(X, A),
      parent(X, B).
    
### Отсечение 

    sibling(A, B) :-
      parent(X, A),
      !,
      parent(X, B).

### Отсечение, ещё пример

    max(X,Y,Z) :-
      X =< Y,
      !,
      Y = Z.
    max(X,Y,X). 
