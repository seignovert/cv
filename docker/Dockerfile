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
COPY docker/texlive.profile /root/texlive.profile
COPY docker/texlive.sh /root/texlive.sh
RUN sh /root/texlive.sh

# Install missing packages
COPY docker/packages.sh /root/packages.sh
RUN sh /root/packages.sh

# Clean config
RUN rm -f /root/texlive.profile \
          /root/texlive.sh \
          /root/packages.sh

WORKDIR /latex
