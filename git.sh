#!/usr/bin/env bash
REPOSITORY=$1
DIRECTORY=$2

echo $REPOSITORY
echo $DIRECTORY

if [ ! -d "$DIRECTORY" ]; then
  git clone $REPOSITORY $DIRECTORY
else
  cd $DIRECTORY && git fetch && git pull
fi
