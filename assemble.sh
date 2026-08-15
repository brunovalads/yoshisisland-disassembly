#!/bin/bash

# Configuration
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
ASAR="$SCRIPT_DIR/asar/asar"
ASSEMBLE="$SCRIPT_DIR/disassembly/assemble.asm"
ROM_NAME_BASE="yi"
ROM_NAME="${ROM_NAME_BASE}.sfc"
HASH_MD5="$SCRIPT_DIR/yi.md5sum"
HASH_SHA1="$SCRIPT_DIR/yi.sha1sum"
HASH_SHA256="$SCRIPT_DIR/yi.sha256sum"

# Build
echo "Building \"$ROM_NAME\"..."
echo ""

chmod +x "$ASAR" 2>/dev/null
"$ASAR" "$ASSEMBLE" "$ROM_NAME"

if [ $? -ne 0 ]; then
    echo ""
    echo "Build FAILED!"
    echo ""
    read -p "Press enter to exit..."
    exit 1
fi

echo "Build succeeded!"

# Check build
echo ""
echo "Checking build..."
echo ""

# - Check MD5
current_md5=$(md5sum "$ROM_NAME" | awk '{print $1}')
if grep -qi "$current_md5" "$HASH_MD5"; then
    echo "MD5 match succeeded!"
else
    echo "MD5 match FAILED!"
fi

# - Check SHA1
current_sha1=$(sha1sum "$ROM_NAME" | awk '{print $1}')
if grep -qi "$current_sha1" "$HASH_SHA1"; then
    echo "SHA1 match succeeded!"
else
    echo "SHA1 match FAILED!"
fi

# - Check SHA256
current_sha256=$(sha256sum "$ROM_NAME" | awk '{print $1}')
if grep -qi "$current_sha256" "$HASH_SHA256"; then
    echo "SHA256 match succeeded!"
else
    echo "SHA256 match FAILED!"
fi

echo ""
read -p "Press enter to exit..."