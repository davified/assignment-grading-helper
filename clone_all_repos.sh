#!/usr/bin/env bash

set -e

if [[ $1 == '' || $2 == '' ]]; then
  echo "ERROR! Usage: ./clone_all_repos.sh ./links/github_repo_urls_file.txt name-of-assignment-repo"
  exit 1
fi

if [[ $3 == '--install-deps' ]]; then
  install_dependencies_flag='--install-deps'
fi

path_to_urls_file=$1
target_dir="assignments/$2"

mkdir -p ${target_dir}

while read repo_url; do
  ./git_clone.sh ${repo_url} ${target_dir} ${install_dependencies_flag}
done < ${path_to_urls_file} 
