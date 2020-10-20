#!/bin/bash

set -o pipefail

CURRENT_DIR=$(pwd)

cd "$APP_ROOT"

flutter drive --target=test_driver/app.dart

cd "$CURRENT_DIR"
