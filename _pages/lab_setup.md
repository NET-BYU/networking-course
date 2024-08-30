---
title: Lab Setup
layout: page
toc: true
icon: fas fa-wrench
---

## Development Environment

You are welcome to use the computers in the Embedded Lab (EB 438) or Digital Lab (EB 423) to work on your labs, however, none of the labs require you to sit at one of these computers. The labs will be tested and graded on Linux, so you need to make sure that it works in that environment. I completed all of the labs on macOS and did not see major differences. If you would like to use pure Windows to develop your labs, don't. Sorry, the socket programming is different on Windows so it would require a lot of effort to support Windows and Linux. I can't vouch for the Linux Subsystem on Windows, but you are welcome to try. Students in the past have had success using it. Just know that all grading will be done using pure Linux. If you don't have access to Linux on your machine, you can SSH into a Digital Lab or Embedded Lab computer and develop from there, or install a VM on your machine.

To SSH into an Embedded Lab computer, use the following hostname: `digital-<N>.ee.byu.edu` or `embed-<N>.ee.byu.edu`, replacing <N> with the computer number. These computers should have all the necessary libraries and executables to do the labs.

## Visual Studio Code

I highly recommend you use [VS Code](https://code.visualstudio.com). It's a good enough [editor]({% link assets/vim.png %}) and has a lot of powerful extensions. Specifically, using auto-formatting on save will save you a lot of trouble (and points) when you submit your code. Set up your VS Code [C/C++ extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools) with the following Clang format specification:

```
{ BasedOnStyle: LLVM, UseTab: Never, IndentWidth: 4, TabWidth: 4, ColumnLimit: 100 }
```

(you can also change the ColumnLimit to 80, the default.)

Here is an example of my configuration:

![Clang format configuration in VS Code]({% link assets/clang-format.png %}){:width="80%"}

I even have it format my code on save.

![Setting to format on save]({% link assets/format-on-save.png %}){:width="80%"}

If you are working on the labs remotely (SSHing into a computer), I *strongly* recommend you figure out how to use [VS Code's remote development](https://code.visualstudio.com/docs/remote/ssh). It is a very powerful way of developing on a remote machine while making it look like everything is local. Spending some time now will save you a lot of time later... I promise.

## Terminal

A theme in this class will be setting up your environment so that it matches your preferences, making your life easier. This is true with your terminal app—set it up so that it brings you joy (as much as a terminal app can) and works with your habits. 

My highly opinionated set up involves using [zsh](https://en.wikipedia.org/wiki/Z_shell), [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh), and [Powerlevel10k](https://github.com/romkatv/powerlevel10k). If you would like read more about my setup, you can go [here](https://byunetlab.notion.site/Phil-s-Computer-Setup-0722e33e22e74460aa53f58d5f2babb8).

## Git Repositories

For the labs, we will be using [GitHub Classroom](https://classroom.github.com/classrooms). If you are unfamiliar with Git, now is the time to start learning. VSCode has some Git integrations which will make this easier. 

For each lab, you will be given a link to start the lab. This will automatically create a GitHub repo for you for that lab. The first three labs have template code for you. This is the only way to start and submit the lab! In order for your code to be graded, you must push your code to your repo.

## Lab Submission

I will be using Gradescope to grade your labs. You will submit your code to Gradescope and it will give you a preliminary score. You are allowed to fix your code and resubmit it as many times as you want before the deadline. I will only grade the last submission before the deadline. **There will be extra test cases that will only be used after the deadline has passed.** This is motivation to write your code as best you can and not just write code that passes the tests.
