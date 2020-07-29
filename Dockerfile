FROM ubuntu:18.04
MAINTAINER James Hunt <james@niftylogic.com>

RUN apt-get update \
 && apt-get install -y curl wget git unzip \
                       build-essential zlibc zlib1g-dev ruby ruby-dev openssl \
                       libxslt-dev libxml2-dev libssl-dev libreadline7 libreadline-dev \
                       libyaml-dev libsqlite3-dev sqlite3 \
 && rm -rf /var/lib/apt/lists/* \
 && curl -Lo vault.zip https://releases.hashicorp.com/vault/1.4.0/vault_1.4.0_linux_amd64.zip \
     && unzip vault.zip \
     && mv vault /usr/bin/vault \
     && chmod 0755 /usr/bin/vault \
     && rm vault.zip \
 && curl -Lo /usr/bin/safe https://github.com/starkandwayne/safe/releases/download/v1.5.4/safe-linux-amd64 \
     && chmod 0755 /usr/bin/safe \
 && curl -Lo /usr/bin/spruce https://github.com/geofffranks/spruce/releases/download/v1.26.0/spruce-linux-amd64 \
     && chmod 0755 /usr/bin/spruce \
 && curl -Lo /usr/bin/jq https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 \
     && chmod 0755 /usr/bin/jq \
 && curl -Lo /usr/bin/bosh https://github.com/cloudfoundry/bosh-cli/releases/download/v6.2.1/bosh-cli-6.2.1-linux-amd64 \
     && chmod 0755 /usr/bin/bosh

RUN curl -Lo credhub_cli.tgz https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.7.0/credhub-linux-2.7.0.tgz \
 && tar -zxf credhub_cli.tgz \
 && mv credhub /usr/bin/credhub \
 && chmod 0755 /usr/bin/credhub \
 && rm credhub_cli.tgz

ARG GENESIS_VERSION

RUN curl -Lo /usr/bin/genesis https://github.com/genesis-community/genesis/releases/download/v$GENESIS_VERSION/genesis \
     && chmod 0755 /usr/bin/genesis

RUN genesis -v
