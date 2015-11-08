%#####################print all cells#####################%
printAllCells([A|[]], BoardHeight, I) :-
	I < BoardHeight,
	I1 is I + 1,
	startPrintLine(A, I1),
	nl,
	length(A, BoardLength),
	startPrintDivisor(1, BoardLength),
	nl.
printAllCells([A|B], BoardHeight, I) :-
	I < BoardHeight,
	I1 is I + 1,
	startPrintLine(A, I1),
	nl,
	length(A, BoardLength),
	startPrintDivisor(1, BoardLength),
	nl,
	printAllCells(B, BoardHeight, I1).
printAllCells(_,_,_).
getLength([L | _], BoardLength) :-
	length(L, BoardLength).

%######################printBoard#########################%
printBoard(Board) :-
	length(Board, BoardHeight),
	getLength(Board, BoardLength),
	printIdsOfColumns(BoardLength),
	nl,
	printAllCells(Board, BoardHeight, 0).