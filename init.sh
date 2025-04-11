#!/usr/bin/env bash
# This script is used to initialize the dotfiles.

set -u
set -o pipefail

precheck(){
# Check if the script is run as root
if [ "$(id -u)" -eq 0 ]; then
    echo "Don't run this script as root."
    exit 1
fi

cd "$(dirname "$0")" || exit 1

if [ -f ".git/git-crypt/keys/default" ]; then
    echo "git-crypt is already initialized."
    exit 0
fi

if ! command -v git-crypt &> /dev/null; then
    echo "git-crypt could not be found. Please install it first."
    exit 1
fi
}

cleanup() {
    rm -f "$keyfile"
}

main(){
    read -r -p "Please put in the bash64 encoded key> " answer
    echo "$answer" | base64 -d > "$keyfile"

   if [ ! -f "$keyfile" ]; then
       echo "Key file not found."
       return 1
   fi

    #Check if the key file is empty
    if [ ! -s "$keyfile" ]; then
       echo "Key file is empty."
       echo "fail"
       return 1
    fi

    git-crypt unlock "$keyfile" || {
       echo "Failed to unlock git-crypt."
       return 1
    }
}

precheck
keyfile="$(mktemp)"
trap cleanup 1 2 3 6
main ; cleanup "$?"

make up
