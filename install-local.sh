#!/bin/bash

# Simple local installer for the modified bai.sh

SOURCE_SCRIPT="./bai.sh" # Assumes bai.sh is in the same directory
TARGET_DIR="/usr/local/bin"
TARGET_NAME="bai"
TARGET_PATH="${TARGET_DIR}/${TARGET_NAME}"

echo "Attempting to install ${SOURCE_SCRIPT} to ${TARGET_PATH}..."

# Check if source script exists
if [ ! -f "$SOURCE_SCRIPT" ]; then
    echo "ERROR: Source script '${SOURCE_SCRIPT}' not found in the current directory."
    exit 1
fi

# Check if target directory exists (it usually does)
if [ ! -d "$TARGET_DIR" ]; then
    echo "ERROR: Target directory '${TARGET_DIR}' does not exist."
    echo "You might need to create it manually (e.g., sudo mkdir -p ${TARGET_DIR})"
    exit 1
fi

# Copy the script using sudo
echo "Copying script (requires sudo)..."
sudo cp "$SOURCE_SCRIPT" "$TARGET_PATH"
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to copy script to ${TARGET_PATH}."
    exit 1
fi
echo "Script copied successfully."

# Set execute permissions using sudo
echo "Setting execute permissions (requires sudo)..."
sudo chmod +x "$TARGET_PATH"
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to set execute permissions on ${TARGET_PATH}."
    # Attempt to clean up if chmod fails? Maybe not necessary.
    exit 1
fi
echo "Permissions set successfully."

echo
echo "Installation complete!"
echo "You can now try running the command: ${TARGET_NAME}"
echo "(You might need to open a new terminal or run 'hash -r')"
exit 0
