%%%%%%%%%%%%%%%%%%%%%% Create empty table %%%%%%%%%%%%%%%%%%%%%%%%%

createEmptyLine(A, M, M).		% Stops when the list reaches
createEmptyLine([A|B], N, M) :-		% the max number of elements
	N < M,				%
	N1 is N + 1,			% Recursively adds an emty elem
	A = '  ',			% to the list (line)
	createEmptyLine(B, N1, M).
	
createEmptyBoard([BoardHead | BoardTail], M, M).	
createEmptyBoard([BoardHead | BoardTail], N, M) :-
	N < M,		% Stops when the list reaches
	N1 is N + 1,	% the max number of elements
	createEmptyLine(BoardHead, 0, M),
	createEmptyBoard(BoardTail, N1, M).
	
% Recursively adds an empty elem to the list (list of lines)