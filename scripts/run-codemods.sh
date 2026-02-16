#!/bin/bash

# run-codemods.sh
# This script applies all ast-grep codemods to the project

set -e

echo "🚀 Running ast-grep codemods..."
echo "================================"
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

echo "📝 Applying changes to files..."
echo ""

# Run ast-grep with update-all flag to apply changes
npx @ast-grep/cli scan --rule codemods/ --update-all

echo ""
echo "✅ Codemods applied successfully!"
echo "================================"
