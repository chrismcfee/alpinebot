FROM archlinux:latest
MAINTAINER GGMethos <ggmethos@autistici.org>

USER root

RUN yes | pacman -Syyu

RUN yes | pacman -S python2

RUN yes | pacman -S git wget yajl

RUN yes | pacman -S autoconf automake binutils bison fakeroot file findutils flex gawk gcc gettext grep groff gzip libtool m4 make pacman patch pkgconf sed sudo texinfo which

RUN cd /tmp && git clone https://aur.archlinux.org/package-query.git


RUN useradd -r -s /usr/bin/nologin tmp

RUN chown -R tmp: /tmp/

USER tmp


RUN cd /tmp/package-query/ && makepkg -si

RUN cd /tmp/ && git clone https://aur.archlinux.org/yaourt.git && cd /tmp/yaourt/ && makepkg -si

RUN yaourt -S --noconfirm python2-protobuf

RUN useradd -r -s /usr/bin/nologin sftbot

RUN mkdir /home/sftbot/

RUN chown -R sftbot: /home/sftbot

USER sftbot

RUN cd /home/sftbot/ && git clone https://github.com/SFTtech/sftmumblebot.git


RUN cd /home/sftmumblebot/

################################################
USER root

VOLUME ["secret"]

#COPY /secret/

################################################


#copy secret config to proper directory

#configure a user and chown the files with said user

#dl or gitclone the sftbot or just copy a zip over and extract

#go to directory of sftbot and ./run the bot as final cmd
