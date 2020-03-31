#!/bin/bash 

TRAIN_IMAGE_DIR="~/automl/efficientdet/data/coco/image_train"
VAL_IMAGE_DIR="~/automl/efficientdet/data/coco/image_val"
TEST_IMAGE_DIR="~/automl/efficientdet/data/coco/image_test"
TRAIN_ANNOTATIONS_FILE="~/automl/efficentdet/data/coco/annotations/image_train.json"
VAL_ANNOTATIONS_FILE="~/automl/efficientdet/data/coco/annotations/image_val.json"
TESTDEV_ANNOTATIONS_FILE="~/automl/effficientdet/data/coco/annotations/image_test.json"
OUTPUT_DIR="./"

IMAGE_DIR="~/automl/efficientdet/data/coco/image_train"
TRAIN_ANNOTATIONS_FILE="~/automl/efficientdet/data/coco/annotations/image_train.json"
OUTPUT_DIR="./tf_data"

# python create_coco_tfrecord.py \
#   --train_image_dir="${TRAIN_IMAGE_DIR}" \
#   --val_image_dir="${VAL_IMAGE_DIR}" \
#   --test_image_dir="${TEST_IMAGE_DIR}" \
#   --train_annotations_file="${TRAIN_ANNOTATIONS_FILE}" \
#   --val_annotations_file="${VAL_ANNOTATIONS_FILE}" \
#   --testdev_annotations_file="${TESTDEV_ANNOTATIONS_FILE}" \
#   --output_dir="${OUTPUT_DIR}"

python dataset/create_coco_tfrecord.py \
  --image_dir="${IMAGE_DIR}" \
  --object_annotations_file="${TRAIN_ANNOTATIONS_FILE}" \
  --output_file_prefix="${OUTPUT_DIR/FILE_PREFIX}" \
  --num_shards=32
