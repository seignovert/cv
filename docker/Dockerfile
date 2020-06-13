FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive
ENV PATH /opt/texlive/texdir/bin/x86_64-linux:${PATH}

# Install libs
RUN apt-get update && \
    apt-get install -y \
        libfontconfig \
        perl \
        tar \
        wget

WORKDIR /root

# Install TeXlive
COPY texlive.profile .
COPY texlive.sh .
RUN sh texlive.sh

# Install missing packages
COPY packages.sh .
RUN sh packages.sh

# Clean config
RUN rm -f texlive.profile \
          texlive.sh \
          packages.sh

WORKDIR /latex
