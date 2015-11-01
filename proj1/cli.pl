%%%%%%%%%%%%%%% Clears the entire screen %%%%%%%%%%%%%%%%%%%
clearScreen :-
	printBlank(65).
	
%%%%%%%%%%%%%%% Blank line %%%%%%%%%%%%%%%%%%%
printBlank(A) :-
	A > 0,
	nl,
	A1 is A - 1,
	printBlank(A1).
	
printBlank(_).

%%%%%%%%%%%%%%%%%%%%% Main Menu %%%%%%%%%%%%%%%%%%%%%%%%%%
mainMenu :-
	clearScreen,
	printMainMenu,
	getChar(In),
	(
		In = '1' -> write('Chose to play\n'), playMenu;
		In = '2' -> write('Chose Info\n'), infoMenu;
		In = '3' -> write('Chose Exit\n');
	
		mainMenu
	).
	
%%%%%%%%%%%%%%%%%%%%% Play Menu %%%%%%%%%%%%%%%%%%%%%%%%%%
playMenu :-
	clearScreen,
	printPlayMenu,
	getChar(In),
	(
		In = '1' -> write('Chose to play Human vs Human\n'), startHumanVsHuman, playMenu;
		In = '2' -> write('Chose to play Human vs PC\n'), playMenu;
		In = '3' -> write('Chose to play PC vs PC\n'), playMenu;
		In = '4' -> write('Chose to Go back\n'), mainMenu;
		
		playMenu
	).
	
%%%%%%%%%%%%%%%%%%%%% Info Menu %%%%%%%%%%%%%%%%%%%%%%%%%%
infoMenu :-
	clearScreen,
	printInfoMenu,
	get_char(_),   % Waits for any input
	mainMenu.


%%%%%%%%%%%%%%%%%%%%%%%% Print MainMenu %%%%%%%%%%%%%%%%%%%%%	
printMainMenu :-
	write('========================================\n'),
	write('==                Q!nto               ==\n'),
	write('========================================\n'),
	write('==                                    ==\n'),
	write('==             1 - Play               ==\n'),
	write('==             2 - Info               ==\n'),
	write('==             3 - Exit               ==\n'),
	write('==                                    ==\n'),
	write('========================================\n').
	
	
%%%%%%%%%%%%%%%%%%%% Print Info Panel %%%%%%%%%%%%%%%%%%%%%%%
printInfoMenu :-
	write('======================================================================\n'),
	write('==                           Q!nto - Info                           ==\n'),
	write('======================================================================\n'),
	write('==                                                                  ==\n'),
	write('==  This is a project done in the subject of Logical Programming    ==\n'),
	write('==  at MIEIC course in FEUP.                                        ==\n'),
	write('==                                                                  ==\n'),
	write('==           Authors:                                               ==\n'),
	write('==                      Luis Oliveira - 201304515                   ==\n'),
	write('==                      Joao Nogueira - 201303882                   ==\n'),
	write('==                                                                  ==\n'),
	write('======================================================================\n').
	
%%%%%%%%%%%%%%%%%%%%%%%% PlayMenu %%%%%%%%%%%%%%%%%%%%%	
printPlayMenu :-
	write('=================================================================\n'),
	write('==                Q!nto - Choose the type of game              ==\n'),
	write('==                        you wish to play                     ==\n'),
	write('=================================================================\n'),
	write('==                                                             ==\n'),
	write('==             1 - Human vs Human                              ==\n'),
	write('==             2 - Human vs PC                                 ==\n'),
	write('==             3 - PC vs PC                                    ==\n'),
	write('==             4 - Go back                                     ==\n'),
	write('==                                                             ==\n'),
	write('=================================================================\n').
	
printPlayer1 :-
	clearScreen,
	write('=================================================================\n'),
	write('==                        PLAYER 1`s turn                      ==\n'),
	write('=================================================================\n').
	
printPlayer2 :-
	clearScreen,
	write('=================================================================\n'),
	write('==                        PLAYER 2`s turn                      ==\n'),
	write('=================================================================\n').