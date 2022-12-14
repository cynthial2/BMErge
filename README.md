# BMErge
### **Leveraging Image Processing Techniques to Detect Intracranial Hemorrhages**
#### *BME3053C Final Project*

Team members: Sabrina Borrero, Sarah Bowling, Cynthia Liu, Brook Porter and Syed Tahir


## Table of Contents 
* [General Information](#general-information)
* [Programming Languages](#programming-languages)
* [Set Up](#set-up)
* [Program Overview](#program-overview)
* [Sources](#sources)


## General Information
Intracranial hemorrhages are life-threatening conditions characterized by the bursting of intracranial vessels and rapid buildup of pressure in the skull. They cause 10% of all strokes in the United States alone each year. Strokes are a top five leading cause of death in the US. Early and proper detection of the hemorrhage is critical for effective diagnosis and treatment[^1]. 

This project aims to identify the existence of intracranial hemorrhage from CT scans of the brain by processing the image and passing it through a series of tests. It is a modified version of a competition found on Kaggle called: "[RSNA Intracranial Hemorrhage Detection](https://www.kaggle.com/competitions/rsna-intracranial-hemorrhage-detection/overview)", where the data is obtained.  


## Programming Languages
* MATLAB


## Set Up
To run this project, download all files as well as the images in the [sample images folder](/sample_images). All files and images must be located in the same directory in order for the program to run properly (sample images need to be extracted from folder). Once the code is ready to run, all instructions will be displayed within the code. 


## Program Overview
The program consists of a [main file](/MainProgram.mlx), a [dicom image reader](/DICOM_Converter.mlx) function[^2], three hemorrhage detection functions ([edge detection](/EdgeDetectionTest.mlx), [protrusion](/ProtrusionTest.mlx), [thresholding](/ThresholdingTest.mlx)), and a [text file reader](/IDSearch.mlx) function. 

The main file first takes in user input and then processes every image with a .dcm extension in its working directory. The three hemorrhage detection functions takes in the dicom image and each returns a positive or negative depending on if it finds a hemorrhage. The most common output from the three tests is then considered the program's prediction. The text file reader function corroborates this prediction with the actual results from the included [text file](/resultsTable.txt)[^3]. The main file then displays the accuracy rate of the program in the form of a percentage as well as a confusion matrix. 


## Sources
[^1]: Information taken from [Kaggle competition overview](https://www.kaggle.com/competitions/rsna-intracranial-hemorrhage-detection/overview) 
[^2]: Code taken and modified from an [online source](https://www.mathworks.com/matlabcentral/answers/303156-how-to-convert-dicom-image-to-jpeg-png-with-out-loosing-it-s-metadata#:~:text=It%20is%20not%20possible%20to%20convert%20DICOM%20to,not%20occupy%20more%20than%2064%20Kb%3B%20see%20https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FExif) by Gopichandh Danala
[^3]: Table taken and filtered from stage_2_train.csv in [Kaggle competition data](https://www.kaggle.com/competitions/rsna-intracranial-hemorrhage-detection/data)
