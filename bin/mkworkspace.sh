#!/bin/bash

WORKSPACE_DIR=${HOME}/Documents/43f

year=`date +%G`
weeknumber=`date +%V`
monthnumber=`date +%m`
monthname=`date +%b`
dayofmonth=`date +%d`
BEGIN=0

getMonday() {

    today=`date +%u`
    offset=`expr $today - 1`
    BEGIN=`date -d"$offset days ago" +%d`
}



WORKSPACE_WEEK_DIR=${WORKSPACE_DIR}/${year}/"${monthnumber}-${monthname}/${weeknumber}"

getMonday

END=`expr $BEGIN + 4`

for i in $(seq $BEGIN $END)
do
    dayname=`date -d"$year-$monthnumber-$i" +%a`
    day="${i}_${dayname}"
    day_dir=${WORKSPACE_WEEK_DIR}/${day}
    echo $day_dir
    mkdir -p ${day_dir}
done
