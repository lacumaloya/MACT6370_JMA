#!/bin/bash

# Open VS Code with the correct repository path
cd /Users/jasmineaguilar/MACT6370_JMA

# Try multiple methods to open VS Code on macOS
if [ -d "/Applications/Visual Studio Code.app" ]; then
    open -a "Visual Studio Code" .
elif [ -d "$HOME/Applications/Visual Studio Code.app" ]; then
    open -a "$HOME/Applications/Visual Studio Code.app" .
else
    echo "Could not find VS Code. Please open VS Code manually and use File > Open Folder to open:"
    echo "/Users/jasmineaguilar/MACT6370_JMA"
fi

echo "VS Code should now open with the correct repository folder."
echo "If you're still having issues with git in VS Code, try running the following commands in the VS Code terminal:"
echo "cd /Users/jasmineaguilar/MACT6370_JMA"
echo "git status" 