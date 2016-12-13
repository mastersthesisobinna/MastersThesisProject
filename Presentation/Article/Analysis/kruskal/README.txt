randomSamplingForKruskalTest_ROAA_percentWOBGroup.R
===================================================
Contains the R source file for selecting a random sample of 15 firms from the final sample.
This is used for the Kruskal Test. Variables include, ROAA, percentWOB, and percentWOBGroup.
Input: ./MastersThesisProject/Data/MainData.csv
Output:./MastersThesisProject/Data/randomSample_ROAA_percentWOBGroup.csv


randomSamplingForKruskalTest_ROAE_percentWOBGroup.R
===================================================
Contains the R source file for selecting a random sample of 15 firms from the final sample.
This is used for the Kruskal Test. Variables include, ROAE, percentWOB, and percentWOBGroup.
Input: ./MastersThesisProject/Data/MainData.csv
Output:./MastersThesisProject/randomSample_ROAE_percentWOBGroup.csv


statisticForKruskalTest_ROAA_ROAE_percentWOBGroup.R
===================================================
Contains the R source file for conducting the Kruskal-Wallis Test using the two sampling 
csv file created from the randomSampling... files.
Input 1: ./MastersThesisProject/Data/randomSample_ROAA_percentWOBGroup.csv
Input 2: ./MastersThesisProject/randomSample_ROAE_percentWOBGroup.csv


The files are structured this way because, we want to have our sampling done once, rather
than resampling each time. This way we do the random sampling once and store the results
in two csv files. We apply the Kruskal-Wallis Test on both files in a separate R file.

Both random sampling files: randomSamplingForKruskalTest_ROAA_percentWOBGroup.R and 
randomSamplingForKruskalTest_ROAE_percentWOBGroup.R can be executed to recreate new random
sampling data files and re-test with the Kruskal-Wallis test.