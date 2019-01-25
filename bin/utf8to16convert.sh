#!/bin/bash

for i in $@;
do
    newfile="${i}.tmp"
    bakfile="${i}.bak"
    iconv -f utf-8 -t utf-16 $i > $newfile 
    mv $i $bakfile 
    mv $newfile $i
done



