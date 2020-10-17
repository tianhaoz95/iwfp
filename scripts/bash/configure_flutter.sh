#!/bin/bash

set -o pipefail

flutter channel master
flutter config --enable-web
flutter upgrade
flutter --version

cd $PROJ_ROOT/app
flutter pub get
cd $PROJ_ROOT
