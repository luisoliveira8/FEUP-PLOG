(checkFirstPlay(Board), Check is 0);	
		(
			checkIfACardIsInTheSpot(SelectedLine, SelectedColumn, Board),
			getCoordinatesAroundSpot(Line1, Line2, Column1, Column2, SelectedLine, SelectedColumn, Board),
			(
				\+((checkIfACardIsInTheSpot(Line1, SelectedColumn, Board)));
				\+((checkIfACardIsInTheSpot(SelectedLine, Column1, Board)));
				\+((checkIfACardIsInTheSpot(Line2, SelectedColumn, Board)));
				\+((checkIfACardIsInTheSpot(SelectedLine, Column2, Board)))
			),
			checkIfLessThanFiveInLine(SelectedLine, SelectedColumn, Board, RemovedCard),
			checkIfLessThanFiveInColumn(SelectedLine, SelectedColumn, Board, RemovedCard)
		) -> write('\nPosition Accepted\n'), Col is SelectedColumn, Line is SelectedLine, SelectedCard is SelectedCardTemp, Check is 0;
		write('\nPosition unaccepted\n'),