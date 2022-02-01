#!/bin/bash

set -e

echo "Init Git submodules"
/usr/bin/git submodule init

echo "Update submodules"
/usr/bin/git submodule update
