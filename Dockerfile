FROM alpine:3.15
COPY retag-image.sh /retag-image.sh
ENTRYPOINT ["/retag-image.sh"]
