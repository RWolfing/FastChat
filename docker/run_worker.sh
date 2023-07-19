#!/bin/bash

# Fastchat config
CONTROLLER_ADDRESS="http://172.18.5.121:21001"
MODEL_NAME="fastchat-t4-3b-v1.0"
MODEL_PATH="lmsys/fastchat-t5-3b-v1.0"

# Docker config
IMAGE_NAME="vicuna-worker"
PORT_MAPPING="8000:8000"
VOLUME_MAPPING="docker_worker:/root/.cache/huggingface"

# Run Docker container
docker run \
   -v $VOLUME_MAPPING \
   -p $PORT_MAPPING \
   -e CONTROLLER_ADDRESS=$CONTROLLER_ADDRESS \
   -e MODEL_NAME=$MODEL_NAME \
   -e MODEL_PATH=$MODEL_PATH \
   --gpus all \
   $IMAGE_NAME 

