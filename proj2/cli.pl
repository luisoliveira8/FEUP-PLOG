:-include('listHandling.pl').
:-include('utilities.pl').
:-include('main.pl').
:-include('printRes.pl').

checkIfFinished :-
	write('\n\nIs this the solution you are looking for? (y/n)\n\n'),
	read(Input),
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
	write('3 - Create Solved random puzzle;'),nl,
	write('4 - Create Unsolved random puzzle;'),nl,
	write('0 - Exit the game.'),nl,nl,

	read(Input),
	(
		Input = 1 -> (
			solveFirst(L),
			printSolution1(L),
			printResult(L),
			checkIfFinished,
			pinwheel
			);
		Input = 2 -> (
			solveSecond(L),
			printSolution2(L),
			printResult(L),
			checkIfFinished,
			pinwheel
			);
		Input = 3 -> (
			randomPuzzle,
			checkIfFinished,
			pinwheel
			);
		Input = 4 -> (
			unsolvedRandomPuzzle,
			checkIfFinished,
			pinwheel
			);
		Input = 0 -> write('\n\n\n Chose to exit!');

		pinwheel
	).
	
printResult([]).
printResult([LH | LT]) :-
	write(LH), nl,
	printResult(LT).

randomPuzzle :-
	write('\n\nWhat is The Maximum number you want to have in the puzzle?\n\n'),
	read(Max),
	(
		(integer(Max), Max < 5) -> randomPuzzle;
		integer(Max) -> (
			createRandomPuzzle(L, Max),
			printSolution1(L),
			printResult(L)
			);
		randomPuzzle
	).
	

unsolvedRandomPuzzle :-
	write('\n\nWhat is The Maximum number you want to have in the puzzle?\n\n'),
	read(Max),
	(
		(integer(Max), Max < 5) -> unsolvedRandomPuzzle;
		integer(Max) -> (
			createUnsolvedRandomPuzzle(L, Max),
			printSolution1(L),
			printResult(L)
			);
		unsolvedRandomPuzzle
	).
	