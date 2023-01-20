---
title: "Segmentation of lung tumours by deep learning"
excerpt: "Automatic segmentation of 3D lung nodules through deep learning. First step is automatically segment the lung nodules in CT images with deep learning."
header:
  image: /assets/img_portfolio/clb/7.PNG
  teaser: /assets/img_portfolio/clb/4.PNG
sidebar:
  - title: "Role"
    image: /assets/icons/logo-clb.svg
    image_alt: "logo"
    text: "PostDoc researcher at Centre Léon Berard & INSA, Lyon, France"
  - title: "Responsibilities"
    text:
    - Modeling using python (PyTorch), UNET
    - Gathering public & personal image data
    - Datapreprocessing, cleaning & augmentation techniques
---

# Summary
Lung tumours are a major public health issue. This project is part of a global project on the characterisation of lung tumours by machine learning using radiomics techniques. For this, we need to automatically segment these tumours on CT images. To segment these lung tumours, we will use deep learning which currently gives the best results in terms of quality, robustness and computation time. In particular, we will focus on developing memory-efficient neural networks that can process large 3D images in a single pass through the network, without slicing them into thumbnails.

# The data
The data we use are public data from The Lung Image Database Consortium image collection (LIDC-IDRI) available on the internet [here](https://wiki.cancerimagingarchive.net/display/Public/LIDC-IDRI). These data were collected through a collaboration of seven academic and eight image centers. These data consist of 1018 CT cases and their XML annotations totaling 130 GB.

# Methods used for the segmentation of LIDC-IDRI tumours:
The neural network is used to segment a lung image to segment lung tumors. The goal is to minimize the loss between the annotated segmentation map and the one automatically segmented by the neural network.

{% include figure image_path="/assets/img_portfolio/clb/1.PNG" alt="this is a placeholder image" caption="Figure 1: Learning using deep learning" %}

In the state of the art, we find the UNet is a deep learning architecture with high performance for medical image segmentation.

{% include figure image_path="/assets/img_portfolio/clb/2.PNG" alt="this is a placeholder image" caption="Figure 2: The UNet architecture for medical image segmentation." %}

Therefore, this architecture (UNet) requires a lot of memory resources for large data such as 3D medical images. An alternative to solve this problem is to optimize the algorithm by allowing for memory-efficient back-propagation. An architecture called ***iUNets***:
 - Fully invertible U-Nets with Learnable Up and Downsampling have been proposed by Etmann, C., R. Ke, and C.-B. Schönlieb (2020). Iunets: Fully invertible u-nets with learnable up- and downsampling.
 - The source code is also available [here](https://github.com/cetmann/iunets).

{% include figure image_path="/assets/img_portfolio/clb/3.PNG" alt="this is a placeholder image" caption="Figure 3: The UNet architecture for medical image segmentation." %}

An alternative approach with a multi-scale loss calculation and weighting on each scale (given the state of the art
  - Krebs, J., H. Delingette, B. Mailhe, N. Ayache, and T. Mansi (2019). Learning a probabilistic model for diffeomorphic registration. IEEE Transactions on Medical Imaging 38 (9), 2165-2176.)

was developed with iUNets and tested with tumor segmentation on 3D images.

{% include figure image_path="/assets/img_portfolio/clb/4.PNG" alt="this is a placeholder image" caption="Figure 4: The iUNet architecture for medical image segmentation with multi-scale loss calculation and weighting on each scale." %}


# Segmentation results of the LIDC-IDRI tumours:
To evaluate our result, we look at the dice curves (a measure of similarity between the true segmentation map and the one found by machine learning) for the train (80% of the data) and validation (20% of the data). All three approaches are applied to the cropped images (the tumor is placed in the center of the image) of the LIDC-IDRI.

Figure 4 is an example of these results, obtained by the iUNet. We notice that at 50 epochs we start to overlearn on the training base at the same time as on the test base we go slightly down on the dice curve.


{% include figure image_path="/assets/img_portfolio/clb/5.PNG" alt="this is a placeholder image" caption="Figure 5: Average dice iUNet on LIDC-IDRI cropped images." %}



For this purpose, we tried to improve the iUNet architecture with a multi-scale loss calculation and weighting. The results obtained with these two methods by adding a multi-scale loss calculation can be seen in Figure 5. The dice curve for the validation goes down less than in the case of iUNets.

{% include figure image_path="/assets/img_portfolio/clb/6.PNG" alt="this is a placeholder image" caption="Figure 6: Average dice iUNet with multi-scale loss calculation (left) and with multi-scale loss calculation and weighting (right) on LIDC-IDRI cropped images." %}




Figure 6 shows the LIDC-IDRI cropped lung images (tumors are placed in the center of the image) (top); the annotated segmentation map (middle); and the tumor segmentation with iUNet and multi-scale loss calculation (bottom).


{% include figure image_path="/assets/img_portfolio/clb/7.PNG" alt="this is a placeholder image" caption="Figure 7: Tumour segmentation with iUNet with multi-scale loss calculation on LIDC-IDRI cropped images." %}


# Objectives and perspectives:
The results shown in figure 6 are quite good in terms of automatic segmentation. We observe that the annotated segmentation map and the one found by the neural network are different on the border. However, its images are cropped with the tumor in the center of the image and the model does not fit the whole image. The results are not good enough when learning this neural network on whole images.
The next step in this work will be to perform tumor detection using the neural network to use the results for segmentation.
