FROM node:10

WORKDIR /functions

RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget

RUN apt -y install default-jre

COPY . /

RUN \
    npm install -g firebase-tools && \
    npm install && \
    npm run build

ENTRYPOINT [ "npm", "run", "emulator:container" ]
