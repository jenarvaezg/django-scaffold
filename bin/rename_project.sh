#!/bin/bash

if [ -z $1 ]; then
	echo "Usage: ./rename_project.sh <new_project_name>"
	exit 1
fi

grep --include=*.py -lr scaffold . |  xargs sed -i '' -e "s/scaffold/$1/g"
mv src/scaffold src/$1
