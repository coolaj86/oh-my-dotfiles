#!/usr/bin/env bash
rm -f .config.fish
touch .config.fish
for file in src/all/*.partial; do
  cat $file >> .config.fish
done
for file in src/fish/*.partial; do
  cat $file >> .config.fish
done
