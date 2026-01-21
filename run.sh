#!/bin/bash
# Script to build and run the RTIOW raytracer

BUILD_DIR="out/Debug"
OUTPUT_FILE="image.ppm"

if [ ! -d "$BUILD_DIR" ]; then
    echo "Error: $BUILD_DIR does not exist. Please run cmake first."
    exit 1
fi

echo "Building project..."
cd "$BUILD_DIR" && make

if [ $? -eq 0 ]; then
    echo "Running rtiow and saving to $OUTPUT_FILE..."
    ./rtiow > "../../$OUTPUT_FILE"
    echo "Done. Image saved to $OUTPUT_FILE."
else
    echo "Build failed."
    exit 1
fi
