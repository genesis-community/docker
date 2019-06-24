Genesis Docker Image
====================

This repository contains the recipe for the Genesis Docker Image,
a container image that wraps up all of the tools and libraries
necessary for running Genesis deployments.  It is intended to be
useful for evaluation of Genesis and running CI/CD pipelines that
do deployments.

Software Installed
------------------

- **Vault** v1.1.3 (https://vaultproject.io)
- **Safe** v1.2.1 (https://github.com/starkandwayne/safe)
- **Spruce** v1.2.0 (https://github.com/geofffranks/spruce)
- **jq** v1.6 (https://github.com/stedolan/jq)
- **BOSH** v5.5.1 (https://github.com/cloudfoundry/bosh-cli)
- **Genesis** v2.6.16 (https://github.com/genesis-community/genesis)

Usage
-----

You almost invariably want to run a shell in the docker container,
and use that to execute Genesis:

    docker run -it starkandwayne/genesis /bin/bash
    $ genesis -v
    ... etc ...

Happy Hacking!
