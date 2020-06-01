FROM node:latest
USER root
RUN apt update
RUN apt-get -y install sudo
