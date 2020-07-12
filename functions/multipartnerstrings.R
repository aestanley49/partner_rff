###################################################################################
######### Purpose: Split multi partner strings and add actions to partners
###################################################################################
######### Method: for each multipartner string, split into individual partner names, making duplicate rows with same action code and then add 1s and 0s in action to the same parter per species 

#load in data 
df <- read.csv(paste0("/usr/local/bin/store/partner_rff/data/tableofPandAmodified.csv"), stringsAsFactors = FALSE, na = "", #issue was that "" is coming up instead of NA
               strip.white=TRUE) #trying to see if this will fix problem 
    #### note, this csv has specific field offices in partner names
    ## worth combining with earlier version and creating two outputs? 
    ### if offices aren't included, more will be combined (not super significant in agreement level combination)


#load packages
library(tidyverse)

######### the following puts together by species, then specific agreeement then non-distinct partners

df2 <- separate_rows(df, partner.in.agreement, sep = ",")

# returns string w/o leading or trailing whitespace
trim <- function (x) gsub("^\\s+|\\s+$", "", x)

df2$partner.in.agreement <- trim(df2$partner.in.agreement)
## ^^ this works 

againdf <- df2[,-c(3,5:12)]

aggdf <- againdf %>% 
  group_by(Scientific.name, agreement.number, partner.in.agreement) %>%  #want to select first all the same scientific names and then individual agreeements (that way if there are multiple agreements dont sum partner actions across agreements)
  summarise_each(funs(sum)) #works as col sum 

docaddition <- aggdf

## change back to 1s and 0s 
docspef <- aggdf %>% mutate_if(is.numeric, ~1 * (. > 0)) #changed all values back to ones and zeros


######### If want to ignore different agreements the following works - (should be slightly different)

againdf <- df2[,-c(3:12)]
aggdf <- againdf %>% 
  group_by(Scientific.name, partner.in.agreement) %>%  #want to select first all the same scientific names and then individual agreeements (that way if there are multiple agreements dont sum partner actions across agreements)
  summarise_each(funs(sum)) #works as col sum 

addition <- aggdf

## change back to 1s and 0s 

nondocspef <- aggdf %>% mutate_if(is.numeric, ~1 * (. > 0)) #changed all values back to ones and zeros


############################################################################################
######### scrap work 

## stackoverflow - https://stackoverflow.com/questions/15347282/split-delimited-strings-in-a-column-and-insert-as-new-rows
trydf <- df %>% 
  mutate(partner.in.agreement = strsplit(as.character(partner.in.agreement), ",")) %>% # replace column by spliting strings
  unnest(partner.in.agreement)  #unnesting flattens it back out into regular columns 
#counting number of new partners for copperbelly water snake and campshellby burrowing crayfish - seems to have worked 

#need to remove space between commas - added trimws before strsplit 
#didn't work 

#this should remove all white space from datafram so that can do next step correctly 
#trydf <- as.data.frame(apply(trydf$partner.in.agreement,2,function(x)gsub('\\s+', '',x)))
# issue was that this removed internal white space across entire df 

# returns string w/o leading whitespace
trim.leading <- function (x)  sub("^\\s+", "", x)

# returns string w/o trailing whitespace
trim.trailing <- function (x) sub("\\s+$", "", x)

trydf <- trim.trailing(trydf$partner.in.agreement)

trydf <- trim.trailing(trydf$partner.in.agreement)

#trydf <- noquote(trydf$partner.in.agreement)
#trydf <- as.factor(trydf$partner.in.agreement)
#trydf <- paste0(trydf)

#look at actions 
#remove character columns not being used in summary 
againdf <- trydf[,-c(3,5:12)]

aggdf <- againdf %>% 
  group_by(Scientific.name, agreement.number, partner.in.agreement) %>%  #want to select first all the same scientific names and then individual agreeements (that way if there are multiple agreements dont sum partner actions across agreements)
  # distinct() %>%  #select partners that are not distinct
  # summarise_all(funs(sum)) ## add numeric values in columns (not this only work if all values that are not in groupby are numeric)
  #this might work better bc can specify which columns and what to do 
  #%>% 
  summarise_all(funs(trimws(paste(., collapse = ''))))
# if interested in the number of each partner and 1s and 0 provided by each the following also works but is less applicable 




#issue is that if characters have slight difference eg " BLM" vs BLM won't combine
# resolved by removing white space 

#then would need to go through and add vales in cells 
library(gsubfn)

dat[] <- as.numeric(gsubfn('([0-9]+)\\+([0-9]+)', 
                           ~as.numeric(x)+as.numeric(y), as.matrix(aggdf)))

dat[] <- lapply(aggdf, function(x) as.numeric(gsubfn('([0-9]+)\\+([0-9]+)', 
                                                     ~as.numeric(x)+as.numeric(y),  as.character(x))))


s <- trimws(strsplit(df$partner.in.agreement, split = ","))
data.frame(V1 = rep(df$V1, sapply(s, length)), V2 = unlist(s))