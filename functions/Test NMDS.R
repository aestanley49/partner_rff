# Test exploration of Partner-> action data using NMDS. 
# goal is to be able to group partners in action space and then explore factors that might relate to groupings
library(vegan)

DataSource <- "./data" # input raw dataset goes here
#output.dir <-"./output" # output dataset writes to here
#functions.dir <- "./functions" # directory for functions 


TestData <- read.csv(paste0(DataSource,"/tableofpartnersandactions.csv"), stringsAsFactors = FALSE)

PartnerbyAction <- TestData[,c(2,11:21 )] # probably need one partner and all its actions. 
PartnerbyAction <- PartnerbyAction[-which(duplicated(PartnerbyAction$partner.in.agreement)),] # hack to only look at one instance of each partner NOT LEGITIMATE FOR ACTUAL ANALYSIS

names(PartnerbyAction) <- c("partner","LW_Mng","Sp_Mng", "Awareness",                         
                            "law","econ","Cons_Planning", "Policy",               
                            "Research", "Education","Inst_Dev", "funding")

rownames(PartnerbyAction) <- PartnerbyAction$partner
for(i in 2:12){
  PartnerbyAction[,i] <- as.numeric(PartnerbyAction[,i])  # silly hack because it wouldn't let me change columns to numeric in one go??
}

## have to remove any partners which have no action data? why are there rows for them?

TestPartners <- PartnerbyAction[-which(rowSums(PartnerbyAction[,2:12])==0),-1]


Testnmds<-metaMDS(TestPartners,k=4)
names(Testnmds)
Testnmds

plot(Testnmds) # actions are crosses and partners are circles
ordiplot(Testnmds,type="n")
orditorp(Testnmds,display="species",col="red",air=0.01)
orditorp(Testnmds,display="sites",cex=0.3,air=0.01)

ordiplotnmds


Testnmds$stress
Testnmds$points

# can just plot 
dim(Testnmds$points)
plot(Testnmds$points)  # maybe this is just plotting partners?


#https://jonlefcheck.net/2012/10/24/nmds-tutorial-in-r/

## can also examine how different factors (maybe we could look at partner type, taxon, other?) group out

## Example code from somewhere else where FLnnip.f was the dataset the nmds was made on and minT was the grouping factor
### The following lines are code that make the points a color gradient depending on the min temp for the site.  I think this should range from colder minT (blues) to hotter minT (reds)
##tempPal <- colorRampPalette(c("cyan", "magenta"))
##FLnnip.f$Col <- tempPal(10)[as.numeric(cut((FLnnip.f$minT), breaks=10))]

##plot(FLnmds$points, type="p", xlab="NMDS 1", ylab="NMDS 2",  pch=20, col=FLnnip.f$Col, cex=1.75)


## trying to determine how to identify clusters
## Use dendrogram on dissimilarity matrix
#https://stackoverflow.com/questions/12436902/overlaying-clustering-results-on-an-ordination

dij <- vegdist(TestPartners)
clu <- hclust(dij, method = "complete")
grp <- cutree(clu, 3)

col <- c("red2", "green4", "mediumblue")

plot(Testnmds, type = "n", display = "sites")
points(Testnmds, col = col[grp], bg = col[grp], pch = 21) # not working. something to do with labels?
#legend("topright", legend = paste("Cluster", 1:3),
#       col = col, pt.bg = col, bty = "n", pch = 21)
