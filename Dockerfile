ARG ATLANTIS_VERSION="v0.27.2"

FROM ghcr.io/runatlantis/atlantis:${ATLANTIS_VERSION}

ARG TERRAGRUNT_VERSION="v0.57.5"
ARG SOPS_VERSION="v3.8.1"

ADD --chown=root:root --chmod=0755 https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 /usr/local/bin/terragrunt
ADD --chown=root:root --chmod=0755 https://github.com/getsops/sops/releases/download/${SOPS_VERSION}/sops-${SOPS_VERSION}.linux.amd64 /usr/local/bin/sops

USER atlantis
