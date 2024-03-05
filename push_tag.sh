#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

major="0"
minor="1"
build=$(date +%Y%m%d%H%M%S)
version="$major.$minor.$build"

git tag -a "$version" -m "Version $version"
git push origin "$version"
echo "Pushed tag $version to origin"
