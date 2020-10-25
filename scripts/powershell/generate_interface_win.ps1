# Get project root directory
Set-Variable -Name PROJ_ROOT -Value (get-item $PSScriptRoot).parent.parent.FullName
Write-Output $PROJ_ROOT

# Protobuf location
Set-Variable -Name SRC_DIR -Value $PROJ_ROOT/projects/interfaces

# Dart code locations
Set-Variable -Name DART_DST_DIR -Value $PROJ_ROOT/projects/app/lib/services/interfaces

# TypeScript code locations
Set-Variable -Name  TS_DST_DIR -Value $PROJ_ROOT/vendors/firebase/functions/src/interfaces

protoc -I $SRC_DIR --dart_out=$DART_DST_DIR $SRC_DIR/*.proto

pbjs -t static-module -w commonjs -o $TS_DST_DIR/interfaces.js $SRC_DIR/*.proto
pbts --out $TS_DST_DIR/interfaces.d.ts $TS_DST_DIR/interfaces.js