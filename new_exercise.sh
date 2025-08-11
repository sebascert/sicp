#!/usr/bin/env bash

# Usage: ./new_exercise.sh [-c|--chapter] <name>.<scm|md>
# Creates a new exercise, with given extension, and optionally new chapter.

set -e

usage(){
    cat <<EOF
Usage:
  ./new_exercise.sh [-c | --chapter] <name>.<scm|md>

Options:
  -c, --chapter    Create the exercise in new chapter
EOF
}

exercise_dir=exercises

new_chapter=0
name=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        -c|--chapter)
            new_chapter=1
            shift
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        -*)
            echo "Unknown option: $1"
            usage
            exit 1
            ;;
        *)
            if [[ -z "$name" ]]; then
                name="$1"
                if [[ ! "$name" =~ \.(scm|md)$ ]]; then
                    echo "Error: <name> must end with .scm or .md"
                    usage
                    exit 1
                fi
                shift
            else
                echo "Unexpected argument: $1"
                usage
                exit 1
            fi
            ;;
    esac
done

if [[ -z "$name" ]]; then
    echo "Error: Missing exercise name argument"
    usage
    exit 1
fi

read chapter ex < <(
    ls exercises/ | grep -E '^[0-9]+\.[0-9]+\..*\.(scm|md)$' | \
        awk -F. '{print $1, $2}' | \
        sort -k1,1n -k2,2n | \
        tail -n1
)

mkdir -p "$exercise_dir"

if [ "$new_chapter" = 1 ]; then
    touch "$exercise_dir/$(( chapter + 1 )).1.$name"
    exit 0
fi

touch "$exercise_dir/${chapter}.$(( ex + 1 )).$name"
