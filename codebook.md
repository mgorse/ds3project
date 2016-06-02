# Code book for HAR data cleaning

run_analysis.R will do the following:

*   Read and merge the training and test sets
*   Label activities using the labels from activitiy_labels.txt, downcasing and replacing underscores with spaces
*   Extract features with "mean" or "std" in their name
*   For each such observation, calculate the mean value for each subject and activity. Store these means in a table called "har_tidy"
*   Write the table to a file called "har_tidy.txt"

har_tidy has columns indicating the subject and activity (sitting, walking upstairs, etc) along with additional columns for various observations. Each value contains the mean for the given observation over the given subject and activity.
