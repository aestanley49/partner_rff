##### example igraph network code 

#will have to change working directory 
orgtyp_base <- read.csv(paste0("/usr/local/bin/store/partner_rff/output/base.csv"), stringsAsFactors = FALSE, na = "") #issue was that "" is coming up instead of NA

library(tidyverse)
library(igraph)


SL <- base[which(base$type_of_org == "SL"),]

#try and add line here that counts number of rows and assigns that as a vector then the number of unique species 

#trying to count number of partners from each species 
nosp <- SL %>% dplyr::group_by(Common.name) %>%
  dplyr::summarise(length(Common.name))
#result is column of species names and a count column
#want to change the count column back to ones and zeros and then count total 

count <- nosp %>% mutate_if(is.numeric, ~1 * (. > 0)) %>% summarise(sum(`length(Common.name)`))

#make into vector (count is currently a function?)

# for number of partners
part <- nrow(SL)


# color loop 

#for #color =  
#if ( 0<x <= 4) {
#statement1
#} else if ( 5 < x <= 9) {
#statement2
#} else if ( 10 < x <= 15) {
#statement3
#} else if ( 16 < x <= 20) {
#statement4
#} else if ( 21 < x <= 25) {
#statement4  
#} else if ( 26 < x <= 30) {
#statement4  
#} else {
#statement5
#}



SL <- SL[,-c(1:4)] #remove non numeric columns
tSL <- t(SL)   #transform
SL <- t(tSL)   #was coming up as non numeric so tranformed again to overwrite

matSL <- tSL %*%  SL

########### put into network analysis code 


matSL[lower.tri(matSL)] <- NA
diag(matSL) <- NA

SLlist <- matSL %>% melt() 
SLlist <- SLlist[-which(is.na(SLlist$value)),]

SLnet <- graph_from_data_frame(d=SLlist, directed=T) 

E(SLnet)$arrow.size <- .02 #determine size of arrows (this makes the heads real small so they are more like lines)
node.size<-setNames(c(6,2,0,0,0,5,2,4,1,5,3), c("L_W_Man" ,"Sp_Man", "Awareness", "law" , "livelihood_econ", "ConD&P","Legal","R&M" ,"Edu","IDevelopment","funding")) #set the names of each node


E(SLnet)$width <- E(SLnet)$value 

plot(SLnet, rescale=F, layout=layout_in_circle, vertex.size=node.size*2) ## note the node sizes were scaled up 

#now with color 

pal2 <- "skyblue"

plot(SLnet, vertex.color = pal2, rescale=F, layout=layout_in_circle, vertex.size=node.size*2) ## note the node sizes were scaled up 
