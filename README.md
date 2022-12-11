# BMErge
### **Leveraging Image Processing Techniques to Detect Intracranial Hemorrhages**
#### *BME3053C Final Project*

Team members: Sabrina Borrero, Sarah Bowling, Cynthia Liu, Brook Porter and Syed Tahir

## Table of Contents 
* [General Information] (#General-Information)
* [Programming Language(s)] (#Programming-Language(s))
* [Set Up] (#Set-Up)
* [Program Overview] (#Program-Overview)
* [Sources] (#Sources)

## General Information
Intracranial hemorrhages are life-threatening conditions characterized by the bursting of intracranial vessels and rapid buildup of pressure in the skull. They cause 10% of all strokes in the United States alone each year. Strokes are a top five leading cause of death in the US. Early and proper detection of the hemorrhage is critical for effective diagnosis and treatment. 

This project aims to identify the existence of intracranial hemorrhage from CT scans of the brain by processing the image and passing it through a series of tests. It is a modified version of a competition found on Kaggle called: "[RSNA Intracranial Hemorrhage Detection](https://www.kaggle.com/competitions/rsna-intracranial-hemorrhage-detection/overview)", where the data is obtained.  

## Programming Language(s)
MATLAB

## Set Up
To run this project, download all files as well as desired test images from the [data section](https://www.kaggle.com/competitions/rsna-intracranial-hemorrhage-detection/data) on the Kaggle competition webpage . The dicom images must be obtained from the stage_2_train folder in order for the code to verify its predictions. All files and images must be located in the same directory in order for the program to run properly. Once the code is ready to run, all instructions will be displayed within the code. 

## Program Overview
The program consists of a main file, a dicom image reader function, three hemorrhage detection functions, and a text file reader function. The main file provides users with the instructions on how to use the program by asking for user input, and then processes every image with a .dcm extension in the working directory. The three hemorrhage detection functions takes in the dicom image and returns a positive or negativ depending on if it finds a hemorrhage. The text file reader function corroborates the code's prediction with the actual results from the included text file.

## Sources

