FROM ubuntu:16.04
MAINTAINER Masaki Muranaka <monaka@monami-ya.com>

ENV HOME /root
RUN mkdir -p /build
COPY . /build

RUN chmod 750 /build/prepare.sh && \
	chmod 750 /build/system_services.sh && \
	chmod 750 /build/utilities.sh && \
	chmod 750 /build/cleanup.sh

RUN /build/prepare.sh && \
	/build/system_services.sh && \
	/build/utilities.sh && \
	/build/cleanup.sh

EXPOSE 22

CMD ["/sbin/my_init"]
