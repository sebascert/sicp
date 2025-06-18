#!/usr/bin/env bash

# Usage: ./format.sh path/to/file.scm
# Formats a Scheme file using MIT Scheme pretty printing.

set -e

usage() {
    echo "Usage: $0 path/to/file.scm"
}

[ $# -ne 1 ] && {
    usage
    exit 1
} >&2

file="$1"

[ -r "$file" ] || {
    echo "unable to read file $file"
    exit 1
} >&2

temp=$(mktemp) || {
    echo "unable to create temp file"
    exit 1
} >&2

mit-scheme --quiet <<EOF > "$temp"
(with-input-from-file "$file"
  (lambda ()
    (let loop ()
      (let ((expr (read)))
        (unless (eof-object? expr)
          (pp expr)
          (loop))))))
EOF

cp "$temp" "$file"
rm "$temp"
