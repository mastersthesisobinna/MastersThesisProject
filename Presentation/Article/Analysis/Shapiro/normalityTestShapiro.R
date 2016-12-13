wobData <- read.csv("/Users/javao/Desktop/MastersThesisProject/Data/MainData.csv")

#ROAA shapiro
resultROAA <- shapiro.test(wobData$ROAA)
pValueROAA <- resultROAA$p.value
methodROAA <- resultROAA$method


#ROAE shapiro
resultROAE <- shapiro.test(wobData$ROAE)
pValueROAE <- resultROAE$p.value
methodROAE <- resultROAE$method


#percentWOB shapiro
resultPercentWOB <- shapiro.test(wobData$percentWOB)
pValueResultPercentWOB <- resultPercentWOB$p.value
methodResultPercentWOB <- resultPercentWOB$method

pValueVector <- c(pValueROAA, pValueROAE, pValueResultPercentWOB) #p-values for ROAA, ROAE, percentWOB
methodROAE <- c(methodROAA, methodROAE, methodResultPercentWOB) #Statistic methods used for each
selectedVariables <- c("ROAA", "ROAE", "percentWOB")

results <- data.frame(selectedVariables, methodROAE, pValueVector)

normalityTestTable <- xtable(results, caption="Shapiro Normality Test for ROAA, ROAE and percentWOB variables", label="Shapiro")
names(normalityTestTable) <- c("Variable", "Procedure", "p-value")