library(readr)
#CleanData <- read_csv("~/Desktop/Fall 2019/RFF part 2/codesalafsky.csv", sep = "", stringsAsFactors = FALSE)
#CleanData <- read_csv("~/Desktop/Fall 2019/RFF part 2/codesalafsky.csv")
#CleanData <- read.csv("~/Desktop/Fall 2019/RFF part 2/codesalafsky.csv", sep = "", stringsAsFactors = FALSE)

CleanData <- read.csv("~/Desktop/Fall 2019/RFF part 2/codesalafsky.csv", stringsAsFactors = FALSE)

#class(CleanData$partner.in.agreement) ## checking data 

###error in read.csv -> more columns than column names
  ## Switched to read_csv so wouldn't have that problem 
  ## result was that the column names format go changed so now there are duplicates where one is formated corrected

# CleanData$partner.in.agreement checking which colunm type should be used 

cleaning_salafsky <- function(CleanData){
  
View(CleanData) #Looking at data
  ## reformate the changes to cells (unsure why, but column head changed)
CleanData$partner.in.agreement[11] <-  "Natural Resources Conservation Service"
CleanData$partner.in.agreement[117] <- "California Department of Fish and Game"
CleanData$partner.in.agreement[45] <- "Kane County"
CleanData$partner.in.agreement[56] <- "New Mexico Department of Game and Fish" #New Mexico Department of Fish and Game <- “” Game and Fish *multiple occurances]
CleanData$partner.in.agreement[57] <- "USFWS, BLM, New Mexico Department of Game and Fish"
CleanData$partner.in.agreement[62] <- "Vauge/Unspecified cooperators: NRCS, New Mexico Department of Game and Fish"
CleanData$partner.in.agreement[205] <- "North Carolina Department of Agriculture & Consumer Services Plant Conservation Program"
CleanData$partner.in.agreement[143] <- "Vermejo Park Ranch"

### ### Changing cells so that spelling errors are corrected and match partner names in other data set 
  ## this formate no longer works 
  CleanData[11,4]  ## Check that no levels aka stringAsFactors = False
CleanData$`partner in agreement`[11] <-  "Natural Resources Conservation Service"
CleanData$`partner in agreement`[117] <- "California Department of Fish and Game"
CleanData$`partner in agreement`[45] <- "Kane County"
CleanData$`partner in agreement`[56] <- "New Mexico Department of Game and Fish" #New Mexico Department of Fish and Game <- “” Game and Fish *multiple occurances]
CleanData$`partner in agreement`[57] <- "USFWS, BLM, New Mexico Department of Game and Fish"
CleanData$`partner in agreement`[62] <- "Vauge/Unspecified cooperators: NRCS, New Mexico Department of Game and Fish"
CleanData$`partner in agreement`[205] <- "North Carolina Department of Agriculture & Consumer Services Plant Conservation Program"
CleanData$`partner in agreement`[143] <- "Vermejo Park Ranch"
  
### ### Manual check of multiple partner strings
  # split strings
  # print out unquie names with corresponding row numbers 

### ### make new data set with 1s and 0s in action columns 
    ### Subsetting based on if a 0 was in the cell, the cell was empty ("") or there was a space in the call (" ")
CleanData$X <- NULL
CleanData$X1..Land.Water.Management
CleanData[which(CleanData$X1..Land.Water.Management == 0 | CleanData$X1..Land.Water.Management == "" | CleanData$X1..Land.Water.Management == " "),11] <- NA # 11 is the column called 'land water management'
CleanData[which(CleanData$X2..Species.Management== 0 | CleanData$X2..Species.Management== "" | CleanData$X2..Species.Management== " "),12] <- NA
CleanData[which(CleanData$X3..Awareness.raising== 0 | CleanData$X3..Awareness.raising== "" | CleanData$X3..Awareness.raising== " "),13] <- NA
CleanData[which(CleanData$X4..law.enforcement.and.prosecution== 0 | CleanData$X4..law.enforcement.and.prosecution== "" | CleanData$X4..law.enforcement.and.prosecution== " "),14] <- NA
CleanData[which(CleanData$X5..livelihood..economic.and.moral.incentrives== 0 | CleanData$X5..livelihood..economic.and.moral.incentrives== "" | CleanData$X5..livelihood..economic.and.moral.incentrives== " "),15] <- NA
CleanData[which(CleanData$X6..Conservation.Design.and.Planning== 0 | CleanData$X6..Conservation.Design.and.Planning== "" | CleanData$X6..Conservation.Design.and.Planning== " "),16] <- NA
CleanData[which(CleanData$X7..Legal.and.Policy.frameworks == 0 | CleanData$X7..Legal.and.Policy.frameworks == "" | CleanData$X7..Legal.and.Policy.frameworks == " "),17] <- NA
CleanData[which(CleanData$X8..Research.and.monitoring== 0 | CleanData$X8..Research.and.monitoring== "" | CleanData$X8..Research.and.monitoring== " "),18] <- NA
CleanData[which(CleanData$X9..Education.and.Training== 0 | CleanData$X9..Education.and.Training== "" | CleanData$X9..Education.and.Training== " "),19] <- NA
CleanData[which(CleanData$X10..Institutional.Development== 0 | CleanData$X10..Institutional.Development== "" | CleanData$X10..Institutional.Development== " "),20] <- NA
CleanData[which(CleanData$funding == 0 | CleanData$funding == "" | CleanData$funding == " "),21] <- NA


### Old way of formating column head 
### This formate no longer works 
CleanData[which(CleanData$`1. Land/Water Management` == 0 | CleanData$`1. Land/Water Management` == "" ),] <- NA
CleanData[which(CleanData$`2. Species Management`== 0),] <- NA
CleanData[which(CleanData$`3. Awareness raising`== 0),] <- NA
CleanData[which(CleanData$`4. law enforcement and prosecution`== 0),] <- NA
CleanData[which(CleanData$`5. livelihood, economic and moral incentrives`== 0),] <- NA
CleanData[which(CleanData$`6. Conservation Design and Planning`== 0),] <- NA
CleanData[which(CleanData$`7. Legal and Policy frameworks`== 0),] <- NA
CleanData[which(CleanData$`8. Research and monitoring`== 0),] <- NA
CleanData[which(CleanData$`9. Education and Training`== 0),] <- NA
CleanData[which(CleanData$`10. Institutional Development`== 0),] <- NA
CleanData[which(CleanData$funding== 0),] <- NA

CleanData[1, c(11:21)]
View(CleanData)



if (CleanData[is.na(CleanData)] <- 0){
} else (CleanData[is.character(CleanData[,c(11:21)])] <- write(1))


CleanData[which(CleanData$X1..Land.Water.Management == 0),11]

which.is.chatacter 

CleanData[is.character(CleanData[,c(11:21)])] <- 1

if(CleanData[is.na(CleanData)] <- 0){
} 

if(CleanData[is.character(CleanData[,c(11:21)])]){
  return("TRUE")
}
   #if true print 1 
   CleanData[,c(11:21)] <- 1
   
   if(CleanData[is.character(CleanData[33,13])]){
     return("TRUE")
   }
   
  
   
class(CleanData[,c(11:21)])
class(CleanData$X2..Species.Management)

#function converts strings to integers 
strtoi(CleanData$X3..Awareness.raising, base=0L)
strtoi(CleanData$X3..Awareness.raising[33], base=0L)
class(CleanData$X3..Awareness.raising[33])

as.numeric(CleanData$X3..Awareness.raising[33])

?write
  
trial <- CleanData[,c(11:21)] %>% strtoi()
  
class(trial)
View(trial)
}



### checking the strings of multiple partners
check <- CleanData[which(CleanData$type.of.partners == "M"),]
View(check)

?strsplit()

i=1:43
for (i in 1:ncol(check)) {
  dvec <- strsplit(check$partner.in.agreement[i], split=",")[[1]]
}
View(dvec)
      
           
           