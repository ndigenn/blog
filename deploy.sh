#!/bin/bash

# 2. Build the updated static site
hugo

# 3. Commit the source changes to main
git add .
git commit -m "Update site content"
git push origin main

# 4. Push the generated public/ folder to hostinger branch
git subtree split --prefix public -b hostinger-deploy
git push origin hostinger-deploy:hostinger --force
git branch -D hostinger-deploy
