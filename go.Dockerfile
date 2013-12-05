# erkl/go:1.2
FROM stackbrew/ubuntu:13.10

MAINTAINER Erik Lundin <erklundin@gmail.com>

# install wget
RUN apt-get update
RUN apt-get -y install wget

# install go to /usr/local/go
RUN wget -nv -O - 'http://go.googlecode.com/files/go1.2.linux-amd64.tar.gz' | tar -xzf - -C /usr/local

# configure GOPATH and GOROOT
ENV GOPATH /go
ENV GOROOT /usr/local/go

# make sure GOPATH actually exists
RUN mkdir -p "$GOPATH"

# update PATH
ENV PATH $GOPATH/bin:$GOROOT/bin:$PATH
