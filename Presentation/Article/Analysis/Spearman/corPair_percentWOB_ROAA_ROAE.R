if (!require("xtable")) {
  install.packages("xtable", repos="http://cran.rstudio.com/") 
  library("xtable")
}

if (!require("apsrtable")) {
  install.packages("apsrtable", repos="http://cran.rstudio.com/") 
  library("apsrtable")
}


wobData <- read.csv("C:/MastersThesisProject/Data/MainData.csv")

#format characteristics of the data
wobData$firm <- as.character(wobData$firm )
wobData$ticker <- as.character(wobData$ticker)
wobData$Board <- as.numeric(wobData$Board)
wobData$WOB <- as.numeric(wobData$WOB)
wobData$Sector <- as.character(wobData$Sector)
wobData$State <- as.character(wobData$State)
wobData$City <- as.character(wobData$City)
wobData$Country <- as.character(wobData$Country)
wobData$percentWOB <- as.numeric(wobData$percentWOB)

wobData <- wobData[,c("ROAA","ROAE","percentWOB")] #select multiple variables
cor.test(wobData$ROAA, wobData$ROAE, method = "spearman")
corResult <- round(cor(wobData[,1:3], method = "spearman"), 3) #spearman correlation matrix

cormatrix <- rcorr(as.matrix(wobData), type='spearman')
prob <- as.data.frame(cormatrix$P) #can also do cormatrix$r for spearman correalation rho
xtable(prob, caption="Spearman Correlation matrix analysis, P-Value", label="matrixCor", digit=3)

# Hide upper triangle
upper<-corResult
upper[upper.tri(corResult)]<-""
upper<-as.data.frame(upper)

xtable(upper, caption="Spearman Correlation matrix analysis", label="matrixCor", digit=3)
