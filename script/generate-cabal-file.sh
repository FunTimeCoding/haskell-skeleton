#!/bin/sh -e

cabal init --overwrite --non-interactive --is-libandexe --license MIT --minimal --category Testing --synopsis 'Skeleton for Haskell projects.'
rm ChangeLog.md
rm LICENSE

SYSTEM=$(uname)

if [ "${SYSTEM}" = Darwin ]; then
    SED='gsed'
else
    SED='sed'
fi

${SED} --in-place 's/LICENSE/LICENSE.md/' haskell-skeleton.cabal
${SED} --in-place 's/ChangeLog.md/documentation\/CHANGELOG.md/' haskell-skeleton.cabal
