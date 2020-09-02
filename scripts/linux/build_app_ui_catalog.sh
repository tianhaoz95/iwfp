#!/bin/bash

set -e
set -o pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJ_ROOT="$(dirname "$SCRIPT_DIR")"

cd $PROJ_ROOT/app

flutter build web --target lib/entrypoint/ui.dart

mv build/web build/catalog

flutter build web

cd $PROJ_ROOT
