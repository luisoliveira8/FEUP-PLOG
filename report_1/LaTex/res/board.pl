%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%% Create empty table %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
createEmptyLine(A, M, M).

createEmptyLine([A|B], N, M) :-
	N < M,
	N1 is N + 1,
	A = '  ',
	createEmptyLine(B, N1, M).
	
createEmptyBoard([BoardHead | BoardTail], M, M).	
	
createEmptyBoard([BoardHead | BoardTail], N, M) :-
	N < M,
	N1 is N + 1,
	createEmptyLine(BoardHead, 0, M),
	createEmptyBoard(BoardTail, N1, M).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%% Board drawing %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%#########################################################%
%###################Print the divisor#####################%
%#########################################################%
startPrintDivisor(A, Max) :-
	write('   '),
	printDivisor(A, Max).

printDivisor(A, Max) :-
	M is Max + 1,
	A < M,
	write('-----'),
	B is A + 1,
	printDivisor(B, Max).

printDivisor(Max, Max) :-
	write('-').
%#########################################################%

%#########################################################%
%########################Print ID's#######################%
%#########################################################%
printIdsOfColumns(A) :-
	write('    '),
	printColumnIds(1, A),
	nl,
	startPrintDivisor(1, A).

printColumnIds(A, Max) :-	%case < 10
	M is Max + 1,
	A < M,
	A < 10,
	write('  '),
	write(A),
	write('  '),
	B is A + 1,
	printColumnIds(B, Max).

printColumnIds(A, Max) :-	%case > 9
	M is Max + 1,
	A < M,
	A > 9,
	write(' '),
	write(A),
	write('  '),
	B is A + 1,
	printColumnIds(B, Max).

printColumnIds(Max, Max) :-
	write('  ').
%#########################################################%
	
%#########################################################%
%#######################print a line######################%
%#########################################################%
startPrintLine(A, I) :-
	I > 9,
	write(I),
	write(' | '),
	printLine(A).

startPrintLine(A, I) :-
	I < 10,
	write(I),
	write('  | '),
	printLine(A).

printLine([A|[]]) :-
	write(A),
	write(' |').
	
printLine([A|B]) :-
	write(A),
	write(' | '),
	printLine(B).
%#########################################################%
	
%#########################################################%
%#####################print all cells#####################%
%#########################################################%
printAllCells([A|[]], S, I) :-
	I < S,
	I1 is I + 1,
	startPrintLine(A, I1),
	nl,
	startPrintDivisor(1, S),
	nl.
	
printAllCells([A|B], S, I) :-
	I < S,
	I1 is I + 1,
	startPrintLine(A, I1),
	nl,
	startPrintDivisor(1, S),
	nl,
	printAllCells(B, S, I1).

printAllCells(_,_,_).
%#########################################################%
	
%#########################################################%
%######################printBoard#########################%
%#########################################################%
printBoard(A) :-
	createEmptyBoard(Board,0, A),
	printIdsOfColumns(A),
	nl,
	printAllCells(Board, A, 0).
%#########################################################%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%