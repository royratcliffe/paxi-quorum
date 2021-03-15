:- module(paxos_udp, []).
:- use_module(library(udp_broadcast), [udp_broadcast_initialize/2]).

:- udp_broadcast_initialize(ip(0, 0, 0, 0), [scope(paxos)]).
