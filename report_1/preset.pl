%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
means(empty, '  ').

means(black_spades, '1b').
means(green_spades, '1G').
means(red_spades, '1R').
means(yellow_spades, '1Y').
means(blue_spades, '1B').

means(black_exclamation, '2b').
means(green_exclamation, '2G').
means(red_exclamation, '2R').
means(yellow_exclamation, '2Y').
means(blue_exclamation, '2B').

means(black_diamonds, '3b').
means(green_diamonds, '3G').
means(red_diamonds, '3R').
means(yellow_diamonds, '3Y').
means(blue_diamonds, '3B').

means(black_hearts, '4b').
means(green_hearts, '4G').
means(red_hearts, '4R').
means(yellow_hearts, '4Y').
means(blue_hearts, '4B').

means(black_clubs, '5b').
means(green_clubs, '5G').
means(red_clubs, '5R').
means(yellow_clubs, '5Y').
means(blue_clubs, '5B').

means(black_wild, 'Wb').
means(green_wild, 'WG').
means(red_wild, 'WR').
means(yellow_wild, 'WY').
means(blue_wild, 'WB').

means(wild_spades, '1W').
means(wild_exclamation, '2W').
means(wild_diamonds, '3W').
means(wild_hearts, '4W').
means(wild_clubs, '5W').

means(qinto, '!!').
%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

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