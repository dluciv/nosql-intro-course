#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $DIR/install.sh
node_modules/.bin/prez --init # for new chapters only
echo node_modules/ >.gitignore
echo build/ >>.gitignore
