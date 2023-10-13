#!/bin/sh

UNAME=$(uname -o)

if [ $UNAME = "Darwin" ]; then
  echo "TODO setup macOS setup"
  exit 0
elif [ $UNAME = "GNU/Linux" ]; then
  echo "TODO linux stuff"
  exit 0
else
  echo "Sorry this operating system is not supported yet"
  exit 1
fi

if [! which stow >/dev/null 2>&1 ]; then
  echo "`stow` was not detected on this system and is required for the setup of these dotfiles. Aborting"
  exit 1
else
  stow */
fi

