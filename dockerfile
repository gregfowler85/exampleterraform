FROM alpine:latest

RUN apk --update --no-cache add curl \
    && apk --update --no-cache add docker-cli \
    && apk --update --no-cache add bash \
    && apk --no-cache add jq \
    && apk --no-cache add aws-cli

RUN curl -fsSL https://releases.hashicorp.com/terraform/1.3.9/terraform_1.3.9_linux_amd64.zip -o terraform.zip \
    && unzip terraform.zip \
    && rm terraform.zip \
    && mv terraform /usr/local/bin/

COPY ./scripts /usr/local/bin
RUN chmod -R u+x /usr/local/bin/*

CMD ["bash"]
