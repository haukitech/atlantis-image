ARG ATLANTIS_VERSION="v0.29.0"

FROM ghcr.io/runatlantis/atlantis:${ATLANTIS_VERSION}

ARG TERRAGRUNT_VERSION="v0.67.11"
ARG TERRAGRUNT_CHECKSUM="43e062ad6a5e22542748e81d1449b7a135bbf610d4ceed986dc6d30388a35634"

ARG SOPS_VERSION="v3.9.0"
ARG SOPS_CHECKSUM="0d65660fbe785647ff4f1764d7f69edf598f79d6d79ebbef4a501909b6ff6b82"

ADD --chown=root:root --chmod=0755 https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 /usr/local/bin/terragrunt
ADD --chown=root:root --chmod=0755 https://github.com/getsops/sops/releases/download/${SOPS_VERSION}/sops-${SOPS_VERSION}.linux.amd64 /usr/local/bin/sops

COPY --chmod=0755 ./verify_extra_tools_checksum.sh /usr/local/bin/verify_extra_tools_checksum.sh
RUN /usr/local/bin/verify_extra_tools_checksum.sh

USER atlantis
