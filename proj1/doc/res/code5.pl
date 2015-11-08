(checkFirstPlay(Board), Check is 1);	
		(
			checkIfWild(CardOnPlace),
			\+((checkIfACardIsInTheSpot(SelectedLine, SelectedColumn, Board))),
			checkIfLessThanFiveInLine(SelectedLine, SelectedColumn, Board, RemovedCard),
			checkIfLessThanFiveInColumn(SelectedLine, SelectedColumn, Board, RemovedCard)
		) -> write('\nSwap Position Accepted\n'), Col is SelectedColumn, Line is SelectedLine, SelectedCard