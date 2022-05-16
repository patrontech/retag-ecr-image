FROM alpine:3.15
COPY retag-image.sh /retag-image.sh

# Install the AWS CLI
RUN apk add --no-cache \
        jq \
        python3 \
        py3-pip \
    && pip3 install --upgrade pip \
    && pip3 install --no-cache-dir \
        awscli \
    && rm -rf /var/cache/apk/*

ENTRYPOINT ["/retag-image.sh"]
