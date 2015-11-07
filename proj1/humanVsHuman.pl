startHumanVsHuman :-
	totalDeck(Cards),
	permutacao_aleatoria(Cards,Deck),
	divideDeck(Deck, Deck_1, Deck_2, 60),
	createEmptyBoard(Board, 0, 1),
	play(Deck_1, Deck_2, Board).

playerMove(Deck, ResultDeck, Board, ResultBoard) :-	
	printBoard(Board),
	
	printFirstFive(Deck, NumberOfCards),
	
	write('\nYou can try to place '),
	write(NumberOfCards),
	write(' cards\n\n'),
	
	
	getCorrectPos(Col, Line, SelectedCard, NumberOfCards, Board, Deck),
	
	write(Col),
	
	removeCardFromDeck(Deck, ResultDeck, SelectedCard, 0, RemovedCard),
	
	putOnBoard(Line, Col, RemovedCard, Board, ResultBoard).
	
play(Deck_1, Deck_2, Board) :-
	
	printPlayer1,
	playerMove(Deck_1, ResultDeck_1, Board, ResultBoard_1),
	checkBoardSize(ResultBoard_1, ResultBoard_2),
	
	printPlayer2,
	playerMove(Deck_2, ResultDeck_2, ResultBoard_2, ResultBoard_3),
	checkBoardSize(ResultBoard_3, ResultBoard_4),
	play(ResultDeck_1, ResultDeck_2, ResultBoard_4).
	
%%%%%%%%%%%%%%%%%%%%% Gets correct position %%%%%%%%%%%%%%%%%%%%%%%%%%
getCorrectPos(Col, Line, SelectedCard, NumberOfCards, Board, Deck) :-
		
	write('Choose the Card to Play (end the number with"."): '),
	getSelection0(SelectedCardTemp, NumberOfCards),
	write('In What Line do you want to put it: '),
	getLength(Board, BoardHeight),
	length(Board, BoardLength),
	getSelection1(SelectedLine, BoardLength),
	write('In What Column do you want to put it: '),
	getSelection1(SelectedColumn, BoardHeight),
	Deck2 = Deck,
	removeCardFromDeck(Deck2, _, SelectedCardTemp, 0, RemovedCard),
	
	
	(
		checkFirstPlay(Board);	
		(
			checkIfACardIsInTheSpot(SelectedLine, SelectedColumn, Board),
			getCoordinatesAroundSpot(Line1, Line2, Column1, Column2, SelectedLine, SelectedColumn, Board),
			(
				\+((checkIfACardIsInTheSpot(Line1, SelectedColumn, Board)));
				\+((checkIfACardIsInTheSpot(SelectedLine, Column1, Board)));
				\+((checkIfACardIsInTheSpot(Line2, SelectedColumn, Board)));
				\+((checkIfACardIsInTheSpot(SelectedLine, Column2, Board)))
			),
			checkIfLessThanFiveInLine(SelectedLine, SelectedColumn, Board, RemovedCard),
			checkIfLessThanFiveInColumn(SelectedLine, SelectedColumn, Board, RemovedCard)
		) -> write('\nPosition Accepted\n'), Col is SelectedColumn, Line is SelectedLine, SelectedCard is SelectedCardTemp;
		
		write('\nPosition unaccepted\n'),
		getCorrectPos(Col, Line, SelectedCard, NumberOfCards, Board, Deck)
	).