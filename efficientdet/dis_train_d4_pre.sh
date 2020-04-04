#!/bin/bash 

MODEL=efficientdet-d4

# lr = 0.01 * batchsize * num_gpu /16
# finetune/5
# =0.0005

CUDA_VISIBLE_DEVICES="4" python main.py --training_file_pattern=tfrecord/image_train* \
    --val_json_file=tfrecord/image_val* \
    --mode='train_and_eval' \
    --model_name=$MODEL \
    --model_dir=pretrain/$MODEL \
    --ckpt=pretrain/ckp/$MODEL \
    --train_batch_size 4 \
    --hparams="use_bfloat16=false,num_classes=4,learning_rate=0.0005,var_exclude_expr=r'.*/class-predict/.*'" \
    --use_tpu=False
