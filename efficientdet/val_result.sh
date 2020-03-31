#!/bin/bash 

MODEL=efficientdet-d0
Model_dir=pretrain/efficientdet-d0

CUDA_VISIBLE_DEVICES="0" python main.py --mode=eval  \
    --model_name=$MODEL  --model_dir=$Model_dir  \
    --validation_file_pattern=tfrecord/image_val*  \
    --val_json_file='dataset/coco/annotations/image_val.json'  \
    --hparams="use_bfloat16=false,num_classes=4" --use_tpu=False 