%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
means(empty, ' ').

means(yellow, 'Y').
means(green, 'G').
means(red, 'R').
means(black, 'b').
means(blue, 'B').

means(spades, '1').
means(exclamation, '2').
means(diamonds, '3').
means(hearts, '4').
means(clubs, '5').
means(wild, 'W').
%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

%%%%%%%%%%%%% Total Deck %%%%%%%%%%%%
totalDeck(Deck) :-
	Deck =
	[
		[blue, spades],
		[yellow, spades],
		[red, spades],
		[black, spades],
		[green, spades],
		[blue, spades],
		[yellow, spades],
		[red, spades],
		[black, spades],
		[green, spades],
				
		[blue, exclamation],
		[yellow, exclamation],
		[red, exclamation],
		[black, exclamation],
		[green, exclamation],
		[blue, exclamation],
		[yellow, exclamation],
		[red, exclamation],
		[black, exclamation],
		[green, exclamation],
		
		[blue, diamonds],
		[yellow, diamonds],
		[red, diamonds],
		[black, diamonds],
		[green, diamonds],
		[blue, diamonds],
		[yellow, diamonds],
		[red, diamonds],
		[black, diamonds],
		[green, diamonds],
		
		[blue, hearts],
		[yellow, hearts],
		[red, hearts],
		[black, hearts],
		[green, hearts],
		[blue, hearts],
		[yellow, hearts],
		[red, hearts],
		[black, hearts],
		[green, hearts],
		
		[blue, clubs],
		[yellow, clubs],
		[red, clubs],
		[black, clubs],
		[green, clubs],
		[blue, clubs],
		[yellow, clubs],
		[red, clubs],
		[black, clubs],
		[green, clubs],
		
		[wild, spades],
		[wild, diamonds],
		[wild, hearts],
		[wild, clubs],
		
		[blue, wild],
		[yellow, wild],
		[red, wild],
		[green, wild],
		
		[wild, wild],
		[wild, wild]
	].

%%%%%%%%% Prints a given card %%%%%%%%%%%%%%%%%%%%%%
printCard([CardHead | [CardTail]]) :-
	means(CardHead, HeadToPrint),
	means(CardTail, TailToPrint),
	write(HeadToPrint),
	%write(' | '),
	write(TailToPrint).
	
%%%%%%%%% Divide the total shuffled deck into two %%%%%%%%%%%
divideDeck(_, _, _, 0).
divideDeck([DeckHead | DeckTail], [Deck_1Head | Deck_1Tail], Deck_2, N) :-
	N > 30,
	Deck_1Head = DeckHead,
	N1 is N - 1,
	divideDeck(DeckTail, Deck_1Tail, Deck_2, N1).
	
divideDeck([DeckHead | DeckTail], Deck_1, [Deck_2Head | Deck_2Tail], N) :-
	Deck_2Head = DeckHead,
	N1 is N - 1,
	divideDeck(DeckTail, Deck_1, Deck_2Tail, N1).
	
%%%%%%%%% Prints a given Deck on Screen %%%%%%%%%%%
printDeck([], _).
printDeck([DeckHead | DeckTail], A) :-
	A1 is A + 1,
	
	write(A), write(' - '),
	printCard(DeckHead),
	nl,
	printDeck(DeckTail, A1).
	
%%%%%%%%%%%% Prints N First Cards of the Deck %%%%%%%%
print5Cards(_,0, NumberOfCardsLeft) :-
	NumberOfCardsLeft is 5.
print5Cards([], A, NumberOfCardsLeft) :-
	NumberOfCardsLeft is 5 - A.
	
print5Cards([DeckHead | DeckTail], N, NumberOfCardsLeft) :-
	N1 is N - 1,
	P is 5 - N,
	write(P),
	write(' - '),
	printCard(DeckHead),
	nl,
	print5Cards(DeckTail, N1, NumberOfCardsLeft).
	
%%%%%%%%%%%% Prints the first 5 cards %%%%%%%%%%%	
printFirstFive(Deck, NumberOfCardsLeft) :-
	write('\nFirst Five Cards are:\n\n'),
	print5Cards(Deck, 5, NumberOfCardsLeft).

%%%%%%%%%%% Removes the selected card from the deck %%%%%%%%%%
removeCardFromDeck([],[],_, _, _).
removeCardFromDeck([DeckHead | DeckTail], [ResultHead | ResultTail], N, N, RemovedCard) :-
	N1 is N + 1,
	RemovedCard = DeckHead,
	removeCardFromDeck(DeckTail, [ResultHead | ResultTail], N, N1, RemovedCard).
removeCardFromDeck([DeckHead | DeckTail], [ResultHead | ResultTail], SelectedCard, N, RemovedCard) :-
	ResultHead = DeckHead,
	N1 is N + 1,
	removeCardFromDeck(DeckTail, ResultTail, SelectedCard, N1, RemovedCard).
	