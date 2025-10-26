#!/usr/bin/env bash

set -exu

cd "$(dirname "$0")"/..

go install -v github.com/mtratsiuk/b3/cmd/b3@v0.0.7
