#!/bin/bash

set -o pipefail

CURRENT_DIR=$(pwd)

cd "$FIREBASE_ROOT"

firebase deploy --token $FIREBASE_TOKEN

cd "$CURRENT_DIR"
