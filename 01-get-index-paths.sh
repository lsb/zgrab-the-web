#!/bin/sh
wget -e robots=off -nc -l 1 -H --accept-regex '.*20[12][0-9].*[.]paths[.]gz$' -r https://index.commoncrawl.org
