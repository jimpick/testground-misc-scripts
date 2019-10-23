#! /bin/bash

RUN=$1

if [ -z "$RUN" ]; then
	echo Need run
	exit 1
fi

docker run \
	-e TEST_INSTANCE_ROLE= \
	-e TEST_INSTANCE_PARAMS= \
	-e TEST_RUN=$RUN \
	-e TEST_REPO= \
	-e TEST_INSTANCE_COUNT=2 \
	-e TEST_TAG= \
	-e TEST_CASE_SEQ=0 \
	-e TEST_PLAN=smlbench2 \
	-e TEST_BRANCH= \
	-e TEST_CASE=simple-add-get \
	-e REDIS_HOST=172.31.8.78 \
	--network tg-a \
	909427826938.dkr.ecr.us-west-2.amazonaws.com/testground:e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855