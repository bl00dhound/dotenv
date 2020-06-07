#!/bin/bash

cat vscode.ext.txt | xargs -L 1 code --install-extension
cp keybindings.json ~/Library/Application\ Support/Code/User/
cp settings.json ~/Library/Application\ Support/Code/User/
cp snippets/* ~/Library/Application\ Support/Code/User/snippents/* 
