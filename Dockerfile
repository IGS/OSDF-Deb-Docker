# The Basics
FROM ubuntu:xenial
MAINTAINER Victor <victor73@github.com>

RUN mkdir /build

# Create the OSDF user
RUN /usr/sbin/groupadd osdf
RUN /usr/sbin/useradd --home-dir /export/osdf -g osdf --shell /bin/bash osdf

RUN chown -R osdf.osdf /build

RUN apt-get update && \
    apt-get install -y software-properties-common git dh-make \
    dh-systemd build-essential devscripts fakeroot debootstrap \
    pbuilder

RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

RUN apt-get install -y nodejs && \
    npm install -g gulp

USER osdf

CMD git clone http://github.com/IGS/OSDF /build/osdf && cd /build/osdf && git pull && npm install && gulp dist && cp dist/* /export/
