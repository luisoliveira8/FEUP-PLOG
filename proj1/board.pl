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

printCard([A|B]) :-
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

getLength([L | _], BoardLength) :-
	length(L, BoardLength).

%######################printBoard#########################%
printBoard(Board) :-
	length(Board, BoardHeight),
	getLength(Board, BoardLength),
	printIdsOfColumns(BoardLength),
	nl,
	printAllCells(Board, BoardHeight, 0).
	
	
	
%#################### Put on Board ########################
putOnColumn(0, Elem, [_|L], [Elem|L]).
putOnColumn(I, Elem, [H|L], [H|ResL]):-
	I > 0,
	I1 is I - 1,
	putOnColumn(I1, Elem, L, ResL).
	
putOnBoard(0, ElemCol, NewElem, [RowAtTheHead|RemainingRows], [NewRowAtTheHead|RemainingRows]):-
	putOnColumn(ElemCol, NewElem, RowAtTheHead, NewRowAtTheHead).
putOnBoard(ElemRow, ElemCol, NewElem, [RowAtTheHead|RemainingRows], [RowAtTheHead|ResultRemainingRows]):-
	ElemRow > 0,
	ElemRow1 is ElemRow - 1,
	putOnBoard(ElemRow1, ElemCol, NewElem, RemainingRows, ResultRemainingRows).
	
%%%%%%%%%%%%%%%%%%%%%%%%% Check Board %%%%%%%%%%%%%%%%%%%%%%%%%
checkBoardSize(Board, ResultBoard4) :-
	if(checkUpperLine(Board), addLineTop(Board, ResultBoard1), ResultBoard1 = Board),
	if(checkLowerLine(ResultBoard1), addLineBottom(ResultBoard1, ResultBoard2), ResultBoard2 = ResultBoard1),
	if(checkLeftColumn(ResultBoard2), ResultBoard3 = ResultBoard2, addColumnLeft(ResultBoard2, ResultBoard3)),
	if(checkRightColumn(ResultBoard3), ResultBoard4 = ResultBoard3, addColumnRight(ResultBoard3, ResultBoard4)).
	
%%%%%%%%%%%%%%%%%%%%%%%%% Check If Upper Line has any card %%%%%%%%%%%%%%%%%%%%%%%%%
checkUpperLine([Line1 | _]) :-
	lineHasSomething(Line1).
	
%%%%%%%%%%%%%%%%%%%%%%%%% Check If Lower Line has any card %%%%%%%%%%%%%%%%%%%%%%%%%
checkLowerLine([Line1 | []]) :-
	!, lineHasSomething(Line1).
checkLowerLine([_ | Lines]) :-
	!, checkLowerLine(Lines).

%%%%%%%%%%%%%%%%%%%%%%%%% Check If Left Column has any card %%%%%%%%%%%%%%%%%%%%%%%%%
checkLeftColumn([Line1 | []]) :-
	checkFirstElem(Line1).
checkLeftColumn([Line1 | Lines]) :-
	checkFirstElem(Line1),
	checkLeftColumn(Lines).
	
%%%%%%%%%%%%%%%%%%%%%%%%% Check If Right Column has any card %%%%%%%%%%%%%%%%%%%%%%%%%
checkRightColumn([Line1 | []]) :-
	checkLastElem(Line1).
checkRightColumn([Line1 | Lines]) :-
	checkLastElem(Line1),
	checkRightColumn(Lines).

checkLastElem([[empty, empty] | []]) :-
	!.
checkLastElem([_ | []]) :-
	!,
	fail.
checkLastElem([_ | Elems]) :-
	checkLastElem(Elems).
	
checkFirstElem([[empty, empty] | _]) :-
	!.
checkFirstElem(_) :-
	!,
	fail.
	
%%%%%%%%%%%%%%%%%%%%%%%%% Adds Column to the Left %%%%%%%%%%%%%%%%%%%%%%%%%%%
addColumnLeft([ListX | []], Final) :-
	append([[empty,empty]], ListX, TempX),
	append([TempX | _], [], Final).
addColumnLeft([ListX | ListR], [ResultX | ResultR]) :-
	append([[empty,empty]], ListX, ResultX),
	addColumnLeft(ListR, ResultR).
	
%%%%%%%%%%%%%%%%%%%%%%%%% Adds Column to the Right %%%%%%%%%%%%%%%%%%%%%%%%%%%
addColumnRight([ListX | []], Final) :-
	append(ListX, [[empty,empty]], TempX),
	append([TempX | _], [], Final).
addColumnRight([ListX | ListR], [ResultX | ResultR]) :-
	append(ListX, [[empty,empty]], ResultX),
	addColumnRight(ListR, ResultR).
	
%%%%%%%%%%%%%%%%%%%%%%%% Adds Empty Elem at the beginning %%%%%%%%%%%%%%%%%%%%
addEmptyElem([RFirstElem | RElems], OElems) :-
	RFirstElem = [empty, empty],
	fillTheRest(RElems, OElems).

%%%%%%%%%%%%%%%%%%%%%%%%% Check If Line has any card %%%%%%%%%%%%%%%%%%%%%%%%%
lineHasSomething([]) :-
	!, fail.
lineHasSomething([[empty,empty] | Rest]) :-
	!, lineHasSomething(Rest).
lineHasSomething(_).

%%%%%%%%%%%%%%%%%%%%%%%%% Adds Line at the top %%%%%%%%%%%%%%%%%%%%%%%%%
addLineTop([Line1 | RLines], [Line1R | RLinesR]) :-
	length(Line1, Size),
	createEmptyLine(Line1R, 0, Size),
	fillTheRest([Line1 | RLines], RLinesR).
fillTheRest(A, A).

%%%%%%%%%%%%%%%%%%%%%%%%% Adds Line at the bottom %%%%%%%%%%%%%%%%%%%%%%%%%
addLineBottom([], [Line1 | _], Size) :-
	createEmptyLine(Line1, 0, Size).
addLineBottom([Line1 | RLines], [Line1 | RLinesR]) :-
	length(Line1, Size),
	addLineBottom(RLines, RLinesR, Size).
addLineBottom([Line1 | RLines], [Line1 | RLinesR], _) :-
	length(Line1, Size),
	addLineBottom(RLines, RLinesR, Size).