#!/usr/bin/env bash
set -e
set -o pipefail

init () {
  if [ -z "$wallet" ] && [ -z "$userpass" ]; then
    >&2 echo "$(help)"
    return 1
  fi

  : ${algo:='cryptonight'}
  : ${label:="$(hostname -s)"}
  : ${network:='nicehash'}
  : ${threads:=$(nproc --all)}

  : ${url:="$("${network}_${algo}_url")"}
  : ${userpass:="$("${network}_${algo}_up")"}

  cpuminer --algo "$algo" --threads "$threads" --userpass "$userpass" --url "$url" $@
}

help () {
  cat<<'EOT'
Usage: <wallet=ADDRESS> <userpass=USERPASS> cpuminer [additional options]

At a minimum, $wallet or $userpass must be provided.

Environment Variables:
  algo          Mining algorithm
  label         Miner label metadata (if supported)
  network       Pool name (minercircle, nicehash, supportxmr)
  threads       Number of miner threads
  url           Mining server URL
  userpass      user:password pair for mining server
  wallet        Wallet address

EOT
}

minercircle_cryptonight_up () {
  echo "${wallet}.${label}:x"
}

minercircle_cryptonight_url () {
  echo 'stratum+tcp://xmr.minercircle.com:80'
}

nicehash_cryptonight_up () {
  echo "${wallet}.${label}:x"
}

nicehash_cryptonight_url () {
  echo 'stratum+tcp://cryptonight.usa.nicehash.com:3355'
}

supportxmr_cryptonight_up () {
  echo "${wallet}:${label}"
}

supportxmr_cryptonight_url () {
  echo 'stratum+tcp://pool.supportxmr.com:80'
}

init "$@"