%%%%%%%%%%%% Prints N First Cards of the Deck %%%%%%%%
print5Cards(_, MaxNum, MaxNum, MaxNum).
print5Cards([], _, NumberOfCards, NRes) :-
	!, NRes is NumberOfCards.
	
print5Cards([DeckHead | DeckTail], MaxNum, NumberOfCards, NRes) :-
	write(NumberOfCards),
	write(' - '),
	printCard(DeckHead),
	nl,
	M is NumberOfCards + 1,
	print5Cards(DeckTail, MaxNum, M, NRes).
	
%%%%%%%%%%%% Prints the first 5 cards %%%%%%%%%%%	
printFirstFive(Deck, NumberOfCardsLeft) :-
	write('\nFirst Five Cards are:\n\n'),
	print5Cards(Deck, 5, NumberOfCardsLeft).