#!/bin/bash

KEYFILE=~/.ssh/authorized_keys

for FILE in pubkeys/*; do
    KEY=`cat $FILE`
    grep -qF -- "$KEY" "$KEYFILE" || echo "$KEY" >> "$KEYFILE"
done
