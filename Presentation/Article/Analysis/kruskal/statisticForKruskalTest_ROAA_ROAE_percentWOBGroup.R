if (!require("xtable")) {
  install.packages("xtable", repos="http://cran.rstudio.com/") 
  library("xtable")
}

#Read random sampled files
randomROAASample <- read.csv("C:/MastersThesisProject/Data/randomSample_ROAA_percentWOBGroup.csv")
randomROAESample <- read.csv("C:/MastersThesisProject/Data/randomSample_ROAE_percentWOBGroup.csv")

#Select variables
#0 less than 18.9 percentWOB and 1 greater than 18.9 percentWOB
randomROAASample <- randomROAASample[,c("ROAA", "percentWOBGroup")]
randomROAESample <- randomROAESample[,c("ROAE", "percentWOBGroup")]


#chi-square-tabulation
tabul <- qchisq(0.950, 1)


#Kruskal test for significant differences in ROAA between the levels of percentWOBGroup (0 and 1)
randomROAASample <- kruskal.test(randomROAASample$ROAA ~ randomROAASample$percentWOBGroup, data = randomROAASample)
chi <- gsub("Kruskal-Wallis chi-squared", "", randomROAASample$statistic)
chi <- as.numeric(chi)
freedom <- gsub("df", "", randomROAASample$parameter)
freedom <- as.numeric(freedom)
kruskalROAADF <- data.frame(chi, freedom, randomROAASample$p.value, tabul)
row.names(kruskalROAADF) <- ""



#Kruskal test for significant differences in ROAE between the levels of percentWOBGroup (0 and 1)
randomROAESample <- kruskal.test(randomROAESample$ROAE ~ randomROAESample$percentWOBGroup, data = randomROAESample)
chi2 <- gsub("Kruskal-Wallis chi-squared", "", randomROAESample$statistic)
chi2 <- as.numeric(chi2)
freedom2 <- gsub("df", "", randomROAESample$parameter)
freedom2 <- as.numeric(freedom2)
kruskalROAEDF <- data.frame(chi2, freedom2, randomROAESample$p.value, tabul)
row.names(kruskalROAEDF) <- ""

#Print tables
kruskalTestTable1 <- xtable(kruskalROAADF, caption="Kruskal-Wallis Test: Test of significance difference in ROAA between the levels of percentWOBGroup. \\emph{H} indicates the test statistic; \\emph{df} indicates the degree of freedom.", label="kruskalROAA", digits=c(0,4,0,4,4))
names(kruskalTestTable1) <- c("H", "df", "p-value", "chi-square-tabulation")

kruskalTestTable2 <- xtable(kruskalROAEDF, caption="Kruskal-Wallis Test: Test of significance difference in ROAE between the levels of percentWOBGroup. \\emph{H} indicates the test statistic; \\emph{df} indicates the degree of freedom.", label="kruskalROAE", digits=c(0,4,0,4,4))
names(kruskalTestTable2) <- c("H", "df", "p-value", "chi-square-tabulation")

kruskalTestTable1; kruskalTestTable2