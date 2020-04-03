# partner_rff

## Project Overview 
The recovery of threatened species often relies on the formation of partnerships that contribute to the recovery process by providing resources, management, incentives and encouraging behavior or learning. Efficient recovery planning needs to be able to consider existing partnerships and know when to strategically develop new ones. In this context, the main challenge is a lack of information on which organizations are partnering on species recovery, how common partnership are and the degree to which they vary across different types of species and recovery initiatives. One situation where partners are explicitly acknowledged is when species are precluded from listing because of proactive conservation measures. While partnerships across the Endangered Species Act listed species may differ, focusing on the precluded species list offers an opportunity to explore partnerships and incorporate findings into conservation planning. The goal of this study is to explore the presence and activities of partnerships between organizations that are engaged in threatened species conservation actions. In this study, we aim to characters partnerships within precluded species and identify who the partners are as well as their different roles in species recovery. This research has been spearheaded by Resources for the Future, an independent nonprofit research institution that seeks to improve resource decisions through research and policy engagement. My thesis will be a product of a collaborative effort to explore whether the number of partners relate to species or recovery programs characteristics. 

##File structure 
  ## data folder
    ### contains raw data used for analysis 
    ### archieve folder
      #### older data that is no longer used for coding is stored here
  ## documents folder
      ### A mizture of summary notes and other files not involved in code but that provide supplementary material 
  ## functions folder
      ### r-scripts that run functions 
        #### functions include: 
          ##### FormatData.R - used to clean partner names and run loop to dummy code names
          ##### cleaning_salafsky.R - used to clean partner names in salafsky analysis 
  ## output folder
      ### functions and rmd produce csv files and these files are saved here. Some called back into other rmds 

##Document types 
  ### tend to be rmd and r-scripts
  ### r-scripts can be a mixture of functions and scrap work. 
  ### rmd run functions and have larger analysis 

##Management information 

-------------------
GENERAL INFORMATION
-------------------

Title of Dataset: Partnerships in ESA recovery

Author Information (Name, Institution, Address, Email)

	Principal Investigator: Gwen Iacona
	Associate or Co-investigator: Rebecca Epanchin-Niell Annabelle Stanley
	Alternate Contact(s): Annabelle Stanley

Date of data collection (single date, range, approximate date): Start: 2019-06-03 [Year-Month-Date] End: ??

Geographic location of data collection: <City, State, County, Country and/or GPS Coordinates or bounding boxes> 
Washington DC, NY, USA and Ithaca, NY, USA 

Information about funding sources or sponsorship that supported the collection of the data:
???? 

--------------------------
SHARING/ACCESS INFORMATION
-------------------------- 

Licenses/restrictions placed on the data, or limitations of reuse:

Recommended citation for the data:

Citation for and links to publications that cite or use the data:

Links to other publicly accessible locations of the data:

Links/relationships to ancillary or related data sets: 
- RFF archive probably has other work related to ESA list - worth including these? 

--------------------
DATA & FILE OVERVIEW
--------------------

File list (filenames, directory structure (for zipped files) and brief description of all data files):
 - Github structure 
	- data
		- #all excel and csv files being used in the analysis
		- achieve 
			- # all excel and cvv files created during research gathering 
			- # i.e. data 1, data 2
	- documents
		- # word or writen documents related to research 
	- functions
		- Data cleaning documents that are used (as clean data) in later code
	- outputs
		- Finished data code? 

- File naming structure 
	- I don’t think there is one, should we change this? 

Relationship between files, if important for context:  
 - AS_number is main form of gathered data
 - Most csv files tend to consist of a single excel sheet that was changed to csv

Additional related data collected that was not included in the current data package:

If data was derived from another source, list source:
 - Original list of precluded species provided by Julie ? at the US Fish and Wildlife Service

If there are there multiple versions of the dataset, list the file updated, when and why update was made:
- ???

--------------------------
METHODOLOGICAL INFORMATION
--------------------------

Description of methods used for collection/generation of data: <Include links or references to publications or other documentation containing experimental design or protocols used in data collection>

Methods for processing the data: <describe how the submitted data were generated from the raw or collected data>

Software- or Instrument-specific information needed to interpret the data, including software and hardware version numbers:

Standards and calibration information, if appropriate:

Environmental/experimental conditions:

Describe any quality-assurance procedures performed on the data:

People involved with sample collection, processing, analysis and/or submission:


--------------------------
DATA-SPECIFIC INFORMATION <Create sections for each datafile or set, as appropriate>
--------------------------

Number of variables:
- For original data set: 

Number of cases/rows: 
 - Data set began with 90 rows (for the 90 precluded species)
 - Has since been reduced initially in the first data set and then in the second (salafsky) as information was missing for species 

Variable list, defining any abbreviations, units of measure, codes or symbols used:
- For original data set
	- Scientific name
	- Common name
	- New notes on changes being made 
	- Conservation Plan_1
	- Conservation Plan_2
	- Conservation Plan_3
	- PROGRAMS, JULIE NOTES (if conflicting with FWS program)
	- notes_contribute_Julie
	- New additional information
	- notes_all
	- notes_CP1
	- Partners present?_CP1
	- Partner identity CP1
	- partner activities CP1
	- CP1_docs
	- notes_CP2
	- Partners present? CP2
	- Partner identity _CP2 
	- partner activities_CP2
	- CP2_docs	
	- notes_CP3
	- Partners present? CP33
	- Partner identity _CP3
	- partner activities_CP3
	- CP3_docs

This was then condensed into a new dataset called total data with the following variables 
	- 

- Salafsky 
	- Scientific name
	- Common name
	- agreement number 
	- partner in agreement
	- Note if plan is management area (and relevance to the species if information is present)
	- Programatic (Y/N)
	- type of partners: (Signatory for agreements that have been signed = S; Cooperator = C; added for conservation action = A; private landowner = P; Multiple signatories in column/joint actions = M, Generic partner nothing signed for non CCA or CCAA = G) - --> see word doc for undated ones 
	- doc link
	- notes on actions taken (from notes tab)
	- Don't know how to categorize action - dump text here
	- 1. Land/Water Management
	- 2. Species Management
	- 3. Awareness raising
	- 4. law enforcement and prosecution (detection and arrest/criminal prosecution & conviction/ non criminal legal action)
	- 5. livelihood, economic and moral incentrives
	- 6. Conservation Design and Planning (was - Land/Water Protections) --> planning activities devlopment/implementation
	- 7. Legal and Policy frameworks (laws, regulations and codes/ policies and guidelines)
	- 8. Research and monitoring
	- 9. Education and Training
	- 10. Institutional Development (was External capacity building)
	- funding 
 
Missing data codes: 
- In original data set, this was either a “ “, 0 or left blank (read in as NA). During data processing, these were all converted to NA 

Specialized formats or other abbreviations used:
