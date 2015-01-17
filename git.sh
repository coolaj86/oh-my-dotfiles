#!/usr/bin/env bash
REPOSITORY=$1
DIRECTORY=$2

if [ ! -d "$DIRECTORY" ]; then
  git clone $REPOSITORY $DIRECTORY
else
  cd $DIRECTORY && git fetch && git pull
fi
