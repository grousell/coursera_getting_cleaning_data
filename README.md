# Coursera - Getting and Cleaning Data Project

This the respository for the Getting and Cleaning Data final course project. 

The `run_analysis` script will load and clean using the tidyverse.  

* The training and test data are loaded separately, the subject number and activity codes are added
* Both data sets are then combined into the full dataframe. 
* The variables of interest (i.e. mean, standard deviation) are selected from the master dataframe
* The pared down dataframe is grouped by subject and activity, and the mean calculted for all variables
* Resulting tidy data set saved as `tidy_df.txt`