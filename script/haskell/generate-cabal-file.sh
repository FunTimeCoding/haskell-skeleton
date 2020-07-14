#!/bin/sh -e

DIRECTORY=$(dirname "${0}")
SCRIPT_DIRECTORY=$(
    cd "${DIRECTORY}" || exit 1
    pwd
)
# shellcheck source=/dev/null
. "${SCRIPT_DIRECTORY}/../../configuration/project.sh"

cabal init --overwrite --non-interactive --is-libandexe --license MIT --minimal --category Testing --synopsis 'Skeleton for Haskell projects.'
rm ChangeLog.md
rm LICENSE

SYSTEM=$(uname)

if [ "${SYSTEM}" = Darwin ]; then
    SED='gsed'
else
    SED='sed'
fi

${SED} --in-place 's/LICENSE/LICENSE.md/' "${PROJECT_NAME_DASH}.cabal"
${SED} --in-place 's/ChangeLog.md/documentation\/CHANGELOG.md/' "${PROJECT_NAME_DASH}.cabal"
