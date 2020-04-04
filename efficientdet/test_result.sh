#!/bin/bash 

MODEL="efficientdet-d5"
Model_dir="gs://kennygs2/models/"${MODEL}
ckp="gs://kennygs2/models/pretrain_efficientdet-d5/"

python3 main.py --mode=eval --model_name=$MODEL  \
	    	--model_dir=$ckp  \
	        --validation_file_pattern=./tfrecord/image_test*  \
		--eval_samples=800    --val_json_file='dataset/coco/annotations/image_test.json'  \
		--testdev_dir=./result/$MODEL/test-dev-out/  \
		--hparams="use_bfloat16=false,num_classes=4" --use_tpu=False --master='local' --logtostderr
