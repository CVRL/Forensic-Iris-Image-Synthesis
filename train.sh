#!/bin/bash
#$ -q gpu                          # Run on the GPU cluster
#$ -l gpu_card=4                   # Run on 4 GPU card


module load cuda/11.6
nvcc --version

export PATH=/usr/local/cuda-11.6/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-11.6/lib64:$LD_LIBRARY_PATH

# Load conda module
module load conda
# Activate your conda custom environment
source activate stylegan3

# Input image size
imsize=256

# Raw data input directory
input_dir="your_dataset_path/"

# Processed data output directory
processed_dir="your_directory/dataset.zip"

# Training output directory
trained_dir="your_output_directory_path"

# Source code directory
source_code="your_directory/stylegan2-ada-pytorch-code/"

# Load GCC compiler
module load gcc/

export CC=/opt/crc/g/gcc/8.3.0/bin/gcc
export CXX=/opt/crc/g/gcc/8.3.0/bin/g++

# Preprocess your custom dataset by running dataset_tool.py 
python3 ''$source_code'dataset_tool.py' --source=$input_dir --dest=$processed_dir --width=$imsize --height=$imsize 

# Train your custom dataset by running train.py
python3 ''$source_code'train.py' --data=$processed_dir --outdir=$trained_dir --cond=1 --gpus=4


