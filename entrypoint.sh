#!/bin/bash

set -e

rm -f /var/app/tmp/pids/server.pid

bundle check || bundle install -j4

if [ "$#" == 0 ]
then
    exec bundle exec rails server -p 3001 -b '0.0.0.0'
fi

exec $@
