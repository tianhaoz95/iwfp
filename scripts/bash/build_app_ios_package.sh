#!/bin/bash

set -o pipefail

CURRENT_DIR=$(pwd)

cd "$APP_ROOT"

flutter build ios --release --no-codesign

cd "$CURRENT_DIR"
