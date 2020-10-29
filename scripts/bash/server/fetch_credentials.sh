#!/bin/bash

set -o pipefail

. "$CRED_SCRIPT_DIR/fetch_credential_repository.sh"

export GOOGLE_APPLICATION_CREDENTIALS="$TEMP_DIR/$CREDENTIAL_REPOSITORY/firebase-adminsdk.json"
