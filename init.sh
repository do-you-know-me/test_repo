#!/bin/bash

set -e

echo "Init Git submodules"
git submodule init

echo "Update submodules"
git submodule update
