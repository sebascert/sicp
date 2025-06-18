#!/usr/bin/env bash

# Usage: ./run.sh path/to/file.scm
# Runs a Scheme file using MIT Scheme with utils preloaded.

set -e

usage() {
    echo "Usage: $0 path/to/file.scm"
}

[[ $# -ne 1 ]] && {
    usage
    exit 1
} >&2

file="$(realpath "$1")"
utils="utils/utils.scm"

[ -r "$file" ] || {
    echo "Error: unable to read file '$file'"
    exit 1
} >&2

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

mit-scheme --quiet --load "$utils" < "$file"
