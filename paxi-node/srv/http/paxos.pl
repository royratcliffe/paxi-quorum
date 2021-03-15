:- module(http_paxos, []).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).
:- use_module(library(paxos)).
:- use_module(paxos/ledger).

:- http_handler(root(paxos), paxos, []).
:- http_handler(root(paxos/node), paxos_node, []).
:- http_handler(root(paxos/quorum), paxos_quorum, []).
:- http_handler(root(paxos/ledger), paxos_ledger, []).

paxos(_Request) :-
    findall(B=C, (paxos_property(A), A =.. [B, C]), D),
    reply_json(json(D)).

paxos_node(_Request) :-
    paxos_property(node(A)),
    reply_json(json([node=A])).

paxos_quorum(_Request) :-
    paxos_property(quorum(A)),
    reply_json(json([quorum=A])).

paxos_ledger(_Request) :-
    findall(Key-Value, current_ledger(Key, Value), Data),
    reply_json(json(Data), [serialize_unknown(true)]).
