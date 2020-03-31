#!/bin/bash 

MODEL=efficientdet-d1

# train
CUDA_VISIBLE_DEVICES="1" python main.py --training_file_pattern=tfrecord/image_train* \
    --validation_file_pattern=tfrecord/image_val* \
    --mode='train_and_eval' \
    --model_name=$MODEL \
    --model_dir=$MODEL \
    --val_json_file='dataset/coco/annotations/image_val.json' \
    --hparams="use_bfloat16=false,num_classes=4,learning_rate=0.005" --use_tpu=False \
    --train_batch_size 8
