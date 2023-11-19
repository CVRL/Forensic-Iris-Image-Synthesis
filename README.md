# Forensic Iris Image Synthesis

## Proceedings of the IEEE/CVF Winter Conference on Applications of Computer Vision (WACV) 2024

### [Paper](https://wacv2024.thecvf.com/)

<figure>
  <img src="./teaser.png" style="width:100%">
  <figcaption>Figure 1: Synthesis of PMI-conditioned same- and different-identity forensic iris images, with a desired iris image quality (controlled by matching the ISO quality metrics), and with the desired genuine/impostor score distributions (mimicking score distributions obtained for authentic forensic samples).</figcaption>  

## Contents
- **Training Dataset Preparation:**
  - Code: stylegan2-ada-pytorch-code/dataset_tool.py
  - *Note: To prepare the conditional training dataset, ensure you have a JSON file containing filenames and their corresponding labels. An example JSON file is available in training-dataset/dataset.json.*


- **Training:**
  - Code: stylegan2-ada-pytorch-code/train.py

- **Synthesis Image Generation:**
  - Code: stylegan2-ada-pytorch-code/generate.py
  - *Note: If you want to adjust the noise intensity while generating synthesis images, you can change it by modifying line number 122.*

### Citation
Please cite our paper if you use any part of our code or data.
```
@inproceedings{bhuiyan2024forensic,
  title={Forensic Iris Image Synthesis},
  author={Bhuiyan, Rasel Ahmed and Czajka, Adam},
  booktitle={Proceedings of the IEEE/CVF Winter Conference on Applications of Computer Vision (WACV)},
  year={2024},
}
