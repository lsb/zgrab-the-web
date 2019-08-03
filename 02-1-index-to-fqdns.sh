#!/bin/sh
gzip -d | awk '{$1 = ""; $2 = ""; print}' | jq -r .url | cut -d / -f 3 | cut -d '?' -f 1 | grep -v ':' | cut -d '#' -f 1 | grep -v -E '^[0-9.]+$' | sed -E -e 's/[.]$//' | uniq
