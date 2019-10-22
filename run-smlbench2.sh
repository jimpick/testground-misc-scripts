#./testground -vv run --builder docker:go --runner local:docker --run-cfg keep_containers=true --instances=1 smlbench/simple-add
./testground -vv run --builder docker:go --runner local:docker --instances=2 smlbench2/simple-add-get
