#!/bin/sh

geth init  --datadir /db /config/genesis.json


exec geth \
  --datadir /db \
  --networkid 7077  \
  --nodiscover \
  --syncmode=full \
  --verbosity ${EL_LOG_LEVL:-3} \
  --authrpc.jwtsecret /config/jwtsecret \
  --http \
  --http.addr=0.0.0.0 \
  --http.vhosts=* \
  --authrpc.vhosts="*" \
  --authrpc.addr=0.0.0.0 \
  --port=${EL_P2P_PORT:-30303} 
