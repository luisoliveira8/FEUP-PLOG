getChar(In) :-
	get_char(In),
	get_char(_).

permutacao_aleatoria([],[]).
permutacao_aleatoria(L,[E|Acc]):- 
	length(L, N),
	random(0, N, R),
	nth0(R, L, E),
	list_delete(L, R, L1),
	permutacao_aleatoria(L1, Acc).
	
list_delete([_|L], 0, L):-
	!.
list_delete([X|L], N, [X|Lf]):-
	N1 is N -1,
	list_delete(L, N1, Lf).
	
getInt(Input):-
	read(TempInput),
	get_code(_),
	Input is TempInput.
	
getSelection0(SelectedCard, NumberOfCards) :-
	getInt(In),
	(
		In > -1,	In < NumberOfCards -> SelectedCard is In;
		
		write('\nWrong input, write again: '),
		getSelection0(SelectedCard, NumberOfCards)
	).
	
getSelection1(SelectedCard, NumberOfCards) :-
	getInt(In),
	(
		In > 0,	In < NumberOfCards + 1 -> SelectedCard is In - 1;
		
		write('\nWrong input, write again: '),
		getSelection1(SelectedCard, NumberOfCards)
	).