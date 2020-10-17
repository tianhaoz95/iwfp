#!/bin/bash

set -o pipefail

cd $PROJ_ROOT/app

flutter build web --target lib/entrypoint/ui.dart

mv build/web build/catalog

flutter build web

cd $PROJ_ROOT
