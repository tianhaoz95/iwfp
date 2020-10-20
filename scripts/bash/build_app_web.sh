#!/bin/bash

set -o pipefail

CURRENT_DIR=$(pwd)

cd "$APP_ROOT"

flutter build web

cd "$CURRENT_DIR"
