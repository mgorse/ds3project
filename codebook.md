# Code book for HAR data cleaning

run_analysis.R will do the following:

*   Read and merge the training and test sets
*   Label activities using the labels from activitiy_labels.txt, replacing underscores with spaces
*   Extract features with "mean" or "std" in their name
*   For each such observation, calculate the mean value for each subject and activity. Store these means in a table called "means"

Means has the following columns:
*   observation: the calculation from which the mean is taken.
*   subject: a number from 1-30 corresponding to the research subject for which this observation was taken.
*   activity: the activity that the subject was performing (walking, sitting, etc)
*   mean: the arithmetic mean.
