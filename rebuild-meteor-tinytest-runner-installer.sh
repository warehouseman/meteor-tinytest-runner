#!/bin/bash
#
# This script plays no part in Meteor Tinytest Runner.
# Instead it used to facilitate packaging up and testing
# the installer and uninstaller of Meteor Tinytest Runner.
#

installIfNotInstalled () {
  PKG=$1
  PKG_OK=$(dpkg-query -W --showformat='${Status}\n' ${PKG}  2>/dev/null | grep "install ok installed")
  echo "Checking for ${PKG}: ${PKG_OK}";
  if [ "" = "${PKG_OK}" ]; then
    echo "No ${PKG}. Please run the following command: "
    echo "sudo apt-get install ${PKG}"
    exit 1;
  fi
  echo;
}

meteorProjIfNotMeteorProj () {
	echo "Checking for a Meteor project.";
	if [ ! -d "projMeteor" ]; then
		echo "Making a Meteor project.";
		meteor create projMeteor
		cd projMeteor
		meteor create --package yours:skeleton
		cd ..
	fi
}

installIfNotInstalled "makeself"

meteorProjIfNotMeteorProj

cp -R projMeteor tryMTRInst
mkdir -p meteor-tinytest-runner_bk
# cp rebuild-meteor-tinytest-runner-installer.sh ./meteor-tinytest-runner
cp -R ./meteor-tinytest-runner/* ./meteor-tinytest-runner_bk/

pushd ./meteor-tinytest-runner_bk/;
rm -f LICENSE
rm -f README.md
rm -f rebuild-meteor-tinytest-runner-installer.sh
rm -f meteor-tinytest-runner.bin
makeself --current . meteor-tinytest-runner.bin "Installing meteor-tinytest-runner" ./install-meteor-tinytest-runner.sh
chmod a+x meteor-tinytest-runner.bin
cp meteor-tinytest-runner.bin ../tryMTRInst/
cp meteor-tinytest-runner.bin ../meteor-tinytest-runner
popd;

pushd ./tryMTRInst;
./meteor-tinytest-runner.bin
tree
printf "Ready to test uninstall ? Hit <enter>."
read _
./tests/tinyTests/remove-meteor-tinytest-runner.sh
ls -l
printf "Done ? Hit <enter>."
read _
popd;

rm -fr tryMTRInst
rm -fr meteor-tinytest-runner_bk

