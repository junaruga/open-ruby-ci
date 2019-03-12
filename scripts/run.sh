#!/bin/bash

set -ev

pushd ruby_src
rm -rf ruby
git clone -q --depth 1 https://github.com/ruby/ruby.git
pushd ruby

autoconf
./configure --prefix "$(pwd)/dist"
make -s
make -s check TESTS="" TESTOPTS="${TESTOPTS=-q --tty=no}" MSPECOPT="-fs"

popd
popd
