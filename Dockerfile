FROM alpine:3.12.0

ARG VERSION=0.9.1
ARG ARCH=linux_amd64

RUN apk update && \
	apk add --no-cache --virtual=install curl && \
	curl -o /bin/git-chglog -L https://github.com/git-chglog/git-chglog/releases/download/$VERSION/git-chglog_$ARCH && \
	chmod +x /bin/git-chglog && \
	apk del install && \
	apk add --no-cache git

ENTRYPOINT [ "git-chglog", "--version" ]
