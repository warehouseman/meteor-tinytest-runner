#!/bin/bash
#
# This installer was made with 'makeself' by Stéphane Peter (megastep at megastep.org)
# The command used was :
#    makeself --current . meteor-tinytest-runner.run "Installing meteor-tinytest-runner" ./install.sh
# It expects be run in the target directory
# To un-install execute ./tests/tinyTests/remove-meteor-tinytest-runner.sh
#
export THIS=meteor-tinytest-runner
echo "Installing ${THIS} in current directory -- $(pwd)."
cd $(dirname $0)
rm -f ${THIS}.run
rm -f install-meteor-tinytest-runner.sh
