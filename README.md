# Meteor Tinytest Runner

These small scripts provide you with everything you need to tinytest one or all of your packages **from the command line** with results delivered **on the command line**.

A sample script is included for running the scripts as part of continuous integration in *CircleCI*.

It is an installer made with 'makeself' by Stéphane Peter (megastep at megastep.org) and embeds an uninstaller.

For a first try, deposit ```meteor-tinytest-runner.run``` in an empty temporary directory like so:

     yourself@pkgtstvid:~/projects/tryIt$ tree
     .
     └── meteor-tinytest-runner.run
      
     0 directories, 1 file
     yourself@pkgtstvid:~/projects/tryIt$

Execute the installer with...

   ./meteor-tinytest-runner.run

... and you ought to see ...

    yourself@pkgtstvid:~/projects/tryIt$ ./meteor-tinytest-runner.run
    Verifying archive integrity... All good.
    Uncompressing Installing meteor-tinytest-runner  100%
    Installing meteor-tinytest-runner in current directory -- /home/yourself/projects/tryIt.
    /home/yourself/projects/tryIt
    yourself@pkgtstvid:~/projects/tryIt$
    yourself@pkgtstvid:~/projects/tryIt$
    yourself@pkgtstvid:~/projects/tryIt$ tree
    .
    ├── example_circle.yml
    └── tests
        └── tinyTests
            ├── remove-meteor-tinytest-runner.sh
            ├── runner.js
            ├── test-all.sh
            └── test-package.sh

    2 directories, 5 files
    yourself@pkgtstvid:~/projects/tryIt$

All unneeded files are deleted.

To uninstall, execute ...

    ./tests/tinyTests/remove-meteor-tinytest-runner.sh

... and you should see ...

    yourself@pkgtstvid:~/projects/tryIt$
    yourself@pkgtstvid:~/projects/tryIt$ ./tests/tinyTests/remove-meteor-tinytest-runner.sh
    Purging meteor-tinytest-runner from this filesystem.
    yourself@pkgtstvid:~/projects/tryIt$


The specific makeself command used was ...

    makeself --current . meteor-tinytest-runner.run "Installing meteor-tinytest-runner" ./install.sh

... but it is important to run it in a copy of this project **with the ```.git``` directory removed**.

