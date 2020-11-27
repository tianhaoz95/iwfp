FROM node:10

RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget

RUN apt -y install default-jre

COPY ./vendors/firebase /

RUN npm install -g firebase-tools

ENTRYPOINT [ "firebase", "emulators:start" ]
