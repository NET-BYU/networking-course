---
layout: homework
title: Link Layer
chapter: 6
icon: link-layer.svg
problems:
    - question: Did you do spend at least 30 minutes on the [Ethernet and ARP](http://www-net.cs.umass.edu/wireshark-labs/Wireshark_Ethernet_ARP_v8.0.pdf) Wireshark lab?

    - question: Read about ARP spoofing [online](https://en.wikipedia.org/wiki/ARP_spoofing).
      parts:
        - Describe how an attacker would perform ARP spoofing to perform a person-in-the-middle attack.
        - Assuming a device has been on a network for awhile, devise a scheme where that device could detect that ARP spoofing is happening on the network and alert the network administrator.
        - If you could make any modifications to the link layer, what would you change or add to protect against ARP spoofing? Would that approach be feasible in real use?
  
    - question: List **at least 7 protocols** and the **order they would be used** when a user connects a new device to a network and goes to a webpage on their web browser for the first time. You can assume that no caching has previously been performed.

    - question: In this problem, we explore the use of small packets for Voice-over-IP applications.
      parts:
        - Consider sending a digitally encoded voice source directly. Suppose the source is encoded at a constant rate of 128 kbps. Assume each packet is entirely filled before the source sends the packet into the network. The time required to fill a packet is the **packetization delay**. What is the packetization delay in milliseconds, assuming that the packet is **L bytes** long?

        - Packetization delays greater than 20 msec can cause a noticeable and unpleasant echo. Determine the packetization delay for **L = 1,500 bytes** (roughly corresponding to a maximum-sized Ethernet packet) and for **L = 50** (corresponding to an ATM packet).

        - What is the percent overhead associated with packets **L = 1,500 bytes** long and for **L = 50 bytes** long when the packet header is **20 bytes**? Assume that L includes the header.

        - Calculate the transmission delay at a single switch for a link rate of **R = 600 Mbps** for **L = 1,500 bytes**, and for **L = 50 bytes**.

        - What are the advantages/disadvantages of using a small packet size?

    - question: What are the advantages and drawbacks of the following multiple access protocols? 
      parts:
        - Channel partitioning
        - Random access
        - Taking turns
---

