#!/bin/sh -e

cabal clean
rm -rf build
script/check.sh --ci-mode
cabal build
script/test.sh
