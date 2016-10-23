#!/bin/bash

npm install prez
node_modules/.bin/prez --init
echo node_modules/ >.gitignore
echo build/ >>.gitignore
