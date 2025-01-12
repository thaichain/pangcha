#!/bin/sh

boot_nodes=$(curl -s https://config.dencun-devnet-8.ethpandaops.io/api/v1/nodes/inventory | jq '[ .ethereum_pairs[] | .consensus.enr ] | join(",")' | tr -d '"')

if [ -n "${CHECKPOINT_SYNC_URL}" ]; then
  checkpoint_sync="--checkpoint-sync-url=${CHECKPOINT_SYNC_URL}"
else
  checkpoint_sync=""
fi

exec lighthouse bn \
  --datadir /data \
  --execution-jwt /config/jwtsecret \
  --execution-endpoint http://geth:8551 \
  --self-limiter=blob_sidecars_by_range:256/10 \
  --debug-level ${CL_LOG_LEVEL:-info} \
  --testnet-dir /config/testnet \
  --enable-private-discovery  \
  --eth1 --http  --http-address 0.0.0.0 --http-port 8000  --target-peers 5 --http-allow-sync-stalled 
