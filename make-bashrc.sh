#!/usr/bin/env bash
rm -f .bashrc
touch .bashrc
for file in src/all/*.partial; do
  cat $file >> .bashrc
done
for file in src/bash/*.partial; do
  cat $file >> .bashrc
done
