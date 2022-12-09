

clear; clc; close all; 

total = 0; correct = 0;
program_output = []; actual_output = [];

table = readtable('resultsTable.txt'); 

while true
% Display Main Menu

    fprintf("MENU: \n");
    fprintf("1. Enter image(s) \n");
    fprintf("2. Exit program \n");
    fprintf("Caution: All images in working directory will be evaluated using this program.\n");

    choose = input("Choose a menu option: ");
% Option 1: Process all images in working directory
% _Create struct containing all images in working directory with .dcm extension_

    if choose == 1 
        fprintf("Running analysis...\n")
        images = dir("*.dcm");
        image_vector = [];
        Hemorrhage_vec = zeros(1,size(images,1));
%% 
% _Pass image into each test_

        for i = 1:size(images,1)
            image = images(i).name;
            image = convertCharsToStrings(image);
            image_vector = [image_vector image];

            % Find upper and lower image display values 
            [DICOM_image, low_actual, high_actual] = DICOM_Converter(image);
            
            % Thresholding Test 
            Test_1_Results = ThresholdingTest(DICOM_image,low_actual,high_actual);
            
            % Edge Detection Test
            Test_2_Results = EdgeDetectionTest(DICOM_image,low_actual,high_actual);
           
            % Protrusion Test
            Test_3_Results = ProtrusionTest(DICOM_image,low_actual,high_actual);
    
%% 
% _Base overall hemorrhage prediction on what the tests predict_ 

            % Tests overall returns 1 or 0 
            h_found = Test_1_Results + Test_2_Results + Test_3_Results;

            if h_found >= 2
                Hemorrhage_vec(i) = 1;
            else
                Hemorrhage_vec(i) = 0;
            end
%% 
% _Check prediction with confirmation table_

            fprintf("Checking prediction...\n")
            ID = char(image); 
            ID = ID(1:12);
            result = IDSearch(ID, table);
            
            fprintf("Expected output: %d \n", result);
            fprintf("Predicted Output: %d \n", Hemorrhage_vec(i));
        
            if result == Hemorrhage_vec(i)
                fprintf("Prediction correct. \n\n");
                correct = correct + 1;
            else
                fprintf("Prediction incorrect. \n\n")
            end 
            program_output = [program_output Hemorrhage_vec(i)];
            actual_output = [actual_output result];
        
        end
%% 
% Display predictions

       Hemorrhage_vec = transpose(Hemorrhage_vec);
       image_vector = transpose(image_vector);
       PredictionTable = cat(2,image_vector,Hemorrhage_vec)
%% 
% Display Accuracy and Confusion Matrix

       fprintf("\nTotal images tested: %g \n", size(images,1));
       fprintf("Current accuracy: %g%% \n", correct/size(images,1)*100);
        
       fprintf("\nGenerating confusion matrix... \n\n")
       C = confusionmat(actual_output, program_output, 'Order', [0, 1]);
       confusionchart(C, 'Title', 'Existence of Hemorrhage: Predicted vs Actual');
% Option 2: Exit Program

    elseif choose == 2
        fprintf("\nThanks for using the program.\n")
        break;  
% Other: Invalid menu option

    else 
        fprintf("Error. Invalid menu choice! Please try again...");
    end 
end