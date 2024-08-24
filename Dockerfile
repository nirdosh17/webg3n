# ######################################################################
# Docker container
# ######################################################################
FROM ubuntu:latest
LABEL maintainer="Bernhard Reitinger <br@rexos.org>"

ENV GO111MODULE=on
ENV APP_PORT=8000

RUN apt-get update
ENV TZ=Europe/Vienna
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install -y xorg-dev libgl1-mesa-dev libopenal1 libopenal-dev libvorbis0a libvorbis-dev libvorbisfile3
RUN apt-get install -y libjpeg-turbo8 libjpeg-turbo8-dev
RUN apt-get install -y xvfb wget tar gcc

ARG GO_VERSION=1.14
ARG GO_ARCH=linux-amd64
WORKDIR /usr/local
RUN wget -q -o /dev/null https://dl.google.com/go/go${GO_VERSION}.${GO_ARCH}.tar.gz
RUN tar -xzf go${GO_VERSION}.${GO_ARCH}.tar.gz
ENV GOROOT=/usr/local/go
ENV GOPATH=/root/go
ENV PATH=${GOROOT}/bin:${GOPATH}/bin:${PATH}
RUN ls -la /usr/local

RUN apt-get install -y ca-certificates
WORKDIR /go/src/app

COPY go.mod .
COPY go.sum .

RUN go mod download

COPY . .

RUN mkdir -p /go/bin

RUN GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" -o /go/bin/web-app

WORKDIR /go/bin

RUN cp -r /go/src/app/templates /go/bin
RUN cp -r /go/src/app/static /go/bin
RUN cp -r /go/src/app/models /go/bin

EXPOSE $APP_PORT

ENTRYPOINT ["/bin/sh", "-c", "/usr/bin/xvfb-run -s \"-screen 0 1920x1080x24\" -a $@", ""]
CMD ["/go/bin/web-app"]
