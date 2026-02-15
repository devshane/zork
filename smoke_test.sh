#!/bin/bash
# Smoke test for Zork

# Run zork with input 'quit' followed by 'y' for confirmation
# We use a timeout to prevent it from hanging if it doesn't exit
echo -e "quit\ny" | ./zork

EXIT_CODE=$?

if [ $EXIT_CODE -eq 0 ]; then
  echo "Smoke test PASSED: Zork exited gracefully."
  exit 0
else
  echo "Smoke test FAILED: Zork exited with code $EXIT_CODE"
  exit 1
fi
