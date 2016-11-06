#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $DIR/install.sh
node_modules/.bin/prez --init # for new chapters only
