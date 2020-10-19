#!/bin/bash

set -o pipefail

CURRENT_DIR=$(pwd)

cd "$APP_ROOT"

flutter build web --target lib/entrypoint/ui.dart

cd "$CURRENT_DIR"
