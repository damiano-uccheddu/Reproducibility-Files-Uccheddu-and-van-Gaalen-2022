/*____/\\\\\\\\\\\___  __/\\\________/\\\_  _____/\\\\\\\\\____  ____/\\\\\\\\\_____  __/\\\\\\\\\\\\\\\_             
* ___/\\\/////////\\\_  _\/\\\_______\/\\\_  ___/\\\\\\\\\\\\\__  __/\\\///////\\\___  _\/\\\///////////__            
*  __\//\\\______\///__  _\/\\\_______\/\\\_  __/\\\/////////\\\_  _\/\\\_____\/\\\___  _\/\\\_____________           
*   ___\////\\\_________  _\/\\\\\\\\\\\\\\\_  _\/\\\_______\/\\\_  _\/\\\\\\\\\\\/____  _\/\\\\\\\\\\\_____          
*    ______\////\\\______  _\/\\\/////////\\\_  _\/\\\\\\\\\\\\\\\_  _\/\\\//////\\\____  _\/\\\///////______         
*     _________\////\\\___  _\/\\\_______\/\\\_  _\/\\\/////////\\\_  _\/\\\____\//\\\___  _\/\\\_____________        
*      __/\\\______\//\\\__  _\/\\\_______\/\\\_  _\/\\\_______\/\\\_  _\/\\\_____\//\\\__  _\/\\\_____________       
*       _\///\\\\\\\\\\\/___  _\/\\\_______\/\\\_  _\/\\\_______\/\\\_  _\/\\\______\//\\\_  _\/\\\\\\\\\\\\\\\_      
*        ___\///////////_____  _\///________\///__  _\///________\///__  _\///________\///__  _\///////////////__     
*                                       __                       _                            _  _           _        
*                                      (_     __    _  \/    _ _|_   |_| _  _  | _|_|_       |_|(_| _  o __ (_|       
*                                      __)|_| | \_/(/_ /    (_) |    | |(/_(_| |  |_| | /    | |__|(/_ | | |__|       
*                                                   _                                         __          _           
*                                       _ __  _|   |_) _ _|_ o  __ _ __  _ __ _|_    o __    |_     __ _ |_) _        
*                                      (_|| |(_|   | \(/_ |_ |  | (/_|||(/_| | |_    | | |   |__|_| | (_)|  (/_       
*
******************************************************************************************************************

Replication code

* Uccheddu, Damiano and Ruben van Gaalen. "Children's Strains, Parents' Pains? How Adult Children's Union Dissolution Influences Older Parents' Health" 
* Paper submitted to the Journal of Family Research (JFR). Submission URL: https://ubp.uni-bamberg.de/jfr/index.php/jfr/authorDashboard/submission/774 

		//Index\\
*----	[ 0. Preliminary settings]-------------------------------------------------------------------------------*
*----	[ 1. Define paths]---------------------------------------------------------------------------------------*
*----	[ 2. Run the do-files]-----------------------------------------------------------------------------------*
*----	[ 3. Close]----------------------------------------------------------------------------------------------*

******************************************************************************************************************/



*----	[ 0. Preliminary settings]-------------------------------------------------------------------------------*

cls 
clear
clear matrix
clear mata 
set max_memory 	.		, permanently
set maxvar 		120000	, permanently
set logtype text
set more off
capture log close 
capture macro drop _all 	
version 16.1

*>> Timestamps
*	The program "timestamp_start" will start the timer
capture program drop timestamp_start
program define timestamp_start
display "$S_TIME  $S_DATE"
timer clear
timer on 1
end

*	The program "timestamp_stop" will stop the timer
capture program drop timestamp_stop
program define timestamp_stop
display "$S_TIME  $S_DATE"
timer off 1
timer list 1
end



*----	[ 1. Define paths]---------------------------------------------------------------------------------------*

*>> Macros for the Ado files directories
sysdir set PLUS 		"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\ado\plus"
sysdir set PERSONAL 	"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\ado\personal"

*>> Macros for file save locations
*	Log files 
global logfolder 		"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Data Analysis\Log folder"

*	Codebook
global codebook 		"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Data Analysis\Output folder\Codebook"



*>> Macros for dataset locations
	* 	Dataset input (here we have the original data)
		* SHARE data
global share_in 		"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Input\SHARE"
global share_w1_in  	"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Input\SHARE\WAVE1" 
global share_w2_in  	"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Input\SHARE\WAVE2"
global share_w3_in  	"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Input\SHARE\WAVE3"
global share_w4_in  	"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Input\SHARE\WAVE4" 
global share_w5_in  	"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Input\SHARE\WAVE5"
global share_wX_in  	"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Input\SHARE\WAVEX"

		* CBS data
global cbs_filePop_in	"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Input\Stata - Converted - File_POPULATIE" 
global cbs_file1_in		"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Input\File1\Stata - Converted"
global cbs_file2_in		"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Input\File2\Stata - Converted"
global cbs_file3_in		"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Input\File3\Stata - Converted"
global cbs_file4_in		"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Input\File4\Stata - Converted"
global cbs_file5_in		"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Input\File5\Stata - Converted"
global cbs_file6_in		"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Input\File6\Stata - Converted"
global cbs_file7_in		"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Input\File7\Stata - Converted"
global cbs_file8_in		"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Input\File8\Stata - Converted"
global cbs_file9_in		"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Input\File9\Stata - Converted"
global cbs_file10_in	"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Input\File10\Stata - Converted"
global cbs_file11_in	"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Input\File11\Stata - Converted"
global cbs_file12_in	"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Input\File12\Stata - Converted"

	* 	Dataset output (here we have the new created data [e.g. the data for the analysis])
		* SHARE data
global share_w1_out  	"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Output\SHARE\w1" 
global share_w2_out  	"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Output\SHARE\w2"
global share_w3_out  	"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Output\SHARE\w3"
global share_w4_out  	"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Output\SHARE\w4" 
global share_w5_out  	"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Output\SHARE\w5"
global share_wX_out  	"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Output\SHARE\wX"
global share_all_out 	"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Output\SHARE\W_All"

		* CBS data
global cbs_filePop_out	"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Output\CBS\Stata - Converted - File_POPULATIE" 
global cbs_file1_out	"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Output\CBS\File 1"
global cbs_file2_out	"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Output\CBS\File 2"
global cbs_file3_out	"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Output\CBS\File 3"
global cbs_file4_out	"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Output\CBS\File 4"
global cbs_file5_out	"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Output\CBS\File 5"
global cbs_file6_out	"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Output\CBS\File 6"
global cbs_file7_out	"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Output\CBS\File 7" 
global cbs_file8_out	"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Output\CBS\File 8" 
global cbs_file9_out	"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Output\CBS\File 9" 
global cbs_file10_out	"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Output\CBS\File 10" 
global cbs_file11_out	"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Output\CBS\File 11" 
global cbs_file12_out	"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Output\CBS\File 12" 

		* Merged data
global merged_cbs_share_out "\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Dataset\Output\Merged CBS-SHARE"

*>> Macros for tables and figures saving locations 
* 	Tables
global tables_out  		"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Data Analysis\Output folder\Tables"

* 	Figures 
global figure_out 		"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Data Analysis\Output folder\Figures"



*>> Macros for do-files
	*	Dataset Preparation
			* Export all the appropriate labels and attributes from each single original SHARE dataset
global dataset_preparation10 "\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Data Analysis\Code\1.0. Data preparation (SHARE labels and attributes)"
			
			* Contains all the do-files necessary to run $dataset_preparation12"
global dataset_preparation11 "\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Data Analysis\Code\1.1. Data preparation (SHARE labels and attributes)"
			
			* Runs everything present in "$dataset_preparation11"  
global dataset_preparation12 "\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Data Analysis\Code\1.2. Data preparation (SHARE labels and attributes)"

	* 	Dataset Creation and Cleaning
global dataset_creation 	"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Data Analysis\Code\2. Dataset Creation" 	// With this do-file we extract, recode, and create new variables from each SHARE module. Then, we merge the modules and append the waves. 

	* 	Data Analysis 
global data_analysis 		"\\cbsp.nl\Productie\projecten\SES\208008SSBDIV_SEC1\Werk\NIDI-CBS\Data Analysis\Code\3. Data Analysis" 	// This do-file contains the analyses



*----	[ 2. Run the do-files]-----------------------------------------------------------------------------------*


// do "$dataset_preparation10\1.0. Data preparation (SHARE labels and attributes).do" 	// <- Save descriptive attributes of SHARE variables to a do-file

do "$dataset_preparation12\1.2. Data preparation (SHARE labels and attributes).do"  // <- Label SHARE data
do "$dataset_creation\2. Dataset Creation.do" 										// <- Create the dataset and clean the data
do "$data_analysis\3. Data Analysis.do"												// <- Run the analyses



*----	[ 3. Close]----------------------------------------------------------------------------------------------*

display "$S_TIME  $S_DATE"
timer off 1
timer list 1


