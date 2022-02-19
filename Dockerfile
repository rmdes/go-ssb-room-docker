k# SPDX-FileCopyrightText: 2021 The NGI Pointer Secure-Scuttlebutt Team of 2020/2021
#
# SPDX-License-Identifier: Unlicense

FROM golang:1.16-alpine as build

RUN apk add --no-cache \
      build-base \
      git \
      sqlite \
      sqlite-dev

RUN mkdir /app
WORKDIR /app
COPY . /app


RUN cd /app/cmd/server && go build && \
    cd /app/cmd/insert-user && go build

FROM alpine:3.14

COPY --from=build /app /app
WORKDIR /app

EXPOSE 8008
EXPOSE 3000

ENV REPO /app/.ssb-go-room-secrets
RUN mkdir /app/.ssb-go-room-secrets
RUN adduser -D -h /app ssb && \
    chown -R ssb:ssb /app && \
    chmod +x ./start.sh

USER ssb

CMD ./start.sh

