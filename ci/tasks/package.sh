#!/bin/bash

set -e +x

pushd account-registration
  echo "Packaging WAR"
  ./mvnw clean package -DskipTests
popd

war_count=`find account-registration/target -type f -name *.war | wc -l`

if [ $war_count -gt 1 ]; then
  echo "More than one war found, don't know which one to deploy. Exiting"
  exit 1
fi

find account-registration/target -type f -name *.war -exec cp "{}" package-output/account-registration.war \;

echo "Done packaging"
exit 0
