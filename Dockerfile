#ARG  IMAGE_TAG =lts-slim
FROM jenkins/jenkins:lts-slim

USER root
######### Install docker client

RUN apt update && apt install -y  apt-transport-https \
    ca-certificates curl \
    gnupg gnupg2 \
    software-properties-common \
    lsb-release

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key  add -
RUN add-apt-repository  "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" 
RUN apt update && apt install -y docker-ce-cli

######### Install ansible 

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
RUN add-apt-repository "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main"
RUN apt update &&  apt install -y  ansible

########## Install jenkins plugins

USER jenkins

RUN jenkins-plugin-cli --plugins \
  workflow-aggregator \
  pipeline-model-definition \
  antisamy-markup-formatter \
  docker-workflow \
  git \
  junit \
  cobertura \
  ansible \

