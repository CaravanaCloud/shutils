#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Build started at $(date)."
rm -rf $DIR/bin
mkdir $DIR/bin
find $DIR/src -maxdepth 1 -type f ! -name 'test_*' | sort | xargs cat > ./bin/utils.sh
chmod +x $DIR/bin/utils.sh
echo "Build complete at $(date)."

