# Benchmarks

A collection of plaintext benchmarks for popular web frameworks.

## Usage

These benchmarks are powered by Docker, first make sure Docker is installed and running.

Next, you will need to build images for each of the tests. You can do this using the `Makefile`.

```sh
make all
```

Once all of the images are built, you can run the benchmark script.

```sh
./benchmark.sh
```

## Result

mimalloc is fast!

```shell
📊  Vapor 4 (Swift)
Booting...
📝  Testing GET /ping
🚀  Benchmarking
Running 5s test @ http://localhost:9000/ping
  4 threads and 128 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     5.46ms    4.47ms  63.67ms   91.28%
    Req/Sec     6.53k     0.93k    8.73k    79.00%
  130063 requests in 5.00s, 17.86MB read
Requests/sec:  26003.40
Transfer/sec:      3.57MB
53c1b01b39344b07d20db9a937e4a684e250a9c7f0bdd63e15e4ccc2ce63ba05

📊  Vapor 4 Musl (Swift)
Booting...
📝  Testing GET /ping
🚀  Benchmarking
Running 5s test @ http://localhost:9000/ping
  4 threads and 128 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     8.10ms    6.84ms  91.83ms   92.06%
    Req/Sec     4.40k   648.56     5.81k    84.50%
  87462 requests in 5.00s, 12.01MB read
Requests/sec:  17480.75
Transfer/sec:      2.40MB
1a75b34cf24bae6233b88ad4dba57072a8a74cccf2d666e29c338f433058d8d9

📊  Vapor 4 Musl + mimalloc(Swift)
Booting...
📝  Testing GET /ping
🚀  Benchmarking
Running 5s test @ http://localhost:9000/ping
  4 threads and 128 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     4.95ms    3.86ms  51.20ms   91.02%
    Req/Sec     7.09k     1.05k    9.03k    71.00%
  141193 requests in 5.00s, 19.39MB read
Requests/sec:  28216.29
Transfer/sec:      3.87MB
bfe7102b6ca7a9f85936f5d1802a89ebef05f6963472aa1736693f83323dbdd2

✅  Done
```
