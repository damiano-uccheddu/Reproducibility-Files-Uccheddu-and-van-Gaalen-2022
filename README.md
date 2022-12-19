# Reproducibility Files

### Uccheddu, D., & van Gaalen, R. (__2022__). Children’s strains, parents’ pains? How adult children’s union dissolution influences older parents’ health. *Journal of Family Research*. https://doi.org/10.20377/jfr-774 



# Instructions: 

1. Unzip the folder "_ALL DATA (ORIGINAL DATASETS) - Stata converted.zip" in the working directory "[...]\Replication Material\Dataset\Input"
2. Open the master do-file "0. Master do-file.do" from the folder "[...]\Replication Material\Data Analysis\Code\0. Master do-file"
3. Change all the paths to match your own computer's paths (rows from 70 to 160 in master the do-file). A typical example would be to replace "\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\ado\plus" with "C:\Users\[...]\Replication Material\ado\plus"
4. To replicate all the analyses, run the do-file "0. Master do-file.do" from the folder "[...]\Replication Material\Data Analysis\Code\0. Master do-file"

# Data avilability
The   System   of   Social-statistical   Datasets   (SSD)   microdata   can   be   accessed   via   the   following   link:   https://www.cbs.nl/en-gb/onze-diensten/customised-services-microdata/microdata-conducting-your-own-research.   The   SSD   microdata   was   analysed   via   a   secure   internet   connection   (Remote   Access)   (https://www.cbs.nl/en-gb/our-services/customised-services-microdata/microdata-conducting-your-own-research/rules-and-sanctioning-policy)  after  receiving  authorization  from  Statistics  Netherlands  (CBS).  For  further details regarding CBS microdata access, please send an email to: microdata@cbs.nl. 

The Survey of Health, Ageing and Retirement in Europe (SHARE) data are distributed by SHARE-ERIC (Survey  of  Health,  Ageing  and  Retirement  in  Europe  –   European  Research  Infrastructure  Consortium)  to  registered  users  through  the  SHARE  Research  Data  Center.  The  official  SHARE  Research  Data  Center  website (https://releases.sharedataportal.eu/users/login) is the sole online access point to the SHARE data. Here  SHARE  users  can  download  the  SHARE  data  after  a  successful  registration.  For  further  details  regarding SHARE microdata access, please visit http://www.share-project.org/data-access.html. 


# Notes:

- The do-file "0. Master do-file.do" contains the commands to create the datasets and run the analysis;

- The do-file "1.0. Data preparation (SHARE labels and attributes).do" contains the necessary commands to create other do-files (within the folder "[...]\1.1. Data preparation (SHARE labels and attributes)") which allow exporting all the appropriate labels from each single original SHARE dataset. The SHARE datasets provided by CBS were unlabeled, and that was the reason why we had to create these do-files.

- The do-files contained in "[...]\1.1. Data preparation (SHARE labels and attributes)" will restore all the original descriptive attributes of each SHARE variable (e.g., the labels)

- The do-file "1.2. Data preparation (SHARE labels and attributes).do" imports the .csv SHARE datasets (created by CBS), restore all the original descriptive attributes of their variables (running all the do-files contained in "[...]\1.1. Data preparation (SHARE labels and attributes)"), and saves for each .csv file a new .dta dataset (hence, from comma-separated files to the appropriate Stata file type)

- The do-file "2. Dataset Creation.do" extracts and recode variables from each SHARE module, it merges SHARE modules per wave, it appends SHARE waves to panel long format, it fixes and (re)generates some variables, defines some labels, etc.. In addition, it extracts and recode variables from each CBS module and it merges SHARE data with CBS data in a long format ready for the longitudinal analysis. 

- The do file "3. Data Analysis.do" creates some new variables, performs the Multivariate Imputation by Chained Equations (MICE), and carry out the statistical analyses. The do-file contains tasks that take a long time to complete (more than 4 hours)

- The tables will be showed in the .txt files contained within the folder "[...]\Replication Material\Data Analysis\Output folder\Tables"

- The figures will be showed in the folder "[...]\Replication Material\Data Analysis\Output folder\Figures"

## Codebooks and questionnaires: 
### SHARE
- Original questionnaires can be found at http://www.share-project.org/data-documentation/questionnaires.html. 
- Original codebooks can be found at https://www.share-datadocutool.org 

### SSD
- Original codebooks can be found at https://www.cbs.nl/nl-nl/onze-diensten/maatwerk-en-microdata/microdata-zelf-onderzoek-doen/catalogus-microdata 


## Data & Sample
This paper uses data from two sources: the Survey of Health, Ageing and Retirement in Europe (SHARE) and the System of Social-statistical Datasets (SSD). 

1)	Survey of Health, Ageing and Retirement in Europe (SHARE) - Version: SHARE Release 6.1.0. 

    SHARE Waves 1, 2, 4, and 5 (DOIs: 
    https://doi.org/10.6103/SHARE.w1.610,  
    https://doi.org/10.6103/SHARE.w2.610, 
    https://doi.org/10.6103/SHARE.w4.610, 
    https://doi.org/10.6103/SHARE.w5.610). 

    SHARE data can be retrieved from https://share-project.centerdata.nl/sharedatadissemination/users/login (on 22 Oct. 21)


2)	System of Social-statistical Datasets (SSD) - Bakker, Bart F. M., Johan van Rooijen, and Leo van Toor. “The System of Social Statistical Datasets of Statistics Netherlands: An Integral Approach to the Production of Register-Based Social Statistics.” Statistical Journal of the IAOS 30, no. 4 (January 1, 2014): 411–24. https://doi.org/10.3233/SJI-140803.

    Version: 8-1-2020. Please consult Stelsel van Sociaal-statistische Bestanden (SSB) (https://www.cbs.nl/)
    SSD data can be retrieved via the following link: Microdata: Conducting your own research (https://www.cbs.nl/). 

    The SSD microdata was analysed via a secure internet connection (Remote Access), after receiving authorization from Statistics Netherlands (CBS). The attached document “GAP_ScheidenNIDI.docm” includes the form that has been filled in to access the data. 

    More details regarding CBS data access can be found at the following web address: https://www.cbs.nl/en-gb/onze-diensten/customised-services-microdata/microdata-conducting-your-own-research. 

    For further information: microdata@cbs.nl.


