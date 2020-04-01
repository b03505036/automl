#!/bin/bash 

MODEL="efficientdet-d0"
Model_dir="gs://kennygs/models/"${MODEL}
ckp="gs://kennygs/models/pretrain_efficientdet-d0/"

python3 main.py --mode="eval"  \
    --model_name=$MODEL  --model_dir=$ckp  \
    --validation_file_pattern="gs://kennygs/coco/image_val*"  \
    --val_json_file="/home/kenny70037/automl/efficientdet/dataset/coco/annotations/image_val.json"  \
    --hparams="use_bfloat16=false,num_classes=4" 
