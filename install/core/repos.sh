#!/bin/bash

set -e

if [ "$(id -u)" -eq 0 ]; then
  echo "Please do not run with doas, as root, or with sudo!"
  exit
fi

doas apk add -lu --interactive=no \
  chimera-repo-user

doas apk update --interactive=no
doas apk upgrade --interactive=no

echo "Chimera User Repo has been added"
