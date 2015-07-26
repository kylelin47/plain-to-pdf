#!/bin/bash
move_logs()
{
    log_folder="$1"/logs
    echo "Moving logs to ${log_folder}"
    mkdir -p "$log_folder"
    mv "$1"/*.log "$log_folder"
}
getopts ":o:" opt
if [ -z "$OPTARG" ];
    then output=.;
else output="$OPTARG";
fi
mkdir -p "$output"
for script in "`dirname $0`/scripts/convert_"*.sh; do
    "$script" "$output"
done
move_logs "$output"
