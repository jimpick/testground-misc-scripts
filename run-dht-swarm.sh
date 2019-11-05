#! /bin/bash

REPLICAS=$1

RUN=$2

if [ -z "$REPLICAS" ]; then
	echo Need replicas
	exit 1
fi

if [ -z "$RUN" ]; then
	echo Need run
	exit 1
fi

REGION=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone | sed 's/[a-z]$//')
$(aws ecr get-login --no-include-email --region $REGION)

docker service create \
  --replicas $REPLICAS \
	--name dht \
	--network tgoverlay \
	--with-registry-auth \
	--restart-condition none \
	-e TEST_INSTANCE_ROLE= \
	-e TEST_INSTANCE_PARAMS="timeout_secs=300" \
	-e TEST_RUN=run_$REPLICAS_$RUN \
	-e TEST_REPO= \
	-e TEST_INSTANCE_COUNT=$REPLICAS \
	-e TEST_TAG= \
	-e TEST_PLAN=dht \
	-e TEST_BRANCH= \
	-e TEST_CASE_SEQ=0 \
	-e TEST_CASE=findpeers \
	-e REDIS_HOST=172.31.14.166 \
  909427826938.dkr.ecr.us-west-2.amazonaws.com/testground/testground-dht:jim1
