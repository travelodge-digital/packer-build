FROM public.ecr.aws/amazonlinux/amazonlinux:2023

# system deps and ansible-core
RUN dnf -y install --allowerasing unzip python3-pip openssh-clients curl ant ansible-core-2.15.3-1.amzn2023.0.11 && dnf clean all

# install Packer
ENV PACKER_VERSION=1.14.2

RUN curl -fsSL https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip -o /tmp/packer.zip \
 && unzip -d /usr/local/bin /tmp/packer.zip && rm /tmp/packer.zip
