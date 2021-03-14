:- use_module(library(paxos), [paxos_initialize/1]).
:- ensure_loaded(udp).

paxos:paxos_message_hook(Paxos, -, udp(paxos, Paxos)) :- !.
paxos:paxos_message_hook(Paxos, Timeout, udp(paxos, Paxos, Timeout)).

:- paxos_initialize([]).
