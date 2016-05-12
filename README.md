GRACC Test Data
===============

This test data was extracted from gracc.opensciencegrid.org Elasticsearch on 05/12/16.  It was extracted by the tool elasticdump, a node.js tool.

    elasticdump@2.1.2

The command to extract was:

    elasticdump --input http://127.0.0.1:9200/gracc-osg-2016.05.10 --output ./test_data/gracc-osg-2016.05.10/data.json --type=data
    elasticdump --input http://127.0.0.1:9200/gracc-osg-2016.05.10 --output ./test_data/gracc-osg-2016.05.10/mapping.json --type=mapping 
    elasticdump --input http://127.0.0.1:9200/gracc-osg-2016.05.10 --output ./test_data/gracc-osg-2016.05.10/analyzer.json --type=analyzer

Only the top (using `head`) lines were kept of the data.json in order to minimize the data size.

