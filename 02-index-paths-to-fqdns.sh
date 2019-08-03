#!/bin/sh
(for f in commoncrawl.s3.amazonaws.com/crawl-data/CC-MAIN-201*-*/* ; do zcat $f ; done) | awk '/gz$/ {print "https://commoncrawl.s3.amazonaws.com/" $1}' | parallel --linebuffer --load 300% 'wget -nv -O- {} | ./02-1-index-to-fqdns.sh' | sort -u
