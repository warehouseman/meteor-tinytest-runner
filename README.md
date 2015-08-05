# Meteor Tinytest Runner

## Introduction
These small scripts provide you with everything you need to tinytest one or all of your packages **from the command line** with results delivered **on the command line**.

You'll need that capability when you go to use a continuous integration system such as CircleCi.  A sample script is included for running the scripts as part of continuous integration in *CircleCI*.

## What it is.
It's a ```bash``` installer.  It's only been tested on Ubuntu, but is quite generic so it should work fine on a Mac too, and maybe CygWin.

It's made using [makeself](http://stephanepeter.com/makeself/) by Stéphane Peter (megastep at megastep.org) and includes an embedded uninstaller.

## Usage
### Installing
For a first try, **before running it in your project**, deposit ```meteor-tinytest-runner.run``` in an empty temporary directory like so:

    yourself@yourpc:~/projects$ mkdir -p tryMTRInst
    yourself@yourpc:~/projects$ cd tryMTRInst
    yourself@yourpc:~/projects/tryMTRInst$ wget https://raw.githubusercontent.com/warehouseman/meteor-tinytest-runner/master/meteor-tinytest-runner.run


Now execute the installer with...

    sh meteor-tinytest-runner.run


... and you ought to see ...

    yourself@yourpc:~/projects/tryMTRInst$ sh meteor-tinytest-runner.run
    Verifying archive integrity... All good.
    Uncompressing Installing meteor-tinytest-runner  100%
    Installing meteor-tinytest-runner in current directory -- /home/yourself/projects/tryMTRInst.
    yourself@yourpc:~/projects/tryMTRInst$
    yourself@yourpc:~/projects/tryMTRInst$ # sudo apt-get -y install tree
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

**A warning** : the installer will overwrite any files named like those above

Also, the installer deletes it's own support files.
So **another warning** : the installer will lose any files you have named:

- meteor-tinytest-runner.run
- install-meteor-tinytest-runner.sh


### Removing
To uninstall, execute ...

    ./tests/tinyTests/remove-meteor-tinytest-runner.sh

... and you should see ...

    yourself@yourpc:~/projects/tryMTRInst$
    yourself@yourpc:~/projects/tryMTRInst$ ./tests/tinyTests/remove-meteor-tinytest-runner.sh
    Purging meteor-tinytest-runner from this filesystem.
    yourself@yourpc:~/projects/tryMTRInst$ tree
    .
    
    0 directories, 0 files
    yourself@yourpc:~/projects/tryMTRInst$

The uninstaller script does **not** remove the directories ```tests``` or ```tinyTests``` unless they are completely empty.

## Recreating the file : meteor-tinytest-runner.run
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
    # Copy the builder
    cp meteor-tinytest-runner/rebuild-meteor-tinytest-runner-installer.sh .
    # Run it.
    sh ./rebuild-meteor-tinytest-runner-installer.sh
    # Again, note the date and time of the installer
    ls -l meteor-tinytest-runner/meteor-tinytest-runner.run
