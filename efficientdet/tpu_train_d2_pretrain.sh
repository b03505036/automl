#!/bin/bash 

MODEL=efficientdet-d2

python3 main.py --tpu=${TPU_NAME} \
    		--model_name=$MODEL \
       		--training_file_pattern=${DATA_DIR}/image_train* \
		--model_dir="${MODEL_DIR}pretrain_${MODEL}" \
		--mode='train'\
		--use_tpu="TRUE" \
    		--hparams="num_classes=4,var_exclude_expr=r'.*/class-predict/.*',learning_rate=0.008" \
		--ckpt=${PRETRAIN_MODEL_DIR}$MODEL/ \
		--num_epochs=250 \
		--train_batch_size=64
	       	
