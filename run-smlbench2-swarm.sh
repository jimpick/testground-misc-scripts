#./testground -vv run --builder docker:go --runner local:docker --run-cfg keep_containers=true --instances=1 smlbench/simple-add

docker images | grep testground-smlbench2 | awk '{print $3}' | xargs docker rmi

./testground -vv run --builder docker:go --runner cluster:swarm --instances=2 smlbench2/simple-add-get
