#!/bin/bash

set -o pipefail

####################################
## This should only be used in CI ##
####################################

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJ_ROOT="$(dirname "$SCRIPT_DIR")"

flutter channel master
flutter config --enable-web
flutter upgrade
flutter --version

cd $PROJ_ROOT/app
flutter pub get
cd $PROJ_ROOT
