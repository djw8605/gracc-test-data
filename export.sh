#!/bin/sh -x

date=$1

mkdir gracc.osg.raw-$date

tmp_file=`mktemp -u`
elasticdump --input http://127.0.0.1:9200/gracc.osg.raw-$date --output $tmp_file --type=data &
data_pid=$!
# Kill the data dump after 2 seconds, then take only the head
sleep 2
kill $data_pid
wait $data_pid
head -100 $tmp_file > ./gracc.osg.raw-$date/data.json
rm -rf $tmp_file

elasticdump --input http://127.0.0.1:9200/gracc.osg.raw-$date --output ./gracc.osg.raw-$date/mapping.json --type=mapping
elasticdump --input http://127.0.0.1:9200/gracc.osg.raw-$date --output ./gracc.osg.raw-$date/analyzer.json --type=analyzer

