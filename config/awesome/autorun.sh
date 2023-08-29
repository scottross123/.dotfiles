#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    exec "$@"&
  fi
}

redshifty () {
    REDSHIFT_PROCESS=$(ps aux | grep redshift)

    if [[ -z $REDSHIFT_PROCESS ]]; then
        redshift
    fi
}

run source /home/scott/.Xmodmap
run picom
run redshifty

