#!/bin/bash

# search.sh: A script to search for a keyword in a file or directory

# Prompt the user for a keyword and file/directory
read -p "Enter the keyword to search for: " keyword
read -p "Enter the file or directory to search in: " target

# Check if the target exists
if [ ! -e "$target" ]; then
    echo "Error: '$target' does not exist."
    exit 1
fi

# Perform the search
if [ -f "$target" ]; then
    echo "Searching in file '$target'..."
    grep -i "$keyword" "$target"
elif [ -d "$target" ]; then
    echo "Searching in directory '$target'..."
    grep -ri "$keyword" "$target"
else
    echo "Error: '$target' is not a file or directory."
    exit 1
fi
