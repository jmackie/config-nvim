#!/usr/bin/env bash

# Enable bash "strict mode"
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
shopt -s inherit_errexit
IFS=$'\n\t'

# I forget this all the time and always need it...
#HERE="${0%/*}"   

usage() {
    cat >/dev/stderr <<-EOF
Usage: ${0} ARG1 ARG2 [ARG3]

What is this thing?
EOF
}

main() {
    if [[ "$#" -lt 2 ]]; then
        usage
        exit 1
    fi

    local -r arg1="$1"; shift
    local -r arg2="$1"; shift
    local -r arg3="${1:-default-value}"

    # do stuff with args...
    echo "arg1=$arg1 arg2=$arg2 arg3=$arg3"
}

main "$@"
