#!/usr/bin/env bash

# Usage: ./run.sh [-i|--interactive] file1.scm [file2.scm ...]
# Runs one or more Scheme files using MIT Scheme with utils preloaded.

set -e

usage() {
    echo "Usage: $0 [-i|--interactive] file1.scm [file2.scm ...]"
}

[[ $# -lt 1 ]] && {
    usage
    exit 1
} >&2

interactive_flag=0
files=()

# Parse optional --debug
for arg in "$@"; do
    case "$arg" in
        -i|--interactive)
            interactive_flag=1
            ;;
        *)
            files+=("$arg")
            ;;
    esac
done

[[ ${#files[@]} -lt 1 ]] && {
    usage
    exit 1
} >&2

utils="utils/utils.scm"

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

# Verify each file
for f in "${files[@]}"; do
    file="$(realpath "$f")"

    [ -r "$file" ] || {
        echo "Error: unable to read file '$file'"
        continue
    } >&2

    echo "=================================================="
    echo "Running file $(basename "$file")"
    echo "=================================================="
    if [ $interactive_flag = 1 ]; then
        mit-scheme --quiet --load "$utils" --load "$file"
    else
        mit-scheme --quiet --load "$utils" < "$file"
    fi
done
