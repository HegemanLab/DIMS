# Used for MS data with no retention times such as Direct Infusion data. 

# import XCMS provided by Bioconductor. 
library(xcms)

# Need to set working directory first! use getwd() to check current 
# directory and then if needed, use setwd() and set your working directory
# setwd("C:/Users/Lab/Desktop/Coding_Bits/DIMS")


### SINGLE FILE PROCESSING
# Input file goes here.
input_filename <- "ACM_sept16_T1R2_GL21_method1.mzXML"

xraw <- xcmsRaw(input_filename)

xraw_pos <- split(xraw, xraw@polarity == "positive")

pos_data <- xraw_pos$'TRUE'
neg_data <- xraw_pos$'FALSE'

found_pos <- findPeaks.MSW(pos_data) 
found_neg <- findPeaks.MSW(neg_data)

# Holds peak data ~ determining if neg/pos mode scans are all together
trim_pos <- cbind(found_pos@.Data[,1], found_pos@.Data[,2], found_pos@.Data[,3], found_pos@.Data[,8])
colnames(trim_pos) <- c("mz", "mzmax", "mzmin", "intensity")

trim_neg <- cbind(found_neg@.Data[,1], found_neg@.Data[,2], found_neg@.Data[,3], found_neg@.Data[,8])
colnames(trim_neg) <- c("mz", "mzmax", "mzmin", "intensity")

write.csv(trim_pos, file = paste("pos-", substr(input_filename, 1, nchar(input_filename)-6), ".csv", sep = ""))
write.csv(trim_neg, file = paste("neg-", substr(input_filename, 1, nchar(input_filename)-6), ".csv", sep = ""))

### MULTIPLE FILE PROCESSING
input_filenames <- c("ACM_sept16_T1R2_GL21_method1.mzXML", "ACM_sept16_T1R3_GL20_method1.mzXML")

lapply(input_filenames, function(x){
  
  input_filename <- x
  
  xraw <- xcmsRaw(input_filename)
  
  xraw_pos <- split(xraw, xraw@polarity == "positive")
  
  pos_data <- xraw_pos$'TRUE'
  neg_data <- xraw_pos$'FALSE'
  
  found_pos <- findPeaks.MSW(pos_data) 
  found_neg <- findPeaks.MSW(neg_data)
  
  # Holds peak data ~ determining if neg/pos mode scans are all together
  trim_pos <- cbind(found_pos@.Data[,1], found_pos@.Data[,2], found_pos@.Data[,3], found_pos@.Data[,8])
  colnames(trim_pos) <- c("mz", "mzmax", "mzmin", "intensity")
  
  trim_neg <- cbind(found_neg@.Data[,1], found_neg@.Data[,2], found_neg@.Data[,3], found_neg@.Data[,8])
  colnames(trim_neg) <- c("mz", "mzmax", "mzmin", "intensity")
  
  write.csv(trim_pos, file = paste("pos-", substr(input_filename, 1, nchar(input_filename)-6), ".csv", sep = ""))
  write.csv(trim_neg, file = paste("neg-", substr(input_filename, 1, nchar(input_filename)-6), ".csv", sep = ""))
  
})



