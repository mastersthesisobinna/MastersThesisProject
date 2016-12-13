if (!require("xtable")) {
  install.packages("xtable", repos="http://cran.rstudio.com/") 
  library("xtable")
}

#Read random sampled files
randomROAASample <- read.csv("C:/MastersThesisProject/Data/randomSample_ROAA_percentWOBGroup.csv")
randomROAESample <- read.csv("C:/MastersThesisProject/Data/randomSample_ROAE_percentWOBGroup.csv")


#Select variables
#0 less than 18.9 percentWOB and 1 greater than 18.9 percentWOB
randomROAASample <- randomROAASample[,c("ROAA", "percentWOB", "percentWOBGroup")]
randomROAESample <- randomROAESample[,c("ROAE", "percentWOB", "percentWOBGroup")]


#Print tables
table1 <- xtable(randomROAASample, caption="ROAA of different percentWOBGroup levels for 30 randomly selected firms from the  sample. A percentWOBGroup value of 0 represented firms with a percentWOB that is less than the mean of percentWOB calculated in the  sample (see \\autoref{percentWomen}). A percentWOBGroup value of 1 represented firms with a percentWOB that is greater than the mean of percentWOB calculated in the  sample.", label="randomROAA")
names(table1) <- c("ROAA", "percentWOB", "percentWOBGroup")

table2 <- xtable(randomROAESample, caption="ROAE of different percentWOBGroup levels for 30 randomly selected firms from the  sample. A percentWOBGroup value of 0 represented firms with a percentWOB that is less than the mean of percentWOB calculated in the  sample (see \\autoref{percentWomen}). A percentWOBGroup value of 1 represented firms with a percentWOB that is greater than the mean of percentWOB calculated in the  sample.", label="randomROAE")
names(table2) <- c("ROAE", "percentWOB", "percentWOBGroup")

table1; table2

#p-value: 0.759 (p > 0.05)
#Null hypothesis is accepted