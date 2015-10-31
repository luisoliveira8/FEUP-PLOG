:- include('cards.pl').

startHumanVsHuman :-
	totalDeck(Cards),
	permutacao_aleatoria(Cards,Deck),
	divideDeck(Deck, Deck_1, Deck_2, 60),
	play(Deck_1, Deck_2).

play(Deck_1, Deck_2) :-
	printFirstFive(Deck_1),
	get_char(_),
	printFirstFive(Deck_2),
	get_char(_),
	play(Deck_1, Deck_2).