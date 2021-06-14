FROM ubuntu:20.04

LABEL org.opencontainers.image.authors="yvanj@cyber.gent"

# install deps
RUN apt update && apt upgrade -y && apt install -y wget unzip

# download dist file
RUN mkdir /hpool && cd /hpool && wget 'https://github.com/hpool-dev/chia-miner/releases/download/v1.4.0-2/HPool-Miner-chia-v1.4.0-2-linux.zip'

# unpack dist file
RUN cd /hpool && unzip HPool-Miner-chia-v1.4.0-2-linux.zip

# prepare volume dir
RUN mkdir /hpool-data

VOLUME     ["/hpool-data"]
ENTRYPOINT ["/hpool/linux/hpool-miner-chia", "-config", "/hpool-data/config.yml"]
