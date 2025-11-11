FROM public.ecr.aws/amazonlinux/amazonlinux:2023

# system deps
RUN dnf -y install unzip python3-pip openssh-clients curl && dnf clean all

# install Packer
ENV PACKER_VERSION=1.14.2
RUN curl -fsSL https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip -o /tmp/packer.zip \
 && unzip -d /usr/local/bin /tmp/packer.zip && rm /tmp/packer.zip

# install Ansible
RUN pip3 install --no-cache-dir "ansible>=9,<10"

ENTRYPOINT ["packer"]