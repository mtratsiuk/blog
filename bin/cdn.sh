#!/usr/bin/env bash

set -exu

cd "$(dirname "$0")"/..

b3 --root=. --mode=cdn $@
