FROM alpine:3.6

RUN apk --no-cache update && \
    apk --no-cache add python py-pip py-setuptools ca-certificates groff less jq bash && \
    pip --no-cache-dir install awscli && \
    rm -rf /var/cache/apk/*

WORKDIR /data

COPY entrypoint.sh /
COPY assume.sh /usr/bin

ENTRYPOINT [ "/entrypoint.sh" ]