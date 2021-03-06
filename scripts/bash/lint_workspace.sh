#!/bin/bash

set -e
set -o pipefail

if [[ $1 != "check" ]] && [[ $1 != "format" ]]
then
  echo "example usage: lint_workspace.sh [check/format]"
  exit 1
fi

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
  $SERVER_ROOT/package.json \
  $SERVER_ROOT/README.md \
  $SERVER_ROOT/tslint.json \
  $SERVER_ROOT/tsconfig.json \
  $SERVER_ROOT/jest.config.js
cd $SERVER_ROOT
npm install
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
  $APP_ROOT/pubspec.yaml \
  $APP_ROOT/analysis_options.yaml \
  $APP_ROOT/dartdoc_options.yaml \
  $APP_ROOT/README.md
cd $APP_ROOT
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
$GENERIC_CHECKER $SITE_ROOT/package.json
cd $SITE_ROOT
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
$GENERIC_CHECKER $FIREBASE_ROOT/firebase.json $FIREBASE_ROOT/database.rules.json $FIREBASE_ROOT/firestore.indexes.json

# Check gitpod config
$GENERIC_CHECKER $PROJ_ROOT/.gitpod.yml

# Check vscode config
$GENERIC_CHECKER $PROJ_ROOT/.vscode/settings.json

# Check templates
$GENERIC_CHECKER $PROJ_ROOT/.github/ISSUE_TEMPLATE/*.md $PROJ_ROOT/.github/pull_request_template.md

# Check dependabot config
$GENERIC_CHECKER $PROJ_ROOT/.github/dependabot.yml

# Chkec the Vercel server shell code
cd $VERCEL_SERVER_ROOT
npm run format
if [[ $1 == "check" ]]
then
  # TODO(tianhaoz95): add a lint option for vercel linter script
  npm run format
fi
if [[ $1 == "format" ]]
then
  npm run format
fi
cd $PROJ_ROOT