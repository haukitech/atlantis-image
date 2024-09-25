ARG ATLANTIS_VERSION="v0.29.0"

FROM docker.io/alpine:3.20 AS build

ARG TERRAGRUNT_VERSION="0.67.13"
ARG TERRAGRUNT_CHECKSUM="1053866abc20a2b17ecd4ef5af8f6c974cef88fbcae386e1127fc58bc0000c99"

ARG SOPS_VERSION="3.9.0"
ARG SOPS_CHECKSUM="0d65660fbe785647ff4f1764d7f69edf598f79d6d79ebbef4a501909b6ff6b82"

RUN mkdir -p /extra_tools/bin
WORKDIR /extra_tools

ADD https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 ./bin/terragrunt
ADD https://github.com/getsops/sops/releases/download/v${SOPS_VERSION}/sops-v${SOPS_VERSION}.linux.amd64 ./bin/sops

COPY --chmod=0755 ./verify_extra_tools_checksum.sh verify_extra_tools_checksum.sh
RUN ./verify_extra_tools_checksum.sh


FROM ghcr.io/runatlantis/atlantis:${ATLANTIS_VERSION}

COPY --from=build --chown=root:root --chmod=0755 /extra_tools/bin/ /usr/local/bin/

USER atlantis
