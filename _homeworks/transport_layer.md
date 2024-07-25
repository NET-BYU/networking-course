---
layout: homework
title: Transport Layer
chapter: 3
icon: transport-layer.svg
old_problems:
    - P4
    - P14
    - P23
    - P40
    - P41
wireshark_labs:
    - <a target="_blank" href="http://www-net.cs.umass.edu/wireshark-labs/Wireshark_TCP_v8.0.pdf">TCP</a>
    - <a target="_blank" href="http://www-net.cs.umass.edu/wireshark-labs/Wireshark_UDP_v8.0.pdf">UDP</a>
problems:
    - question: Did you do spend at least 30 minutes on the [TCP](http://www-net.cs.umass.edu/wireshark-labs/Wireshark_TCP_v8.0.pdf) and [UDP](http://www-net.cs.umass.edu/wireshark-labs/Wireshark_UDP_v8.0.pdf) Wireshark labs?
    
    - question:
      parts: 
        - "Suppose you have the following 2 bytes: `01011100` and `01100101`. What is the 1s complement of the sum of these 2 bytes?"
        - "Suppose you have the following 2 bytes: `11011010` and `01100101`. What is the 1s complement of the sum of these 2 bytes?"
        - For the bytes in part (a), give an example where one bit is flipped in each of the 2 bytes and yet the 1s complement doesn't change.

    - question: 
      parts: 
        - What is the UDP/TCP checksum protecting against? 
        - What is the UDP/TCP checksum not protecting against?
        - Why should you include the header in the checksum and not just the payload?

    - question:
      image: assets/tcp_multiplexing.png
      parts: 
        - "What is the source port # for packet B?"
        - "What is the destination port # for packet B?"
        - "What is the source port # for packet A?"
        - "What is the destination port # for packet A?"
        - "What is the source port # for packet D?"
        - "What is the destination port # for packet D?"
        - "What is the source port # for packet C?"
        - "What is the destination port # for packet C?"
  
    - question: Suppose that TCP's current estimated values for the round trip time (estimatedRTT) and deviation in the RTT (DevRTT) are 290 ms and 11 ms, respectively. Suppose that the next measured value of the RTT is 220 ms. For the following questions, use the values of α = 0.125, and β = 0.25.
      parts:
        -  What is the estimatedRTT after the new RTT?
        -  What is the RTT Deviation for the the new RTT?
        -  What is the TCP timeout for the new RTT?
    
    - question: Consider the figure above in which a TCP sender and receiver communicate over a connection in which the segments can be lost. The TCP sender wants to send a total of 10 segments to the receiver and sends an initial window of 5 segments at t = 1, 2, 3, 4, and 5, respectively. Suppose the initial value of the sequence number is 60 and every segment sent to the receiver each contains 818 bytes. The delay between the sender and receiver is 7 time units, and so the first segment arrives at the receiver at t = 8, and an ACK for this segment arrives at t = 15. As shown in the figure, 1 of the 5 segments is lost between the sender and the receiver, but one of the ACKs is lost. Assume there are no timeouts and any out of order segments received are thrown out. For each of the time periods (t = 1 to t = 19), list the corresponding sequence number or acknowledgement number. If for a time period, no data or acknowledgement was received or no data was sent, mark with an x.
      image: assets/tcp-retransmissions.png
    
    - question: Consider the figure above, which plots the evolution of TCP's congestion window at the beginning of each time unit (where the unit of time is equal to the RTT). In the abstract model for this problem, TCP sends a "flight" of packets of size cwnd at the beginning of each time unit. The result of sending that flight of packets is that either (i) all packets are ACKed at the end of the time unit, (ii) there is a timeout for the first packet, or (iii) there is a triple duplicate ACK for the first packet. In this problem, you are asked to reconstruct the sequence of events (ACKs, losses) that resulted in the evolution of TCP's cwnd shown above. Consider the evolution of TCP's congestion window in the example above and answer the following questions. The initial value of cwnd is 1 and the initial value of ssthresh (shown as a red +) is 8.
      image: assets/cwnd.png
      parts:
        - Give the time ranges at which TCP is in slow start.
        - Give the time ranges at which TCP is in congestion avoidance.
        - Give the times at which packets are lost via timeout.
        - Give the times at which packets are lost via triple ACK.
        - Give the times at which the value of `ssthresh` updated.
---
