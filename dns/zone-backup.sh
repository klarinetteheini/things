#!/bin/sh

zones="wit.ch jcw.ch l-c-w.ch a-c-w.ch"
nameserver_ip=$(dig a ch.ch-inter.net +short)

now=$(date '+%Y%m%d-%H%M')

for zone in $zones; do
	dig @$nameserver_ip axfr $zone > axfr-$zone-$now
done

find . -name 'axfr-*' -mtime +2d -exec rm \{\} \;