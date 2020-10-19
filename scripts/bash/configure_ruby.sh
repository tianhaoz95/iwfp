#!/bin/bash

set -o pipefail

CURRENT_DIR=$(pwd)

cd "$ANDROID_APP_ROOT"

gem install bundler:1.17.3
bundle install

cd "$CURRENT_DIR"
