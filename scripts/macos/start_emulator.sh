#!/bin/bash

set -o pipefail

echo "Available devices are:"
xcrun instruments -s

UDID=$(xcrun instruments -s | awk -F ' *[][]' -v 'device=${DEVICE_ID}' '$1 == device { print $2 }')
xcrun simctl boot "${UDID:?No Simulator with this name found}"
