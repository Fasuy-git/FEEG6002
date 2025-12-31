#import "../template.typ": *

#show: codly-init.with()
#codly(languages: codly-languages)

= Lecture 2

== Command Line

It was previously states that a command line is a non-graphical way of interacting with the computer using the screen and a keyboard. The command line like many other programming languages is a *REPL* type of program, which stands for:

- *Read*: read user input.
- *Evaluate*: run the command.
- *Print*: show the output.
- *Loop*: wait for the next command.

The command line can be used to manually perform many OS tasks (moving, renaming, deleting files and folders etc.,). Alternatively a bash file (*`.bat`*) can be used to chain together commands and automate scripts.

GUIs are not easy to program, often add unnecessary complexity to the program and are difficult to automate. The command line is therefore an attractive alternative for user interaction. The shell allows for interaction with the command line and also allows for many different programs to interact with one another. To allow for  interactivity, Shell's use the *Unix philosophy* which states:

- Write programs that do one thing and do it well.
- Write programs to work together.
- Write programs to handle text streams (universal interface).

== Input Output (I/O) Streams

The input and output of programs is done via a stream. There exists three standard streams for OSs which are shown in *@1-table-standard-streams*.

#figure(
  table(
    columns: 4,
    fill: (column, row) => if row == 0 { gray },
    table.header([*Standard Stream*], [*Abbreviation*], [*File Descriptor*], [*Connected to*]),
    [Input], [*`stdin`*], [0], [Keyboard],
    [Output], [*`stdout`*], [1], [Screen],
    [Error], [*`stderr`*], [2], [Screen],
  ),
  caption: [Standard streams],
)<1-table-standard-streams>

== Program I/O in C

The built in C library *`stdio`* defines these streams. As well as some functions which make use of these streams, as shown below:

- * `printf()` * $->$ Utilizes the *`stdout`* to print to the terminal.
- * `fprintf()` * $->$  Takes an argument (either *`stdout`* or `stderr`) to either print out to standard out or standard error.
- *`getchar()`* $->$ Get one character from *`stdin`* (note that this saves as the ASCII value of the character).
- *`putchar()`* $->$ Send one character to *`stdout`* (note that this takes the ASCII number and outputs the corresponding character).

One common tool to stop an infinitely looping code is to use the *`EOF`* (end of file) character, which can be inputted in a windows shell by doing *`ctrl + Z`* and then pressing *`Enter`*.

Note that for *`fprintf()`* if *`stdout`* is passed then it behaves the same as *`printf`*. If *`stderr`* is instead passed than an *unbuffered, undirectable* output is printed to the shell.

Applying these functions in one program, a parrot code can be created as shown in *@2-parrot* which returns the inputted text from the terminal.

#figure(
  ```C
  #include <stdio.h>
  int main()
  {
  	int c;
  	fprintf(stderr, "Enter some characters (Ctrl-D quits)\n");
  	while ((c = getchar()) != EOF) {
  		putchar(c);
  	}
  	fprintf(stderr, "Goodbye\n");
  	return 0;
  }
  ```,
  caption: [C code which parrots the input and prints it back out to the terminal.],
  supplement: [Figure],
  kind: figure,
)<2-parrot>

== Program I/O in Terminal

The *`echo`* command can be used to print things within the terminal (*`stdout`*), the standard output can be redirected and written to a file using *`>`* this is shown in *@2-redirect-stdout-terminal*

#figure(
  image("images/2-stdout-redirect.png", width: 85%),
  caption: [Redirecting terminal *`stdout`*.],
  supplement: [Figure],
  kind: figure,
)<2-redirect-stdout-terminal>

To append to a text file *`>>`* can be used instead. The *`stdin`* can also be redirected using the *`<`* operator, this is shown in *@2-redirect-stdin*.

#figure(
  image("images/2-stdin-redirect.png", width: 85%),
  caption: [Redirecting terminal *`stdin`* into a executable file.],
  supplement: [Figure],
  kind: figure,
)<2-redirect-stdin>

The output of the *`parrot.exe`* can itself be redirected into another text file by utilizing both the *`>`* command, as shown in *@2-redirect-stdout*.

#figure(
  image("images/2-program-stdout-redirect.png", width: 85%),
  caption: [Redirecting program *`stdout`* into a text file.],
  supplement: [Figure],
  kind: figure,
)<2-redirect-stdout>

Note that the *`stderr`* from the program is still outputted to the shell, this can also be redirected using the *`2`* file descriptor, this is shown in *@2-stderr-redirect*.

#figure(
  image("images/2-stderr-redirect.png", width: 85%),
  caption: [Redirecting program *`stdout`* and *`stderr`* into a text file.],
  supplement: [Figure],
  kind: figure,
)<2-stderr-redirect>

Note that if anything is ever re-routed to *`dev\null`* then this output is quietly destroyed. Pipes can be used to chain together commands, effectively chaining the *`stdout`* of one command to the *`stdin`* of the second command. An example of using pipes to chain together commands is shown in *@2-pipes*.

#figure(
  image("images/2-pipes.png", width: 85%),
  caption: [Utilizing pipes in the terminal to chain commands.],
  supplement: [Figure],
  kind: figure,
)<2-pipes>

#pagebreak()
