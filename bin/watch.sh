#!/usr/bin/env bash

set -eu

cd "$(dirname "$0")"/..

last_hash=""

inotifywait -m -r ./posts ./assets ./b3.json -e create -e delete -e move -e modify |
    while read directory action file; do
        changed="$directory$file"

        if [ -e "$changed" ]; then
            current_hash=$(md5sum "$changed")
        else
            current_hash=$changed
        fi

        if [ "$current_hash" != "$last_hash" ]; then
            echo "file changed: $changed"
            ./bin/build.sh -v
        fi

        last_hash="$current_hash"
    done
