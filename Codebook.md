subjecttrain and subjecttest read the subject files and get combined into one table
called subject.  the header gets renamed 'subject'

activity train and activitytest read the activity tables, and are replaced with descriptors
that are provided.  they get combined via rbind into "activity" and the column header is renamed
activity.
 
datatest and datatrain are read and combined into a dataset called "data."
the headers of "data" are renamed after features is read.

the activity and subject columns are then added to the dataset, "data."

data is then transformed into a data table, selecting the columns that contain "mean" or "std."
the selected data is then grouped by subject and activity, averaging each variable.

the data is then written into a table called "run_analysis.txt"  