#!/bin/bash

# Detect Operating System
OS=$(uname -s | tr '[:upper:]' '[:lower:]')

# Detect Architecture
ARCH=$(uname -m)

# Normalize Architecture names
if [ "$ARCH" == "x86_64" ]; then
    ARCH="amd64"
elif [ "$ARCH" == "aarch64" ] || [ "$ARCH" == "arm64" ]; then
    ARCH="arm64"
fi

# Map 'darwin' to 'macos' for your specific file naming if necessary
# and try to find the correct binary
if [ "$OS" == "darwin" ]; then
    BINARY_PATH_1="./blog-darwin-arm64"
    BINARY_PATH_2="./blog-macos-arm64"

    if [ -f "$BINARY_PATH_1" ]; then
        BINARY="$BINARY_PATH_1"
    elif [ -f "$BINARY_PATH_2" ]; then
        BINARY="$BINARY_PATH_2"
    else
        echo "Error: No macOS binary found in $BINARY_DIR"
        exit 1
    fi
else
    # For Linux or other systems
    BINARY="./blog-${OS}-${ARCH}"
fi

# Check if the binary exists and is executable
if [ -x "$BINARY" ]; then
    echo "Running: $BINARY"
    # "$@" passes all arguments from this script to the binary
    "$BINARY" "$@"
else
    echo "Error: Binary not found or not executable at $BINARY"
    exit 1
fi
