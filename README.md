# Assignment grading helper

A collection of shell scripts to make grading easier for JumpStart trainers

## Cloning repos in batch

Usage:
1. in `links/`, create a .txt file containing a list of all git repo urls (e.g. ./links/apple-css-lab.txt)
  - you can copy this list of get repos from the lab submissions spreadsheet

2. Run: `./clone_all_repos.sh ./links/apple-css-lab.txt [--install-deps]` 
  - if the assignment is a javascript project, you can pass in the `--install-deps` flag to automatically `npm install` after cloning the repo


