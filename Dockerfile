FROM alpine

RUN apk update
RUN apk add --no-cache samba tini

EXPOSE 137/udp 138/udp 139/tcp 445/tcp

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["/sbin/tini", "--", "/usr/bin/entrypoint.sh"]
