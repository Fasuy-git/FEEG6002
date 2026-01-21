#import "../template.typ": *

#show: codly-init.with()
#codly(languages: codly-languages)

#lecture("Lecture 15", 1, 8)

== Linux or Unix Remote Servers

Typically remote servers are used for things such as websites, supercomputers and cloud computing. The default language for such servers is Linux or Unix as:

- The dominant server and supercomputer OS
- Can do everything from the command line
- Efficient package managers for software updates and installation.

= Lecture 16

== Shell Scripts

Shell scripts are a chain of shell commands and are useful for automating tasks (creating/copying/moving files), simple data processing and running programs sequentially. They are scalable and can have command line arguments easily passed to them.

== Make Files

Are primarily used to build a set of compiled files if there is a change within one of the files. It does this by comparing the timestep of different files within the program. They can also be used to run tasks in parallel, which is particularly useful for parralizable tasks.

== Shell Script Syntax
=== Variables

All of the common commands that can be ran on a linux or unix shell can be placed sequentially in a .sh file and ran. To define variables the syntax shown in *@15-16-shell-variables* can be used.

#figure(
  [```sh
  NAME=world
  echo "Hello double quoted $NAME"
  echo 'Hello single quoted $NAME (Oops)'

  FILE="image"
  echo $FILE01.png "(broken)"
  echo ${FILE}01.png "(works)"
  ```],
  caption: [Shell script which depicts how to define variables and use them.],
  supplement: [Figure],
  kind: figure,
)<15-16-shell-variables>

Note that in *@15-16-shell-variables* using double quoted strings will expand the variable whereas single will not. Using curly brackets will protect the variable and every variable is by default a string.

=== Command Line Arguments

Command line arguments can be passed into a shell script, these are numbered 0-n where 0 is the name of the program itself. An example of this is show in *@15-16-shell-command-args*.

#figure(
  [```sh
    echo "command: $0" #Name of the command
    echo "arg 1: $1" #1st arg
    echo "arg 2: $2" #2nd arg
    echo "arg 3: $3" #3rd arg
    echo "all args: $@"
    echo "number of args: $#"
  ```],
  caption: [Shell script which returns the command line arguments.],
  supplement: [Figure],
  kind: figure,
)<15-16-shell-command-args>

== Dependency Graphs and Make Files

An intuitive way of thinking about a program is through the use of a flowchart, which defines the path taken between a source and a target. An example of a flowchart for a simple calculation and plotting program is shown in *@15-16-flowchart*.

#figure(
  image("images/16-flowchart.png", width: 70%),
  caption: [An example of a flowchart for a simple plotting program.],
  supplement: [Figure],
  kind: figure,
) <15-16-flowchart>

However, for make files it makes more sense to use a dependency graph, which clearly defines the dependencies between different sections of the program, shown in *@15-16-dependency-graph* for the flowchart that was shown in *@15-16-flowchart*.

#figure(
  image("images/16-dependancy-grpah.png", width: 70%),
  caption: [An example of a dependency graph for the program shown in *@15-16-flowchart*.],
  supplement: [Figure],
  kind: figure,
) <15-16-dependency-graph>

The basic syntax for a make file is shown in *@15-16-basic-make-syntax* with the target being the target file, the source being teh source file, the tab being a space and the command being teh command needed to generate the target file


#figure(
  [```make
  target1: source1 source2
  [tab] command1a
  [tab] command1b
  target2: target1
  [tab] command2
  ```],
  caption: [Basic syntax for a make file.],
  supplement: [Figure],
  kind: figure,
)<15-16-basic-make-syntax>

To create the target from the make file, the command *`make target`* is ran. As shown in *@15-16-basic-make-syntax*, multiple sources can be set to one target file. Now all the essential building blocks are defined the make file for the dependency graph shown in *@15-16-dependency-graph* can be created, this is shown in *@15-16-dependency-graph-makefile*.

#figure(
  [```make
  Figure.png: plotfile.py data.txt
    python plotfile.py data.txt

  data.txt: tabulatesin
    ./tabulatesin > data.txt

  tabulatesin: tabulatesin.c
    gcc -Wall -ansi -pedantic -lm -o tabulatesin tabulatesin.c

  clean:
    rm data.txt tabulatesin plotfile.py

  plotfile.py:
    wget http://www.soton.ac.uk/~rpb/feeg6002/tools/plotfile.py

  ```],
  caption: [Makefile for the dependency graph shown in  *@15-16-dependency-graph*.],
  supplement: [Figure],
  kind: figure,
)<15-16-dependency-graph-makefile>

#pagebreak()
