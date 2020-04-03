#!/bin/bash 

MODEL="efficientdet-d4"
Model_dir="gs://kennygs2/models/"${MODEL}
ckp="gs://kennygs2/models/pretrain_efficientdet-d4/"

python3 main.py --mode="eval"  \
    --model_name=$MODEL  --model_dir=$ckp  \
    --tpu=${TPU_NAME} \
    --use_tpu="TRUE" \
    --validation_file_pattern="gs://kennygs2/coco/image_val*"  \
    --val_json_file="/home/kenny70038/automl/efficientdet/dataset/coco/annotations/image_val.json"  \
    --hparams="num_classes=4" 
