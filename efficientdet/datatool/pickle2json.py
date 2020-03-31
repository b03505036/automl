# -*- coding: utf-8 -*-

'''
Convert a pkl file into json file
'''
import sys
import os
import pickle
import json
import io
import argparse


pkl = "out/atss_r50_fpn_1x.pkl"
json_file="out/test.json"

def obj_2_sku(obj):
    return {"image_id":obj.image_id,"bbox":obj.bbox,"score":obj.score,"category_id":obj.category_id}

pkl_file = open(pkl, 'rb')
data = pickle.load(pkl_file)


with open(json_file, "w+") as f:
    json.dump(data, f, default=obj_2_sku)


pkl_file.close()
