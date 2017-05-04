# Fully Convolutional Networks for Image Segmentation

This one is for nature lovers :). In this lab you will finetune a fully convolutional network to segment horses on the “weizmann horse image database” provided by [Eran Borenstein](http://www.msri.org/people/members/eranb/), 

## Resources
This Laboratory is based on the [tutorial](https://github.com/NVIDIA/DIGITS/tree/master/examples/semantic-segmentation) provided by Nvidia. It is strongly recommended to read the tutorial and get a nice grasp on the main ideas. Our task is just a tuned down version of the fine tuning exercise presented there. 

### Database

The data for this lab can be obtained from [Eran’s website](http://www.msri.org/people/members/eranb/), it contains 2 main directories
- Rgb: rgb 328 images of horses
- Figure_ground: Hand labeled segmentation of the image, with two labels: Horse (white), background (black)

### Deep Learning  Engine
The baseline code works over the [caffe deep learning library](https://github.com/BVLC/caffe), specifically its python bindings.  If you need a quick introduction for python you might want to check the resources available on [Laboratory 13](https://github.com/fuankarion/Vision17/tree/master/Lab13-OpticalFLow). If you have an Nvidia GPU available it should have at least 2GB Memory, otherwise you will not be able to complete this Lab.

### Python Library
For the sake of simplicity your Lab instructor has coded a minimal Python library to work with Fully Convolutional networks over Caffe’s default python wrapper. The library is available at…

There are two files you might want to take a look:
- createLMDBFNC: Two utility functions to create LMDB files for both labels and image data.
- trainFCN. Sample routine for **finetuning** an FCN network, it will log train data to ./net/log.txt

Additionally inside the directory ./net you will find 3 relevant resources
- Fcn_alexnet.caffemodel: weights for the fully convolution mode  of Alexnet in pascal VOC
- Solver.prototxt: Overall training/fine-tuning configuration 
- trainVal.prototxt: Network descriptor

If you need some help with the prototxt files, you can check the caffe reources on [layers](http://caffe.berkeleyvision.org/tutorial/layers.html)

### A Handy layer

Unlike most fine tune processes where the final layer of a network is learnt from scratch and some of the other layers are fine tuned, we will finetune **only** the layers related to the deconvolution process, and will learn a minimal 3 class output at the very top of the network. This final layer is called *score_3classes*.

## Your turn
Finetune the provided network for the “weizmann horse image database”, remember there are  4 main steps:
Create image labels
Create LMDBs
Decide a training schedule (number of iterations, steps, & learning rate)
Import pretrained model 



