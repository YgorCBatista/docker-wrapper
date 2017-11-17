#!/bin/bash

# Save PATH
OLD_PATH=$PATH

# Mock docker
PATH=$ROOT_FOLDER/$TEST_FOLDER/fixtures/bin:$PATH

echo "+ Validating arguments"

# Tests

php | grep "\-\-rm"  >/dev/null
echo "- [$?] container will be removed (--rm)"

php | grep -P " php\s*$" >/dev/null
echo "- [$?] command is 'php'"

php -v | grep "php \-v$" >/dev/null
echo "- [$?] option argument is correct"

php index.php | grep "php index.php$" >/dev/null
echo "- [$?] file (non-option) argument is correct"

php -n index.php arg1 arg2 | grep "php -n index.php arg1 arg2" >/dev/null
echo "- [$?] option, file and arguments combined"

# Reset PATH
PATH=$OLD_PATH