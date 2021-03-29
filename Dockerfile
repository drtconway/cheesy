FROM ubuntu:groovy

ENV DEBIAN_FRONTEND="noninteractive"

RUN apt update && \
    apt install -y \
        curl \
        gnupg \
        tzdata
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo 'deb https://dl.yarnpkg.com/debian/ stable main' >> /etc/apt/sources.list && \
    apt update && \
    apt install -y yarn
