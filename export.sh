#!/bin/sh -x

date=$1

mkdir gracc.osg.raw0-$date

tmp_file=`mktemp -u`
elasticdump --input http://127.0.0.1:9200/gracc.osg.raw0-$date --output $tmp_file --type=data &
data_pid=$!
# Kill the data dump after 2 seconds, then take only the head
sleep 5
kill $data_pid
wait $data_pid
head -1000 $tmp_file > ./gracc.osg.raw0-$date/data.json
rm -rf $tmp_file


elasticdump --input http://127.0.0.1:9200/gracc.osg.raw0-$date --output ./gracc.osg.raw0-$date/mapping.json --type=mapping
elasticdump --input http://127.0.0.1:9200/gracc.osg.raw0-$date --output ./gracc.osg.raw0-$date/analyzer.json --type=analyzer

tar czf ./gracc.osg.raw0-$date.tar.gz ./gracc.osg.raw0-$date/


rm -rf ./gracc.osg.raw0-$date


