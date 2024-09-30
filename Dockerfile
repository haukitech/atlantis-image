# Copyright 2024 Hauki Tech sp. z o.o.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ARG ATLANTIS_VERSION="v0.30.0"

FROM docker.io/alpine:3.20 AS build

ARG TERRAGRUNT_VERSION="0.67.14"
ARG TERRAGRUNT_CHECKSUM="00fc7cd273f516f9ad5e560c2d5d578c0d9ec7592306c17ca6560792d99ffdf2"

ARG SOPS_VERSION="3.9.0"
ARG SOPS_CHECKSUM="0d65660fbe785647ff4f1764d7f69edf598f79d6d79ebbef4a501909b6ff6b82"

RUN mkdir -p /extra_tools/bin
WORKDIR /extra_tools

ADD https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 ./bin/terragrunt
ADD https://github.com/getsops/sops/releases/download/v${SOPS_VERSION}/sops-v${SOPS_VERSION}.linux.amd64 ./bin/sops

COPY --chmod=0755 ./verify_extra_tools_checksum.sh verify_extra_tools_checksum.sh
RUN ./verify_extra_tools_checksum.sh


FROM ghcr.io/runatlantis/atlantis:${ATLANTIS_VERSION}

RUN apk add --no-cache aws-cli
COPY --from=build --chown=root:root --chmod=0755 /extra_tools/bin/ /usr/local/bin/

USER atlantis
