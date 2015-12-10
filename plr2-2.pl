:-use_module(library(clpfd)).

exercise(L) :-
		length(L, 12),
		domain(L, 0, 5),
		
		L = [S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12],
		
		sum([S1, S2, S3, S4], #=, 5),
		sum([S4, S5, S6, S7], #=, 5),
		sum([S7, S8, S9, S10], #=, 5),
		sum([S10, S11, S12, S1], #=, 5),
		
		labeling([], L),
		
		write(L).