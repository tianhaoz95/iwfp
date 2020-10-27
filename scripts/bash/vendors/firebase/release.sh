#!/bin/bash

set -o pipefail

CURRENT_DIR=$(pwd)

cd "$FIREBASE_ROOT"

firebase deploy --token $FIREBASE_TOKEN --only hosting,database,storage,firestore

cd "$CURRENT_DIR"
