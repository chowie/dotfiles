#!/bin/bash


for i in $@;
do
    newfile="${i}.tmp"
    bakfile="${i}.bak"
    iconv -f utf-16 -t utf-8 $i > $newfile 
    mv $i $bakfile 
    mv $newfile $i
done



