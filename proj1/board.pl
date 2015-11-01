%%%%%%%%%%%%%%%%%%% Create empty table %%%%%%%%%%%%%%%%%%%%
createEmptyLine(_, M, M).

createEmptyLine([A|B], N, M) :-
	N < M,
	N1 is N + 1,
	A = [empty, empty],
	createEmptyLine(B, N1, M).
	
createEmptyBoard(_, M, M).	
createEmptyBoard([BoardHead | BoardTail], N, M) :-
	N < M,
	N1 is N + 1,
	createEmptyLine(BoardHead, 0, M),
	createEmptyBoard(BoardTail, N1, M).


%###################Print the divisor#####################%
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

%########################Print ID's#######################%
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

printCard([A,B]) :-
	means(A, A1),
	means(B, B1),
	write(A1),
	write(B1).
%#######################print a line######################%
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
	printCard(A),
	write(' |').
	
printLine([A|B]) :-
	printCard(A),
	write(' | '),
	printLine(B).

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

getLength([L | A], BoardLength) :-
	length(L, BoardLength).

%######################printBoard#########################%
printBoard(Board) :-
	length(Board, BoardHeight),
	getLength(Board, BoardLength),
	printIdsOfColumns(BoardLength),
	nl,
	printAllCells(Board, BoardHeight, 0).
	
	
	
%#################### Put on Board ########################
%%% 1. position; 2. element to use on replacement; 3. current list; 4. resultant list.
putOnColumn(0, Elem, [H|L], [Elem|L]).
putOnColumn(I, Elem, [H|L], [H|ResL]):-
	I > 0,
	I1 is I - 1,
	putOnColumn(I1, Elem, L, ResL).
	
%%% 1. element row; 2. element column; 3. element to use on replacement; 3. current matrix; 4. resultant matrix.
putOnBoard(0, ElemCol, NewElem, [RowAtTheHead|RemainingRows], [NewRowAtTheHead|RemainingRows]):-
	putOnColumn(ElemCol, NewElem, RowAtTheHead, NewRowAtTheHead).
putOnBoard(ElemRow, ElemCol, NewElem, [RowAtTheHead|RemainingRows], [RowAtTheHead|ResultRemainingRows]):-
	ElemRow > 0,
	ElemRow1 is ElemRow - 1,
	putOnBoard(ElemRow1, ElemCol, NewElem, RemainingRows, ResultRemainingRows).
	
%%%%%%%%%%%%%%%%%%%%%%%%% Check Board %%%%%%%%%%%%%%%%%%%%%%%%%
checkBoardSize(Board, ResultBoard) :-
	checkUpperLine(Board) -> addLine(Board, ResultBoard).

checkUpperLine([Line1 | Lines]) :-
	lineHasSomething(Line1).

lineHasSomething([]) :-
	fail.
lineHasSomething([[empty,empty] | Rest]) :-
	lineHasSomething(Rest).
lineHasSomething(_).

addLine([Line1 | RLines], [Line1R | RLinesR]) :-
	length(Line1, Size),
	createEmptyLine(Line1R, 0, Size),
	fillTheRest([Line1 | RLines], RLinesR).
	
fillTheRest(A, A).