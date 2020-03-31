#!/bin/bash 

MODEL=efficientdet-d3
# base = 0.01
# train
CUDA_VISIBLE_DEVICES="3" python main.py --training_file_pattern=tfrecord/image_train* \
    --validation_file_pattern=tfrecord/image_val* \
    --mode='train_and_eval' \
    --model_name=$MODEL \
    --model_dir=$MODEL \
    --val_json_file='dataset/coco/annotations/image_val.json' \
    --hparams="use_bfloat16=false,num_classes=4,learning_rate=0.0025" --use_tpu=False \
    --train_batch_size 4
