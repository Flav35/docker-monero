#!/bin/bash

set -ex

if ["$PASS" -eq ""];then echo "PASS is empty"; exit 1; fi

exec dumb-init /minerd -a cryptonight -o "$POOL" -u "$WALLET_ADDRESS" -t "$NTHREAD" -p "$(hostname):$PASS"
