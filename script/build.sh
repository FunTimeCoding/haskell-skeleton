#!/bin/sh -e

# In case this has not been run before, dependencies cannot be installed.
cabal update

cabal clean

rm -rf build

cabal install --only-dependencies --enable-tests
cabal configure --enable-tests
#cabal build
cabal test

script/check.sh --ci-mode
script/measure.sh --ci-mode
#script/test.sh --ci-mode
#SYSTEM=$(uname)
#
# TODO: Needs polish.
#if [ "${SYSTEM}" = Linux ]; then
#    script/debian/package.sh
#    script/docker/build.sh
#fi
