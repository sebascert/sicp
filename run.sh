#!/usr/bin/env bash

# Usage: ./run.sh file1.scm [file2.scm ...]
# Runs one or more Scheme files using MIT Scheme with utils preloaded.

set -e

usage() {
    echo "Usage: $0 file1.scm [file2.scm ...]"
}

[[ $# -lt 1 ]] && {
    usage
    exit 1
} >&2

utils="utils/utils.scm"

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

# Verify each file
for f in "$@"; do
    file="$(realpath "$f")"

    [ -r "$file" ] || {
        echo "Error: unable to read file '$file'"
        continue
    } >&2

    echo "=================================================="
    echo "Running file $(basename "$file")"
    echo "=================================================="
    mit-scheme --quiet --load "$utils" < "$file"
done
