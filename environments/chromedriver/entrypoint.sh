#!/bin/bash

set -o pipefail

${EXTRACT_DIR}/${EXECUTABLE} --port=${USE_PORT}
