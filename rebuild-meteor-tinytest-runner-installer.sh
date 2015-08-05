mkdir -p tryOutMTRInstaller
mkdir -p meteor-tinytest-runner_bk
cp rebuild-meteor-tinytest-runner-installer.sh ./meteor-tinytest-runner
cp -R ./meteor-tinytest-runner/* ./meteor-tinytest-runner_bk/
pushd ./meteor-tinytest-runner_bk/
rm -f LICENSE
rm -f README.md
rm -f rebuild-meteor-tinytest-runner-installer.sh
makeself --current . meteor-tinytest-runner.run "Installing meteor-tinytest-runner" ./install-meteor-tinytest-runner.sh
cp meteor-tinytest-runner.run ../tryOutMTRInstaller/
cp meteor-tinytest-runner.run ../meteor-tinytest-runner
popd
pushd ./tryOutMTRInstaller
./meteor-tinytest-runner.run
tree
./tests/tinyTests/remove-meteor-tinytest-runner.sh
ls -l
read -p "Done ? Hit <enter>."
popd
rm -fr tryOutMTRInstaller
rm -fr meteor-tinytest-runner_bk
