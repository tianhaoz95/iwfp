#!/bin/bash

set -o pipefail

CURRENT_DIR=$(pwd)

cd "$APP_ROOT"

flutter build appbundle && flutter build apk --split-per-abi

cd "$CURRENT_DIR"
