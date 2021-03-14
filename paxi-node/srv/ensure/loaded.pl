:- module(ensure_loaded, []).

:- initialization(up, program).

up :-
    expand_file_name('[0-9]*.pl', Files0),
    sort(Files0, Files),
    load_files(Files, [if(not_loaded)]).
