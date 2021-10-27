#!/usr/bin/env bash
#set -x;

GLOB_NET=1
function setup() {
  if [ $UID -eq 0 ]; then
    which $SHORTCUT;
    if [ $? -ne 0 ]; then
      read -p "Enter Script's shortcut: " SHORTCUT
      cp $0 /usr/local/sbin/$SHORTCUT
      mkdir -p ~/.netO;
      echo $SHORTCUT > ~/.netO/netO.conf;
    else
        read -p "Seems the shortcut is used by another script 🙄 ,Try something else: " SHORTCUT
        cp $0 /usr/local/sbin/$SHORTCUT
    fi
  fi
}
function Diag() {
	echo -e "\E[1;34m
		Here are some diagnosis that might help to fix your issue\n
		1. Git force push to the specified branch.
		2. Git reset to head.
		0. Exit
	\E[m
	";
	read  DiagVar;
  case $DiagVar in
    1)
	    echo "Option one choosen"
	    ;;
    2)
	    echo "Option two choosen"
	    ;;
    0)
	    return 0
	    ;;
    *)
    	clear;	    
    	echo -e "\E[1;31m Invalid option. Please try again.\E[m"	    
	    Diag
      ;;
  esac
}

function net_T() {
  local NET_MON
  echo -ne "\E[1;33m Checking internet connection ...  👀 \E[m"
  ping google.com -c 1 > /dev/null 2>&1
  if [ $? -ne 0 ]; then
    NET_MON=1
    sleep 2;
    echo -en "\E[1;31m You are offline 😖 PS:(\E[m\n \E[1;33m Waiting for internet connection to come back ... 🤢🤢 \E[m";
  fi
  ping google.com -c 1 > /dev/null 2>&1
  while [[ $? -ne 0 ]]; do
    NET_MON=1
    ping google.com -c 1 > /dev/null 2>&1 ;
  done
  if [[ $? -eq 0 ]]; then
      NET_MON=0
  fi
  if [ $NET_MON -eq 0 ] ; then
    echo -e "\E[5;35m \E[1m you are Online PS 👍 :)\E[m \E[m";
  fi
  GLOB_NET=0
}
function confirm_dir() {
  if ! -e $(pwd)/usermail.conf;then
    touch $(pwd)/usermail.conf;
    read -p "Enter the default email for use by git config --global user.email: " GEMAIL;
    git config --global user.name $GEMAIL;
    echo $GEMAIL>$(pwd)/usermail.conf;
    echo $(pwd)/usermail.conf >> $(pwd)/.gitignore;
  fi
  if ! -e $(pwd)/username.conf;then
    touch $(pwd)/usermail.conf;
    read -p "Enter the default username for use by git config --global user.name:" GUSERNAME;
    git config --global user.email $GUSERNAME;
    echo $GUSERNAME>$(pwd)/username.conf;
    echo $(pwd)/username.conf >> $(pwd)/.gitignore
  fi
}
function git_controller() {
  git add *;
  git commit -m "patch auto-gen by ${0:0} under account $USER"
  net_T
  if [ $GLOB_NET -eq 0 ]; then
    echo -ne "\E[1;34m Script is push updates --- 💭 \E[m";
    echo -e "\n"
    git push origin ${1:-main}
  fi
  if [ $? -ne 0 ]; then
    echo -e "\E[34mUnfortunately we could not push your updates online.PS:( \E[m"
	#"Call the diagnosis function to handle the errir encountered"
    Diag
  fi
}
function git-fetcher() {
  net_T
  if [ $GLOB_NET -eq 0 ]; then
    echo -e "\E[1;34m Fetching updates\nRunning git fetch --all \E[m";
    git fetch --all
    echo "\nDone !!!"
  fi
}

if [ ! -e ~/.netO/netO.conf ]; then
  setup;
  git_controller $1
else
  git_controller $1
fi
