#!/bin/sh

if [ ! -d ebin ]; then
  mkdir ebin
fi
for FILE in src/*.erl; do
  erlc -o ebin $FILE
done
