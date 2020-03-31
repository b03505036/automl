#!/bin/bash 

MODEL=efficientdet-d0


CUDA_VISIBLE_DEVICES="0" python main.py --training_file_pattern=tfrecord/image_train* \
    --val_json_file=tfrecord/image_val* \
    --model_name=$MODEL \
    --model_dir=pretrain/$MODEL \
    --ckpt=pretrain/ckp/$MODEL \
    --train_batch_size 16 \
    --hparams="use_bfloat16=false,num_classes=4,learning_rate=0.0025,var_exclude_expr=r'.*/class-predict/.*'" \
    --use_tpu=False
