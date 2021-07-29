#!/bin/bash

TEMPLATES_DIR="Templates"
TEMPLATES=$(cd $TEMPLATES_DIR && find . -type d -maxdepth 1 -mindepth 1 && cd ..)
XCODE_TEMPLATES_DIR="$(xcode-select -p)/Library/Xcode/Templates/File Templates/"

for template in $TEMPLATES; do
    source_dir="$(pwd)/$TEMPLATES_DIR/$(basename $template)"
    target_dir="$XCODE_TEMPLATES_DIR$(basename $template)"
    echo "🔗 Linking file $source_dir to $target_dir"
    ln -s "$source_dir" "$target_dir"
done
