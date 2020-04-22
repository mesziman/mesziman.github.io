#!/bin/bash

findwhat=$(readelf -d $1 | grep "\(NEEDED\)" | sed -r "s/.*\[(.*)\]/\1/")
for line in $findwhat
do
    if [[ -z $(find out/target/product/cepheus/ -name $line) ]]
    then
        echo "$1 is missing file: $line";
    fi
done
