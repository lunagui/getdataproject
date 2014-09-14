 
#Summary
 
 **This repo includes the following files:**

   * run_analysis.R: the script to get tidy data average.txt.
   * average.txt: the final tidy data of script run_analysis.R.
   * CodeBook.md: all information about average.txt.
   * README.md: this file.

**The tidy dataset(average.txt), which is final output of script(run_analysis.R) based on raw data.**

**Raw data information:**
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Then the sensor signals were pre-processed and saved.(Unzip the file and read the README.txt get more information.)

**The purpose:**
Get the tidy data which is  average of each variable for each activity and each subject based on raw data.

#Study design
 
The raw data has been  split to two set, train data and test data. We need the whole data first.
Read all information related, we found that these two data set just has been split based on subject, which means who performed the activity. We can confirm that by checking subject_train.txt and subject_test.txt. These tow file has different unique elements.  So we are suer we can combined them together easily.

The two data set have same file. Before we merge them, we should combined the subject and activity label first. That will be good for getting average data based on  subject and activity label.

#Instruction list

**To get tidy data set of average.txt, you should do these step first:**

**Step 1**  Up zip the getdata-projectfiles-UCI HAR Dataset.zip, find the following files and move to your R working directory:
   * features.txt
   * activity_lab.txt
   * train/X_train.txt
   * train/y_train.txt
   *train/subject_train.txt
   * test/X_test.txt
   * test/y_test.txt
   *test/subject_test.txt
   
**Step 2** Run the script run_analysis.R. My R Version is 0.98.994.

**Step 3** check your working directory, there is a file average.txt.
