FROM docker.io/1and1internet/ubuntu-16:latest
ARG DEBIAN_FRONTEND=noninteractive
COPY files /
RUN \
  apt-get update && \
  apt-get -o Dpkg::Options::=--force-confdef -y install gettext-base amavisd-new spamassassin clamav-daemon libnet-dns-perl libmail-spf-perl pyzor razor arj bzip2 cabextract cpio file gzip lhasa nomarch pax unrar-free unzip zip zoo && \
  adduser clamav amavis && \
  adduser amavis clamav && \
  apt-get -y clean && \
  mkdir /var/run/clamav/ && \
  chown clamav:clamav /var/run/clamav/ && \
  rm -rf /var/lib/apt/lists/* && \
  chmod -R 0755 /hooks
ENV DOMAIN=example.com \
    ENABLE_RAZOR_AND_PYZOR=0
EXPOSE 10024
