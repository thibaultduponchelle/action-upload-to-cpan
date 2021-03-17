FROM debian:latest

RUN apt-get update \
    && apt-get install -y cpanminus make gcc libnet-ssleay-perl libcrypt-ssleay-perl \
    && rm -rf /var/lib/apt/lists/*

RUN cpanm CPAN::Uploader

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
