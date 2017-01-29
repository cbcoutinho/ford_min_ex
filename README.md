## Description

This is a minimum working example using internal functions and interfaces that shows a graphviz-related bug FORD. It is related to [FORD Issue 193](https://github.com/cmacmackin/ford/issues/193)

## Debug mode - FORD

I wanted to use FORD interactively, so I [forked ford](https://github.com/cbcoutinho/ford) and added the project directory to my PYTHONPATH environmental variable.

Getting into FORD interactively required a project file at a minimum. Then just execute ipython as follows:

    ipython script.py -i -- project.md

## Documentation

To build the documentation, execute the following command:

    make docs
