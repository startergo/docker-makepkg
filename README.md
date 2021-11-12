docker-makepkg
==============

[![build status](https://github.com/startergo/docker-makepkg/actions/workflows/build.yaml/badge.svg)](https://github.com/startergo/docker-makepkg/actions/workflows/build.yaml)

This docker image is intended to tests `PKGBUILDs`, by installing dependencies
and running `makepkg -f` in a clean Arch installation. It is intended to be
used by packagers, both via CI, and on non-ArchLinux environments.

The package can be saved to the current director by adding `-e EXPORT_PKG=1`,
and the updated .SRCINFO file for the built package with `-e EXPORT_SRC=1`.

Forked from [whynothugo/makepkg](https://github.com/whynothugo/docker-makepkg) to test building rEFInd in EDK2 environment

Usage with travis
-----------------

Generally, this should be enough:

```
sudo: required

services:
 - docker

script:
  - docker run -v $TRAVIS_BUILD_DIR:/pkg startergo/makepkg
```

Usage locally after cloning the repo and CD to the main repo
-------------

```
docker run --rm --mount type=bind,src=$pwd/pkg,target=/pkg ghcr.io/startergo/makepkg:latest
```
On Windows in Powershell-Core
-----------

```
docker run --rm --mount type=bind,src=$(pwd)/pkg,target=/pkg ghcr.io/startergo/makepkg:latest
```

Or export the built package file to the workding directory

```
docker run -e EXPORT_PKG=1 -v $PWD:/pkg ghcr.io/startergo/makepkg:latest
```

Or export the updated .SRCINFO for the package

```
docker run -e EXPORT_SRC=1 -v $PWD:/pkg ghcr.io/startergo/makepkg:latest
```

If you are running Arch, add `-v /etc/pacman.d/mirrorlist:/etc/pacman.d/mirrorlist:ro`
to use your own mirrors.

Usage with GitLab CI
--------------------

Since GitLab CI uses Docker, it should be trivial to use these images there
too.

Extra details
-------------

* `base-devel` is preinstalled.
* All `depends` will be installed (including AUR packages using [paru](https://github.com/Jguer/paru)).
* GPG keys used to verify signatures are auto-fetched.

Licence
-------

This repository is licensed under the ISC licence. See LICENCE for details.
