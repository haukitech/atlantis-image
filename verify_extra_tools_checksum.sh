#!/bin/sh
set -uex

echo "${TERRAGRUNT_CHECKSUM} /usr/local/bin/terragrunt" | sha256sum -c
echo "${SOPS_CHECKSUM} /usr/local/bin/sops" | sha256sum -c
