:- include('cards.pl').
:- include('board.pl').

startHumanVsHuman :-
	totalDeck(Cards),
	permutacao_aleatoria(Cards,Deck),
	divideDeck(Deck, Deck_1, Deck_2, 60),
	createEmptyBoard(Board, 0, 1),
	play(Deck_1, Deck_2, Board, 1, 1).

playerMove(Deck, ResultDeck, Board, ResultBoard, BoardHeight, BoardLength, SelectedCard) :-	
	%trace,
	printBoard(Board, BoardHeight, BoardLength),
	printFirstFive(Deck, NumberOfCards),
	
	write('\nYou can try to place '),
	write(NumberOfCards),
	write(' cards\n\n'),
	write('Choose the Card to Play (end the number with"."): '),
	
	getSelection0(SelectedCard, NumberOfCards),
	
	write('In What Line do you want to put it: '),
	getSelection1(SelectedLine, BoardLength),
	write('In What Column do you want to put it: '),
	getSelection1(SelectedColumn, BoardHeight),
	
	removeCardFromDeck(Deck, ResultDeck, SelectedCard, 0, RemovedCard),

	putOnBoard(SelectedLine, SelectedColumn, RemovedCard, Board, ResultBoard).
	
	
play(Deck_1, Deck_2, Board, BoardHeight, BoardLength) :-
	playerMove(Deck_1, ResultDeck_1, Board, ResultBoard_1, BoardHeight, BoardLength, SelectedCard_1),
	playerMove(Deck_2, ResultDeck_2, ResultBoard_1, ResultBoard_2, BoardHeight, BoardLength, SelectedCard_2),
	
	play(ResultDeck_1, ResultDeck_2, ResultBoard_2, BoardHeight, BoardLength).