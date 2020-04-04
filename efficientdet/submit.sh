#!/bin/bash 

Model=efficientdet-d5
python3 datatool/submit.py --test_json=result/${Model}/test-dev-out/detections_test-dev2017_test_results.json --submit_file=${Model}_result.csv 
