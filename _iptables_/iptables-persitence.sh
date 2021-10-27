#!/usr/bin/env bash
# set -x;
conf=$(pwd)/ip-rules
function _mailer_() {
 echo "Exception raised";
}
function _base_() {
  while true; do
   echo "executing ... "
 done
 echo "Hello"
}

trap  _mailer_  SIGTERM SIGKILL EXIT

. $conf
_base_ $@
