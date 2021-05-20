FROM pytorch/pytorch:1.8.1-cuda11.1-cudnn8-runtime

RUN apt-get update && apt-get install -y curl fuse && \
    mkdir /gcsfuse && \
    curl -L -O https://github.com/GoogleCloudPlatform/gcsfuse/releases/download/v0.35.0/gcsfuse_0.35.0_amd64.deb && \
    dpkg --install gcsfuse_0.35.0_amd64.deb && \
    apt-get update && \
    apt-get clean -y all
   

COPY . /stylegan2

RUN cd /stylegan2 && \
    pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir stylegan2_pytorch