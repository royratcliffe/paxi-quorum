:- module(load, []).
:- autoload(library(prolog_source), [directory_source_files/3]).

:- initialization(up, program).

up :-
    directory_source_files(., Files0, [recursive(true), if(not_loaded)]),
    sort(Files0, Files),
    load_files(Files).
