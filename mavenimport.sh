#!/bin/bash

# copy and run this script to the root of the repository directory containing files
# this script attempts to exclude uploading itself explicitly so the script name is important
# Get command line params
# while getopts ":r:u:p:" opt; do
# 	case $opt in
# 		r) REPO_URL="$OPTARG"
# 		;;
# 		u) USERNAME="$OPTARG"
# 		;;
# 		p) PASSWORD="$OPTARG"
# 		;;
# 	esac
# done

REPO_URL="http://${ip}/repository/${repo}/"
USERNAME="admin"
PASSWORD="qwer1234"

find . -type f -not -path './mavenimport\.sh*' -not -path '*/\.*' -not -path '*/\^archetype\-catalog\.xml*' -not -path '*/\^maven\-metadata\-local*\.xml' -not -path '*/\^maven\-metadata\-deployment*\.xml' | sed "s|^\./||" | xargs -I '{}' curl -u "$USERNAME:$PASSWORD" -X PUT -v -T {} ${REPO_URL}/{} ;
