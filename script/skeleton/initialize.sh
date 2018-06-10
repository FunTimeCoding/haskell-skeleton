#!/bin/sh -e

DIRECTORY=$(dirname "${0}")
SCRIPT_DIRECTORY=$(cd "${DIRECTORY}" || exit 1; pwd)
# shellcheck source=/dev/null
. "${SCRIPT_DIRECTORY}/skeleton.sh"
NAME=$(echo "${1}" | grep --extended-regexp '^([A-Z]+[a-z0-9]*){1,}$') || NAME=''

if [ "${NAME}" = '' ]; then
    echo "Usage: ${0} NAME"
    echo "Name must be in upper camel case."

    exit 1
fi

SYSTEM=$(uname)

if [ "${SYSTEM}" = Darwin ]; then
    SED='gsed'
    FIND='gfind'
else
    SED='sed'
    FIND='find'
fi

rm -rf script/skeleton
DASH=$(echo "${NAME}" | ${SED} --regexp-extended 's/([A-Za-z0-9])([A-Z])/\1-\2/g' | tr '[:upper:]' '[:lower:]')
INITIALS=$(echo "${NAME}" | ${SED} 's/\([A-Z]\)[a-z]*/\1/g' | tr '[:upper:]' '[:lower:]')
UNDERSCORE=$(echo "${DASH}" | ${SED} --regexp-extended 's/-/_/g')
# shellcheck disable=SC2016
${FIND} . -regextype posix-extended -type f ! -regex "${EXCLUDE_FILTER}" -exec sh -c '${1} -i --expression "s/HaskellSkeleton/${2}/g" --expression "s/haskell-skeleton/${3}/g" --expression "s/haskell_skeleton/${4}/g" --expression "s/bin\/ss/bin\/${5}/g" --expression "s/hs\\\\/${5}\\\\/g" "${6}"' '_' "${SED}" "${NAME}" "${DASH}" "${UNDERSCORE}" "${INITIALS}" '{}' \;
git mv lib/haskell_skeleton.sh "lib/${UNDERSCORE}.sh"
git mv bin/hs "bin/${INITIALS}"
echo "# This dictionary file is for domain language." > "documentation/dictionary/${DASH}.dic"