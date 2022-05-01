#!/bin/bash

_HOME2_=$(dirname $0)
export _HOME2_
_HOME_=$(cd $_HOME2_;pwd)
export _HOME_

echo $_HOME_
cd $_HOME_

if [ "$1""x" == "x" ]; then
  exit 1
fi

srcdir="$1"
dstdir="$_HOME_"

cd "$1"/

git log --format=oneline 2>&1|grep _zoff_tc|while read a; do
  hash=$(echo $a|cut -d ' ' -f 1)
  name=$(echo $a|cut -d ' ' -f 2)
  git show $hash > "$_HOME_"'/'"$name"'.diff'
done
