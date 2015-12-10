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

create4RandomRings(_,0).
create4RandomRings([LHead | LTail], C) :-
	length(LHead, 9),
	C1 is C - 1,
	create4RandomRings(LTail, C1).

setDomain([], _, _).
setDomain([LHead | LTail], NMin, NMax) :-
	domain(LHead, NMin, NMax),
	setDomain(LTail, NMin, NMax).

createRandomPuzzle(L, Max) :-
	create4RandomRings(L, 4),
	setDomain(L, 0, Max),
	transpose(L, LTransposed),
	checkSum(LTransposed, 20),
	flatten(L, LRes),
	labeling([], LRes).

createUnsolvedRandomPuzzle(L, Max) :-
	create4RandomRings(L, 4),
	setDomain(L, 0, Max),
	sortingAll(L, L2),
	transpose(L2, LTransposed),
	checkSum(LTransposed, 20),
	flatten(L2, LRes),
	labeling([], LRes).
