FROM alpine:latest
MAINTAINER ntmggr
ENV REFRESHED_AT 2016-06-23

ENV S3BUCKET microservices-devops
ENV S3REGION us-west-2
ENV BACKUPINTERVAL 60
ENV CONSUL_HTTP_ADDR 127.0.0.1:8500

# install necessary packages
RUN apk update && apk add make curl git mercurial bzr go && \
    rm -rf /var/cache/apk/*

ENV GOROOT /usr/lib/go
ENV GOPATH /gopath
ENV GOBIN /gopath/bin
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin



# clone consul-snapshot
RUN git clone https://github.com/pshima/consul-snapshot $HOME/consul-snapshot && \
    cd $HOME/consul-snapshot && \
    make build && \
    make install

ENTRYPOINT ["/usr/local/bin/consul-snapshot"]
CMD ["backup"]