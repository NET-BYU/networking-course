---
layout: homework
title: Networking
chapter: 1
icon: networking.svg
problems:
  - question: Did you do spend at least 30 minutes on the [Getting Started](http://www-net.cs.umass.edu/wireshark-labs/Wireshark_Intro_v8.0.pdf) Wireshark lab?
  
  - question: What are the benefits and drawbacks of using packet-switching vs circuit switching?
  
  - question: Describe a human analogy for a protocol. What happens when someone does not follow the protocol?
  
  - question: What should a networking protocol define?
  
  - question: What problems are introduced by using a store-and-forward transmission technique for routers and switches?
  
  - question: Suppose that the packet length is **L = 16000 bits**, and that the link transmission rate along the link to router on the right is **R = 100 Mbps**. 
    image: assets/single_link_transmission_time.png
    parts:
      - What is the transmission delay?
      - What is the maximum number of packets per second that can be transmitted by this link?
  
  - question: Assume the length of a packet is 4000 bits. The speed of light propagation delay on each link is 3x10<sup>8</sup> m/sec. What is the **transmission delay** and **propagation delay** for links 1, 2, and 3? What is the total end-to-end delay?
    image: assets/transmission_delay.png

  - question: 
    image: assets/bottleneck.png
    parts: 
      - What is the maximum achievable end-end throughput (in Mbps) for each of four client-to-server pairs, assuming that the middle link is fairly shared (divides its transmission rate equally)?

      - Which link is the bottleneck link?

      - Assuming that the servers are sending at the maximum rate possible, what are the link utilizations for the server links (R<sub>S</sub>)?

      - Assuming that the servers are sending at the maximum rate possible, what are the link utilizations for the client links (R<sub>C</sub>)?

      - Assuming that the servers are sending at the maximum rate possible, what is the link utilizations for the shared link (R)?
---
