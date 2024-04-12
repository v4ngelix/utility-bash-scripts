#!/bin/bash

echo '///OBSIDIAN BACKUP///'
echo '1. Trying to back-up notes.'

echo '2. Navigating to the notes directory.'
cd ~/Documents/Notes || { echo "Cannot change directory. Exiting..."; exit 1; }

date=$(date '+%d-%m-%Y')
# TODO: should add '-2' to the end if a backup has been made on the same day already.
commitMessage="backup-${date}"

git add . # Using "." to add all files including hidden ones

if git diff-index --quiet HEAD --; then
    echo "No changes to commit."
else
    git commit -m "$commitMessage"
    commitStatus=$?
    if [ $commitStatus -eq 0 ]; then
        git push
	    echo "Commit made. Message: $commitMessage."
        pushResult=$?
        if [ $pushResult -eq 1 ]; then
            echo 'Nothing to push.'
        else
            echo 'Changes pushed.'
        fi
    else
        echo "No commit made. Exiting..."
    fi
fi

