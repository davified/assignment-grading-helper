# Assignment grading helper

A collection of shell scripts to make grading easier for JumpStart trainers

## Cloning repos in batch

General Usage: `./clone_all_repos.sh [-i] [-n assignment_name || -f <repos_file.txt>]` 

### Scenario 1: repos with identical names (e.g. labs)
1. Run: `./clone_all_repos.sh [-i] -n assignment_name` 
  - Example: `./clone_all_repos.sh -n js-basics-3 -i` 
  - if the assignment is a javascript project, you can pass in the `-i` flag to automatically `npm install` after cloning the repo


### Scenario 2: repos with different names (e.g. projects)
1. in `links/`, create a .txt file containing a list of all git repo urls (e.g. ./links/apple-css-lab.txt)
  - you can copy this list of get repos from the lab submissions spreadsheet

2. Run: `./clone_all_repos.sh -f links/apple-css.txt [-i]` 
