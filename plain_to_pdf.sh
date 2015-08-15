#!/bin/bash
move_logs()
{
    log_folder="$1"/logs
    echo "Moving logs to ${log_folder}"
    mkdir -p "$log_folder"
    mv "$1"/*.log "$log_folder" 2> /dev/null
}
output=.
while getopts ":o:" opt; do
    case $opt in
        o)
          output="$OPTARG"
          ;;
        \?)
          echo "Invalid option: -$OPTARG" >&2
          exit 1
          ;;
        :)
          echo "Option -$OPTARG requires an argument." >&2
          exit 1
          ;;
    esac
done
mkdir -p "$output"
for script in "`dirname $0`/scripts/convert_"*.sh; do
    "$script" "$output"
done
move_logs "$output"
