#!/bin/bash 

MODEL="efficientdet-d5"
Model_dir="gs://kennygs2/models/"${MODEL}
ckp="gs://kennygs2/models/pretrain_efficientdet-d5/"

python3 main.py --mode="eval"  \
    --model_name=$MODEL  --model_dir=$ckp  \
    --validation_file_pattern="gs://kennygs2/coco/image_val*"  \
    --val_json_file="/home/kenny70038/automl/efficientdet/dataset/coco/annotations/image_val.json"  \
    --hparams="use_bfloat16=false,num_classes=4" 
