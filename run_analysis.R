
# Load Libraries ----------------------------------------------------------

library(tidyverse)

# Q1. Load Data ---------------------------------------------------------------

## Features and Activity Labels ----
features <- read.table("UCI HAR Dataset/features.txt", 
                       row.names=NULL, 
                       quote="\"", 
                       comment.char="")


activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", 
                              quote="\"", 
                              comment.char="")

names (activity_labels) <- c("activity_code", "activity_label")

## Training Set ----

train <- read.table("UCI HAR Dataset/train/X_train.txt", 
                    quote="\"", 
                    comment.char=""
                    )

train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt", 
                            quote="\"", 
                            comment.char="")

names (train_subject) <- "subject"

train_labels <- read.table("UCI HAR Dataset/train/y_train.txt", 
                           quote="\"", 
                           comment.char="")

names (train_labels) <- "activity_code"

train_full <- cbind (train_labels, train_subject, train)
## Test Set ----

test <- read.table("UCI HAR Dataset/test/X_test.txt", 
                    quote="\"", 
                    comment.char=""
)

test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt", 
                            quote="\"", 
                            comment.char="")

names (test_subject) <- "subject"

test_labels <- read.table("UCI HAR Dataset/test/y_test.txt", 
                           quote="\"", 
                           comment.char="")

names (test_labels) <- "activity_code"

test_full <- cbind (test_labels, test_subject, test)

## Merge Test and Training Data --------------------------------------------

df <- rbind (train_full, test_full)

## Add Variable Labels to data frame ---------------------------------------

names (df) <- c("activity_code", "subject", features$V2)

# Q2. Extracts only the measurements on the mean and SD --------

df_mean_sd  <- df %>% 
  select (contains(c("activity_code", "subject", "mean", "std")))


# Q3. Uses descriptive activity names to name the activities in the data --------

df_mean_sd <- df_mean_sd %>% 
  left_join(activity_labels, by = c ("activity_code"))


# Q4. Appropriately labels the data set with descriptive variable  --------

# See above - ## Add Variable Labels to data frame 

# Q5 From the data set in step 4, creates a second, independent tidy data set ----
# with the average of each variable for each activity and each subject.

tidy_df <- df_mean_sd %>% 
  group_by (activity_label, subject) %>% 
  summarise_all (mean, na.rm = TRUE)





