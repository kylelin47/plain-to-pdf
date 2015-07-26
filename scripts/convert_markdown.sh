#!/bin/bash
find -type f -name "*.md" | while read file; do
    output="$1"/$(basename "$file" .md).pdf
    echo "Converting file ${file} to ${output}"
    pandoc "$file" -f markdown_github -o "$output"
done
