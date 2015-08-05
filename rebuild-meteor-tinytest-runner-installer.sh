mkdir -p tryMTRInst
mkdir -p meteor-tinytest-runner_bk
cp rebuild-meteor-tinytest-runner-installer.sh ./meteor-tinytest-runner
cp -R ./meteor-tinytest-runner/* ./meteor-tinytest-runner_bk/
pushd ./meteor-tinytest-runner_bk/
rm -f LICENSE
rm -f README.md
rm -f rebuild-meteor-tinytest-runner-installer.sh
makeself --current . meteor-tinytest-runner.run "Installing meteor-tinytest-runner" ./install-meteor-tinytest-runner.sh
chmod a+x meteor-tinytest-runner.run
cp meteor-tinytest-runner.run ../tryMTRInst/
cp meteor-tinytest-runner.run ../meteor-tinytest-runner
popd
pushd ./tryMTRInst
./meteor-tinytest-runner.run
tree
./tests/tinyTests/remove-meteor-tinytest-runner.sh
ls -l
read -p "Done ? Hit <enter>."
popd
rm -fr tryMTRInst
rm -fr meteor-tinytest-runner_bk
