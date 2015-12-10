printSolution1(L):-
	write('\33\[2J'),
	write('###########################################################'),nl,
	write('#################### Pinwheel Puzzle ######################'),nl,
	write('###########################################################'),nl,
	write('######################### Result ##########################'),nl,nl,nl,
	getValue(R1C1, 0, 0, L),	getValue(R1C2, 0, 1, L),	getValue(R1C3, 0, 2, L),	getValue(R1C4, 0, 3, L),	getValue(R1C5, 0, 4, L),
	getValue(R1C6, 0, 5, L),	getValue(R1C7, 0, 6, L),	getValue(R1C8, 0, 7, L),	getValue(R1C9, 0, 8, L),
	getValue(R2C1, 1, 0, L),	getValue(R2C2, 1, 1, L),	getValue(R2C3, 1, 2, L),	getValue(R2C4, 1, 3, L),	getValue(R2C5, 1, 4, L),
	getValue(R2C6, 1, 5, L),	getValue(R2C7, 1, 6, L),	getValue(R2C8, 1, 7, L),	getValue(R2C9, 1, 8, L),
	getValue(R3C1, 2, 0, L),	getValue(R3C2, 2, 1, L),	getValue(R3C3, 2, 2, L),	getValue(R3C4, 2, 3, L),	getValue(R3C5, 2, 4, L),
	getValue(R3C6, 2, 5, L),	getValue(R3C7, 2, 6, L),	getValue(R3C8, 2, 7, L),	getValue(R3C9, 2, 8, L),
	getValue(R4C1, 3, 0, L),	getValue(R4C2, 3, 1, L),	getValue(R4C3, 3, 2, L),	getValue(R4C4, 3, 3, L),	getValue(R4C5, 3, 4, L),
	getValue(R4C6, 3, 5, L),	getValue(R4C7, 3, 6, L),	getValue(R4C8, 3, 7, L),	getValue(R4C9, 3, 8, L),

	write('                            '), write(R1C1), nl,
	write('                   '), write(R1C9), write('       '), write(R2C1), write('        '), write(R1C2), nl,
	write('                     '), write(R2C9), write('      '), write(R3C1), write('      '), write(R2C2), nl,
	write('                       '), write(R3C9), write('    '), write(R4C1), write('    '), write(R3C2), nl,
	write('                         '), write(R4C9), write('     '), write(R4C2), nl,
	write('               '), write(R1C8), write('  '), write(R2C8), write('  '), write(R3C8), write('  '), write(R4C8), write('   O   '), write(R4C3), write('  '), write(R3C3), write('  '), write(R2C3), write('  '), write(R1C3), nl,
	write('                        '), write(R4C7), write('       '), write(R4C4), nl,
	write('                      '), write(R3C7), write('   '), write(R4C6), write('   '), write(R4C5), write('   '), write(R3C4), nl,
	write('                    '), write(R2C7), write('    '), write(R3C6), write('     '), write(R3C5), write('    '), write(R2C4), nl,
	write('                  '), write(R1C7), write('     '), write(R2C6), write('       '), write(R2C5), write('     '), write(R1C4), nl,
	write('                       '), write(R1C6), write('         '), write(R1C5), nl, nl, nl.

printSolution2(L):-
	write('\33\[2J'),
	write('###########################################################'),nl,
	write('#################### Pinwheel Puzzle ######################'),nl,
	write('###########################################################'),nl,
	write('######################### Result ##########################'),nl,nl,nl,
	getValue(R1C1, 0, 0, L),	getValue(R1C2, 0, 1, L),	getValue(R1C3, 0, 2, L),	getValue(R1C4, 0, 3, L),	getValue(R1C5, 0, 4, L),
	getValue(R1C6, 0, 5, L),	getValue(R1C7, 0, 6, L),	getValue(R1C8, 0, 7, L),	getValue(R1C9, 0, 8, L),
	getValue(R2C1, 1, 0, L),	getValue(R2C2, 1, 1, L),	getValue(R2C3, 1, 2, L),	getValue(R2C4, 1, 3, L),	getValue(R2C5, 1, 4, L),
	getValue(R2C6, 1, 5, L),	getValue(R2C7, 1, 6, L),	getValue(R2C8, 1, 7, L),	getValue(R2C9, 1, 8, L),
	getValue(R3C1, 2, 0, L),	getValue(R3C2, 2, 1, L),	getValue(R3C3, 2, 2, L),	getValue(R3C4, 2, 3, L),	getValue(R3C5, 2, 4, L),
	getValue(R3C6, 2, 5, L),	getValue(R3C7, 2, 6, L),	getValue(R3C8, 2, 7, L),	getValue(R3C9, 2, 8, L),

	write('                            '), write(R1C1), write('        '), nl,
	write('                     '), write(R1C9), write('      '), write(R2C1), write('      '), write(R1C2), nl,
	write('                       '), write(R2C9), write('    '), write(R3C1), write('    '), write(R2C2), nl,
	write('                         '), write(R3C9), write('     '), write(R3C2), nl,
	write('                  '), write(R1C8), write('  '), write(R2C8), write('  '), write(R3C8), write('   O   '), write(R3C3), write('  '), write(R2C3), write('  '), write(R1C3), write('  '), nl,
	write('                        '), write(R3C7), write('       '), write(R3C4), nl,
	write('                      '), write(R2C7), write('   '), write(R3C6), write('   '), write(R3C5), write('   '), write(R2C4), nl,
	write('                    '), write(R1C7), write('    '), write(R2C6), write('     '), write(R2C5), write('    '), write(R1C4), nl,
	write('                        '), write(R1C6), write('       '), write(R1C5), write('     '), nl, nl, nl.

getValue(Value, 0, Column, [LH | _]) :-
	getValueFromColumn(Value, Column, LH).

getValue(Value, Ring, Column, [_ | LT]) :-
	R is Ring - 1,
	getValue(Value, R, Column, LT).

getValueFromColumn(Value, 0, [Value | _]).
getValueFromColumn(Value, Column, [_ | LT]) :-
	C is Column - 1,
	getValueFromColumn(Value, C, LT).