---
title: TCP Client v3
number: 3
repo: https://github.com/byu-ecen426-classroom/tcp_client_v3.git
---

> If debugging is the process of removing software bugs, then programming must be the process of putting them in. 
> 
> [Edsger Dijkstra](https://en.wikipedia.org/wiki/Edsger_W._Dijkstra)

## GitHub Classroom

Use the GitHub Classroom link posted in the Teams channel for the lab to accept the assignment.

## Historical Time Spent on Lab

![]({% link assets/lab_times/{{ page.title }}.svg %})

## Overview

For this lab, you will be building off what you did in the previous two labs. You will want to use your previous code as a starting point. The major difference is that we will be creating a [binary protocol](https://en.wikipedia.org/wiki/Binary_protocol). What this means is that instead of using ASCII, we will be using binary. I know what you are thinking: ASCII is binary! And you are right! In fact, this protocol will still have ASCII characters to represent the text of the message. However, for the action and message length fields, we will be using binary.

### Protocol

The request protocol will be formatted as follows:

```
 0                   1                   2                   3
 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|  Action |                    Message Length                   |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                             Data                              |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

Action: 5 bits
Message Length: 27 bits
Data: variable
```

We are very concerned about wasted space, so we will be packing these bits in tight!

The mapping from text action to binary action is as follows:

| Action      | Binary Value |
| ----------- | ------------ |
| `uppercase` | 0x01         |
| `lowercase` | 0x02         |
| `reverse`   | 0x04         |
| `shuffle`   | 0x08         |
| `random`    | 0x10         |

All other values are reserved and should not be used ☠️.

The response will be formatted as:

```
 0                   1                   2                   3
 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                         Message Length                        |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                             Data                              |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

Message Length: 32 bits
Data: variable
```

When dealing with binary formats, you have to be careful what kind of [endianness](https://en.wikipedia.org/wiki/Endianness) you use. You don't know what architecture the server is running, so you can't assume it is the same as yours. The server also can't assume anything. To deal with this, all networking protocols are formatted in big-endian (called network order).

For example, if you wanted to reverse the string "The LAN Before Time", then you would send the following binary data (displayed in hex format):

```
20 00 00 13 54 68 65 20 4C 41 4E 20 42 65 66 6F 72 65 20 54 69 6D 65
```

If you were to print this to your console, you would see:
```
 \0\0�The LAN Before Time
```

Where the first character is a space (because `0x20` is hex for a space character), `\0` is the NULL terminator, and � is `DC3` (device control 3) on the ASCII table, which is an unrepresentable ASCII character. The response from the server would be (displayed in hex format):

```
00 00 00 13 65 6d 69 54 20 65 72 6f 66 65 42 20 4e 41 4c 20 65 68 54
```

If you were to print this to your console, you would see:
```
\0\0\0�emiT erofeB NAL ehT
```

Where `\0` is the NULL terminator and � is `DC3` (device control 3) on the ASCII table.


### Command-line Interface (CLI)

Your program will take the same input file as the previous lab. So from the command-line interface perspective, you do not have to modify anything. This lab only touches the protocol part.

### Technical Debt

At this point in the labs, you might have incurred some [technical debt](https://en.wikipedia.org/wiki/Technical_debt). Since this lab is on the lighter side, this is your chance to pay it back. Take some time to understand how all of the different parts come together. Having a clear understanding of this will be helpful in future labs. Take time to make sure your code is clean and understandable. Run [Valgrind](https://www.valgrind.org)... it's a requirement.


## Objectives

- Understand the difference between a binary protocol and a text-based protocol.

- Implement a binary protocol.

- Learn about bit fields in C or get more practice with bit bashing.


## Requirements

- The name of your program must be named `tcp_client`.

- No modifications to `tcp_client.h` are allowed.

- The default port must be `8082`.

- Everything about the command-line interface must stay the same as lab 2.

- You must build off the previous lab (meaning you have to keep the pipelining).

- Your program must handle *any size* input, up to the allowable limit of the protocol.

- Use the binary version of the protocol.

- Ensure that Valgrind reports no errors. Don't run Valgrind from within the VSCode terminal window—it reports bad results. You know you are good when you see the following output on the last line of the Valgrind report: `ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)`. Run Valgrind with the following options:
```bash
valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --num-callers=20 --track-fds=yes bin/tcp_client
```


## Testing

You can follow the same testing structure as lab 1 and 2. I will also be running a TCP server at `ecen426.byu.edu:8082`. This server is only accessible on campus (for security purposes). If you are off-campus, you will need to VPN or use [SSH port forwarding](https://help.ubuntu.com/community/SSH/OpenSSH/PortForwarding) to test against it.


## Submission

To submit your code, upload it to Gradescope.

## Resources

- [`htonl`, `htons`, `ntohl`, `ntohs`](https://linux.die.net/man/3/htonl)

- [The Valgrind Quick Start Guide](https://www.valgrind.org/docs/manual/quick-start.html#quick-start.mcrun)

- [Copying integer value to character buffer and vice versa in C](https://www.includehelp.com/c/copying-of-integer-value-to-character-buffer-and-vice-versa-in-c.aspx)

- [C bit fields](https://www.tutorialspoint.com/cprogramming/c_bit_fields.htm)
  - [Reference](https://en.cppreference.com/w/cpp/language/bit_field)
  - Stack Overflow: [here](https://stackoverflow.com/questions/20911460/bit-fields-in-c-and-c-where-are-they-used) and [here](https://stackoverflow.com/questions/24933242/when-to-use-bit-fields-in-c)
  - [Deep dive](https://www.catb.org/esr/structure-packing/)
