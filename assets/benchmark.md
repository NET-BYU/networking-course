## Single Thread

  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     6.15ms    3.36ms  22.85ms   67.92%
    Req/Sec     1.06k    98.77     2.11k    91.11%
  299938 requests in 30.00s, 372.14MB read
Requests/sec:   9997.85
Transfer/sec:     12.40MB

## Threading

  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    16.51s     4.76s   24.53s    57.02%
    Req/Sec   181.80      0.40   182.00    100.00%
  54673 requests in 30.00s, 67.83MB read
Requests/sec:   1822.19
Transfer/sec:      2.26MB

## Thread Pool

  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    12.57s     3.80s   19.23s    57.88%
    Req/Sec   337.90      2.34   342.00     80.00%
  108275 requests in 30.00s, 134.34MB read
Requests/sec:   3609.16
Transfer/sec:      4.48MB

## Select

  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     1.13ms    1.09ms  11.86ms   93.91%
    Req/Sec     1.06k   106.15     1.78k    87.16%
  300000 requests in 30.00s, 372.22MB read
Requests/sec:   9999.94
Transfer/sec:     12.41MB
