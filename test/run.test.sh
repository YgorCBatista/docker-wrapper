#!/bin/bash

# Save PATH
OLD_PATH=$PATH

# Don't mock docker
PATH=$PATH:$ROOT_FOLDER/$TEST_FOLDER/fixtures/bin

# Setup
docker tag php:latest php:default

echo "+ Running on Docker"

# Tests

php -v | grep -P "PHP \d\.\d\.\d" >/dev/null
echo "- [$?] container reveive single option (-v)"

php -r "echo 'oh yeah!';" | grep "oh yeah!" >/dev/null
echo "- [$?] container receive more complex options (-r)"

# Teardown
docker rmi php:default >/dev/null

# Reset PATH
PATH=$OLD_PATH