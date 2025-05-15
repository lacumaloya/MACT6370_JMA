#!/bin/bash

# Show current directory and check if it's a git repository
echo "CURRENT DIRECTORY: $(pwd)"
if [ -d ".git" ]; then
    echo "SUCCESS: This IS a git repository!"
    echo "Git is properly configured in this directory."
else
    echo "ERROR: This is NOT a git repository!"
    echo "No .git directory found in the current location."
    
    # Check if the MACT6370_JMA directory exists at the expected path
    if [ -d "/Users/jasmineaguilar/MACT6370_JMA/.git" ]; then
        echo "FOUND: Git repository exists at /Users/jasmineaguilar/MACT6370_JMA"
        echo ""
        echo "To fix this issue, run:"
        echo "cd /Users/jasmineaguilar/MACT6370_JMA"
        echo ""
        
        # Ask if they want to change directory automatically
        echo "Would you like to change to the correct directory now? (y/n)"
        read -p "> " answer
        if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
            cd /Users/jasmineaguilar/MACT6370_JMA
            echo "Directory changed to: $(pwd)"
            echo "Now try running 'git status' to verify it works."
        fi
    else
        echo "ERROR: Could not find git repository at /Users/jasmineaguilar/MACT6370_JMA either."
        echo "The repository may be in a different location or not initialized."
    fi
fi

# Print helpful git commands
echo ""
echo "USEFUL GIT COMMANDS:"
echo "git status         - Check repository status"
echo "git add .          - Stage all changes"
echo "git commit -m \"message\" - Commit changes"
echo "git push           - Push changes to remote"
 