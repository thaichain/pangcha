#!/bin/sh

exec lighthouse bn \
  --datadir /data \
  --execution-jwt /config/jwtsecret \
  --execution-endpoint http://geth:8551 \
  --debug-level ${CL_LOG_LEVEL:-info} \
  --testnet-dir /config/testnet \
  --eth1 \
  --http \
  --http-address=0.0.0.0 \
  --metrics \
  --metrics-address=0.0.0.0 \
  --http-allow-sync-stalled \
  --target-peers 1 \
  --port ${CL_P2P_PORT:-9000} \
  --disable-peer-scoring
