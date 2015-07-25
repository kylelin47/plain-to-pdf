#!/bin/bash
getopts ":o:" opt
if [ -z "$OPTARG" ];
    then output=.;
else output="$OPTARG";
fi
mkdir -p "$output"
for script in "`dirname $0`/scripts/"*.sh; do
    "$script" "$output"
done
