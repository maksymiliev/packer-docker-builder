FROM ubuntu:22.04

RUN apt-get update && apt-get install -y curl apt-transport-https ca-certificates curl gnupg-agent software-properties-common
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN apt-get update && apt-get install -y packer docker-ce docker-ce-cli containerd.io

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

