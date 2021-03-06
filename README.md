# Paxi Quorum

Named for Paxi, the Greek island group on the Ionian sea. Uses
SWI-Prolog Paxos to implement a Dockerised consensus quorum.

Each Paxi node launches a non-forking HTTP daemon on port 8080 as user
`daemon`.

Forking fails for Docker container deployment. It terminates the
container because the container itself represents an architectural
deployment process fork. No need to fork the fork.

The entry-point loads sources dynamically by searching recursively
within `/srv` for unloaded source files; the launcher sorts then loads
all unloaded server sources. Hence it also loads as-yet-to-be-deployed
sources in any derived container images.

## Loader Sorting

Sorting the sources lets ordering dependencies exist by prefixing with
digits, e.g. `000_load_me_first.pl` loads before `load_me_second.pl`; this
simple approach sets up a convention for general load ordering. 

The strategy presumes that all sources in `/srv` need to be loaded. Put
them elsewhere if they are optional, e.g. in a package. 

The sorting does not override explicit dependency load-ordering since
only unloaded sources load this way. The loader resolves the dependency
tree.

## References

* [Paxi](https://en.wikipedia.org/wiki/Paxi)
* [library(paxos): A Replicated Data Store](https://www.swi-prolog.org/pldoc/man?section=paxos)
* [Paxos (computer science)](https://en.wikipedia.org/wiki/Paxos_(computer_science))
* [Time, Clocks and the Ordering of Events in a Distributed System](http://lamport.azurewebsites.net/pubs/time-clocks.pdf)
