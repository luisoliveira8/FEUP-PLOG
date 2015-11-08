startHumanVsHuman :-
	totalDeck(Cards),
	permutacao_aleatoria(Cards,Deck),
	divideDeck(Deck, Deck_1, Deck_2, 60),
	createEmptyBoard(Board, 0, 1),
	play(Deck_1, Deck_2, Board).

playerMove(Deck, ResultDeck, Board, ResultBoard) :-	
	chooseCardsToPlace(Deck, ResultDeck, Board, ResultBoard, 5).
	
swapCards(Deck, ResultDeck, Board, ResultBoard) :-
	chooseCardsToSwap(Deck, ResultDeck, Board, ResultBoard).
	
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
	
	!,
	getCorrectPos(Col, Line, SelectedCard, NumberOfCards, Board, Deck, Check),
	!, 
	if(Check == 0,(
		removeCardFromDeck(Deck, ResultDeckT1, SelectedCard, 0, RemovedCard),
		putOnBoard(Line, Col, RemovedCard, Board, ResultBoardT1),
		checkBoardSize(ResultBoardT1, ResultBoardT2),
		
		N2 is NumberOfCards - 1,	
		if((N2 > 0),(
			write('\nDo you want to add more cards (0. - Yes | 1. - No)? '),
			get_char(Answer),
			get_char(_),
			!,
			if(Answer == '0', chooseCardsToPlace(ResultDeckT1, ResultDeck, ResultBoardT2, ResultBoard, N2), (
				ResultBoard = ResultBoardT2,
				ResultDeck = ResultDeckT1))
			),
			(
				write('\nNo more cards to play. Turn ended.\n'),
				ResultBoard = ResultBoardT2,
				ResultDeck = ResultDeckT1
			))
		),
		(
			ResultBoard = Board,
			ResultDeck = Deck
		)
	).
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% To swap cards %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
chooseCardsToSwap(Deck, ResultDeck, Board, ResultBoard) :-
	printBoard(Board),
	print5Cards(Deck, 5, 0, NumberOfCards),
	
	length(Deck, DeckLength),
	write('\nYou still have '),
	write(DeckLength),
	write(' Card(s)\nYou can try to swap '),
	write(NumberOfCards),
	write(' cards\n\n'),
	!,
	getCorrectPosToSwap(Col, Line, SelectedCard, NumberOfCards, Board, Deck, Check),
	!,
	if(Check == 0, (
		removeCardFromDeck(Deck, ResultDeckT1, SelectedCard, 0, RemovedCard),
		getCardFromBoard(Line, Col, Board, CardOnPlace),
		append([CardOnPlace], ResultDeckT1, ResultDeckT2),
		putOnBoard(Line, Col, RemovedCard, Board, ResultBoardT1),
			
		write('\nDo you want to swap more cards (0. - Yes | 1. - No)? '),
		get_char(Answer),
		get_char(_),
		if(Answer == '0', chooseCardsToSwap(ResultDeckT2, ResultDeck, ResultBoardT1, ResultBoard), (
			ResultBoard = ResultBoardT1,
			ResultDeck = ResultDeckT2))
	),(
		ResultBoard = Board,
		ResultDeck = Deck
	)).
	
play(Deck_1, Deck_2, Board) :-
	
	printPlayer1,
	printBoard(Board),
	print5Cards(Deck_1, 5, 0, _),
	
	moveMenu(Choice),
	(
		Choice == 1 -> playerMove(Deck_1, ResultDeck_1, Board, ResultBoard_1);
		Choice == 2 -> swapCards(Deck_1, ResultDeck_1, Board, ResultBoard_1);
		Choice == 3 -> (swapCardsInDeck(Deck_1, ResultDeck_1), ResultBoard_1 = Board)
	),
	checkVictory(ResultDeck_1, Check),
	if(Check == 1,
		(
			printPlayer2,
			printBoard(ResultBoard_1),
			print5Cards(Deck_2, 5, 0, _),
			
			moveMenu(Choice2),
			(
				Choice2 == 1 -> playerMove(Deck_2, ResultDeck_2, ResultBoard_1, ResultBoard_2);
				Choice2 == 2 -> swapCards(Deck_2, ResultDeck_2, ResultBoard_1, ResultBoard_2);
				Choice2 == 3 -> (swapCardsInDeck(Deck_2, ResultDeck_2), ResultBoard_2 = ResultBoard_1)
			),
			
			checkVictory(ResultDeck_2, Check2),
			if(Check2 == 1, play(ResultDeck_1, ResultDeck_2, ResultBoard_2), winMenu2)
			),winMenu1).
	
%%%%%%%%%%%%%%%%%%%%% Gets correct position %%%%%%%%%%%%%%%%%%%%%%%%%%
getCorrectPos(Col, Line, SelectedCard, NumberOfCards, Board, Deck, Check) :-
		
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
		(checkFirstPlay(Board), Check is 0);	
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
		) -> write('\nPosition Accepted\n'), Col is SelectedColumn, Line is SelectedLine, SelectedCard is SelectedCardTemp, Check is 0;
		
		write('\nPosition unaccepted\n'),
		
		write('\nDo you want to try again (0. - Yes | 1. - No)? '),
		get_char(Answer),
		get_char(_),
		if(Answer == '0', getCorrectPos(Col, Line, SelectedCard, NumberOfCards, Board, Deck, Check), Check is 1)
		
	).
	
%%%%%%%%%%%%%%%%%%%%% Gets correct position to swap %%%%%%%%%%%%%%%%%%%%%%%%%%
getCorrectPosToSwap(Col, Line, SelectedCard, NumberOfCards, Board, Deck, Check) :-
		
	write('Choose the Card to swap (end the number with"."): '),
	getSelection0(SelectedCardTemp, NumberOfCards),
				
	write('In What Line do you want to put it: '),
	getLength(Board, BoardHeight),
	length(Board, BoardLength),
	getSelection1(SelectedLine, BoardLength),
	write('In What Column do you want to put it: '),
	getSelection1(SelectedColumn, BoardHeight),
	Deck2 = Deck,
	removeCardFromDeck(Deck2, _, SelectedCardTemp, 0, RemovedCard),
	getCardFromBoard(SelectedLine, SelectedColumn, Board, CardOnPlace),
	
	(
		(checkFirstPlay(Board), Check is 1);	
		(
			checkIfWild(CardOnPlace),
			\+((checkIfACardIsInTheSpot(SelectedLine, SelectedColumn, Board))),
			checkIfLessThanFiveInLine(SelectedLine, SelectedColumn, Board, RemovedCard),
			checkIfLessThanFiveInColumn(SelectedLine, SelectedColumn, Board, RemovedCard)
		) -> write('\nSwap Position Accepted\n'), Col is SelectedColumn, Line is SelectedLine, SelectedCard is SelectedCardTemp, Check is 0;
		
		write('\nSwap Position unaccepted\n'),
		
		write('\nDo you want to try again (0. - Yes | 1. - No)? '),
		get_char(Answer),
		get_char(_),
		if(Answer == '0', getCorrectPosToSwap(Col, Line, SelectedCard, NumberOfCards, Board, Deck, Check), Check is 1)
		
	).
	
swapCardsInDeck(Deck_1, ResultDeck_1) :-
	chooseToSwap(Deck_1, ResultDeck_1, 5).

chooseToSwap(Deck, ResultDeck_1, 0) :-
	ResultDeck_1 = Deck.
chooseToSwap(Deck, ResultDeck_1, N) :-
	print5Cards(Deck, N, 0, NumberOfCards),
	getSelection0(SelectedCardTemp, NumberOfCards),
	removeCardFromDeck(Deck, ResultDeck, SelectedCardTemp, 0, RemovedCard),
	append(ResultDeck, [RemovedCard], TempDeck),
	
	write('\nDo you want to try swap more (0. - Yes | 1. - No)? '),
	get_char(Answer),
	get_char(_),
	if(Answer == '0', N1 is N - 1, N1 is 0),
	chooseToSwap(TempDeck, ResultDeck_1, N1).
	
checkVictory([Deck | _], Check) :-
	chec(Deck, Check).
	
chec([C | _], Check) :-
	if(nonvar(C), Check is 1, Check is 0).
