#! /bin/bash

RUN=$1

if [ -z "$RUN" ]; then
	echo Need run
	exit 1
fi

REGION=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone | sed 's/[a-z]$//')
$(aws ecr get-login --no-include-email --region $REGION)

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
	-e REDIS_HOST=172.31.7.35 \
	--network testground \
	909427826938.dkr.ecr.us-west-2.amazonaws.com/testground:e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
