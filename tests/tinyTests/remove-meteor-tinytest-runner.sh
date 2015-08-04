#!/bin/bash
echo "Purging meteor-tinytest-runner from filesystem."
cd $(dirname $0)
rm -fr ../../example_circle.yml
rm -fr ./runner.js
rm -fr ./test-all.sh
rm -fr ./test-package.sh
rm -fr ./remove-meteor-tinytest-runner.sh
[ `ls -1A . | wc -l` -eq 0 ] && rm -fr ../tinyTests
