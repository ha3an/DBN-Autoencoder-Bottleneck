# Bottleneck Feature Extraction for TIMIT dataset with Deep Belief Network and Autoencoder

Author: Hassan Taherian

Laboratory for Intelligent Multimedia Processing (LIMP)

Unfortunately Deep Belief Network is not provided in Microsoft’s Computational Network Toolkit (CNTK). This MATLAB based program can be used as an add-on to bring Deep Belief Network (DBN) support for CNTK. You can pretrain your network with it and use the trained weights as an initial point for your CNTK model. As a particular application, I write MATLAB scripts to pretrain features with DBN for bottleneck feature extraction of TIMIT dataset. 

1. timit_RBM_AE.m can be used to pretrain data with DBN (with or without fine tuning) and use its weights as initial point for Network in CNTK. 
2. timit_DBN.m can be used to train data with DBN (with fine tuning) and extract bottleneck features without post training with CNTK.


This program is powered by DeeBNet toolbox, implemented in Laboratory for Intelligent Multimedia Processing (LIMP) by Mohammad Ali Keyvanrad (http://ce.aut.ac.ir/~keyvanrad). DeeBNet is designed to be very modular, extensible, reusable and can easily be modified and extended. it is an object oriented toolbox with the most important abilities needed for the implementation of DBNs.
