# packer-build

A Docker container image that includes Packer and Ansible for infrastructure provisioning and configuration management.

## Overview

This repository provides a containerized environment with:
- **Packer** (v1.14.2) - for building machine images
- **Ansible** (v9.x) - for configuration management and provisioning
- **Amazon Linux 2023** base image with essential system tools

## Usage

### Pull the image
```bash
docker pull ghcr.io/travelodge-digital/packer-build:latest
```

### Run Packer commands
```bash
# Check Packer version
docker run --rm ghcr.io/travelodge-digital/packer-build:latest version

# Build from a Packer template (mount your project directory)
docker run --rm -v $(pwd):/workspace -w /workspace \
  ghcr.io/travelodge-digital/packer-build:latest build template.pkr.hcl
```

### Interactive usage
```bash
docker run --rm -it --entrypoint /bin/bash ghcr.io/travelodge-digital/packer-build:latest
```

## Building locally

```bash
git clone https://github.com/travelodge-digital/packer-build.git
cd packer-build
docker build -t packer-build .
```

## Included Tools

- **Packer** 1.11.2 - Infrastructure as Code for building images
- **Ansible** 9.x - Configuration management and application deployment
- **Ant** 1.10.x - Build tool for legacy app
- **System utilities**: curl, unzip, openssh-clients, python3-pip

## CI/CD

This repository uses GitHub Actions to automatically:
- Build multi-architecture Docker images (linux/amd64, linux/arm64)
- Create version tags automatically
- Publish to GitHub Container Registry (ghcr.io)

Images are available at: `ghcr.io/travelodge-digital/packer-build`