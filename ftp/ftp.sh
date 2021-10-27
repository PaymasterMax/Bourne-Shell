#!/usr/bin/env bash
_TARGET_HOST="192.168.137.76"
_USER_="ftpmonster"
_PASSWORD_="1100111"
_TARGET_DIR="/home/codex/"
_UPLOAD="~/Downloads/contacts.csv"

_upload(){
  # zip -r backup.zip /
  ftp -invp <<EOF
  open $_TARGET_HOST
  user $_USER_ $_PASSWORD_
  cd $_TARGET_DIR
  put $_UPLOAD
  bye
EOF
}
_main(){
  _upload
}


_main
