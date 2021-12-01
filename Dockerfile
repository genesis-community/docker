FROM ubuntu:18.04
MAINTAINER Dennis J. Bell <dennis.j.bell@gmail.com>

RUN apt-get update \
 && apt-get install -yy wget gnupg \
 && wget -q -O - https://raw.githubusercontent.com/starkandwayne/homebrew-cf/master/public.key | apt-key add - \
 && echo "deb http://apt.starkandwayne.com stable main" | tee /etc/apt/sources.list.d/starkandwayne.list \
 && wget -q -O - https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
 && echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list \
 && apt-get update && apt-get install -yy \
    aha \
    autoconf \
    bosh-cli \
    build-essential \
    bzip2 \
    certstrap \
    cf-cli \
    cf6-cli \
    concourse-fly \
    credhub-cli \
    curl \
    git \
    gotcha \
    file \
    kubectl \
    libreadline7 \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libtool \
    libxml2-dev \
    libxslt-dev \
    libyaml-dev \
    libyaml-perl \
    lsof \
    om \
    openssl \
    pivnet-cli \
    ruby \
    ruby-dev \
    sipcalc \
    spruce \
    sqlite3 \
    vim-common \
    unzip \
    zlib1g-dev \
    zlibc \
 && rm -rf /var/lib/apt/lists/* \
 && curl -Lo vault.zip https://releases.hashicorp.com/vault/1.6.3/vault_1.6.3_linux_amd64.zip \
     && unzip vault.zip \
     && mv vault /usr/bin/vault \
     && chmod 0755 /usr/bin/vault \
     && rm vault.zip \
 && curl -Lo /usr/bin/safe https://github.com/starkandwayne/safe/releases/download/v1.6.1/safe-linux-amd64 \
     && chmod 0755 /usr/bin/safe \
 && curl -Lo /usr/bin/spruce https://github.com/geofffranks/spruce/releases/download/v1.28.0/spruce-linux-amd64 \
     && chmod 0755 /usr/bin/spruce \
 && curl -Lo /usr/bin/jq https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 \
     && chmod 0755 /usr/bin/jq \
 && curl -Lo /usr/bin/bosh https://github.com/cloudfoundry/bosh-cli/releases/download/v6.4.4/bosh-cli-6.4.4-linux-amd64 \
     && chmod 0755 /usr/bin/bosh

RUN curl -Lo credhub_cli.tgz https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.9.0/credhub-linux-2.9.0.tgz \
 && tar -zxf credhub_cli.tgz \
 && mv credhub /usr/bin/credhub \
 && chmod 0755 /usr/bin/credhub \
 && rm credhub_cli.tgz

ARG GENESIS_VERSION

RUN curl -Lo /usr/bin/genesis https://github.com/genesis-community/genesis/releases/download/v$GENESIS_VERSION/genesis \
     && chmod 0755 /usr/bin/genesis

RUN genesis -v
