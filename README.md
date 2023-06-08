Genesis Docker Image
====================

## DEPRECATED

#### This functionality has been moved into the genesis ci pipeline.

The pipeline will produce production and dev images, which can be found on dockerhub under genesiscommunit/genesis.  Tags `latest` will be the latest production release, while `dev` will be the latest development release candidate.  Versioned images will also be found with the version as its tag.

This repository will no longer be maintained

----

This repository contains the recipe for the Genesis Docker Image,
a container image that wraps up all of the tools and libraries
necessary for running Genesis deployments.  It is intended to be
useful for evaluation of Genesis and running CI/CD pipelines that
do deployments.

Software Installed
------------------

- **Vault** v1.4.0 (https://vaultproject.io)
- **Safe** v1.5.4 (https://github.com/starkandwayne/safe)
- **Spruce** v1.25.2 (https://github.com/geofffranks/spruce)
- **jq** v1.6 (https://github.com/stedolan/jq)
- **BOSH** v6.2.1 (https://github.com/cloudfoundry/bosh-cli)
- **Genesis** v2.7.1 (https://github.com/genesis-community/genesis)

Usage
-----

You almost invariably want to run a shell in the docker container,
and use that to execute Genesis:

    docker run -it starkandwayne/genesis /bin/bash
    $ genesis -v
    ... etc ...

Happy Hacking!
