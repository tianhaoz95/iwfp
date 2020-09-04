#!/bin/bash

set -e
set -o pipefail

if [[ $1 != "check" ]] && [[ $1 != "format" ]]
then
  echo "example usage: lint_workspace.sh [check/format]"
  exit 1
fi

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
LINUX_SCRIPT_DIR="$(dirname "$SCRIPT_DIR")"
PROJ_ROOT="$(dirname "$LINUX_SCRIPT_DIR")"

GENERIC_CHECKER="prettier --write"
if [[ $1 == "check" ]]
then
  GENERIC_CHECKER="prettier --check"
fi
if [[ $1 == "format" ]]
then
  GENERIC_CHECKER="prettier --write"
fi

# Check top-level README
$GENERIC_CHECKER \
  $PROJ_ROOT/README.md \
  $PROJ_ROOT/CONTRIBUTING.md \
  $PROJ_ROOT/CODE_OF_CONDUCT.md

# Check server code
$GENERIC_CHECKER \
  $PROJ_ROOT/functions/package.json \
  $PROJ_ROOT/functions/README.md \
  $PROJ_ROOT/functions/tslint.json \
  $PROJ_ROOT/functions/tsconfig.json \
  $PROJ_ROOT/functions/jest.config.js
cd $PROJ_ROOT/functions
if [[ $1 == "check" ]]
then
  npm run lint
fi
if [[ $1 == "format" ]]
then
  npm run fix
fi
cd $PROJ_ROOT

# Check app code
$GENERIC_CHECKER \
  $PROJ_ROOT/app/pubspec.yaml \
  $PROJ_ROOT/app/analysis_options.yaml \
  $PROJ_ROOT/app/dartdoc_options.yaml \
  $PROJ_ROOT/app/README.md
cd $PROJ_ROOT/app
if [[ $1 == "check" ]]
then
  flutter analyze
fi
if [[ $1 == "format" ]]
then
  flutter format .
fi
cd $PROJ_ROOT

# Check workflows
$GENERIC_CHECKER $PROJ_ROOT/.github/workflows/*.yml

# Check project site
$GENERIC_CHECKER $PROJ_ROOT/site/package.json
cd $PROJ_ROOT/site
if [[ $1 == "check" ]]
then
  yarn docs:lint
fi
if [[ $1 == "format" ]]
then
  yarn docs:format
fi
cd $PROJ_ROOT

# Check Firebase config
$GENERIC_CHECKER $PROJ_ROOT/firebase.json $PROJ_ROOT/database.rules.json $PROJ_ROOT/firestore.indexes.json

# Check gitpod config
$GENERIC_CHECKER $PROJ_ROOT/.gitpod.yml

# Check GitHub pages config
$GENERIC_CHECKER $PROJ_ROOT/_config.yml

# Check vscode config
$GENERIC_CHECKER $PROJ_ROOT/.vscode/settings.json

# Check templates
$GENERIC_CHECKER $PROJ_ROOT/.github/ISSUE_TEMPLATE/*.md $PROJ_ROOT/.github/pull_request_template.md

# Check dependabot config
$GENERIC_CHECKER $PROJ_ROOT/.dependabot/config.yml
