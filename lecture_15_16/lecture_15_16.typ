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


