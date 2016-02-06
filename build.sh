#!/bin/sh -e

./run-style-check.sh --ci-mode
cabal build
./run-tests.sh --ci-mode
