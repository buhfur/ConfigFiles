#!/bin/bash
# bash script which commits changes made on the old-wiki repo 


REPO_PATH="/root/old-wiki/"
cd $REPO_PATH || exit

# Check for changes
if [ -n "$(git status --porcelain)" ]; then
    # Stage all changes
    git add -A
    # Commit with a timestamp
    git commit -m "Auto-commit: $(date)"
    # (Optional) Push to remote
    git push origin master  # Replace 'main' with your branch name if needed
fi
