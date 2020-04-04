#!/bin/bash 

# TRAIN_IMAGE_DIR="~/automl/efficientdet/data/coco/image_train"
# VAL_IMAGE_DIR="~/automl/efficientdet/data/coco/image_val"
# TEST_IMAGE_DIR="~/automl/efficientdet/data/coco/image_test"
# TRAIN_ANNOTATIONS_FILE="~/automl/efficentdet/data/coco/annotations/image_train.json"
# VAL_ANNOTATIONS_FILE="~/automl/efficientdet/data/coco/annotations/image_val.json"
# TESTDEV_ANNOTATIONS_FILE="~/automl/effficientdet/data/coco/annotations/image_test.json"
# OUTPUT_DIR="./"

# IMAGE_DIR="~/automl/efficientdet/data/coco/image_train"
# TRAIN_IMAGE_INFO_FILE="~/automl/efficientdet/data/coco/annotations/image_train.json"
# TRAIN_ANNOTATIONS_FILE='~/automl/efficientdet/data/coco/annotations/image_train.json'
# OUTPUT_DIR="./tf_data"

# python create_coco_tfrecord.py \
#   --train_image_dir="${TRAIN_IMAGE_DIR}" \
#   --val_image_dir="${VAL_IMAGE_DIR}" \
#   --test_image_dir="${TEST_IMAGE_DIR}" \
#   --train_annotations_file="${TRAIN_ANNOTATIONS_FILE}" \
#   --val_annotations_file="${VAL_ANNOTATIONS_FILE}" \
#   --testdev_annotations_file="${TESTDEV_ANNOTATIONS_FILE}" \
#   --output_dir="${OUTPUT_DIR}"

# train
python3 dataset/create_coco_tfrecord.py \
     --image_dir=dataset/coco/image_train \
     --object_annotations_file=dataset/coco/annotations/image_train.json \
     --output_file_prefix=tfrecord/image_train \
     --num_shards=32

# val
python3 dataset/create_coco_tfrecord.py \
    --image_dir=dataset/coco/image_val \
    --object_annotations_file=dataset/coco/annotations/image_val.json \
    --output_file_prefix=tfrecord/image_val \
    --num_shards=32

# test
python3 dataset/create_coco_tfrecord.py \
    --image_dir=dataset/coco/image_test \
    --object_annotations_file=dataset/coco/annotations/image_test.json \
    --output_file_prefix=tfrecord/image_test \
    --num_shards=32
