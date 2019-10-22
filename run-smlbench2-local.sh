#! /bin/bash

set -e

#./testground -vv run --builder docker:go --runner local:docker --run-cfg keep_containers=true --instances=1 smlbench/simple-add

#./testground -vv run --builder exec:go --runner local:exec --instances=2 smlbench2/simple-add-get

go build

TEST_CASE=simple-add-get TEST_CASE_SEQ=0 TEST_INSTANCE_COUNT=2 go run main.go
