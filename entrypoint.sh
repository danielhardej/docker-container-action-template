#!/bin/sh

set -e

# Get inputs from environment variables
NAME=${INPUT_NAME:-"World"}
MESSAGE=${INPUT_MESSAGE:-"Hello"}

# Generate the greeting
GREETING="${MESSAGE}, ${NAME}!"
CURRENT_TIME=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Output the greeting
echo "🎉 ${GREETING}"
echo "⏰ Executed at: ${CURRENT_TIME}"

# Set outputs for the GitHub Action
echo "greeting=${GREETING}" >> $GITHUB_OUTPUT
echo "time=${CURRENT_TIME}" >> $GITHUB_OUTPUT

# Also output in a way that's visible in logs
echo "::notice title=Action Completed::${GREETING} at ${CURRENT_TIME}"

echo "✅ Docker Container Action completed successfully!"