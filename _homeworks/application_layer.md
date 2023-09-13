---
layout: homework
title: Application Layer
chapter: 2
icon: application-layer.svg
problems:
    - question: Did you do spend at least 30 minutes on the [HTTP](http://www-net.cs.umass.edu/wireshark-labs/Wireshark_HTTP_v8.0.pdf) Wireshark lab?
    - question: Suppose you and four of your friends are trying to load the same webpage. 
      parts:
        - You decide to open multiple parallel non-persistent HTTP connections. Will this help you load the webpage more quickly than your friends? Why or why not?
        - If all of your friends do the same thing and open the same number of parallel non-persistent HTTP connections as you, will your parallel connections still be beneficial? Why or why not?

    - question: What is the difference between non-persistent HTTP connections and persistent HTTP connections? Which one is better and why?

    - question: Suppose within your Web browser you click on a link to obtain a Web page. The IP address for the associated URL is not cached in your local host, so a DNS lookup is necessary to obtain the IP address. Suppose that four DNS servers are visited before your host receives the IP address from DNS. The first DNS server visited is the local DNS cache, with an RTT delay of RTT<sub>0</sub> = 5 ms. The second, third and fourth DNS servers contacted have RTTs of 35, 30, and 1 ms, respectively. Initially, let's suppose that the Web page associated with the link contains exactly one object, consisting of a small amount of HTML text. Suppose the RTT between the local host and the Web server containing the object is RTT<sub>HTTP</sub> = 6 ms.
      image: /426/assets/dns_http_rtt.png
      parts:
        - Assuming zero transmission time for the HTML object, how much time (in ms) elapses from when the client clicks on the link until the client receives the object?
        - Now suppose the HTML object references 2 very small objects on the same server. Neglecting transmission times, how much time (in ms) elapses from when the client clicks on the link until the base object and all 2 additional objects are received from web server at the client, assuming non-persistent HTTP and no parallel TCP connections?
        - Suppose the HTML object references 2 very small objects on the same server, but assume that the client is configured to support a maximum of 5 parallel TCP connections, with non-persistent HTTP.
        - Suppose the HTML object references 2 very small objects on the same server, but assume that the client is configured to support persistent HTTP.
        - "What's the fastest method we've explored: Nonpersistent-serial, Nonpersistent-parallel, or Persistent?"
  
    - question: How does SMTP mark the end of a message body? How about HTTP? Can HTTP use the same method as SMTP to mark the end of a message body? Explain.
    
    - question: Suppose you can access the caches in the local DNS servers of your department. Can you propose a way to roughly determine the Web servers (outside your department) that are most popular among the users in your department? Explain.

    - question: Suppose that your department has a local DNS server for all computers in the department. You are an ordinary user (i.e., not a network administrator). Can you determine if an external website was likely accessed recently from a computer in your department? Explain.
    
    - question: Suppose you join a BitTorrent torrent, but you do not want to upload any data to any other peers (free-riding). Can you receive a complete copy of a file that is shared by the swarm. Why or why not?
wireshark_labs:
    - <a target="_blank" href="http://www-net.cs.umass.edu/wireshark-labs/Wireshark_HTTP_v8.0.pdf">HTTP</a>
---

