#!/bin/bash 

MODEL=efficientdet-d5

# train
CUDA_VISIBLE_DEVICES="5" python main.py --training_file_pattern=tfrecord/image_train* \
    --validation_file_pattern=tfrecord/image_val* \
    --mode='train_and_eval' \
    --model_name=$MODEL \
    --model_dir=$MODEL \
    --val_json_file='dataset/coco/annotations/image_val.json' \
    --hparams="use_bfloat16=false,num_classes=5" --use_tpu=False \
    --train_batch_size 1
