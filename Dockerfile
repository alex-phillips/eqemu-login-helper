FROM alpine:3.12

LABEL maintainer="hackerman <ahp118@gmail.com>"

COPY src/ /src/
COPY Makefile /

RUN \
 echo "**** install build dependencies ****" && \
 apk update && \
 apk add \
    make \
    g++ && \
 echo "**** build 5998 version ****" && \
 mkdir build && \
 make && \
 mv /bin/eqemu-login-helper /bin/eqemu-login-helper-5998 && \
 echo "**** build 5999 version ****" && \
 sed -i 's|5998|5999|g' ./src/* && \
 make && \
 mv /bin/eqemu-login-helper /bin/eqemu-login-helper-5999 && \
 sed -i 's|5998|5999|g' ./src/*

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
