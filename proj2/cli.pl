:-include('listHandling.pl').
:-include('utilities.pl').
:-include('main.pl').
:-include('printRes.pl').

checkIfFinished :-
	write('\n\nIs this the solution you are looking for? (y/n)\n\n'),
	getChar(Input),
	(
		Input = 'n' -> (
			write('\33\[2J'),
			fail
			);
		true
	).

pinwheel:-
	write('\33\[2J'),
	write('###########################################################'),nl,
	write('#################### Pinwheel Puzzle ######################'),nl,
	write('###########################################################'),nl,nl,nl,
	write('1 - Solve first puzzle;'),nl,
	write('2 - Solve second puzzle;'),nl,
	write('0 - Exit the game.'),nl,nl,

	getChar(Input),
	(
		Input = '1' -> (
			solveFirst(L),
			printSolution1(L),
			printResult(L),
			checkIfFinished,
			pinwheel
			);
		Input = '2' -> (
			solveSecond(L),
			printSolution2(L),
			printResult(L),
			checkIfFinished,
			pinwheel
			);
		Input = '0' -> write('\n\n\n Chose to exit!');

		pinwheel
	).
	
printResult([]).
printResult([LH | LT]) :-
	write(LH), nl,
	printResult(LT).