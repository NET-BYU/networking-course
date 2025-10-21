---
title: Concurrent HTTP Server
number: 6
repo: https://github.com/byu-ecen426-classroom/concurrent_http_server.git
---

> Controlling complexity is the essence of computer programming.
> 
> [Brian Kernighan](https://en.wikipedia.org/wiki/Brian_Kernighan)

## GitHub Classroom

Use the GitHub Classroom link posted in the Teams channel for the lab to accept the assignment.

## Historical Time Spent on Lab

![]({% link assets/lab_times/{{ page.title }}.svg %})

## Overview

For this lab, you will be extending your HTTP server to handle multiple clients _at once_. The rest of your server will stay the same. There are multiple ways of supporting multiple clients. A typical approach is to spawn a new thread or process for each client that connects. That thread or process is responsible for communicating with a specific client. There is another approach that uses a system call (`poll` or `select`) to determine which sockets are ready to receive data from or write data to. With socket programming, most of the time your program is waiting around for the sockets to send or receive data, this allows your program to handle multiple sockets at once. Instead of creating a new thread or process for each client socket, one process keeps track of many sockets at once.

For this lab, you are required to implement a concurrent server in three ways: (1) using threads, (2) using a thread pool, and (3) using `select`. Using threads, when a new request comes in, a thread is created and the socket is passed to that thread. The newly spawned thread is now responsible for receiving and sending data while the main thread is still accepting new clients. With a thread pool, you create a bunch of threads before starting your server and hand tasks (i.e., new clients) to threads that are idle. As mentioned in lecture, threads have their own set of issues, largely shared memory. To limit these issues, try to use local variables as much as possible. You should not need to use mutex/locks in this lab! For the `select` implementation, you will need to use the [`select` call](https://docs.python.org/3.12/library/selectors.html) to determine which sockets are ready to read from or write to. This is a more advanced technique and requires a good understanding of how sockets work. You will need to maintain a list of all the client sockets that are connected to your server and use `select` to determine which sockets are ready for reading or writing.

As part of writing a well behaving server, you will need to appropriately handle the threads when you are exiting (the user hits `ctrl-c`). This allows your server to finishing handling clients that have already connected before shutting down the server. To do this, you must join all spawned threads.

Assuming you did the previous lab correctly, you shouldn't have to change any of your HTTP parsing code.

### Command-line Interface (CLI)

To control whether you are using threads, a thread pool, or select, we need to modify the CLI of your program. Add a new flag option, called `-c`/`--concurrency`. It takes a string which controls which concurrency technique you are using. The complete CLI will look like

```
usage: http_server.py [-h] [-p PORT] [-v] [-d] [-f FOLDER] [-c {thread,thread-pool,select}]

optional arguments:
  -h, --help            show this help message and exit
  -p PORT, --port PORT  port to bind to
  -v, --verbose         turn on debugging output
  -d, --delay           add a delay for debugging purposes
  -f FOLDER, --folder FOLDER
                        folder from where to serve from
  -c {thread,thread-pool,select}, --concurrency {thread,thread-pool,select}
                        concurrency methodology to use
```

### Benchmarking

As part of this lab, you will be benchmarking the different approaches to concurrency. To do so, you will be using the [wrk2](https://github.com/giltene/wrk2) tool. It sends a bunch of HTTP requests to your server and measures how long it takes to respond. You will need to build `wrk2` yourself by cloning the [linked repo](https://github.com/giltene/wrk2) and running `make`. After running `make`, a `wrk` executable will be generated. I have verified that it works on the Digital and Embedded Lab computers. You will benchmark the performance of your old lab that was single threaded vs. the threaded version vs. the thread-pool version vs. the select version. Record the results in `benchmark.md` of your repository. For consistency, record the results of your benchmark using this configuration:

```
./wrk -t10 -c10 -d30s -R10000 http://127.0.0.1:8085/page.html
```

Run the benchmark **3 or more times** and report the best run. You should turn off verbose output when running your benchmarks. You are welcome to play around with different configurations, but for the results you report, make sure to use this configuration. Here is an [example]({% link assets/benchmark.md %}) of what the benchmark.md file should look like.

## Objectives

- Learn how to use threading, thread pools, and select in Python.

- Learn how to make an HTTP server concurrent.

- Get experience with benchmarking.


## Requirements

- You must use Python 3.12 for this lab.

- The name of your program must be named `http_server.py`.

- You must be able to handle multiple concurrent clients at once using threads, a thread pool, and `select`.

- You can only use the low-level [threading.Thread](https://docs.python.org/3.12/library/threading.html#thread-objects) objects. All high-level concurrency libraries like [concurrent.futures](https://docs.python.org/3.12/library/concurrent.futures.html) are **not allowed**. Python has implementations of thread pools, but you must implement these yourself to get the credit. For select, you can use [selectors](https://docs.python.org/3.12/library/selectors.html) class.

- Add the `-c`/`--concurrency` flags to your program. If the concurrency flag is not provided, the default value should be `thread`.

- You must gracefully shutdown your server, **waiting for all client sockets to finish**.

- The default port must be `8085`.

- You must benchmark the performance of your server using threads/thread-pool/select and report those results in `benchmark.md`.

- All other requirements are the same as lab 5.

## Testing

One way to test that your server is handling multiple clients is to add an artificial delay (e.g., `sleep`) to your program, just for testing purposes. This technique will simulate a request taking a long time and show if you are handling clients concurrently. This is already built into your CLI with the `--delay` flag.

For debugging purposes, it might be useful to prefix all log messages with the socket that you are working on. The socket number should correspond to what thread is running. This can give you insight into what each thread is doing.

The benchmarking tool, [wrk2](https://github.com/giltene/wrk2), will also help you in your testing.


## Submission

To submit your code, upload it to Gradescope.

## Resources

- [Python Threads](https://docs.python.org/3.12/library/threading.html)

- [Python Queue (good for coordinating between threads)](https://docs.python.org/3.10/library/queue.html)

- [Python Select](https://docs.python.org/3.12/library/selectors.html)
