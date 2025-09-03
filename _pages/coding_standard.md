---
title: Coding Standard
layout: page
toc: true
icon: fas fa-terminal
---

## C Coding Standard

### 1. General

* **1.1** You must write C-code. No class definitions are allowed. If you need a data structure, it must be something supported by "C", such as a `struct`.

* **1.2** When compiled, your code must not cause the compiler to issue any warnings or errors.

* **1.3** Your code, when submitted, must be in a finished form. You must not have any commented out lines of code.

* **1.4** Avoid using repetitive sections of copied and pasted code in your programs.

* **1.5** No external downloaded libraries are allowed, except for the simple logging library, [log.c](https://github.com/rxi/log.c), unless the lab description specifies otherwise. Libraries that come standard in the Unix environment are allowed (e.g., `string.h`, `getopt.h`, `stdio.h`). 

* **1.6** All code will be graded against the coding standard.

### 2. Comments
* **2.1** Comments must be _meaningful_. Make sure that your code completely describes your intent. If your code is unclear or does not completely describe what is going on, comment accordingly.

* **2.2** Each function (except for `main`) must have a comment header which includes:
    - A description of the function (what it does, what has to happen first, etc.).
    - A list of all of the arguments, their names, and meanings.
    - A description of the return value and its meaning.

### 3. Formatting
* **3.1** You must use the [`clang-format`](https://clang.llvm.org/docs/ClangFormat.html) code formatter on your code. I recommend you use something that automatically formats your code when you save your file, such as [VS Code](https://code.visualstudio.com) and the [C/C++ Extension](https://github.com/Microsoft/vscode-cpptools). The starter code for the C labs include a `.clang-format` file that your C/C++ VS Code extension will use by default. If you do not like the format, you can change it.
  
### 4. Program Output
* **4.1** All logging messages must be written to `stderr`.

* **4.2** All program output must be written to `stdout`.

* **4.3** A program must return the correct return value when it exits.

## Python Coding Standard

### 1. General
* **1.1** You must use Python 3.12

* **1.2** Your code, when submitted, must be in a finished form. You must not have any commented out lines of code.

* **1.3** Avoid using repetitive sections of copied and pasted code in your programs.

* **1.4** No external downloaded libraries are allowed, unless explicitly stated in the lab instructions. 

* **1.5** All code will be graded against the coding standard.

### 2. Comments
* **2.1** Comments must be _meaningful_. Make sure that your code completely describes your intent. If your code is unclear or does not completely describe what is going on, comment accordingly.

* **2.2** Each function must have a comment header which includes:
    - A description of the function (what it does, what has to happen first, etc.).
    - A list of all of the arguments, their names, and meanings.
    - A description of the return value and its meaning.

### 3. Formatting
* **3.1** You must use the [`black`](https://github.com/psf/black) code formatter. I recommend you use something that automatically formats your code when [you save your file](https://dev.to/adamlombard/how-to-use-the-black-python-code-formatter-in-vscode-3lo0).

### 4. Program Output
* **4.1** All logging messages must be written to `stderr`.

* **4.2** All program output must be written to `stdout`.
