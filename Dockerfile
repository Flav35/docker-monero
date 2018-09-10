FROM ubuntu:xenial

ARG WALLET_ADDRESS

RUN set -ex; \
    apt-get update; \
    apt-get install -yq --no-install-recommends libjansson4 libcurl3; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD ./minerd /
ADD ./monero.sh /
ADD https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 /usr/local/bin/dumb-init
RUN chmod +x /usr/local/bin/dumb-init
ENV POOL=stratum+tcp://pool.supportxmr.com:3333
ENV WALLET_ADDRESS=${WALLET_ADDRESS}
ENV NTHREAD 1
ENV USERPASS ""

CMD ["/monero.sh"]
