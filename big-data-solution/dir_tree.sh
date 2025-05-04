#!/bin/bash

# Function to display the directory tree, including files and subdirectories
print_tree() {
    local dir=$1
    local indent=$2

    # Loop over all files and directories in the current directory
    for item in "$dir"/*; do
        if [ -d "$item" ]; then
            echo "${indent}|-- $(basename "$item")"
            # Recurse into subdirectory
            print_tree "$item" "$indent    "
        elif [ -f "$item" ]; then
            echo "${indent}|-- $(basename "$item")"
        fi
    done
}

# Start printing the tree from the specified directory
print_tree "/d/SparkOnDocker/working-cluster/big-data-solution" ""

