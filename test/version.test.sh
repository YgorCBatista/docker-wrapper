#!/bin/bash

# Save PATH
OLD_PATH=$PATH

# Mock docker
PATH=$ROOT_FOLDER/$TEST_FOLDER/fixtures/bin:$PATH

echo "+ Validating versions"

php | grep "php:default" >/dev/null
echo "- [$?] default image tag is 'php:default'"

PHP_VERSION=7.0 php | grep "php:7.0" >/dev/null
echo "- [$?] version (tag) by environment"

pushd fixtures/app >/dev/null

php | grep "php:5.5" >/dev/null
echo "- [$?] version by project file (.version)'"

PHP_VERSION=5.6 php | grep "php:5.6" >/dev/null
echo "- [$?] env overrides file"

popd >/dev/null

# Reset PATH
PATH=$OLD_PATH