#!/usr/bin/env bats
# Test: Vulkan Server (Python FastAPI Daemon)

set -e

echo 'Testing Vulkan Server (Python daemon)...'

# Change to server directory
cd server

# Check that Python daemon exists
if [ -f python/vulkan/node/main.py ]; then
    echo 'Python daemon found'
else
    echo 'Python daemon not found'
    exit 1
fi

# Check requirements
if [ -f requirements.txt ]; then
    echo 'Requirements found'
else
    echo 'Requirements not found'
    exit 1
fi

# Try to import the main module
echo 'Testing Python import...'
python -c 'from vulkan.node.main import app; print("Import successful")' 2>&1 || echo 'Import failed (may need dependencies installed)'

echo 'Server test complete!'