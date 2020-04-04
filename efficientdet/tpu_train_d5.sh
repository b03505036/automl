#!/bin/bash 

MODEL=efficientdet-d5

python3 main.py --tpu=${TPU_NAME} \
    		--model_name=$MODEL \
       		--training_file_pattern=${DATA_DIR}/image_train* \
		--model_dir=${MODEL_DIR}${MODEL} \
		--mode='train'\
		--use_tpu="TRUE" \
    		--hparams="num_classes=4" \
		--num_epochs=250 \
		--train_batch_size=8
	       	
