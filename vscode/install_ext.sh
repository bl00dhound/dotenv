#!/bin/bash

cat vscode.ext.txt | xargs -L 1 code --install-extension
