---
title: "CodeBook"
author: "Wouter Baake"
date: "Friday, August 15, 2014"
output: html_document
---

A description of the source data can be found in the text files in the "UCI HAR Dataset" directory.

## Script description

The script "run_analysis.R" does the following things:

- Download the data files
- Load all the data for the test and training dataset
- Combine both datasets
- Read the labels from file and set as column names
- Select only the data with mean() or std() in their column name
- Read the activity names and subject id's for test and training datasets
- Combine descriptions of test and train dataset and give columns names
- Transform the activity numbers into descriptive names
- Combine description with dataset
- Melt the data and calculate the means per variable
- Write tidy dataset to a csv file

## Tidy data file

The tidy_data dataset consists of the following variables:

- activity: A string value describing the type of activity for which the gyroscope data was recorded.
- subject_id: A numeric value (1 to 30) that identifies the subject that performed the activity
- variable: A string value describing the gyroscope variable that was recorded activity and subject
- value: The mean of the gyroscope variable recorded for this activity and subject