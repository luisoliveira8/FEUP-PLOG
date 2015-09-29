%imprime 1 elemento por linha

imprime([H|T]) :-
	write(H), nl,
	imprime(T).
imprime([]).