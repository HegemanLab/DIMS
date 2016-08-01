# DIMS
R Script for direct infusion style test that Dana ran. 

## Functionality
Takes in either a single file or multiple files (mzML or mzXML) and splits it into positive and negative modes. Once split into different modes the script then processes those XCMS Raw objects and ouputs the desired data in a csv. The output csv contains the following data columns: mz, mzmax, mzmin, intensity.

## Instructions
* For single file processing update line 13 with the name of your file, for multiple files update the files starting on line 42. Make sure to set your working directory to the directory where that file is located. 
* Once files are added, run that section of code then run remainder of that section. 
 * if doing the single file processing, 'this section' means lines 13-37
 * if doing the single file processing, 'this section' means lines 42-78
