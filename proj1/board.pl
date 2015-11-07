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
	
%%%%%%%%%%%%%%%%%%%%%%%%%% Check if spot is enpty %%%%%%%%%%%%%%%%%%%%%%%%%
checkIfACardIsInTheSpot(0, ElemCol, [BoardHead | BoardTail]) :-
	checkIfACardIsInTheLine(ElemCol, BoardHead).
checkIfACardIsInTheSpot(ElemRow, ElemCol, [BoardHead | BoardTail]) :-
	ElemRow > 0,
	ElemRow1 is ElemRow - 1,
	checkIfACardIsInTheSpot(ElemRow1, ElemCol, BoardTail).
	
%%%%%%%%%%%%%%%%%%%%%%%%%% Check if spot is empty in line %%%%%%%%%%%%%%%%%
checkIfACardIsInTheLine(0, [[empty, empty]|_]).
checkIfACardIsInTheLine(0, _) :-
		fail.
checkIfACardIsInTheLine(Elem, [LineHead | LineTail]) :-
	Elem > 0,
	Elem1 is Elem - 1,
	checkIfACardIsInTheLine(Elem1, LineTail).
	
%%%%%%%%%%%%%%%%%%%%%%%%% Checks if There are not more than 4 in a row %%%%%%%%%%%%%%%%%%%%

checkNumberInLine(0, [LineHead | LineTail], Number, Sequence, SelectedCard) :-
	append([SelectedCard], Sequence, SequenceRes),
	N is Number + 1,
	!,
	checkNumberInLine(-1, LineTail, N, SequenceRes, SelectedCard).
	
checkNumberInLine(SelectedColumn, [[empty, empty] | LineTail], _, Sequence, SelectedCard) :-
	SelectedColumn > 0,
	N is SelectedColumn - 1,
	!,
	checkNumberInLine(N, LineTail, 0, SequenceRes, SelectedCard).

checkNumberInLine(SelectedColumn, [[empty, empty] | LineTail], Number, Sequence, SelectedCard) :-
	!,
	Number < 6,
	checkSequence(Sequence).
	
checkNumberInLine(SelectedColumn, [], Number, Sequence, SelectedCard) :-
	!,
	Number < 6,
	checkSequence(Sequence).
	
checkNumberInLine(SelectedColumn, [LineHead | LineTail], Number, Sequence, SelectedCard) :-
	SelectedColumn > 5,
	N is SelectedColumn - 1,
	!,
	checkNumberInLine(N, LineTail, 0, Sequence, SelectedCard).
	
checkNumberInLine(SelectedColumn, [LineHead | LineTail], Number, Sequence, SelectedCard) :-
	SelectedColumn > -6,
	N is SelectedColumn - 1,
	N2 is Number + 1,
	append([LineHead], Sequence, SequenceRes),
	!,
	checkNumberInLine(N, LineTail, N2, SequenceRes, SelectedCard).
	
checkIfLessThanFiveInLine(0, SelectedColumn, [SelectedLine | _], SelectedCard) :- 
	checkNumberInLine(SelectedColumn, SelectedLine, 0, Sequence, SelectedCard).
checkIfLessThanFiveInLine(SelectedLine, SelectedColumn, [_ | BoardTail], SelectedCard) :-
	N is SelectedLine - 1,
	checkIfLessThanFiveInLine(N, SelectedColumn, BoardTail, SelectedCard).
	
	
%%%%%%%%%%%%%%%%%%%% Check rules in column %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
checkIfLessThanFiveInColumn(SelectedLine, SelectedColumn, [BoardHead | BoardTail], SelectedCard) :-
	SelectedLine > 5,
	N is SelectedLine - 1,
	!,
	checkIfLessThanFiveInColumn(N, SelectedColumn, BoardTail, SelectedCard).
	
checkIfLessThanFiveInColumn(SelectedLine, SelectedColumn, [BoardHead | BoardTail], SelectedCard) :-
	checkNumberInColumn(SelectedLine, SelectedColumn, [BoardHead | BoardTail], [], SRes, SelectedCard),
	length(SRes, Size),
	!, Size < 6,
	!, checkSequence(SRes).
	
checkNumberInColumn(SelectedLine, SelectedColumn, [BoardHead | []], Sequence, SRes, SelectedCard) :-
	getCard(BoardHead, SelectedColumn, Sequence, SRes, SelectedLine, Check, SelectedCard).
	
checkNumberInColumn(SelectedLine, SelectedColumn, [BoardHead | BoardTail], Sequence, SRes, SelectedCard) :-
	getCard(BoardHead, SelectedColumn, Sequence, SRes2, SelectedLine, Check, SelectedCard),
	if((Check == 1), (N is SelectedLine - 1, checkNumberInColumn(N, SelectedColumn, BoardTail, SRes2, SRes, SelectedCard)), SRes = Sequence).
	
getCard([[empty , empty] | LineTail], 0, Sequence, SRes, Line, Check, SelectedCard) :-
	Line < 0,
	SRes = Sequence,
	Check is 0.
	
getCard([[empty , empty] | _], 0, _, SRes, Line, Check, _) :-
	Line > 0,
	SRes = [],
	Check is 1.
	
getCard(_, 0, Sequence, SRes, 0, Check, SelectedCard) :-
	append(Sequence, [SelectedCard], SRes),
	Check is 1.
	
getCard([LineHead | _], 0, Sequence, SRes, _, Check, _) :-
	append(Sequence, [LineHead], SRes),
	Check is 1.

getCard([LineHead | LineTail], SelectedColumn, Card, SRes, Line, Check, SelectedCard) :-
	N is SelectedColumn - 1,
	getCard(LineTail, N, Card, SRes, Line, Check, SelectedCard).
	
%%%%%%%%%%%%%%%%%%%%%%%%%%% Checks if it is the firstMove %%%%%%%%%%%%%%%%%%%%%%%%%%%
checkFirstPlay(Board) :-
	length(Board, BoardSize),
	!, BoardSize == 1.