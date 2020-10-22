#!/bin/bash

set -o pipefail

flutter channel master
flutter config --enable-web
flutter upgrade
flutter --version
flutter doctor -v

cd $APP_ROOT
flutter pub get
cd $PROJ_ROOT
