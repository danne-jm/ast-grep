#!/bin/bash

# dry-run-codemods.sh
# This script shows what changes would be made without applying them

set -e

echo "🔍 Running ast-grep codemods (DRY RUN)..."
echo "========================================="
echo ""

# Check if npx is available
if ! command -v npx &> /dev/null; then
    echo "❌ Error: npx is not installed. Please install Node.js and npm."
    exit 1
fi

# Check if codemods directory exists
if [ ! -d "codemods" ]; then
    echo "❌ Error: codemods directory not found."
    exit 1
fi

echo "📋 Showing diffs (no files will be modified)..."
echo ""

# Run ast-grep with --diff flag to show changes without applying them
npx @ast-grep/cli scan --rule codemods/ --diff

echo ""
echo "✅ Dry run complete! No files were modified."
echo "========================================="
echo "To apply these changes, run: ./scripts/run-codemods.sh"
