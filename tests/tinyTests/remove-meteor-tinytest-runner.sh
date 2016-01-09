#!/bin/bash
#
set -e;

echo "Purging meteor-tinytest-runner from this filesystem."
cd $(dirname $0)
rm -fr ../../example_circle.yml
rm -fr ./runner.js
rm -fr ./install_dependencies.sh
rm -fr ./test-all.sh
rm -fr ./test-package.sh
rm -fr ./remove-meteor-tinytest-runner.sh
rm -fr ./ci

if [ `ls -1A . | wc -l` -gt 0 ]; then
  echo -e "
     * * * Directory '$(pwd)' not empty.  Quitting. * * *
  ";
  exit 1;
fi;

rm -fr ../tinyTests;

cd ..
if [ `ls -1A . | wc -l` -gt 0 ]; then
  echo -e "
     * * * Directory '$(pwd)' not empty.  Quitting. * * *
  ";
  exit 1;
fi;

rm -fr ../tests

exit 0;

