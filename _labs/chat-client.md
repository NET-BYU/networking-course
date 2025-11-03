---
layout: lab
toc: true
title: Chat Client
number: 7
---

> Programs must be written for people to read, and only incidentally for machines to execute.
> 
> [Harold Abelson](https://en.wikipedia.org/wiki/Hal_Abelson)

## GitHub Classroom

Use the GitHub Classroom link posted in the Teams channel for the lab to accept the assignment.

## Historical Time Spent on Lab

N/A

## Overview

For this lab, you will be writing a chat client using [MQTT](https://mqtt.org) in Python. Your chat client will need to be able to chat with other students through the MQTT broker. There are two parts to this lab, the "protocol" (how to format the payload) and the user interface.

MQTT is a different type of application layer protocol from what you have seen in the past. It will be worth your time to understand how it works before you dive into implementing a client. We discussed it in lecture, but reading some [articles](https://www.hivemq.com/blog/how-to-get-started-with-mqtt/) and/or watching some [videos](https://youtu.be/LKz1jYngpcU) will help you understand it better. It is a fairly complex protocol when you get into the details of how it works.

To use MQTT, you need a few pieces of information:

- **Hostname**. This is the hostname of the broker. (In MQTT, they call the server a broker.)
- **Port number**. This is the port number that the broker is bound to. For MQTT, the standard ports are 1883 and 8883.
- **Client ID**. A string to uniquely represent the client that has connected to the broker.
- **Topic**. The topic that you are subscribing to or publishing to. Topics are just strings but are typically hierarchical. Different namespaces are separated by slashes `/`. For example, in home automation, if you want to communicate with a light, the topic might be `home/upstairs/bedroom/light`. A topic is needed to publish or subscribe to.
- **Message**. The message you want to publish (if applicable).
- **Username and password** *(optional)*. Brokers can require that clients provide a username and password. Without a username and password, clients are anonymous. The username can be the same as the client ID.

We will not be using a username and password for this lab.


### Protocol

For this lab to work with other students, we need to standardize some way of formatting the MQTT message's payload and topic. There are two different topic sets: `<netid>/message` where all messages get published and `<netid>/status` where all status updates get published.

Your chat client will subscribe to two topics: `+/message` and `+/status`. These topics will allow you to receive all messages that are published from any NetID (including your own...). When you want to send a message, and assuming your NetId is "le0nh4rt", your client will publish to `le0nh4rt/message`, and when you want to update your status, you will publish to `le0nh4rt/status`.

The payload for the `<netid>/message` publications must contain [`json`](https://www.json.org/json-en.html) data with the following keys:

- `timestamp`: The time the message was published, formatted as the [epoch time (or Unix time)](https://en.wikipedia.org/wiki/Unix_time).
- `name`: The name of the person sending the message.
- `message`: The message you are sending.

For example, if you are publishing a message, "Hello world" at 8:13:00 AM on Nov 24, 2020, then the payload would be the following:

```json
{"timestamp": 1606230780, "name": "Dr. Phil", "message": "Hello world"}
```

The payload for the `<netid>/status` publications must contain `json` data with the following keys:

- `name`: The name of the person sending the message.
- `online`: An integer showing if the person is online or not. 0 for offline and any other value for online.

For example, to update your status to "online", the payload of the status update would be:

```json
{"name": "Dr. Phil", "online": 1}
```

You must publish an "online" message when you start your client and register a [last will](https://mntolia.com/mqtt-last-will-testament-explained-with-examples/) with the broker that publishes an "offline" message when you disconnect. To make the status messages more useful, you must set the [retain flag](https://www.hivemq.com/blog/mqtt-essentials-part-8-retained-messages/) for all status message publications.

### User Interface

This interface will be different from any other lab. Rather than using a command-line interface, you will be building an interactive interface. You have a couple of options for how you want to approach this interface:

1. Build a terminal user interface (TUI). You can use the [ncurses](https://en.wikipedia.org/wiki/Ncurses) library (through the [curses](https://docs.python.org/3/library/curses.html) module in Python) to build a TUI. However, in my opinion, ncurses is a outdated and there are better TUI tools, such as [Texual](https://textual.textualize.io/getting_started/). This approach will allow you to run your chat client in a terminal window. You will need to handle user input, display messages, and update the list of online users. There are many tutorials online for how to use ncurses to build TUIs.

2. Build a graphical user interface (GUI). You can use a GUI library like [Tkinter](https://docs.python.org/3/library/tkinter.html) (which is included with Python). This approach will allow you to create a more user-friendly interface with buttons, text boxes, and other widgets. There are many tutorials online for how to use Tkinter to build GUIs.

Regardless of which option you choose, you must provide the following usage pattern to start your program:

```
Usage: chat.py [--help] [-v] [-h HOST] [-p PORT] [-n NAME] NETID

Arguments:
 NETID The NetID of the user.

Options:
 --help
 -v, --verbose
 --host HOSTNAME, -h HOSTNAME
 --port PORT, -p PORT
 --name NAME, -n NAME
```

If no name is provided, then use NETID as the name.

Here is a demonstration of the chat client:

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/QMcLxLU1xxo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Objectives

- Build something that interfaces with third party code.

- Get exposure to integrating with UI code or writing your own UI code.

- Have fun!


## Requirements

- The name of your program must be named `chat.py`.

- Your program must have the usage pattern provided above and parse all of the options and arguments correctly.

- You are allowed to use the following third-party Python libraries. All other third-party libraries are off limits.
  - [Paho MQTT Client library](https://www.eclipse.org/paho/index.php?page=clients/python/docs/index.php)
  - [Texual](https://textual.textualize.io/getting_started/) *(if you are building a TUI)*

- The default port must be `1883`, and the default hostname must be `localhost`.

- Your client must be able to work with other chat clients. *This might require you to coordinate with other students to make sure they are online when you are testing*.

- Your client must subscribe and publish using QoS of 1.

- Your client must publish an "online" status message when first connecting to the broker and register a last will to publish an "offline" status for when your client disconnects.

- Your status messages must set the retain flag to `true`.

- To support multiple instances of your chat client, you must add randomness to the client ID you use to connect to the broker. You are free to choose how you want to add randomness to your client ID. 

- Your user interface must show the following information:
  - Messages that have been sent and received. It must include the time the message was sent, the name of the person that sent the message, and the message itself. The timestamp must be human-readable and not in epoch time format.

  - Show when people have left or joined the chat server. This can be inline with the chat messages.

## Installing Python Libraries
To install the Paho MQTT Client library and Textual library, you will need to create a [virtual environment](https://docs.python.org/3/library/venv.html). A virtual environment allows you to install Python libraries without needing administrator privileges and without interfering with other Python projects you might have on your computer.

Here is how you do it:

```bash
cd path/to/your/project/folder
python3 -m venv .venv         # Create a virtual environment in the .venv folder
source .venv/bin/activate     # Activate the virtual environment
pip install paho-mqtt textual # Install the required libraries
```

Every time you want to work on your project, you will need to activate the virtual environment by running `source .venv/bin/activate` in your project folder.

## Testing

The chat server will be hosted at ecen426.byu.edu:1883.

One good way of testing your chat client is to bring up multiple instances of your client. That way, you can see how it responds to people coming online and offline.

## Submission

Since this is using a TUI or a GUI, it is hard to do automated testing. Therefore, you will need to record a short video demonstrating your chat client fulfills **all of the requirements below**. You will need to show me your source code and your lab functioning to get all the points. You will submit this video and your source code on Teams, through a private message.

Here is the grading rubric for this lab:

| Requirement                                                          | Points |
| -------------------------------------------------------------------- | ------ |
| Program is named `chat.py`                                           | 1      |
| Usage pattern is correct                                             | 1      |
| Publishes and subscribes with QoS of 1                               | 1      |
| Publishes "online" status on connect                                 | 2      |
| Registers last will to publish "offline" status                      | 2      |
| Status messages set retain flag                                      | 2      |
| Client ID has randomness                                             | 2      |
| User interface shows sent and received messages                      | 5      |
| User interface shows people joining/leaving chat                     | 5      |
| Multiple instances of client work correctly with the same netID/name | 5      |
| Client works with other students' chat clients                       | 5      |
| **Total**                                                            | **31** |


## Resources

- [Textual tutorial](https://textual.textualize.io/tutorial/)

- [Paho MQTT Python documentation](https://eclipse.dev/paho/files/paho.mqtt.python/html/index.html)

- [Paho MQTT Python client publication example](https://github.com/eclipse/paho.mqtt.python/blob/master/examples/client_pub-wait.py)

- [Paho MQTT Python client subscription example](https://github.com/eclipse/paho.mqtt.python/blob/master/examples/client_sub.py)
