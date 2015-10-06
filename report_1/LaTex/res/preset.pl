createPresetA(L) :-
	L =
		[
			[empty, black_spades, empty, empty, empty],
 			[empty, green_spades, green_clubs, green_diamonds, empty],
 			[empty, blue_spades, empty, empty, empty],
 			[empty, yellow_spades, empty, empty, empty],
 			[red_exclamation, red_spades, red_wild, empty, empty]
		].
 
 createPresetB(L) :-
 	L =
		[
			[empty, empty, empty, green_spades, empty, empty],
 			[empty, empty, empty, red_spades, empty, empty],
 			[empty, empty, empty, yellow_wild, empty, empty],
 			[empty, black_clubs, yellow_exclamation, wild_spades, green_hearts, blue_wild],
 			[empty, yellow_hearts, green_exclamation, black_spades, blue_diamonds, red_clubs],
 			[empty, blue_exclamation, red_exclamation, empty, empty, empty]
		].