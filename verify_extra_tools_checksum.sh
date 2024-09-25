#!/bin/sh
set -uex

cat << EOF | sha256sum -c
${TERRAGRUNT_CHECKSUM} /extra_tools/bin/terragrunt
${SOPS_CHECKSUM} /extra_tools/bin/sops
EOF
