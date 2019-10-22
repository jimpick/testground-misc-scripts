#! /bin/bash

redis-cli DEL "run::plan::case:simple-add-get:nodes:seq"
redis-cli DEL "run::plan::case:simple-add-get:states:added"
redis-cli DEL "run::plan::case:simple-add-get:states:received"
redis-cli DEL "run::plan::case:simple-add-get:cid:seq"
redis-cli GET "run::plan::case:simple-add-get:nodes:seq"
