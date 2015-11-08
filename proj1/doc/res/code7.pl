checkVictory([Deck | _], Check) :-
	chec(Deck, Check).
chec([C | _], Check) :-
	if(nonvar(C), Check is 1, Check is 0).