
### checking the strings of multiple partners
check <- CleanData[which(CleanData$type.of.partners == "M" | CleanData$type.of.partners == "G"),]
View(check)

?strsplit()

new <- as.list(check$partner.in.agreement)
new

lapply(new, strsplit(CleanData, split= ","))

for (i in nrow(check)) {
  dvec <- strsplit(check$partner.in.agreement[i], split=",")
  
}







for (i in 1:nrow(check)) {
  dvec <- trimws(strsplit(check$partner.in.agreement[i],split=",")[[1]])
  for (dname in dvec) {
    if (dname%in%colnames(check)) {
      check[i, dname] <- 1              
    } else {
      check[dname] <- 0
      check[i, dname] <- 1                                    
    }
  }
}

View(check)
check <- check[, c(22:83)]
check <- t(check)

#FWS <- USFWS
#and Mississippi Museum of Natural Sciences <- remove and
#the Utah School and Institutional Trust Lands ... <- remove the
# the Utah Governor’s Public Lands Policy C <- remove the
# the Utah Division of Wildlife Resources <- remove the 

check <- row.names(check)
as_string(check)
toString(check)

?String
??String


check <- CleanData[which(CleanData$type.of.partners == "M" | CleanData$type.of.partners == "G"),] # subset to multiple partner rows

check <- check %>%  as_tibble() #now can use stringr packages 

?str_replace
str_replace("USFS, Mississippi National Guard, FWS, and Mississippi Museum of Natural Sciences", "FWS", "USFWS")
str_replace("USFS, Mississippi National Guard, FWS, and Mississippi Museum of Natural Sciences", "FWS", "USFWS")
### this didn't do anything?? 
View(CleanData)
str_locate("USFS, Mississippi National Guard, FWS, and Mississippi Museum of Natural Sciences", "FWS")


## cbind not working 
spelling <- cbind(check, overview$partner.in.agreement)
View(spelling)

#Need to find spelling errors in check 
count(unqiue())


### ### create table of who partners are, species they are working on and actions they are doing 


overview <- CleanData[-which(CleanData$type.of.partners == "M"),] ## not looking at strings of partners
overview <- overview[, -c(3, 5,6,8:10)] ## remove columns with excess information
View(overview)

# each unique partner gets a row
# create column that contains name of all species working on seperated by ;
# Add up actions in columns if redudant 
# create column for total number of species being worked on 

#partner 1    species a     actions 
