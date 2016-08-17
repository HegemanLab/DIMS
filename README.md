# DIMS
R Script for direct infusion style data that Dana ran. This was used for leaf spray data, which does not have chromatographic separation similar to direct injection/infusion data.

## Functionality
Takes in either a single file or multiple files (mzML or mzXML) and splits it into positive and negative modes. Once split into different modes the script then processes those XCMS Raw objects and ouputs the desired data in a csv. The output csv contains the following data columns: mz, mzmax, mzmin, intensity.

## Instructions
* For single file processing update line 13 with the name of your file, for multiple files update the files starting on line 42. Make sure to set your working directory to the directory where that file is located. 
* Once files are added, run that section of code then run remainder of that section. 
 * if doing the single file processing, 'this section' means lines 13-37
 * if doing the single file processing, 'this section' means lines 42-78

## Hegeman Lab - University of Minnesota Twin-Cities
This code was developed for use in the Hegeman Lab at the University of Minnesota Twin-Cities. If you use this script in your research, please don't forget to acknowledge or cite publication. Additionally, if there are any questions about how to use this code, feel free to contact [Adrian Hegeman](mailto:hegem007@umn.edu). 
