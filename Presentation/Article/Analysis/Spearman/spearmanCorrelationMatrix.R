if (!require("xtable")) {
  install.packages("xtable", repos="http://cran.rstudio.com/") 
  library("xtable")
}
if (!require("Hmisc")) {
  install.packages("Hmisc", repos="http://cran.rstudio.com/") 
  library("Hmisc")
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



corstars <- function(x, method=c("pearson", "spearman"), removeTriangle=c("upper", "lower"),
                     result=c("none", "html", "latex")){
  #Compute correlation matrix
  require(Hmisc)
  x <- as.matrix(x)
  correlation_matrix<-rcorr(x, type=method[1])
  R <- correlation_matrix$r # Matrix of correlation coeficients
  p <- correlation_matrix$P # Matrix of p-value 
  
  ## Define notions for significance levels; spacing is important.
  mystars <- ifelse(p < .001, "*** ", ifelse(p < .01, "**  ", ifelse(p < .05, "*   ", "    ")))
  
  ## trunctuate the correlation matrix to two decimal
  R <- format(round(cbind(rep(-1.11, ncol(x)), R), 3))[,-1]
  
  ## build a new matrix that includes the correlations with their apropriate stars
  Rnew <- matrix(paste(R, mystars, sep=""), ncol=ncol(x))
  diag(Rnew) <- paste(diag(R), " ", sep="")
  rownames(Rnew) <- colnames(x)
  colnames(Rnew) <- paste(colnames(x), "", sep="")
  
  ## remove upper triangle of correlation matrix
  if(removeTriangle[1]=="upper"){
    Rnew <- as.matrix(Rnew)
    Rnew[upper.tri(Rnew, diag = FALSE)] <- ""
    Rnew <- as.data.frame(Rnew)
  }
  
  
  ##print table, and comment for significance
  comm <- paste0("\\hline \n \\multicolumn{4}{l}",
                 "{\\scriptsize{Significant at \\emph{p} \\textless .10; *\\emph{p} \\textless .05; **\\emph{p} \\textless .01; ***\\emph{p} \\textless .001}} \n")
  
  if(result[1]=="html") print(xtable(Rnew), type="html")
  else print(xtable(Rnew, caption="Spearman Correlation matrix analysis", label="RHO"), type="latex", hline.after=c(-1, 0), add.to.row = list(pos = list(3), command = comm)) 
  
}

corstars(wobData, result="latex", method="spearman")#corstars function call data,output,correlation