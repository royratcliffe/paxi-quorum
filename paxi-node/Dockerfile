FROM ubuntu:20.04

# https://www.swi-prolog.org/build/PPA.html
#
# Focal Fossa requires two updates, one before installing common
# software properties and another after installing the PPA. Fails
# otherwise.
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-add-repository ppa:swi-prolog/devel
RUN apt-get update
RUN apt-get install -y swi-prolog-nox

WORKDIR /srv
COPY srv .
CMD [ "swipl", "load.pl", "--no-fork", "--user=daemon", "--http=8080" ]
