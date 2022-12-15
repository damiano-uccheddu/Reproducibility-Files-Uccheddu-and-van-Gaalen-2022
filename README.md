# Reproducibility Files

### Uccheddu, D., & van Gaalen, R. (__2022__). *Children’s strains, parents’ pains? How adult children’s union dissolution influences older parents’ health*. Journal of Family Research. https://doi.org/10.20377/jfr-774 



# Instructions: 

1. Unzip the folder "_ALL DATA (ORIGINAL DATASETS) - Stata converted.zip" in the working directory "[...]\Replication Material\Dataset\Input"
2. Open the master do-file "0. Master do-file.do" from the folder "[...]\Replication Material\Data Analysis\Code\0. Master do-file"
3. Change all the paths to match your own computer's paths (rows from 70 to 160 in master the do-file). A typical example would be to replace "\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\ado\plus" with "C:\Users\[...]\Replication Material\ado\plus"
4. To replicate all the analyses, run the do-file "0. Master do-file.do" from the folder "[...]\Replication Material\Data Analysis\Code\0. Master do-file"


# Notes:

- The do-file "0. Master do-file.do" contains the commands to create the datasets and run the analysis;

- The do-file "1.0. Data preparation (SHARE labels and attributes).do" contains the necessary commands to create other do-files (within the folder "[...]\1.1. Data preparation (SHARE labels and attributes)") which allow exporting all the appropriate labels from each single original SHARE dataset. The SHARE datasets provided by CBS were unlabeled, and that was the reason why we had to create these do-files.

- The do-files contained in "[...]\1.1. Data preparation (SHARE labels and attributes)" will restore all the original descriptive attributes of each SHARE variable (e.g., the labels)

- The do-file "1.2. Data preparation (SHARE labels and attributes).do" imports the .csv SHARE datasets (created by CBS), restore all the original descriptive attributes of their variables (running all the do-files contained in "[...]\1.1. Data preparation (SHARE labels and attributes)"), and saves for each .csv file a new .dta dataset (hence, from comma-separated files to the appropriate Stata file type)

- The do-file "2. Dataset Creation.do" extracts and recode variables from each SHARE module, it merges SHARE modules per wave, it appends SHARE waves to panel long format, it fixes and (re)generates some variables, defines some labels, etc.. In addition, it extracts and recode variables from each CBS module and it merges SHARE data with CBS data in a long format ready for the longitudinal analysis. 

- The do file "3. Data Analysis.do" creates some new variables, performs the Multivariate Imputation by Chained Equations (MICE), and carry out the statistical analyses. The do-file contains tasks that take a long time to complete (more than 4 hours)

- The tables will be showed in the .txt files contained within the folder "[...]\Replication Material\Data Analysis\Output folder\Tables"

- The figures will be showed in the folder "[...]\Replication Material\Data Analysis\Output folder\Figures"
