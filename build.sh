#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

rm -rf $DIR/bin
mkdir $DIR/bin
find $DIR/src -maxdepth 1 -type f ! -name 'test_*' | sort | xargs cat > ./bin/util.sh
chmod +x $DIR/bin/util.sh
echo "Build complete."

