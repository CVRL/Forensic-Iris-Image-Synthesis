#!/bin/bash
#$ -q gpu                          # Run on the GPU cluster
#$ -l gpu_card=1                   # Run on 1 GPU card                 

module load cuda/11.6
nvcc --version

export PATH=/usr/local/cuda-11.6/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-11.6/lib64:$LD_LIBRARY_PATH

# Load conda module
module load conda
# Activate your conda custom environment
source activate stylegan3

# Input network
network_pkl="your_directory/network-snapshot-025000.pkl"

# Projector output directory
output_dir="your_output_directory_path"
# Source code directory
source_code="your_directory/stylegan2-ada-pytorch-code/"

# Load GCC compiler
module load gcc/

export CC=/opt/crc/g/gcc/8.3.0/bin/gcc
export CXX=/opt/crc/g/gcc/8.3.0/bin/g++

# Define seed range and class lists
seed_ranges=("0-2489" "0-1541" "0-1093" "0-483" "0-493" "0-221" "0-327" "0-173" "0-237" "0-115" "0-124" "0-92" "0-44" "0-54" "0-63" "0-47" "0-53" "0-326")
classes=("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15" "16" "17")

# Iterate through seed ranges and classes
for i in "${!seed_ranges[@]}"
do
    seed_range="${seed_ranges[i]}"
    class="${classes[i]}"
    
    # Convert class to a two-digit string representation (e.g., 0 -> 00, 1 -> 01)
    class_formatted=$(printf "%03d" "$class")
    
    # Create a unique output directory for each combination
    output_subdir="${output_dir}/class_${class_formatted}"
    
    # Run generate.py to generate images for this seed range and class
    python3 "${source_code}generate.py" --outdir=$output_subdir --seeds=$seed_range --class=$class --network=$network_pkl
done

