#!/bin/bash

cd `dirname $0`
git pull > /dev/null
./run.sh
