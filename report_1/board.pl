%==============================================================%
%================ Create empty table ==========================%
%==============================================================%
createEmptyLine(A, M, M).

createEmptyLine([A|B], N, M) :-
	N < M,
	N1 is N + 1,
	A is 0,
	createEmptyLine(B, N1, M).
	
createEmptyBoard([BoardHead | BoardTail], M, M).	
	
createEmptyBoard([BoardHead | BoardTail], N, M) :-
	N < M,
	N1 is N + 1,
	createEmptyLine(BoardHead, 0, M),
	createEmptyBoard(BoardTail, N1, M).
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
printLine([A|[]]) :-
	write(A).
	
printLine([A|B]) :-
	write(A),
	printLine(B).
%-----------------------------------------%
	
%-----------------------------------------%
%------------print all cells--------------%
%-----------------------------------------%
printAllCells([A|[]]).
	
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
	
	createEmptyBoard(Board,0, A),
	printAllCells(Board).
%-----------------------------------------%