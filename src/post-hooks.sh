#!/bin/bash

echo "Running post hooks"

for filename in /usr/home/dashboard/*.json; do
  curl -XPOST localhost:5601/api/kibana/dashboards/import \
       -H 'kbn-xsrf:true' -H 'Content-type:application/json' \
       -d @$filename
done
