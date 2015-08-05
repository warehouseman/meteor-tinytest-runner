# Meteor Tinytest Runner

## Introduction
These small scripts provide you with everything you need to tinytest one, or all, of the packages in a Meteor app, **from the command line** with results delivered **on the command line**.

You'll need that capability when you go to use a continuous integration system such as CircleCi.  A sample script ```circle.yml``` is included for running the scripts in [CircleCI](https://circleci.com/about).

## What is it?
It's a ```bash``` installer.  It's only been tested on Ubuntu, but it's quite generic, so it should work fine on a Mac too, and maybe CygWin.

All of the test-runner capability is forked from [tozd/meteor-test-runner
](tozd/meteor-test-runner)

It's made using [makeself](http://stephanepeter.com/makeself/) by Stéphane Peter (megastep at megastep.org) and includes an embedded uninstaller.

## Usage
### Installing
For a first try, **before running it in your project**, try the following commands:

    # Have Meteor create an application skeleton
    meteor create tryMTRInst
    # Step in to it
    cd tryMTRInst
    # Have Meteor create a package skeleton
    meteor create --package you:your-pkg
    # Get Meteor Tinytest Runner
    wget https://raw.githubusercontent.com/warehouseman/meteor-tinytest-runner/master/meteor-tinytest-runner.run
    # Execute it
    sh meteor-tinytest-runner.run
    # Watch it run the package skeleton's default tests
    ./tests/tinyTests/test-all.sh

You should see the following :

    yourself@yourpc:~/projects$ # Have Meteor create an application skeleton
    yourself@yourpc:~/projects$ meteor create tryMTRInst
    tryMTRInst: created.
    
    To run your new app:
      cd tryMTRInst
      meteor
    yourself@yourpc:~/projects$ # Step in to it
    yourself@yourpc:~/projects$ cd tryMTRInst
    yourself@yourpc:~/projects/tryMTRInst$ # Have Meteor create a package skeleton
    yourself@yourpc:~/projects/tryMTRInst$ meteor create --package you:your-pkg
    you:your-pkg: created in packages/your-pkg
    yourself@yourpc:~/projects/tryMTRInst$ # Get Meteor Tinytest Runner
    yourself@yourpc:~/projects/tryMTRInst$ wget https://raw.githubusercontent.com/warehouseman/meteor-tinytest-runner/master/meteor-tinytest-runner.run
    --2015-08-04 22:33:27--  https://raw.githubusercontent.com/warehouseman/meteor-tinytest-runner/master/meteor-tinytest-runner.run
    Resolving raw.githubusercontent.com (raw.githubusercontent.com)... 23.235.44.133
    Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|23.235.44.133|:443... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 377501 (369K) [application/octet-stream]
    Saving to: ‘meteor-tinytest-runner.run’
    
    100%[==================================================================================================================================>] 377,501     1.51MB/s   in 0.2s
    
    2015-08-04 22:33:28 (1.51 MB/s) - ‘meteor-tinytest-runner.run’ saved [377501/377501]
    
    yourself@yourpc:~/projects/tryMTRInst$ # Execute it
    yourself@yourpc:~/projects/tryMTRInst$ sh meteor-tinytest-runner.run
    Verifying archive integrity... All good.
    Uncompressing Installing meteor-tinytest-runner  100%
    Installing meteor-tinytest-runner in current directory -- /home/yourself/projects/tryMTRInst.
    yourself@yourpc:~/projects/tryMTRInst$ # Watch it run the package skeleton's default tests
    yourself@yourpc:~/projects/tryMTRInst$ ./tests/tinyTests/test-all.sh
    >>> Testing package 'your-pkg'...
      > Spawning test process...
      > Waiting for Meteor to start...
      > Meteor seems ready, going to run tests in a moment.
      > Running the test runner...
      > Opening Meteor test suite...
      > Running tests...
        [SEVERE] http://127.0.0.1:4096/favicon.ico 0:0 Failed to load resource: the server responded with a status of 404 (Not Found)
        [INFO] http://127.0.0.1:4096/packages/test-in-console.js?59d9cde1f0563b9d9cc5b99297a0997b32d3f499 75:17 S: tinytest - example
        [INFO] http://127.0.0.1:4096/packages/test-in-console.js?59d9cde1f0563b9d9cc5b99297a0997b32d3f499 75:17 C: tinytest - example
        [INFO] http://127.0.0.1:4096/packages/test-in-console.js?59d9cde1f0563b9d9cc5b99297a0997b32d3f499 75:17 passed/expected/failed/total
        [INFO] http://127.0.0.1:4096/packages/test-in-console.js?59d9cde1f0563b9d9cc5b99297a0997b32d3f499 75:17 ##_meteor_magic##state: done
      > Tests completed OK.
    yourself@yourpc:~/projects/tryMTRInst$


Using a file browser in the application directory you willl see that the installer added the following files:

    yourself@yourpc:~/projects/tryMTRInst$ tree
    .
    ├── example_circle.yml
    └── tests
        └── tinyTests
            ├── remove-meteor-tinytest-runner.sh
            ├── runner.js
            ├── test-all.sh
            └── test-package.sh

    2 directories, 5 files
    yourself@yourpc:~/projects/tryMTRInst$

**A warning** : the installer will overwrite any files named like those above.

Also, the installer deletes it's own support files.  So **another warning**, the installer will lose any files you have named:

- meteor-tinytest-runner.run
- install-meteor-tinytest-runner.sh


### Removing
To uninstall, execute ...

    sh tests/tinyTests/remove-meteor-tinytest-runner.sh

... and you should see ...

    yourself@yourpc:~/projects/tryMTRInst$
    yourself@yourpc:~/projects/tryMTRInst$ sh tests/tinyTests/remove-meteor-tinytest-runner.sh
    Purging meteor-tinytest-runner from this filesystem.
    yourself@yourpc:~/projects/tryMTRInst$ tree
    .
    
    0 directories, 0 files
    yourself@yourpc:~/projects/tryMTRInst$

The uninstaller script does **not** remove the directories ```tests``` or ```tinyTests``` unless they are completely empty.

## Recreating the file "meteor-tinytest-runner.run"
Here is the specific ```makeself``` command used to build ```meteor-tinytest-runner.run```  ...

    makeself --current . meteor-tinytest-runner.run "Installing meteor-tinytest-runner" ./install-meteor-tinytest-runner.sh

... but when you run it, remember to run it in **a copy** of this project from which you have **removed the ```.git``` directory!**

To help out there is a script called ```rebuild-meteor-tinytest-runner-installer.sh```, but it is intended to be run in **the parent directory** of ```meteor-tinytest-runner``` So follow these steps :

    # Create a test directory and step into it.
    mkdir -p checkItzOk
    # Step into it.
    cd checkItzOk
    # Clone meteor-tinytest-runner.
    git clone git@github.com:warehouseman/meteor-tinytest-runner.git
    # Note the date and time of the installer
    ls -l meteor-tinytest-runner/meteor-tinytest-runner.run
    #  Eg:
    #  -rwxrwxr-x 1 yourself yourself 70390 Aug  4 19:48 meteor-tinytest-runner/meteor-tinytest-runner.run
    # Copy the builder to the parent directory
    cp meteor-tinytest-runner/rebuild-meteor-tinytest-runner-installer.sh .
    # Run it.
    sh ./rebuild-meteor-tinytest-runner-installer.sh
    # Again, note the date and time of the installer
    ls -l meteor-tinytest-runner/meteor-tinytest-runner.run
