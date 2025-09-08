# start from a clean base image (replace <version> with the desired release)
# FROM runpod/worker-comfyui:5.4.1-base

# Use temporary custom development image until this issue is fixed:
# https://github.com/runpod-workers/worker-comfyui/pull/166 
# Fork: https://github.com/Shellishack/worker-comfyui
FROM shellishack/worker-comfyui:dev

# Install remote media loader nodes
# This enables loading images, videos, and other media files directly from URLs;
# it also supports saving outputs to remote locations.
# More info:
# https://github.com/Shellishack/comfyui_remote_media_io
RUN comfy node install comfyui_remote_media_io

# install custom node dependencies
RUN cd /comfyui/custom_nodes/comfyui_remote_media_io && \
    pip install .[dev]
