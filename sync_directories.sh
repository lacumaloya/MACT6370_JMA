#!/bin/bash

# Define the directories
REPO_DIR="/Users/jasmineaguilar/MACT6370_JMA"
DESKTOP_DIR="/Users/jasmineaguilar/Desktop/MACT6370_JMA"

# Function to show status
show_status() {
    echo "========================================"
    echo "REPOSITORY DIRECTORY: $REPO_DIR"
    echo "DESKTOP DIRECTORY: $DESKTOP_DIR"
    echo "========================================"
    
    # Check if directories exist
    if [ ! -d "$REPO_DIR" ]; then
        echo "ERROR: Repository directory does not exist!"
        exit 1
    fi
    
    if [ ! -d "$DESKTOP_DIR" ]; then
        echo "ERROR: Desktop directory does not exist!"
        exit 1
    fi
    
    # Check if repo directory is a git repository
    if [ ! -d "$REPO_DIR/.git" ]; then
        echo "ERROR: Repository directory is not a git repository!"
    else
        echo "Repository directory IS a git repository ✓"
    fi
    
    # Check if desktop directory is a git repository
    if [ ! -d "$DESKTOP_DIR/.git" ]; then
        echo "Desktop directory is NOT a git repository ✗"
    else
        echo "Desktop directory IS a git repository ✓"
    fi
    
    echo ""
    echo "Files in Repository Directory:"
    ls -la "$REPO_DIR" | grep -v "^d" | grep -v "total"
    
    echo ""
    echo "Files in Desktop Directory:"
    ls -la "$DESKTOP_DIR" | grep -v "^d" | grep -v "total"
    echo "========================================"
}

# Show current status
show_status

# Ask what to do
echo ""
echo "What would you like to do?"
echo "1. Initialize git repository in Desktop directory"
echo "2. Copy all files from Repository to Desktop"
echo "3. Copy all files from Desktop to Repository"
echo "4. Open VS Code with the Repository directory"
echo "5. Exit"
read -p "Enter your choice (1-5): " choice

case $choice in
    1)
        # Initialize git repository in Desktop directory
        cd "$DESKTOP_DIR"
        git init
        git remote add origin https://github.com/lacumaloya/MACT6370_JMA.git
        git fetch
        git checkout main
        echo "Git repository initialized in Desktop directory."
        ;;
    2)
        # Copy files from repo to desktop
        cp -r "$REPO_DIR"/* "$DESKTOP_DIR"/
        echo "Files copied from Repository to Desktop."
        ;;
    3)
        # Copy files from desktop to repo
        cp -r "$DESKTOP_DIR"/* "$REPO_DIR"/
        echo "Files copied from Desktop to Repository."
        echo "You may want to commit these changes to git."
        ;;
    4)
        # Open VS Code with the correct directory
        if [ -d "/Applications/Visual Studio Code.app" ]; then
            open -a "Visual Studio Code" "$REPO_DIR"
            echo "VS Code opened with the Repository directory."
        else
            echo "VS Code not found. Please open it manually and open the directory:"
            echo "$REPO_DIR"
        fi
        ;;
    5)
        echo "Exiting."
        exit 0
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

# Show status after changes
echo ""
echo "Status after changes:"
show_status 