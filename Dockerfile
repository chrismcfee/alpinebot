FROM archlinux:latest
MAINTAINER GGMethos <ggmethos@autistici.org>

USER root

RUN echo "Relay Bot Container Build Starting"

RUN pacman -Syyu

RUN pacman -S python2

#install yaourt

#install protobuf python 2 aur pkg




RUN addgroup mumble && \
adduser -h /home/mumble -s /sbin/nologin -D -G mumble mumble && \
chown -R mumble /home/mumble && \
chown -R mumble /etc/murmur.ini && \
mkdir -p /data && \
chown -R mumble /data

USER root

VOLUME ["/data"]

EXPOSE 64738 64738/udp

#RUN rc-update add murmur boot

COPY data/murmur.ini /etc/murmur.ini

USER mumble

RUN echo "testing"

#RUN /etc/init.d/murmur restart  
#CMD ["murmurd", "-fg", "-ini", "/etc/murmur.ini"]


##########################################################

#custom configuration load in

USER root

VOLUME ["secrets"]

COPY secrets/secret.custom etc/murmur.ini

#########################################################

USER mumble

CMD ["murmurd", "-fg", "-ini", "/etc/murmur.ini"]
