#!/bin/bash
clean()
{
    rm "${1}.aux" 2> /dev/null
    rm "${1}.out" 2> /dev/null
}
find -type f -name "*.tex" ! -name "*_structure.tex" | while read file; do
    output="$1"/$(basename "$file" .tex)
    echo "Converting file ${file} to ${output}.pdf"
    xelatex -jobname="$output" -halt-on-error "$file" | grep -a3 ^!
    clean "$output"
done
