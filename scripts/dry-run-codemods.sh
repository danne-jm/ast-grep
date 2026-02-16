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

# Run ast-grep scan for each rule file
for rule_file in codemods/*.yml; do
    if [ -f "$rule_file" ]; then
        echo "───────────────────────────────────"
        echo "📄 Scanning with rule: $rule_file"
        echo "───────────────────────────────────"
        npx sg scan --rule "$rule_file" --report-style rich --globs '!codemods/**' --no-ignore hidden
        echo ""
    fi
done

echo ""
echo "✅ Dry run complete! No files were modified."
echo "========================================="
echo "To apply these changes, run: ./scripts/run-codemods.sh"
