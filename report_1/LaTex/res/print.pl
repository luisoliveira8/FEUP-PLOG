%#####################print all cells#####################%

printAllCells([A|[]], S, I) :-	% When the lists head is the 
	I < S,			% last line 
	I1 is I + 1,		%
	startPrintLine(A, I1),	% Print the line
	nl,			%
	startPrintDivisor(1, S),% prints line between lines
	nl.			%

printAllCells([A|B], S, I) :-	% Normally recursively called
	I < S,			% Iterator check
	I1 is I + 1,		% Iterator incrementation
	startPrintLine(A, I1),	% Prints index of the line
	nl,			%
	startPrintDivisor(1, S),%
	nl,			%
	printAllCells(B, S, I1).% Recursive Call
	
printAllCells(_,_,_).		%
	
%######################printBoard#########################%

printBoard(A) :-			% Initial Print
	createEmptyBoard(Board,0, A),	% Creates Empty Board
	printIdsOfColumns(A),		% Prints ID's
	nl,				%
	printAllCells(Board, A, 0).	% Prints the board's content