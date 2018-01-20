[knksmith57/cpuminer-opt]
=========================

> dockerized [JayDDee/cpuminer-opt] with opinionated entrypoint.

## Quickstart
```bash
## mine cryptonight on nicehash by default
❯ docker run \
    -d --restart always \
    -e wallet='your-wallet-address-here' \
      knksmith57/cpuminer-opt

## mine cryptonight on supportxmr with 4 threads
❯ docker run \
    -d --restart always \
    -e algo='cryptonight' \
    -e threads=4 \
    -e userpass='your-wallet-address-here:worker' \
    -e url='stratum+tcp://pool.supportxmr.com:80' \
      knksmith57/cpuminer-opt
```

Not _exactly_ polished, but good enough to make you a few cents a day on a cheap VPS.


[JayDDee/cpuminer-opt]:     https://github.com/JayDDee/cpuminer-opt
[knksmith57/cpuminer-opt]:  https://hub.docker.com/r/knksmith57/cpuminer-opt
