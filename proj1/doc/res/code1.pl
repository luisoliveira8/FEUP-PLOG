%%%%%%%%%%%%%%%%%%%%%%%%% Check Board %%%%%%%%%%%%%%%%%%%%%%%%%
checkBoardSize(Board, ResultBoard4) :- 
	if(checkUpperLine(Board), addLineTop(Board, ResultBoard1), ResultBoard1 = Board), 
	if(checkLowerLine(ResultBoard1), addLineBottom(ResultBoard1, ResultBoard2, _), ResultBoard2 = ResultBoard1),
	if(checkLeftColumn(ResultBoard2), ResultBoard3 = ResultBoard2, addColumnLeft(ResultBoard2, ResultBoard3)),
	if(checkRightColumn(ResultBoard3), ResultBoard4 = ResultBoard3, addColumnRight(ResultBoard3, ResultBoard4)).