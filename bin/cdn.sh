#!/usr/bin/env bash

set -exu

cd "$(dirname "$0")"/..

find ./cdn -regextype posix-extended -regex ".*\.jpe?g$" | xargs exiv2 rm && \
b3 --root=. --mode=cdn -v $@
