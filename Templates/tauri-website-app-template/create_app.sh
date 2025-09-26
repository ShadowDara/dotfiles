#!/usr/bin/bash

# This script creates a new Tauri app using the template provided
# in the current directory.

git checkout Tauri-Website-App-Template

git add .

git commit -m "Initial commit from Tauri Website App Template"

git push

git tag v1.0.0

git push origin v1.0.0
