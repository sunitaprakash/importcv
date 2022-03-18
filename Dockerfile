# base image you want to use
# make sure to use a CUDA image if running on GPUs
# FROM nvidia/cuda:XX.X-cudnnX-devel-ubuntuXX.XX
FROM python:3.9.6-slim

# these two lines are mandatory
WORKDIR /gridai/project
COPY . .

RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y

# any RUN commands you'd like to run
# use this to install dependencies
RUN pip install pytorch-lightning && \
    apt install curl -y \
    pip install -r requirements.txt && \
