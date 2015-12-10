removeFromList([ListHead | ListTail], Result, 1, Elem) :-
	Result = ListTail,
	Elem = ListHead.
removeFromList([ListHead | ListTail], [ResultHead | ResultTail], Index, Elem) :-
	ResultHead = ListHead,
	I is Index - 1,
	removeFromList(ListTail, ResultTail, I, Elem).

flatten([],[]).
flatten([LH|LT], Flattened) :-
	is_list(LH),
	flatten(LH, FlattenedTemp),
	append(FlattenedTemp, LT2, Flattened),
	flatten(LT, LT2).
	
flatten([LH | LT], [LH | FlattenedT]) :-
	\+is_list(LH),
	flatten(LT, FlattenedT). 