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