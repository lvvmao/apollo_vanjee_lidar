#!/bin/bash

# Source file and destination path
DEST_DIR="/opt/apollo/neo/lib/modules/drivers/lidar/vanjeelidar"
DEST_FILE="$DEST_DIR/libVanJeeLaser760Filter_linux.so"

# Prompt the user to select the target architecture
while true; do
    echo "Please select the target architecture:"
    echo "  1) x86"
    echo "  2) aarch64"
    read -p "Enter 1 or 2: " ARCH_CHOICE

    if [ "$ARCH_CHOICE" = "1" ]; then
        SRC="/apollo_workspace/modules/drivers/lidar/vanjeelidar/opt_dll/x86/libVanJeeLaser760Filter_linux.so"
        break
    elif [ "$ARCH_CHOICE" = "2" ]; then
        SRC="/apollo_workspace/modules/drivers/lidar/vanjeelidar/opt_dll/aarch64/libVanJeeLaser760Filter_linux.so"
        break
    else
        echo "Invalid input. Please enter 1 or 2."
    fi
done

# Create destination directory
# sudo mkdir -p "$DEST_DIR"

# Copy the file
sudo cp -f "$SRC" "$DEST_FILE"

# Set permissions
sudo chmod 755 "$DEST_FILE"

# Refresh the dynamic linker cache
# sudo ldconfig 2>/dev/null || true