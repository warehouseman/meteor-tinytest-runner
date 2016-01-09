#!/bin/bash
#
# This installer was made with 'makeself' by Stéphane Peter (megastep at megastep.org)
# The command used was :
#    makeself --current . meteor-tinytest-runner.bin "Installing meteor-tinytest-runner" ./install.sh
# It expects be run in the target directory
# To un-install execute ./tests/tinyTests/remove-meteor-tinytest-runner.sh
#
set -e;

export THIS=meteor-tinytest-runner
echo "Installing ${THIS} in current directory -- $(pwd)."
cd $(dirname $0)
chmod a+x ./tests/tinyTests/install_dependencies.sh
if ./tests/tinyTests/install_dependencies.sh; then
	rm -f ${THIS}.bin
	rm -f install-meteor-tinytest-runner.sh
fi
