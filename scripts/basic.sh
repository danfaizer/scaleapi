#!/bin/bash

# sysstat & curl packages required
# This script may need changes depending on the OS
hostuuid="udokyybytzadqsomdxtvqwykadhniblnvqye"
hostapikey="inwwgmjgmndtjjgh"
hostapisecret="udokyybytzadqsomdxtvqwykadhnibln"

load=$( cat /proc/loadavg | awk '{print $1}' )
#cpu=$( mpstat | grep all | awk '{ print 100 - $NF }' )
cpu=$( ps aux | awk {'sum+=$3;print sum'} | tail -n 1 )
mem_used=$( free | grep Mem | awk '{ print $3}' )
mem_free=$( free | grep Mem | awk '{ print $4}' )

curl -X POST http://localhost:9292/api/tic/? -H "Content-Type:application/json" -d '[{"metrics":{"cpu":'$cpu',"mem_used":'$mem_used',"mem_free":'$mem_free',"load":'$load'},"auth":{"apikey":"'$hostapikey'","apisecret":"'$hostapisecret'","uuid":"'$hostuuid'"}}]'
