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
	write('Choose the Card to Play (end the number with"."): '),
	
	getSelection0(SelectedCard, NumberOfCards),
	
	write('In What Line do you want to put it: '),
	getLength(Board, BoardHeight),
	length(Board, BoardLength),
	getSelection1(SelectedLine, BoardLength),
	write('In What Column do you want to put it: '),
	getSelection1(SelectedColumn, BoardHeight),
	
	removeCardFromDeck(Deck, ResultDeck, SelectedCard, 0, RemovedCard),
	
	putOnBoard(SelectedLine, SelectedColumn, RemovedCard, Board, ResultBoard).
	
play(Deck_1, Deck_2, Board) :-
	
	printPlayer1,
	playerMove(Deck_1, ResultDeck_1, Board, ResultBoard_1),
	checkBoardSize(ResultBoard_1, ResultBoard_2),
	
	printPlayer2,
	playerMove(Deck_2, ResultDeck_2, ResultBoard_2, ResultBoard_3),
	checkBoardSize(ResultBoard_3, ResultBoard_4),
	play(ResultDeck_1, ResultDeck_2, ResultBoard_4).