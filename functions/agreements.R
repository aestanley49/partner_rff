library(readxl)
library(tidyverse)

YearNames <- read_excel("/usr/local/bin/store/partner_rff/data/AS8_codingdata.xlsx", "totaldata")
agreements <- function(YearNames){
  
  
}

colnames(YearNames)
#need to add Y/N to this column:: "agreement before listing? (Y/N) **unsure which is listing date (this comepares to column G)"
#Then dummy code to their own column names and fill in 1s and 0s 
#when combine, may want to check partner names 

#rename column
?names_to
rename(YearNames, "agreementlistingdateYN" = "agreement before listing? (Y/N) **unsure which is listing date (this comepares to column G)")
View(YearNames)
#rename didn't work so replicated column, can delete original after run through checks
YearNames$agreementlistingdateYN <- YearNames$`agreement before listing? (Y/N) **unsure which is listing date (this comepares to column G)`


YearNames[YearNames$`Common name` == "BASALT DAISY", 27] <- "Y"
YearNames[YearNames$`Common name` == "BRAND'S PHACELIA", 27] <- "Y,??"
YearNames[YearNames$`Common name` == "COPPERBELLY WATER SNAKE", 27] <- "Y"
YearNames[YearNames$`Common name` == "CORAL PINK SAND DUNES TIGER BEETLE", 9]<- "signed in 2009"
YearNames[YearNames$`Common name` == "CORAL PINK SAND DUNES TIGER BEETLE", 27]<- "Y"







