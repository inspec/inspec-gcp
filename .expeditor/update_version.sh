#!/bin/bash
#
# After a PR merge, Chef Expeditor will bump the PATCH version in the VERSION file.
# It then executes this file to update any other files/components with that new version.
#

set -ev

sed -i -r "s/^version\: .*/version\: $(cat VERSION)/" inspec.yml
