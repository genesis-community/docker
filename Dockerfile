FROM ubuntu:18.04
MAINTAINER James Hunt <james@niftylogic.com>

RUN apt-get update \
 && apt-get install -y curl wget git unzip \
 && rm -rf /var/lib/apt/lists/* \
 && curl -Lo vault.zip https://releases.hashicorp.com/vault/1.1.3/vault_1.1.3_linux_amd64.zip \
     && unzip vault.zip \
     && mv vault /usr/bin/vault \
     && chmod 0755 /usr/bin/vault \
     && rm vault.zip \
 && curl -Lo /usr/bin/safe https://github.com/starkandwayne/safe/releases/download/v1.2.1/safe-linux-amd64 \
     && chmod 0755 /usr/bin/safe \
 && curl -Lo /usr/bin/spruce https://github.com/geofffranks/spruce/releases/download/v1.20.0/spruce-linux-amd64 \
     && chmod 0755 /usr/bin/spruce \
 && curl -Lo /usr/bin/jq https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 \
     && chmod 0755 /usr/bin/jq \
 && curl -Lo /usr/bin/bosh https://github.com/cloudfoundry/bosh-cli/releases/download/v5.5.1/bosh-cli-5.5.1-linux-amd64 \
     && chmod 0755 /usr/bin/bosh

RUN curl -Lo /usr/bin/genesis https://github.com/genesis-community/genesis/releases/download/v2.6.16/genesis \
     && chmod 0755 /usr/bin/genesis
