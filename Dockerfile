FROM alpine:latest
RUN apk add --no-cache samba
CMD ["smbd", "--foreground", "--no-process-group"]
