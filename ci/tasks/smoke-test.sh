#!/bin/bash

set -ex

if [ -z $ACCOUNT_REGISTRATION_URL ]; then
  echo "ACCOUNT_REGISTRATION_URL not set"
  exit 1
fi
apt-get update && apt-get install -y curl
pushd account-registration
  echo "Running smoke tests for Account Registration deployed at $ACCOUNT_REGISTRATION_URL"
  smoke-tests/bin/test $ACCOUNT_REGISTRATION_URL
popd

exit 0
