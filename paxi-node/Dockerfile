FROM ubuntu:20.04

# https://www.swi-prolog.org/build/PPA.html
#
# Focal Fossa requires two updates, one before installing common
# software properties and another after installing the PPA. Fails
# otherwise.
#
# Also important to upgrade Ubuntu upfront, otherwise it might install
# an earlier development version of Prolog. Install the latest.
RUN apt-get upgrade -y
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-add-repository ppa:swi-prolog/devel
RUN apt-get update
RUN apt-get install -y swi-prolog-nox

WORKDIR /srv
COPY srv .
RUN find . -name '*~' -exec rm {} +
ENTRYPOINT [ "swipl", "ensure/loaded.pl", "--", "--no-fork", "--user=daemon", "--http=8080" ]
