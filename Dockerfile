FROM alpine:latest

ENV TERRAFORM_VERSION=0.11.11
ENV AWS_IAM_AUTHENTICATOR_VERSION=1.11.5
ENV AWS_IAM_AUTHENTICATOR_RELEASE_VERSION=2018-12-06
ENV KUBECTL_VERSION=v1.13.3
ENV EKSCTL_VERSION=0.1.19
ENV HELM_VERSION=v2.12.3

RUN apk update && apk upgrade \
    && apk add --no-cache bash git openssl ca-certificates docker python3 unzip wget curl tar \
    && python3 -m ensurepip \
    && rm -r /usr/lib/python*/ensurepip \
    && pip3 install --upgrade pip setuptools \
    && if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi \
    && if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi \
    && pip install awscli invoke \
    && cd /usr/bin \
    && wget https://amazon-eks.s3-us-west-2.amazonaws.com/${AWS_IAM_AUTHENTICATOR_VERSION}/${AWS_IAM_AUTHENTICATOR_RELEASE_VERSION}/bin/linux/amd64/aws-iam-authenticator \
    && chmod +x ./aws-iam-authenticator \
    && wget https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && cd /tmp \
    && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin \
    && curl -sL "https://github.com/weaveworks/eksctl/releases/download/${EKSCTL_VERSION}/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /usr/bin \
    && wget -q https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/bin/helm \
    && chmod +x /usr/bin/helm \
    && apk del wget \
    && rm -r /root/.cache \
    && rm -rf /tmp/* \
    && rm -rf /var/cache/apk/* \
    && rm -rf /var/tmp/*