%==============================================================%
%================ Create empty table ==========================%
%==============================================================%
createEmptyBoard([A|B], N) :-
	N < 10,
	N2 is N - 1,
	A is createEmptyBoard([0|B], N2),
	B is createEmptyBoard([0|B], N2).

createEmptyBoard([A|B], N).
%==============================================================%



%==============================================================%
%================ Board drawing ===============================%
%==============================================================%

%-----------------------------------------%
%----Print the bars between the lines-----%
%-----------------------------------------%
printBar(A, Max) :-
	A < Max,
	write(' |').

printBar(A, Max).
%-----------------------------------------%

%-----------------------------------------%
%--------Print the divisor----------------%
%-----------------------------------------%
printInitialDivisor(A, Max) :-
	M is Max + 1,
	A < M,
	write('--'),
	writeIfTwoAlg(A),
	printBarDivisor(A, Max),
	B is A + 1,
	printInitialDivisor(B, Max).

printInitialDivisor(A, Max).

printBarDivisor(A, Max) :-
	A < Max,
	write('--').

printBarDivisor(A, Max).

writeIfTwoAlg(A) :-
	A > 9,
	write('-').
	
writeIfTwoAlg(A).
%-----------------------------------------%

printIdsOfColumns(A) :-
	printColumnIds(1, A),
	nl,
	printInitialDivisor(1, A).
	
	
%-----------------------------------------%

%-----------------------------------------%
%--------Print the wanted numbers---------%
%-----------------------------------------%
printColumnIds(A, Max) :-
	M is Max + 1,
	A < M,
	write(' '),
	write(A),
	printBar(A, Max),
	B is A + 1,
	printColumnIds(B, Max).

printColumnIds(A, Max).
%-----------------------------------------%

printIdsOfColumns(A) :-
	printColumnIds(1, A),
	nl,
	printInitialDivisor(1, A).
	
%-----------------------------------------%
%------------print a line-----------------%
%-----------------------------------------%
printLine([A|B]) :-
	B == [],
	write(A).
	
printLine([A|B]) :-
	write(A),
	printLine(B).
%-----------------------------------------%
	
%-----------------------------------------%
%------------print all cells--------------%
%-----------------------------------------%
printAllCells([A|B]) :-
	B == [],
	printLine(A).
	
printAllCells([A|B]) :-
	printLine(A),
	nl,
	printAllCells(B).
%-----------------------------------------%
	
%-----------------------------------------%
%---------------printBoard----------------%
%-----------------------------------------%
printBoard(A) :-
	printIdsOfColumns(A),
	nl,
	createEmptyBoard(Board, A),
	printAllCells(Board).
%-----------------------------------------%