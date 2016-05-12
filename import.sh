#!/bin/sh

# Expects elasticdump in the PATH

for dir in `ls | grep gracc`; do
    elasticdump --input $dir/analyzer.json --output http://localhost:9200/$dir --type=analyzer
    elasticdump --input $dir/mapping.json --output http://localhost:9200/$dir --type=mapping
    elasticdump --input $dir/data.json --output http://localhost:9200/$dir --type=data
done



