:- include('utilities.pl').
:- include('humanVsHuman.pl').
:- include('cards.pl').
:- include('board.pl').
:- include('cli.pl').

:- use_module(library(random)).
:- use_module(library(lists)).

%%%%%%%%%%%%%%% First call to the program %%%%%%%%%%%%%%%%%%%
startGame :- 
	mainMenu.