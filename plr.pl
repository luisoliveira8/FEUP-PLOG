:-use_module(library(clpfd)).

exercise([A, B, C]) :-
	domain([A, B, C], 1, 50),
	
	A1 in 0..5,
	A2 in 0..9,
	
	B1 in 0..5,
	B2 in 0..9,
	
	B #= A * 2,
	C #= B + 10,
	A + B #> 10,
	
	A #= A1 * 10 + A2,
	B #= B1 * 10 + B2,
	
	A1 mod 2 #\= A2 mod 2,
	B1 mod 2 #= B2 mod 2,
	
	labeling([], [A, B, C]).