# erkl/node:0.10
FROM stackbrew/ubuntu:13.10

MAINTAINER Erik Lundin <erklundin@gmail.com>

# install wget
RUN apt-get update
RUN apt-get -y install wget

# install node to /usr/local/node
RUN wget -nv -O - 'http://nodejs.org/dist/v0.10.22/node-v0.10.22-linux-x64.tar.gz' | tar -xzf - -C /usr/local
RUN mv /usr/local/node-v0.10.22-linux-x64 /usr/local/node

# update PATH
ENV PATH /usr/local/node/bin:$PATH
