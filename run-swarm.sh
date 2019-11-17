./testground -vv run \
  --builder docker:go \
  --runner cluster:swarm \
  --build-cfg bypass_cache=true \
  --build-cfg go_proxy_mode=local \
  --build-cfg push_registry=true \
  --build-cfg registry_type=aws \
  --run-cfg rm_service=false \
  --run-cfg background=true \
  --instances=3 \
  dht/find-providers
