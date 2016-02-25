# Haar Cascade Object Recognition

This folder contains code for training and detecting objects using a Haar Cascade. The data in this folder is trained using 15 images of the precached sample. To use the trained model on a webcam use the *detector.cpp* file. 

The images used to train the model are located in the *positive* and *negative* subdirectories. To train this data, first run *create_files.py*, which will generate the positives.info and negatives.dat files needed for training. Once completed, run the *create_samples.sh* script to generate the *positives.vec* file. This is the file the training program reads, which can be viewed by executing `opencv_createsamples -vec positives.vec` in terminal. Finally, executing *train_classifier.sh* will start the training. The results should appear in the *data* subdirectory, with *cascade.xml* the file to ultimately use in a detector.

To recreate the training using a different set of images, remove the *data* subdirectory and replace the existing images with new ones. Note that several parameters in the shell script will need to be modified to work for a new dataset. A tutorial on how to work with these parameters is found at https://www.youtube.com/watch?v=WEzm7L5zoZE. API documentation can be found at http://docs.opencv.org/3.1.0/dc/d88/tutorial_traincascade.html#gsc.tab=0.
