# SPDX-FileCopyrightText: 2021 The NGI Pointer Secure-Scuttlebutt Team of 2020/2021
#
# SPDX-License-Identifier: Unlicense

FROM golang:1.16-alpine as build

RUN mkdir -p /app/data /app/code /app/data/.ssg-go-room-secrets

WORKDIR /app/code

RUN apk add --no-cache \
      build-base \
      git \
      sqlite \
      sqlite-dev \
      bash

COPY . /app/code

RUN cd /app/code/cmd/server && go build && \
    cd /app/code/cmd/insert-user && go build

FROM alpine:3.14

COPY --from=build /app/code /app/code
WORKDIR /app/code

EXPOSE 8008
EXPOSE 3000

ENV REPO /app/data/.ssb-go-room-secrets

RUN chmod +x /app/code/start.sh

CMD /app/code/start.sh
