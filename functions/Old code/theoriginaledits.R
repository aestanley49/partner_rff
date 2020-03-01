 <- function(RawData){ # inside the parenthesis indicates what the function needs to work. These are specified in the main MD document
  
  ## this function takes the raw data and formats it into something more useful for later analyses
  # I put some of your "sums code.Rmd" code in this function
  
  #dim(RawData)
  #head(RawData)   ## just looking at the dataset
  
  
  ## Data tidying
  #names(RawData) 
  #View(RawData$`Who the partners are`)
  
  ## 0. Remove empty column
  RawData$X5 <- NULL
  
  ## 1. Replace "N/A" with NA so that fields with no data all behave the same
  
  RawData[which(RawData$`Who the partners are` =="N/A"),5] <- NA # 5 is the column called 'Who the partner are'. I called it this way to avoid writing but it is less safe if things move around // note this changed when other dataset was read in 
  #which(is.na(RawData$`Who the partners are`)) # Check to make sure it worked
  
  ## 2. Manually change spelling errors
  
  RawData$`Who the partners are`[4] <- "Montana Department of Fish Wildlife and Parks, USFWS, BLM, Montana Department of Natural Resources and Conservation"
  RawData$`Who the partners are`[8] <- "Kentucky Ecological Services Field Office, Owner of the Beaver Cave property,  Kentucky Department of Fish and Wildlife Resources,  Natural Resources Conservation Service,  Farm Service Agency,  Kentucky State Nature Preserves Commission,  Kentucky Division of Forestry"
  RawData$`Who the partners are`[10] <- "California Department of Fish and Game, California Department of Forestry and Fire Protection, California Department of Parks and Recreation, Center for Natural Lands Management, City of Riverside Park and Recreation Department, Metropolitan Water District, Riverside County Environmental Programs Department, Riverside County Habitat Conservation Agency, Riverside County Regional Park and Open-Space District, Riverside Land Conservancy, San Diego State University Field Stations Program, The Nature Conservancy, University of California Riverside, BLM, USFWS, USFS, US Navy, US Marine Corps, US Customs and Border Protection, California State Parks"
  RawData$`Who the partners are`[11] <- "Mississippi Army National Guard, USFS, Mississippi Department of Wildlife Fisheries and Parks, USFWS"
  RawData$`Who the partners are`[12] <- "Nevada Department of Conservation and Natural Resources, Clark County, USFS, USFWS, BLM, NPS, Nevada Department of Wildlife, Nevada Department of Transportation, Nevada Division of State Parks, U.S. Air Force, Boulder City"
  RawData$`Who the partners are`[14] <- "Nevada Department of Conservation and Natural Resources, Clark County, USFS, USFWS, BLM, NPS, Nevada Department of Wildlife, Nevada Department of Transportation, Nevada Division of State Parks, U.S. Air Force, Boulder City"
  RawData$`Who the partners are`[19] <- "Indiana Coal Council, Indiana Department of Natural Resources, USFWS, Kentucky Department of Fish and Wildlife Resources, Kentucky Coal Association, Kentucky Coal Country Association, Kentucky Farm Bureau, Kentucky Natural Resources and Environmental Cabinet, Western Kentucky Coal Association, Office of Surface Mining reclamation and Enforcement"
  RawData$`Who the partners are`[20] <- "Utah Division of Parks and Recreation, BLM, USFWS, Kane County"
  RawData$`Who the partners are`[21] <- "private landowners of Cow Head Lake, private landowners of Cow Head Slough, private landowners of the California reach of Barrel Creek, California and Modoc County Cattlemen’s Associations, California Farm Bureau Federation, BLM, California Department of Fish and Game"
  RawData$`Who the partners are`[24] <- "USFWS, BLM, Center of Excellence for Hazardous Materials Management, Natural Resources Conservation Service, Texas A&M University, Texas Comptroller of Public Accounts, Texas Interagency Task Force on Economic Growth and Endangered Species, Texas Department of Agriculture, Texas Parks and Wildlife Department, Railroad Commission of Texas, University of Texas System - University Lands, Texas Farm Bureau, Texas Oil and Gas Association, Texas Royalty Council, Texas and Southwestern Cattle Raisers Association, Texas Wildlife Association, Texas Association of Business"
  RawData$`Who the partners are`[26] <- "Nevada Department of Wildlife, NPS, BLM, USFWS, Nevada Natural Heritage Program, The Nature Conservancy, Desert Research Institute"
  RawData$`Who the partners are`[27] <- "Anza-Borrego State Park, Arizona Game and Fish Department, California Department of Fish and Game, California State Parks, Ocotillo Wells State Vehicular Recreation Area, BLM, U.S. Bureau of Reclamation, USFWS, U.S. Marine Corps Air Station, U.S. Naval Air Facility, U.S. Navy SW Division, The Arizona Department of Water Resources, Arizona Electric Power Cooperative Inc., Arizona Game and Fish Commission, Arizona Power Authority, Central Arizona Water Conservation District, Cibola Valley Irrigation and Drainage District, City of Bullhead City, City of Lake Havasu City, City of Mesa, City of Somerton, City of Yuma, Electrical District No. 3 Pinal County Arizona, Golden Shores Water Conservation District, Mohave County Water Authority, Mohave Valley Irrigation and Drainage District, Mohave Water Conservation District, North Gila Valley Irrigation and Drainage District, Salt River Project Agricultural Improvement and Power District, Town of Fredonia, Town of Thatcher, Town of Wickenburg, Unit ‚ÄúB‚Äù Irrigation and Drainage District, Wellton-Mohawk Irrigation and Drainage District, Yuma County Water Users‚Äô Association; Yuma Irrigation District, Yuma Mesa Irrigation and Drainage District, City of Needles, Coachella Valley Water District, Colorado River Board of California, Imperial Irrigation District, Los Angeles Department of Water and Power, Palo Verde Irrigation District, San Diego County Water Authority, Southern California Edison Company, the Southern California Public Power Authority, Bard Water District, Metropolitan Water District of Southern California, NPS, Bureau of Indian Affairs, Western Area Power Administration (Western), Colorado River Commission of Nevada, Nevada Department of Wildlife, Basic Water Company, Southern Nevada Water Authority"
  RawData$`Who the partners are`[29] <- "BLM, Wyoming Natural Diversity Database"
  RawData$`Who the partners are`[31] <- "USFWS, Clemson University, Georgia Department of Natural Resources, Georgia Department of Transportation, Georgia Power, Mecklenburg County Park and Recreation North Carolina, NPS, North Carolina Department of Agriculture & Consumer Services Plant Conservation Program, USFS"
  RawData$`Who the partners are`[32] <- "BLM, USFWS"
  RawData$`Who the partners are`[33] <- "Uintah County, Rio Blanco County, Utah School and Institutional Trust Lands Administration, Utah Governor’s Public Lands Policy Coordination Office, Utah Division of Wildlife Resources, BLM, USFWS"
  RawData$`Who the partners are`[46] <- "USFWS,  USFS,  California Department of Fish and Game,  John Hancock Mutual Life Insurace Company,  Bob McIntsh (Private landowner),  Sierra Pacific Industries, Hearest Corporation,  Siskiyou County Board of Supervisors"
  RawData$`Who the partners are`[47] <- "USFS, BLM, California Department of Transportation (caltrans), California Department of Fish and Wildlife, Pacific Gas and Electric"
  ##NPS sign or this park?   
  RawData$`Who the partners are`[49] <- "Department of Forest and Rangeland Stewardship Colorado State University, Desert Research Institute, U.S. National Park Service Death Valley National Park"
  RawData$`Who the partners are`[50] <- "USGS, Natural Resources Conservation Service, USFWS, Mashpee Wampanoag Tribe, Lyme Land Conservation Trust, American Forest Foundation, Woodcock Limited, WCS Queens Zoo, Wells National Esturarine Research Reserve, Roger Williams Park Zoo, Audubon Connecticut, Connecticut Audubon Society, Open Space Institute, Audubon New York, Quail Forever, Pheasants Forever, Doris Duke Charitable Foundation, Wildlife Conservation Society, Amrican Bird Conservancy, Quality Deer Management Association, Sustainable Forestry Initiative, White Memorial Foundation, National Fish and Wildlife Foundation, Ruffed Grouse Society/American Woodcock Society, National Wild Turkey Federation, Wildlife Management Institute, New Engalnd Cottontail Conservation Initiative, Northeast Forest and Fire Management, Lyme Timber Company, Monterey Preservation Land Trust, Narrow River Land Trust, Nantucket Conservation Foundation, Scarborough Land Trust, Avalonia Land Conservancy, Orenda Wildlife Land Trust, Trustees of Reservations, Berkshire Natural Resources Council, York Land Trust, Becket Land Trust, Trust for Public Land, Massachusetts National Guard, New York Division of Fish Wildlife and Marine Resources, Northeast Association of Fish and Wildlife Agencies, Rhode Island Division of Fish and Wildlife, Connecticute Department of Energy and Environmental Protection, Massachusetts Division of Fisheries and Wildlife, New Hampshire Fish and Game Department, Maine Department of Inland Fisheries and Wildlife, University of Rhode Island College of Envionment and Life Sciences, University of New Hampshire, University of New Hampshire Cooperative Extenson, New Hampshire Fish and Game Department"
  RawData$`Who the partners are`[52] <- "City of NCCP, USFWS, California Department of Fish and Game, California Resources Agency"
  RawData$`Who the partners are`[60] <- "Colorado Parks and Wildlife, New Mexico Department of Game and Fish, USFS, USFWS, Mescalero Apache Nation, Jicarilla Apache Nation, Taos Pueblo, NPS, BLM,  Trout Unlimited, Vermejo Park Ranch, Colorado Division of Parks and Wildlife"
  RawData$`Who the partners are`[66] <- "California Department of Fish and Game, San Diego Gas and Electric Company, USFWS"
  RawData$`Who the partners are`[68] <- "Office of Species Conservation,  Idaho Department of Fish and Game,  Idaho Department of Lands,  Idaho Army National Guard,  Nongovernmental Cooperator Representative,  Nongovernmental Cooperator Representative, BLM"
  RawData$`Who the partners are`[70] <- "Idaho Department of Fish and Game, Idaho Governor's Office of Species Conservation, USFWS, Soulen Livestock Company Inc. (Soulen Livestock)."
  RawData$`Who the partners are`[77] <- "California Department of Fish and Wildlife, California State Lands Commission, California Department of Parks and Recreation, California Tahoe Conservancy, League to Save Lake Tahoe, Nevada Division of Forestry, Nevada Division of State Lands, Nevada Division of State Parks, Nevada Natural Heritage Program, Tahoe Lakefront Owners’ Association, Tahoe Regional Planning Agency, USFWS, USFS, California Department of Fish and Wildlife, California State Lands Commission, California Department of Parks and Recreation, California Tahoe Conservancy, League to Save Lake Tahoe"
  RawData$`Who the partners are`[80] <- "USDA, USFWS, BLM"
  RawData$`Who the partners are`[81] <- "USFWS,  Montana State University,  Montana Fish Wildlife and Parks"
  RawData$`Who the partners are`[82] <- "Foster Creek Conservation District, Threemile Canyon Farms, The Nature Conservancy,  General Electric, USFWS"
  RawData$`Who the partners are`[86] <- "USFS,  USFWS,  Arizona Game and Fish Department"
  RawData$`Who the partners are`[87] <- "Uintah County, Rio Blanco County,  Utah School and Institutional Trust Lands Administration, Utah Governor’s Public Lands Policy Coordination Office, Utah Division of Wildlife Resources, BLM, USFWS"
  RawData$`Who the partners are`[88] <- "USFS, NPS,  Utah State Office , USFWS, BLM"
  
  write.csv(RawData,paste(DataSource,"/EditedData.csv", sep = "")) # save the edited file to the data repository (could also go in output repository)
  
  EditedData<- RawData # can also use this location to make a logical to call up the saved file if you don't want to do all the processing again
  
  ## 3. format dataset so that there is a column for each partner and a 1 in the column if the species is worked on by that partner
  
  # need to drop the rows with NA first so split works properly
  
  View(EditedData)
  
  EditedData <- EditedData[-which(is.na(EditedData$`Who the partners are`)),] # here i deleted all the rows with an NA
  
  for (i in 1:nrow(EditedData)) {
    dvec <- trimws(strsplit(EditedData$`Who the partners are`[i],split=",")[[1]])
    for (dname in dvec) {
      if (dname%in%colnames(EditedData)) {
        EditedData[i, dname] <- 1              
      } else {
        EditedData[dname] <- 0
        EditedData[i, dname] <- 1                                    
      }
    }
  }
  
  ## 4. Save file that only has the partner info and the names
  
  #names(EditedData) # to see what the column names are
  
  EditedData2 <- EditedData[,c(1,2,8:249)]
  
  write.csv(RawData,paste(DataSource,"/PartnersData.csv", sep = ""))
  
  #View(EditedData2)
  
  PartnersData <- EditedData2
  
  return(PartnersData) # return indicates what will get spit out of the function and what will be accessible in the MD doc
  
}
