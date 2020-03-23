FROM archlinux:latest
MAINTAINER GGMethos <ggmethos@autistici.org>

USER root

RUN echo "Relay Bot Container Build Starting"

RUN pacman -Syyu

RUN pacman -S python2

#install yaourt

#install protobuf python 2 aur pkg

#copy secret config to proper directory

#configure a user and chown the files with said user

#go to directory of sftbot and ./run the bot as final cmd
