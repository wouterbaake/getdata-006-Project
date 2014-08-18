---
title: "README"
author: "Wouter Baake"
date: "Friday, August 15, 2014"
output: html_document
---

Contained in this repo are

* The script "run_analysis.R" -> This downloads the required raw data and collects all the separate datasets into a single data table. It also calculates the requires means and output's a tidy data file
* The CodeBook.md file which describes the action taken in the script
* The tidy data file tidydata.txt containing the means of every data item with "mean()" or "std()" in its name in the original datasets, grouped by activity and subject_id

The script "run_analysis.R" does the following things:
* Download the data files
* Load all the data for the test and training dataset
* Combine both datasets
* Read the labels from file and set as column names
* Select only the data with mean() or std() in their column name
* Read the activity names and subject id's for test and training datasets
* Combine descriptions of test and train dataset and give columns names
* Transform the activity numbers into descriptive names
* Combine description with dataset
* Calculate the means of every column grouped by activity and subject
* Order dataset by activity and subject_id
* Write tidy dataset to a csv file