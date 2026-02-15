#!/bin/bash

echo "Building Zork..."

# Clean previous build
rm -f *.o zork

# Compile sources
# We use -DALLOW_GDT to enable game debugging tool (optional but standard in Makefile)
echo "Compiling source files..."
cc -g -DALLOW_GDT -DTEXTFILE=\"dtextc.dat\" -Wno-deprecated-non-prototype -c *.c

# Link
echo "Linking..."
cc -o zork *.o -lcurses

echo "Build complete. Run ./zork to play."
