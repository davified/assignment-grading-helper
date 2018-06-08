#!/usr/bin/env bash

set -e 

if [[ $1 == '' || $2 == '' ]]; then
  echo "ERROR! Usage: ./clone_and_install.sh GIT_REPO_URL TARGET_DIRECTORY"
  exit 1
fi

repo_url=$1
target_dir=$2
install_dependencies_flag=$3
username=$(echo ${repo_url} | rev | cut -d/ -f2 | rev)
project_name=$(echo ${repo_url} | rev | cut -d/ -f1 | rev)
destination_dir_name="${target_dir}/${username}_${project_name}"


if [[ -d "${destination_dir_name}" ]]; then
  echo "repo already cloned. Skipping"
  exit 0
fi

git clone ${repo_url} "${destination_dir_name}"

if [[ $install_dependencies_flag == '--install-deps' ]]; then
  cd ${destination_dir_name}
  npm install
  cd -
fi


echo "DONE!"
