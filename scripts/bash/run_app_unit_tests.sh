#!/bin/bash

set -o pipefail

CURRENT_DIR=$(pwd)

cd "$APP_ROOT"

flutter analyze && flutter test

cd "$CURRENT_DIR"
