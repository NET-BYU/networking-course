---
title: HTTP Server
number: 5
repo: https://github.com/byu-ecen426-classroom/http_server.git
---

> Computer Science is no more about computers than astronomy is about telescopes.
> 
> [Edsger W. Dijkstra](https://en.wikipedia.org/wiki/Edsger_W._Dijkstra)

## GitHub Classroom

Use the GitHub Classroom link posted in the Teams channel for the lab to accept the assignment.

## Historical Time Spent on Lab

![]({% link assets/lab_times/{{ page.title }}.svg %})

## Overview

Now that you have written TCP client and a TCP server, it is time to graduate to a real protocol: HTTP! As you know, HTTP is just a text-based protocol that runs on top of TCP. The previous lab built the groundwork for your HTTP server. Now instead of parsing my made-up protocol, you will be parsing HTTP. Your HTTP server will support `GET` requests. When your server receives a `GET` request, it will determine the file that is being requested and return it. By the end of this lab, your server should be able to host a full website on it.

There are two parts to this project, the HTTP parsing and CLI.

### HTTP Parsing
Assuming you did the previous lab correctly, you will need to modify the logic that parses a request and builds a response—all of the TCP related logic can stay the same. The HTTP request and response format are pure ASCII, so a lot of the work and tooling you have built around parsing the other protocol still apply.

For your server, your responses will be in `HTTP/1.0`. I've provided a small demo webpage in the `www` folder of the lab. As part of parsing the HTTP request, you must parse all of the headers of the request as well.

### Command-line Interface (CLI)

Only two modifications need to be made to the CLI of your server from the previous lab. First, you need to add an option that allows you to pass in the folder that your server will look for files. What I mean by this is when someone requests `http://localhost:8080/test.jpg`, where should your server look for `test.jpg`? It could look relative to the root directory, but that is a big security problem because then the person requesting has access to your whole hard drive. Instead, an option will be provided that makes all requests relative to that folder. For example, you could run the server,

```
python http_server.py -f ./www
```

Then all requests would be relative to the `www` folder. The previous request would try to access a file at `www/test.jpg`. The second change you need to make is adding a `--delay` flag. This flag needs to purposely delay the handling of a HTTP request for 5 seconds. This flag is purely to help with testing your code and has no real-world benefit.

## Objectives

- Get experience with the HTTP protocol.

- Get more experience with file IO.

- Reinforce understanding of relative file paths.


## Requirements

- You must use Python 3.8+.

- You **can not use any third party Python libraries** for this lab. If you have to `pip install` or clone any repos, in order to import a library, stop. The only exception is the formatter, [Black](https://github.com/psf/black), which you have to `pip install`. However, you do not use it in your code. 

- For all socket related tasks, you must only use the [low-level `socket` interface](https://docs.python.org/3/library/socket.html) that Python provides. No high-level server socket interfaces are allowed.

- The name of your program must be named `http_server.py`.

- `http_server.py` accepts no arguments and five options:

```
usage: http_server.py [-h] [-p PORT] [-v] [-d] [-f FOLDER]

optional arguments:
  -h, --help            show this help message and exit
  -p PORT, --port PORT  port to bind to
  -v, --verbose         turn on debugging output
  -d, --delay           add a delay for debugging purposes
  -f FOLDER, --folder FOLDER
                        folder from where to serve from
```

- The default port must be `8084`.

- The default folder must be `.`.

- When the delay option is set, your server must wait 5 second after receiving an HTTP request before sending a response.

- Your server must be able to *parse all request types* (`GET`, `POST`, `PUT`, etc.); however, you only need to service `GET` requests. If a request type other than `GET` is received, you must return a `405 Method Not Allowed` response. 

- Your server must parse *all* HTTP headers in a request.

- You are only required to respond with one header, `Content-Length`, which contains the size of the response file. You are welcome to support other response headers, such as `Content-Type`, `Last-Modified`, etc.

- Your server must be able to serve a webpage with multiple resources to Chrome.

- If a request for a file does not exist, a proper error message must be returned (`404 File Not Found`) with an error webpage. I've provided `404.html`, but you are welcome to use your own.

- If any other error occurs, the [appropriate error code/message](https://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html) must be returned. **This includes dealing with malformed HTTP requests.**

- Your server needs to be able to return a requested file of any size. Take special care on how you read the file from disk. You probably can't fit a 1 TB file into memory, so how can you serve a file that big?

- All other class norms must be followed (e.g., print errors to `stderr`, correct return codes, etc.).



## Testing

You can follow the same tools as the previous lab. You can also add [httpie](https://httpie.org) or [curl](https://curl.haxx.se) to your repertoire. They will create a valid HTTP request for you to test your server against. Once you have refined your lab, you can use a web browser to make sure your response is well-formed, and the data you are returning is correct.

**Warning**: Chrome has a weird behavior where it will sometimes set up a TCP connection with your server but then not send anything. This TCP connection will cause your server to block, waiting for an HTTP request. I'm not sure why Chrome does this, but it is probably related to performance enhancements and anticipating another HTTP request might be sent. Either way, don't worry about this case since it is a Chrome-specific issue.

**Warning**: When testing with httpie or curl and sending binary files (like a large image), httpie will sometimes close the connection prematurely. This is because you are sending binary data and httpie ignores binary data (by default), it closes the connection early without receiving the full response. So if you aren’t able to send all of the data before httpie decides to close, you will get an error while sending the data.


## Submission

To submit your code, push it to your Github repository. Tag the commit you want to be graded with a tag named `final`.


## Resources

- [HTTP Specification](https://tools.ietf.org/html/rfc7230)

- [HTTP Wikipedia Article](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Message_format)

- [How to get file size in Python?](https://www.geeksforgeeks.org/how-to-get-file-size-in-python/)

- [How to read big file in Python](https://www.iditect.com/guide/python/python_howto_read_big_file_in_chunks.html)
