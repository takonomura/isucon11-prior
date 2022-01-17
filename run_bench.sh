#!/bin/bash
set -e

(cd benchmarker && bin/benchmarker -target "127.0.0.1:80" -exit-status)

(cd webapp && docker-compose exec -T nginx cat /var/log/nginx/access2.log) | ./alp json --reverse --output=count,2xx,3xx,4xx,5xx,method,uri,min,p99,max --matching-groups="/api/schedules/[0-9A-Z]{26}"
