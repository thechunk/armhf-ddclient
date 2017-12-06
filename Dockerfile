FROM container4armhf/armhf-alpine

RUN apk --no-cache add perl curl wget make perl-io-socket-ssl
RUN curl -L http://cpanmin.us | perl - --self-upgrade
RUN cpanm JSON::Any

ADD https://downloads.sourceforge.net/project/ddclient/ddclient/ddclient-3.8.3/ddclient-3.8.3.tar.bz2 /ddclient-3.8.3.tar.bz2

RUN tar -xvjf ddclient-3.8.3.tar.bz2 && rm ddclient-3.8.3.tar.bz2 && cp /ddclient-3.8.3/ddclient /usr/sbin/ddclient && rm -rf /ddclient-3.8.3 && mkdir /etc/ddclient && mkdir /var/cache/ddclient

COPY ddclient.conf /etc/ddclient/ddclient.conf
COPY run.sh /run.sh

RUN chmod 600 /etc/ddclient/ddclient.conf && chmod +x /run.sh

VOLUME /etc/ddclient
VOLUME /var/cache/ddclient

CMD ["./run.sh"]
