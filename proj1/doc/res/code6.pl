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