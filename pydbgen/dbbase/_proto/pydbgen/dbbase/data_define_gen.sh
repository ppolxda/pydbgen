#!/bin/bash
# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")
protoc -I$SCRIPTPATH -I$SCRIPTPATH/.. --python_out=$SCRIPTPATH/../../../ $SCRIPTPATH/data_define.proto
