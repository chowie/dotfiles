#!/bin/bash


for i in $@;
do
    bakfile="${i}.bak"
    cp $i $bakfile 
done



