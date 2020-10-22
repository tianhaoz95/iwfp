#!/bin/bash

set -o pipefail

CURRENT_DIR=$(pwd)

cd "$ANDROID_APP_ROOT"

bundle exec fastlane internal

cd "$CURRENT_DIR"
