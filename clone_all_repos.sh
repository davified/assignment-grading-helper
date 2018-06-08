#!/usr/bin/env bash

set -e

exit_with_error() { 
  echo "ERROR: $0 [-i] [-n assignment_name || -f <repos_file.txt>]" 1>&2
  echo "ERROR: Example: $0 -n js-basics-3" 1>&2
  echo "ERROR: Example: $0 -f links/apple-css.txt -i" 1>&2
  exit 1
  }

if [[ $# == 0 ]]; then
  exit_with_error
fi

while getopts ":f:n:i" o
do	case "$o" in
	f)	repos_file="$OPTARG";;
	i)	install_dependencies='true';;
	n)	assignment_name="$OPTARG";;
	*)  exit_with_error
      ;;
	esac
done
shift $(($OPTIND-1))

echo "Cloning repos with the following configuration details:"
if [[ $repos_file != '' ]]; then echo "repos_file: $repos_file"; fi
if [[ $install_dependencies != '' ]]; then echo "install_dependencies: $install_dependencies"; fi
if [[ $assignment_name != '' ]]; then echo "assignment_name: $assignment_name"; fi


if [[ $repos_file != '' ]]; then
  echo "here"
  directory_name=$(echo ${repos_file} | awk 'BEGIN { FS = "links/" } { print $2 }' | awk 'BEGIN { FS = ".txt" } { print $1 }')
  target_dir="assignments/$directory_name"

  mkdir -p ${target_dir}

  while read repo_url; do
    ./clone_and_install.sh ${repo_url} ${target_dir} ${install_dependencies}
  done < ${repos_file} 

  exit 0
fi

if [[ $assignment_name != '' ]]; then
  github_usernames="./github_usernames.txt"
  target_dir="assignments/$assignment_name"

  mkdir -p ${target_dir}

  while read username; do
    repo_url="https://github.com/${username}/${assignment_name}"
    ./clone_and_install.sh ${repo_url} ${target_dir} ${install_dependencies}
  done < ${github_usernames} 

  exit 0
fi
