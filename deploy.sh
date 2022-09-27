#!/bin/sh
# If any part of the script fails the deploy stops 
set -e

# Status message
printf "\033[0;32mDeploying updates to GitHub…\033[0m\n" 

# Build the project. 
hugo

# Go To Public folder 
cd public 

# Add changes to git. 
git add . 

# Commit changes. 
if [ -n "$*" ]; then
    msg="$*"
else
    msg="Deploying site $(date)"
fi

# Commit changes
git commit -m "$msg" 

# Push source and deploy. 
git push origin main