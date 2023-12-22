---
title: MQTT Client
number: 7
repo: https://github.com/byu-ecen426-classroom/mqtt_client.git
---

> Programs must be written for people to read, and only incidentally for machines to execute.
> 
> [Harold Abelson](https://en.wikipedia.org/wiki/Hal_Abelson)

## GitHub Classroom

Use the GitHub Classroom link posted in the Teams channel for the lab to accept the assignment.

## Historical Time Spent on Lab

![]({% link assets/lab_times/{{ page.title }}.svg %})

## Overview

You will be writing an [MQTT](https://mqtt.org) client in Python. MQTT is a different type of application layer protocol from what you have seen in the past. It will be worth your time to understand how it works before you dive into implementing a client. We discussed it in lecture, but it is worth reading some [articles](https://www.hivemq.com/blog/how-to-get-started-with-mqtt/) and/or watching some [videos](https://youtu.be/LKz1jYngpcU). It is a fairly complex protocol when you get into the details of how it works.

To use MQTT, you need a couple of pieces of information:

- **Hostname**. This is the hostname of the broker. (In MQTT, they call the server a broker.)
- **Port number**. This is the port number that the broker is bound to. For MQTT, the standard ports are 1883 and 8883.
- **Client ID**. A string to uniquely represent the client that has connected to the broker.
- **Topic**. The topic that you are subscribing to or publishing to. Topics are just strings but are typically hierarchical. Different namespaces are separated by slashes `/`. For example, in home automation, if you want to communicate with a light, the topic might be `home/upstairs/bedroom/light`. A topic is needed to publish or subscribe to.
- **Message**. The message you want to publish (if applicable).
- **Username and password** *(optional)*. Brokers can require that clients provide a username and password. Without a username and password, clients are anonymous. The username can be the same as the client ID.

We will not be using a username and password for this lab.

### Protocol

We will be going back to our old-faithful protocol. It will work the following way: A client will publish a message with a topic set to `<netid>/<action>/request`. The payload of the message will be the text you want to transform. For example, if you want to uppercase the text, "Networking is the best!" and your NetID is [le0nh4rt](https://en.wikipedia.org/wiki/Squall_Leonhart), then you would publish to the topic `le0nh4rt/uppercase/request` and the message would be "Networking is the best!". Your client must subscribe to the topic `<netid>/<action>/response`. Using the previous example, you would subscribe to `le0nh4rt/uppercase/response` to get the response, which would be "NETWORKING IS THE BEST!".

**Note**: We are trying to fit a request/response protocol into a publisher/subscriber model. Though it happens all the time, it is not ideal and slightly unintuitive. We are doing this to combine something you are familiar with something new.

### Command-line Interface (CLI)

The only arguments for this lab are NetID, action, message. The NetID will be used for the topic that you publish and subscribe to. The action and message will be the same as the previous labs. Similar to earlier labs, your client must take a hostname and port number. The default port number should be 1883, and the default host should be `localhost`. The provided NetID will also be used for the client ID. You must use look something like this usage pattern:

```
usage: mqtt_client.py [-h] [-p PORT] [--host HOST] [-v] netid action message

positional arguments:
  netid
  action
  message

optional arguments:
  -h, --help            show this help message and exit
  -p PORT, --port PORT
  --host HOST
  -v, --verbose
```

**Note**: The usage pattern can differ slightly depending on the language and library you use to implement the argument parsing, but the general meaning of the usuage pattern should be the same.

## Objectives

- Learn MQTT and how to use it.

- Get experience with asynchronous code.

## Requirements

- You must use the same version of Python the Embedded Lab computers are using.

- The only third-party Python library you are allowed to use in this lab is the [Paho MQTT Client library](https://www.eclipse.org/paho/index.php?page=clients/python/docs/index.php). All other third-party libraries are off limits. 

- You must name your program `mqtt_client.py`.

- Your program must have the usage pattern provided above and parse all of the options and arguments correctly.

- The default port must be `1883`, and the default hostname must be `localhost`.

- Your application must print the response to `stdout`. All other class norms must be followed (e.g., print errors to `stderr`, correct return codes, etc.).

- Your client must subscribe and publish using QoS of 1.

- Answer [these questions]({% link assets/mqtt_questions.txt %}) on MQTT. The questions should be answered in a file called `questions.txt` and placed in your repository.


## Testing

I have provided an MQTT broker at lundrigan.byu.edu:1883. You can use it to test your client. 

You can also install [`mosquitto`](https://mosquitto.org), a popular open-source MQTT broker. Using mosquitto, you can test locally on your machine. You might consider installing `mosquitto-clients`, which gives you [`mosquitto_pub`](https://mosquitto.org/man/mosquitto_pub-1.html) and [`mosuquitto_sub`](https://mosquitto.org/man/mosquitto_sub-1.html), which are clients to publish and subscribe with.


## Submission

To submit your code, push it to your Github repository. Tag the commit you want to be graded with a tag named `final`.


## Resources

- [Paho MQTT Python client](https://www.eclipse.org/paho/index.php?page=clients/python/docs/index.php)
- [Paho MQTT Python client publication example](https://github.com/eclipse/paho.mqtt.python/blob/master/examples/client_pub-wait.py)
- [Paho MQTT Python client subscription example](https://github.com/eclipse/paho.mqtt.python/blob/master/examples/client_sub.py)
- [Python logging](https://realpython.com/python-logging/)
- [Printing to `stderr` in Python](https://stackoverflow.com/questions/5574702/how-to-print-to-stderr-in-python)

