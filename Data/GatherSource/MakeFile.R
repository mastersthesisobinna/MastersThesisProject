setwd("C:/MastersThesisProject/") #set currently directory to find saved workspace
source(file="loadWorkspaceHistory.R") #load the workspace and history upon starting

#setwd("./") please specify your working directory within the project.

#File instruction or description specified here.

#install required packages

#load library

#Note please do not overwrite this template. Use the template to build your R files only
#then save the file in another name. Do not overwrite the template. Clean this line.
source("C:/MastersThesisProject/Data/GatherSource/GatherFinancials.R")
source("C:/MastersThesisProject/Data/GatherSource/GatherWOB.R")
source("C:/MastersThesisProject/Data/GatherSource/MergeData.R")


setwd("C:/MastersThesisProject/") #set working directory where project file is saved
source(file="saveWorkspaceHistory.R") #save the workspace and history before quiting