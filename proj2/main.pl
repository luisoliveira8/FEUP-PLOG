:-use_module(library(clpfd)).
:-use_module(library(samsort)).
:-use_module(library(lists)).

solveFirst(L):-
	createListProb1(L1,L2,L3,L4),
	solveProb([L1, L2, L3, L4], L, 20).

solveSecond(L):-
	createListProb2(L1,L2,L3),
	solveProb([L1, L2, L3], L, 15).

sortAll([],[]).
sortAll([LOH | LOT], [LRH | LRT]) :-
	samsort(LOH, LRH),
	sortAll(LOT, LRT).
	
checkSum([], _).
checkSum([LH | LT], N) :-
	sum(LH, #=, N),
	checkSum(LT, N).

sortingAll([],[]).
sortingAll([LOH | LOT], [LRH | LRT]) :-
	length(LOH, Size),
	length(S, Size),
	length(LRH, Size),
	sorting(LRH, S, LOH),
	sortingAll(LOT, LRT).
	
solveProb(LOriginal, LRes, N) :-
	sortAll(LOriginal, LOrdered),
	sortingAll(LOrdered, LRes),
	transpose(LRes, LResTranspose),
	checkSum(LResTranspose, N),
	flatten(LRes, LR),
	labeling([],LR).
