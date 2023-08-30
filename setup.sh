#!/bin/sh

UNAME=$(uname -o)

echo "Detected operating system is $UNAME"
echo "TODO do different stuff on Darwin vs GNU/Linux"

if ! which stow >/dev/null 2>&1; then
    echo "`stow` was not detected on this system and is required for the setup of these dotfiles. Aborting"
    exit 1
else
    stow */
fi
