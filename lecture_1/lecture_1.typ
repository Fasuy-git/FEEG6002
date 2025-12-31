#import "../template.typ": *

#show: codly-init.with()
#codly(languages: codly-languages)

#lecture("Lecture 1", 1, 1)

== Hello World in C using Quincy

The code required to create an executable file which prints hello world to the console is shown in *@1-hello-world-code*.

#figure(
  ```C
  #include <stdio.h>

  int main()
  {
    printf("Hello World \n");
    return 0;
  }
  ```,
  caption: [C code which prints hello world to terminal],
  supplement: [Figure],
  kind: figure,
)<1-hello-world-code>

- *Line 1*: Imports the header file called the *standard input output library* which contains the *`printf`* function that is utilized later in the code. This line is ran before the code is compiled and pastes in all of the functions within the header file.

- *Line 3*: Defines the *`main`* function which is always where execution starts for a C program. The function is defined as an integer using *`int`* and returns 0 to the OS upon successful execution.

- *Line 5* Utilizes the *`printf`* function to print "hello world" to the terminal. This function requires *`\n`* at the end to start a new line and each line of a C program requires a semicolon to signify the end of a line of code.

If this code is created as a C source file in Quincy it can be *saved* using *`ctrl + s`*, *compiled* using *`F5`* and than *executed* using *`F9`*. This will print the hello world text in the Quincy terminal as shown in *@1-hello-world-output*.

#figure(
  image("images/1-hello-world-output.png"),
  caption: [*@1-hello-world-code* executable file output ],
  supplement: [Figure],
  kind: figure,
)<1-hello-world-output>

When pressing *`F5`* Quincy sends a command to the C compiler which contains the following key flags:

- *`-ansi`*: Ensures compatibility with C90 standard.
- *`-Wall`*: Enables all warnings.
- *`-pedantic`*: Issues all warnings ISO C requires (C90 when using -ansi).

== Using the Command Line

The command line is a *non-graphical way of working with a computer, via screen and keyboard.* There exist many different terminals, some common window terminal commands are shown below:

- `dir` : Display all files in the current folder.
- `cd \` : Navigate to root folder.
- `cd \<dirname>` : Navigate to the specified folder.
- `cd ..` : Move up one folder.
- `mkdir <newdir>` : Make a new folder.
- `rmdir <rmdir>` : Remove a folder.
- `rename <old> <new>` : Rename a file or folder.
- `move <file1> <file2>` : Move file1 to file2.
- `del <file>` : Delete file.
- `cls` : Clear screen.
- `help` : Shows all commands.
- `copy <src> <dest>`: "Copy a file from src to dest.",
- `type <file>`: "Print the contents of a file.",
- `echo <text>`: "Print text to the console.",
- `exit`: "Close the command prompt.",
- `path`: "Show system PATH variable.",
- `ipconfig`: "Display network configuration.",
- `ping <host>`: "Send ICMP packets to a host.",
- `tasklist`: "List running processes.",
- `taskkill /IM <process> /F`: "Kill a running process.",
- `systeminfo`: "Display detailed system information."

#pagebreak()
