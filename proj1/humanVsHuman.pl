startHumanVsHuman :-
	totalDeck(Cards),
	permutacao_aleatoria(Cards,Deck),
	divideDeck(Deck, Deck_1, Deck_2, 60),
	createEmptyBoard(Board, 0, 1),
	play(Deck_1, Deck_2, Board).

playerMove(Deck, ResultDeck, Board, ResultBoard) :-	
	chooseCardsToPlace(Deck, ResultDeck, Board, ResultBoard, 5).
	
chooseCardsToPlace(_, _, ResultBoard, ResultBoard, 0).
chooseCardsToPlace(Deck, ResultDeck, Board, ResultBoard, N) :-
	printBoard(Board),
	
	print5Cards(Deck, N, 0, NumberOfCards),
	
	length(Deck, DeckLength),
	write('\nYou still have '),
	write(DeckLength),
	write(' Card(s)\nYou can try to place '),
	
	write(NumberOfCards),
	write(' cards\n\n'),
	
	getCorrectPos(Col, Line, SelectedCard, NumberOfCards, Board, Deck),
		
	removeCardFromDeck(Deck, ResultDeckT1, SelectedCard, 0, RemovedCard),
	
	putOnBoard(Line, Col, RemovedCard, Board, ResultBoardT1),
	
	checkBoardSize(ResultBoardT1, ResultBoardT2),
	
	N2 is NumberOfCards - 1,	
	
	N2 > 0 -> (
		write('\nDo you want to add more cards (0. - Yes | 1. - No)? '),
		get_char(Answer),
		get_char(_),
		if(Answer == '0', chooseCardsToPlace(ResultDeckT1, ResultDeck, ResultBoardT2, ResultBoard, N2), (
			ResultBoard = ResultBoardT2,
			ResultDeck = ResultDeckT1))
	).
	
play(Deck_1, Deck_2, Board) :-
	
	printPlayer1,
	playerMove(Deck_1, ResultDeck_1, Board, ResultBoard_1),
	
	printPlayer2,
	playerMove(Deck_2, ResultDeck_2, ResultBoard_1, ResultBoard_2),
	play(ResultDeck_1, ResultDeck_2, ResultBoard_2).
	
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