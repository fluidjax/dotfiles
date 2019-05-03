#!/bin/bash

KEYFILE=~/.ssh/authorized_keys
mkdir -p ~/.ssh/
for FILE in ~/dotfiles/pubkeys/*; do
    KEY=`cat $FILE`
    grep -qF -- "$KEY" "$KEYFILE" || echo "$KEY" >> "$KEYFILE"
done