#!/bin/sh -e

# In case this has not been run before, dependencies cannot be installed.
cabal update

cabal clean
rm -rf build

#script/check.sh --ci-mode
cabal install --only-dependencies --enable-tests
cabal configure --enable-tests
#cabal build
cabal test
#script/test.sh
