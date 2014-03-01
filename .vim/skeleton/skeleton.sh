#!/bin/bash

show_help()
{
  echo -e "Usage: $(basename $0) <command> [command-options]\n"
  echo """Commands:
  play    play stream     (options: --cache)
  dump    download stream (options: --name)
  log     show log of opened urls
  help    this message"""
}

#
# main
#

if [[ $# = 0 ]]; then
  show_help
  exit
fi

# debug mode
if [[ $1 = "-d" ]]; then
  DEBUG=echo
  shift
fi

case $1 in
  log)     show_log;;
  help)    show_help;;
  *)       show_help;;
esac
