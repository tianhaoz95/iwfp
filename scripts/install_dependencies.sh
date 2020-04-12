#!/bin/bash

set -e
set -o pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJ_ROOT="$(dirname "$SCRIPT_DIR")"

npm install -g yarn
npm install -g prettier

cd $PROJ_ROOT/app
flutter pub get
cd $PROJ_ROOT

cd $PROJ_ROOT/functions
npm install
cd $PROJ_ROOT

cd $PROJ_ROOT/app
yarn install
cd $PROJ_ROOT
