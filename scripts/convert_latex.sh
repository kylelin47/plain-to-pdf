#!/bin/bash
clean()
{
    rm "${1}.aux"
    rm "${1}.log"
    rm "${1}.out"
}
find -type f -name "*.tex" | while read file; do
    output="$1/$(basename $file .tex)"
    echo "Converting file ${file} to ${output}.pdf"
    pdflatex -interaction=batchmode -jobname="${output}" "$file" -f markdown_github -o "$output"
    clean "$output"
done
