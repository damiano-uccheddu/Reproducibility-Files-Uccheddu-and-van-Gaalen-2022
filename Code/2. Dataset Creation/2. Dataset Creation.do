*>> Log file

cls
capture log close 
pause on 
log using "$logfolder\2. Dataset Creation.log", replace

*** 2. Dataset Creation

*>> Structure of the do-file 

*---- [ 1.  Preliminary settings & other]-------------------------------------------------------------------------------*
*---- [ 2.  (SHARE) Extract & Recode Variables from technical_variables]------------------------------------------------*
*---- [ 3.  (SHARE) Extract & Recode Variables from PH]-----------------------------------------------------------------*
*---- [ 4.  (SHARE) Extract & Recode Variables from MH]-----------------------------------------------------------------*
*---- [ 5.  (SHARE) Extract & Recode Variables from BR]-----------------------------------------------------------------*
*---- [ 6.  (SHARE) Extract & Recode Variables from GV_Health]----------------------------------------------------------*
*---- [ 7.  (SHARE) Extract & Recode Variables from CV_R ]--------------------------------------------------------------*
*---- [ 8.  (SHARE) Extract & Recode Variables from GV_Imputations ]----------------------------------------------------*
*---- [ 9.  (SHARE) Extract & Recode Variables from DN ]----------------------------------------------------------------*
*---- [ 9.  (SHARE) Extract & Recode Variables from CH ]----------------------------------------------------------------*
*---- [10.  (SHARE) Extract & Recode Variables from SP ]----------------------------------------------------------------*
*---- [11.  (SHARE) Extract & Recode Variables from SN ]----------------------------------------------------------------*
*---- [12.  (SHARE) Merge modules per wave ]----------------------------------------------------------------------------*
*---- [13.  (SHARE) Append waves to panel long format ]-----------------------------------------------------------------*
*---- [14.  (SHARE) Fix & (re)generate variables, labels, etc. + Long format save ]-------------------------------------*
*---- [15.  (SHARE) Merge with KOPPELCBS_SHARENL ]----------------------------------------------------------------------*
*---- [16.  (SHARE) Final Save      ]-----------------------------------------------------------------------------------*
*---- [17.     (CBS) Files "Pop."  ]------------------------------------------------------------------------------------*
*---- [17.1.      (CBS) File 1      ]-----------------------------------------------------------------------------------*
*---- [17.2.      (CBS) File 2      ]-----------------------------------------------------------------------------------*
*---- [17.3.      (CBS) File 3      ]-----------------------------------------------------------------------------------*
*---- [17.4.      (CBS) File 4      ]-----------------------------------------------------------------------------------*
*---- [17.5.      (CBS) File 5      ]-----------------------------------------------------------------------------------*
*---- [17.6.      (CBS) File 6      ]-----------------------------------------------------------------------------------*
*---- [17.7.      (CBS) File 7      ]-----------------------------------------------------------------------------------*
*---- [17.8.      (CBS) File 8      ]-----------------------------------------------------------------------------------*
*---- [17.9.      (CBS) File 9      ]-----------------------------------------------------------------------------------*
*---- [17.10.     (CBS) File 10     ]-----------------------------------------------------------------------------------*
*---- [17.11.A.   (CBS) File 11 - A ]-----------------------------------------------------------------------------------*
*---- [17.11.B.   (CBS) File 11 - B ]-----------------------------------------------------------------------------------*
*---- [17.12.A.   (CBS) File 12 - A ]-----------------------------------------------------------------------------------*
*---- [17.12.B.   (CBS) File 12 - B ]-----------------------------------------------------------------------------------*



*---- [ 1.  Preliminary settings & other]-------------------------------------------------------------------------------*

*>> Timestamp (starting)
timestamp_start 



*---- [ 2.  (SHARE) Extract & Recode Variables from technical_variables]------------------------------------------------*

*>>   WAVE 1
use "$share_w1_out\sharew1_rel6-1-0_nl_technical_variables.dta", clear  // Open the dataset

*>> Generate wave identifier  
gen wave=1  

*>> Keep only the Netherlands  
keep if country == 14 

*  Keep only variables of interest
keep           		///
Nl_mergeid_crypt 	/// Person identifier (fix across modules and waves)
country          	/// Country identifier
fam_resp         	/// Family respondent
fin_resp         	/// Financial respondent
hou_resp         	/// Household respondent
mn005_           	/// Single or couple interview
wave

*  Dataset Save
save "$share_w1_out\sharew1_technical_variables.dta", replace 

*  Codebook creation -> you can check comparability using Microsoft Spreadsheet Compare 
codebookout "$codebook\sharew1_technical_variables.xls", replace


*>>   WAVE 2
use "$share_w2_out\sharew2_rel6-1-0_nl_technical_variables.dta", clear  // Open the dataset

*>> Generate wave identifier  
gen wave=2  

*>> Keep only the Netherlands  
keep if country == 14 

*  Keep only variables of interest
keep           		///
Nl_mergeid_crypt	/// Person identifier (fix across modules and waves)
country         	/// Country identifier
fam_resp        	/// Family respondent
fin_resp        	/// Financial respondent
hou_resp        	/// Household respondent
mn005_          	/// Single or couple interview
wave

*  Dataset Save
save "$share_w2_out\sharew2_technical_variables.dta", replace 

*  Codebook creation -> you can check comparability using Microsoft Spreadsheet Compare 
codebookout "$codebook\sharew2_technical_variables.xls", replace


*>>   WAVE 4
use "$share_w4_out\sharew4_rel6-1-0_nl_technical_variables.dta", clear  // Open the dataset

*>> Generate wave identifier  
gen wave=4  

*>> Keep only the Netherlands  
keep if country == 14 

*  Keep only variables of interest
keep           			///
Nl_mergeid_crypt     	/// Person identifier (fix across modules and waves)
country  				/// Country identifier
fam_resp 				/// Family respondent
fin_resp 				/// Financial respondent
hou_resp 				/// Household respondent
mn005_   				/// Single or couple interview
wave

*  Dataset Save
save "$share_w4_out\sharew4_technical_variables.dta", replace 

*  Codebook creation -> you can check comparability using Microsoft Spreadsheet Compare 
codebookout "$codebook\sharew4_technical_variables.xls", replace



*>>   WAVE 5
use "$share_w5_out\sharew5_rel6-1-0_nl_technical_variables.dta", clear  // Open the dataset

*>> Generate wave identifier  
gen wave=5  

*>> Keep only the Netherlands  
keep if country == 14 

*  Keep only variables of interest
keep     				///
Nl_mergeid_crypt     	/// Person identifier (fix across modules and waves)
country  				/// Country identifier
fam_resp 				/// Family respondent
fin_resp 				/// Financial respondent
hou_resp 				/// Household respondent
mn005_   				/// Single or couple interview
wave

*  Dataset Save
save "$share_w5_out\sharew5_technical_variables.dta", replace 

*  Codebook creation -> you can check comparability using Microsoft Spreadsheet Compare 
codebookout "$codebook\sharew5_technical_variables.xls", replace


*---- [ 3.  (SHARE) Extract & Recode Variables from PH]-----------------------------------------------------------------*


*>>   WAVE 1
use "$share_w1_out\sharew1_rel6-1-0_nl_ph.dta", clear    // Open the dataset
gen wave=1                                // Create wave id 

*  Self-report of health variable (SRH)
*  wave 1 respondent self-report of health, creation of new variable
gen srh =.
replace srh = 1 if ph003_==1 | ph052_==1 // merging the EU version of the variable with the US version
replace srh = 2 if ph003_==2 | ph052_==2
replace srh = 3 if ph003_==3 | ph052_==3
replace srh = 4 if ph003_==4 | ph052_==4
replace srh = 5 if ph003_==5 | ph052_==5

*  Defining the label 
label define lab_health 	///
   1 "1.Excellent" 			///
   2 "2.Very good" 			///
   3 "3.Good" 				///
   4 "4.Fair" 				///
   5 "5.Poor"  

*  Label creation for SRH 
label variable srh "Self-report of health"
label values srh lab_health

*  Keep only variables of interest
keep     			///
srh      			/// Self-report of health 
ph049d3  			/// Difficulties: bathing or showering
ph049d1  			/// Difficulties: dressing, including shoes and socks
ph048d3  			/// Difficulties: getting up from chair
ph049d2  			/// Difficulties: walking across a room
ph049d4  			/// Difficulties: eating, cutting up food
ph048d7  			/// Difficulties: reaching or extending arms above shoulder
ph049d6  			/// Difficulties: using the toilet, incl getting up or down
ph048d5  			/// Difficulties: climbing one flight of stairs
ph048d9  			/// Difficulties: lifting or carrying weights over 5 kilos
ph049d9  			/// Difficulties: shopping for groceries
ph049d10    		/// Difficulties: telephone calls
ph049d12 			/// Difficulties: doing work around the house or garden
ph049d8  			/// Difficulties: preparing a hot meal
ph049d11 			/// Difficulties: taking medications
ph049d13 			/// Difficulties: managing money
ph048d1  			/// Difficulties: walking 100 metres
ph049d5  			/// Difficulties: getting in or out of bed
ph049d7     		///
ph004_ ph005_ 		/// Long-term illness
ph006d2     		/// Doctor told you had: high blood pressure or hypertension
ph006d1     		/// Doctor told you had: heart attack
ph006d4     		/// Doctor told you had: stroke
ph006d10    		/// Doctor told you had: cancer
ph006d5     		/// Doctor told you had: diabetes or high blood sugar
ph006d8     		/// Doctor told you had: arthritis
ph006d6     		/// Doctor told you had: chronic lung disease
ph006d9     		/// Doctor told you had: osteoporosis
ph006d14    		/// Doctor told you had: hip fracture or femoral fracture
ph006d12    		/// Doctor told you had: Parkinson disease
ph010d3     		/// Bothered by: breathlessness
ph010d7     		/// Bothered by: falling down
ph010d8     		/// Bothered by: fear of falling down
ph010d9     		/// Bothered by: dizziness, faints or blackouts
ph043_      		/// Eyesight distance
ph044_      		/// Eyesight reading
ph046_      		/// Hearing
ph012_      		/// Weight of respondent
ph013_      		/// Height (How tall are you?)
wave     			/// Wave number
Nl_mergeid_crypt 	// Personal identifier

*>> Encoding this variable because it is str4 in master but int in using data (when you'll do the append)
rename ph012 ph012_old 
encode ph012, gen(ph012)
drop ph012_old 

*  Dataset Save
save "$share_w1_out\sharew1_ph.dta", replace 

*  Codebook creation -> you can check comparability using Microsoft Spreadsheet Compare 
codebookout "$codebook\sharew1_ph.xls", replace

*>>   WAVE 2
use "$share_w2_out\sharew2_rel6-1-0_nl_ph.dta", clear 	// Open the dataset
gen wave=2                                				// Create wave id 

*  wave 2 respondent self-report of health
gen srh =.
replace srh = 1 if ph003_==1
replace srh = 2 if ph003_==2
replace srh = 3 if ph003_==3
replace srh = 4 if ph003_==4
replace srh = 5 if ph003_==5

*  Defining the label 
label define lab_health ///
   1 "1.Excellent"   ///
   2 "2.Very good"      ///
   3 "3.Good"        ///
   4 "4.Fair"        ///
   5 "5.Poor"  

*  Label creation for SRH 
label variable srh "Self-report of health"
label values srh lab_health

*  Recode: "Registered or legally blind" --> POOR Eyesight
recode ph043_ (6=5)
recode ph044_ (6=5)

*  Personal identifier & keep variables
keep     ///
srh      ///
ph049d3  /// Difficulties: bathing or showering
ph049d1  /// Difficulties: dressing, including shoes and socks
ph048d3  /// Difficulties: getting up from chair
ph049d2  /// Difficulties: walking across a room
ph049d4  /// Difficulties: eating, cutting up food
ph048d7  /// Difficulties: reaching or extending arms above shoulder
ph049d6  /// Difficulties: using the toilet, incl getting up or down
ph048d5  /// Difficulties: climbing one flight of stairs
ph048d9  /// Difficulties: lifting or carrying weights over 5 kilos
ph049d10    /// Difficulties: telephone calls
ph049d9  /// Difficulties: shopping for groceries
ph049d10    /// Difficulties: telephone calls
ph049d12 /// Difficulties: doing work around the house or garden
ph049d8  /// Difficulties: preparing a hot meal
ph049d11 /// Difficulties: taking medications
ph049d13 /// Difficulties: managing money
ph048d1  /// Difficulties: walking 100 metres
ph049d5  /// Difficulties: getting in or out of bed
ph049d7  /// 
ph004_ ph005_     /// Long-term illness
ph006d2     /// Doctor told you had: high blood pressure or hypertension
ph006d1     /// Doctor told you had: heart attack
ph006d4     /// Doctor told you had: stroke
ph006d10    /// Doctor told you had: cancer
ph006d5     /// Doctor told you had: diabetes or high blood sugar
ph006d8     /// Doctor told you had: arthritis
ph006d6     /// Doctor told you had: chronic lung disease
ph006d9     /// Doctor told you had: osteoporosis
ph006d14    /// Doctor told you had: hip fracture or femoral fracture
ph006d12    /// Doctor told you had: Parkinson disease
ph010d3     /// Bothered by: breathlessness
ph010d7     /// Bothered by: falling down
ph010d8     /// Bothered by: fear of falling down
ph010d9     /// Bothered by: dizziness, faints or blackouts
ph043_      /// Eyesight distance
ph044_      /// Eyesight reading
ph046_      /// Hearing
ph012_      /// Weight of respondent
ph013_      /// Height (How tall are you?)
wave     ///
Nl_mergeid_crypt    

*>> Encoding this variable because it is str4 in master but int in using data (when you'll do the append)
rename ph012 ph012_old 
encode ph012, gen(ph012)
drop ph012_old 
   
*  Save
save "$share_w2_out\sharew2_ph.dta", replace 
   
*  codebook*
codebookout "$codebook\sharew2_ph.xls", replace


*>>   WAVE 4
use "$share_w4_out\sharew4_rel6-1-0_nl_ph.dta", clear    // Open the dataset 
gen wave=4                                // Create wave id 

*  wave 4 respondent self-report of health
gen srh =.
replace srh = 1 if ph003_==1
replace srh = 2 if ph003_==2
replace srh = 3 if ph003_==3
replace srh = 4 if ph003_==4
replace srh = 5 if ph003_==5

*  Defining the label 
label define lab_health ///
   1 "1.Excellent"   ///
   2 "2.Very good"      ///
   3 "3.Good"        ///
   4 "4.Fair"        ///
   5 "5.Poor"  

*  Label creation for SRH 
label variable srh "Self-report of health"
label values srh lab_health

*  Personal identifier & keep variables   
keep     ///
srh      ///
ph049d3  /// Difficulties: bathing or showering
ph049d1  /// Difficulties: dressing, including shoes and socks
ph048d3  /// Difficulties: getting up from chair
ph049d2  /// Difficulties: walking across a room
ph049d4  /// Difficulties: eating, cutting up food
ph048d7  /// Difficulties: reaching or extending arms above shoulder
ph049d6  /// Difficulties: using the toilet, incl getting up or down
ph048d5  /// Difficulties: climbing one flight of stairs
ph048d9  /// Difficulties: lifting or carrying weights over 5 kilos
ph049d9  /// Difficulties: shopping for groceries
ph049d10    /// Difficulties: telephone calls
ph049d12 /// Difficulties: doing work around the house or garden
ph049d8  /// Difficulties: preparing a hot meal
ph049d11 /// Difficulties: taking medications
ph049d13 /// Difficulties: managing money
ph048d1  /// Difficulties: walking 100 metres
ph049d5  /// Difficulties: getting in or out of bed
ph049d7  /// 
ph004_ ph005_     /// Long-term illness
ph006d2     /// Doctor told you had: high blood pressure or hypertension
ph006d1     /// Doctor told you had: heart attack
ph006d4     /// Doctor told you had: stroke
ph006d10    /// Doctor told you had: cancer
ph006d5     /// Doctor told you had: diabetes or high blood sugar
ph006d8     /// Doctor told you had: arthritis
ph006d6     /// Doctor told you had: chronic lung disease
ph006d9     /// Doctor told you had: osteoporosis
ph006d14    /// Doctor told you had: hip fracture or femoral fracture
ph006d12    /// Doctor told you had: Parkinson disease
ph010d3     /// Bothered by: breathlessness
ph010d7     /// Bothered by: falling down
ph010d8     /// Bothered by: fear of falling down
ph010d9     /// Bothered by: dizziness, faints or blackouts
ph043_      /// Eyesight distance
ph044_      /// Eyesight reading
ph046_      /// Hearing
ph012_      /// Weight of respondent
ph013_      /// Height (How tall are you?)
wave     ///
Nl_mergeid_crypt  

*>> Encoding this variable because it is str4 in master but int in using data (when you'll do the append) 
rename ph012 ph012_old 
encode ph012, gen(ph012)
drop ph012_old 
   
*  Save
save "$share_w4_out\sharew4_ph.dta", replace 
   
*  codebook*
codebookout "$codebook\sharew4_ph.xls", replace


*>>   WAVE 5
use "$share_w5_out\sharew5_rel6-1-0_nl_ph.dta", clear    // Open the dataset 
gen wave=5                                // Create wave id 

*  wave 5 respondent self-report of health
gen srh =.
replace srh = 1 if ph003_==1
replace srh = 2 if ph003_==2
replace srh = 3 if ph003_==3
replace srh = 4 if ph003_==4
replace srh = 5 if ph003_==5

*  Defining the label 
label define lab_health ///
   1 "1.Excellent"   ///
   2 "2.Very good"      ///
   3 "3.Good"        ///
   4 "4.Fair"        ///
   5 "5.Poor"  

*  Label creation for SRH 
label variable srh "Self-report of health"
label values srh lab_health

/* Note: Starting in Wave 5, respondents are asked if they have ever had rheumatoid arthritis (ph006d19) or
osteoarthritis/other rheumatism (ph006d20) as separate questions. FI_arthritis is coded as 1 if the respondent
indicates having had at least one of the conditions. */
tab ph006d19, miss // Doctor told you had: rheumatoid arthritis
tab ph006d20, miss // Doctor told you had: osteoarthritis/other rheumatism


*  Variable "reunification":
gen ph006d8 = . 
replace ph006d8 = 0 if ph006d19==0 | ph006d20==0
replace ph006d8 = 1 if ph006d19==1 | ph006d20==1

/* We can use ph011d11 (Drugs for: osteoporosis) as a proxy for ph006d9 (Doctor told you had: osteoporosis)
because the question is not asked starting from wave 5. I have seen that in Stoltz et al. they don't mention the problem, 
but they use the variable "Doctor told you had: Parkinson" to the Frailty Index, instead of "Doctor told you had: 
osteoporosis" */

*  Simple rename 
rename ph011d11 ph006d9

*  Same variables, different names: 
rename ph089d1 ph010d7
rename ph089d2 ph010d8
rename ph089d3 ph010d9

*  Personal identifier & keep variables
keep     ///
srh      ///
ph049d3  /// Difficulties: bathing or showering
ph049d1  /// Difficulties: dressing, including shoes and socks
ph048d3  /// Difficulties: getting up from chair
ph049d2  /// Difficulties: walking across a room
ph049d4  /// Difficulties: eating, cutting up food
ph048d7  /// Difficulties: reaching or extending arms above shoulder
ph049d6  /// Difficulties: using the toilet, incl getting up or down
ph048d5  /// Difficulties: climbing one flight of stairs
ph048d9  /// Difficulties: lifting or carrying weights over 5 kilos
ph049d9  /// Difficulties: shopping for groceries
ph049d10    /// Difficulties: telephone calls
ph049d12 /// Difficulties: doing work around the house or garden
ph049d8  /// Difficulties: preparing a hot meal
ph049d11 /// Difficulties: taking medications
ph049d13 /// Difficulties: managing money
ph048d1  /// Difficulties: walking 100 metres
ph049d5  /// Difficulties: getting in or out of bed
ph049d7  /// 
ph004_ ph005_     /// Long-term illness
ph006d2     /// Doctor told you had: high blood pressure or hypertension
ph006d1     /// Doctor told you had: heart attack
ph006d4     /// Doctor told you had: stroke
ph006d10    /// Doctor told you had: cancer
ph006d5     /// Doctor told you had: diabetes or high blood sugar
ph006d8     /// Doctor told you had: arthritis
ph006d6     /// Doctor told you had: chronic lung disease
ph006d9     /// Doctor told you had: osteoporosis
ph006d14    /// Doctor told you had: hip fracture or femoral fracture
ph006d12    /// Doctor told you had: Parkinson disease
ph010d7     /// Bothered by: falling down
ph010d8     /// Bothered by: fear of falling down
ph010d9     /// Bothered by: dizziness, faints or blackouts
ph043_      /// Eyesight distance
ph044_      /// Eyesight reading
ph046_      /// Hearing
ph012_      /// Weight of respondent
ph013_      /// Height (How tall are you?)
wave     ///
Nl_mergeid_crypt 

   
*  Save
save "$share_w5_out\sharew5_ph.dta", replace 
   
*  codebook*
codebookout "$codebook\sharew5_ph.xls", replace





*---- [ 4.  (SHARE) Extract & Recode Variables from MH]-----------------------------------------------------------------*


*>> WAVE 1
use "$share_w1_out\sharew1_rel6-1-0_nl_mh.dta", clear    // Open the dataset 
gen wave=1                                // Create wave id 

*  Personal identifier & keep variables   
keep mh002_-mh017_      ///
wave     				///
Nl_mergeid_crypt

*  Save
save "$share_w1_out\sharew1_mh.dta", replace 

*  codebook*
codebookout "$codebook\sharew1_mh.xls", replace


*>> WAVE 2
use "$share_w2_out\sharew2_rel6-1-0_nl_mh.dta", clear    // Open the dataset 
gen wave=2                                				// Create wave id 


*  Personal identifier & keep variables
keep mh002_-mh017_      ///
wave     				///
Nl_mergeid_crypt
   
*  Save
save "$share_w2_out\sharew2_mh.dta", replace 
   
*  codebook*
codebookout "$codebook\sharew2_mh.xls", replace


*>> WAVE 4
use "$share_w4_out\sharew4_rel6-1-0_nl_mh.dta", clear    // Open the dataset 
gen wave=4                                // Create wave id 

*  Personal identifier & keep variables   
keep mh002_-mh017_      ///
wave     				///
Nl_mergeid_crypt  
   
*  Save
save "$share_w4_out\sharew4_mh.dta", replace 
   
*  Codebook*
codebookout "$codebook\sharew4_mh.xls", replace


*>> WAVE 5
use "$share_w5_out\sharew5_rel6-1-0_nl_mh.dta", clear   	// Open the dataset 
gen wave=5                                					// Create wave id 
 
*  Recode variables (inconsistence with other waves)
recode mh003_ (5=2)
recode mh004_ (5=2)
recode mh005_ (5=2)
recode mh006_ (5=2)
recode mh007_ (5=2)
recode mh008_ (5=2)
recode mh011_ (5=2)
recode mh014_ (5=2)
recode mh015_ (5=2)
recode mh016_ (5=2)

recode mh005_ (9=3)
recode mh008_ (9=3)
recode mh011_ (9=3)

*  Personal identifier & keep variables
keep mh002_-mh017_      ///
wave     				///
Nl_mergeid_crypt
   
*  Save
save "$share_w5_out\sharew5_mh.dta", replace 
   
*  codebook*
codebookout "$codebook\sharew5_mh.xls", replace


*---- [ 5.  (SHARE) Extract & Recode Variables from BR]-----------------------------------------------------------------*


*>> WAVE 1
use "$share_w1_out\sharew1_rel6-1-0_nl_br.dta", clear    // Open the dataset 
gen wave=1                                // Create wave id 


*  Personal identifier & keep variables   
keep     ///
br001_      /// Ever smoked daily
br002_   /// Smoke at the present time
br003_   /// How many years smoked
br010_   /// Days a week consumed alcohol last 6 months <- it's different [3 months] in the subsequent weaves
br015_      /// Sports or activities that are vigorous
br016_      /// Activities requiring a moderate level of energy
wave     ///
Nl_mergeid_crypt

*  Save
save "$share_w1_out\sharew1_br.dta", replace 

*  codebook*
codebookout "$codebook\sharew1_br.xls", replace

*>> WAVE 2
use "$share_w2_out\sharew2_rel6-1-0_nl_br.dta", clear    // Open the dataset 
gen wave=2                                // Create wave id 

*  Personal identifier & keep variables
keep     ///
br001_      /// Ever smoked daily
br002_   /// Smoke at the present time
br003_   /// How many years smoked
br022_   /// Stopped smoking
br010_   /// Days a week consumed alcohol last 3 months
br015_      /// Sports or activities that are vigorous
br016_      /// Activities requiring a moderate level of energy
wave     ///
Nl_mergeid_crypt


*  Save
save "$share_w2_out\sharew2_br.dta", replace 
   
*  codebook*
codebookout "$codebook\sharew2_br.xls", replace


*>> WAVE 4
use "$share_w4_out\sharew4_rel6-1-0_nl_br.dta", clear    // Open the dataset 
gen wave=4                                // Create wave id 

*  Personal identifier & keep variables
keep     ///
br001_      /// Ever smoked daily
br002_   /// Smoke at the present time
br003_   /// How many years smoked
br022_   /// Stopped smoking
br010_   /// Days a week consumed alcohol last 3 months
br015_      /// Sports or activities that are vigorous
br016_      /// Activities requiring a moderate level of energy
wave     ///
Nl_mergeid_crypt


*  Save
save "$share_w4_out\sharew4_br.dta", replace 
   
*  codebook*
codebookout "$codebook\sharew4_br.xls", replace


*>> WAVE 5
use "$share_w5_out\sharew5_rel6-1-0_nl_br.dta", clear    // Open the dataset 
gen wave=5                                // Create wave id 


*  Personal identifier & keep variables
keep  ///
br001_   /// Ever smoked daily
br002_  /// Smoke at the present time
br003_  /// How many years smoked
br022_  /// Stopped smoking
br010_  /// Days a week consumed alcohol last 3 months
br015_   /// Sports or activities that are vigorous
br016_   /// Activities requiring a moderate level of energy
wave  ///
Nl_mergeid_crypt


*  Save
save "$share_w5_out\sharew5_br.dta", replace 
   
*  codebook*
codebookout "$codebook\sharew5_br.xls", replace



*---- [ 6.  (SHARE) Extract & Recode Variables from GV_Health]----------------------------------------------------------*


*>> WAVE 1
use "$share_w1_out\sharew1_rel6-1-0_nl_gv_health.dta", clear   // Open the dataset 
gen wave=1                                      // Create wave id 

*  Personal identifier & keep variables   
keep     ///
cusmoke  ///
drinkin2    ///
casp     ///
eurod       /// 
spheu       ///
spheu2      ///
sphus       ///
sphus2      ///
wave     ///
Nl_mergeid_crypt

*  Save
save "$share_w1_out\sharew1_gv_health.dta", replace 

*  codebook*
codebookout "$codebook\sharew1_gv_health.xls", replace


*>> WAVE 2
use "$share_w2_out\sharew2_rel6-1-0_nl_gv_health.dta", clear   // Open the dataset  
gen wave=2                                      // Create wave id 

*  Personal identifier & keep variables   
keep   ///
cusmoke  ///
casp   ///
eurod     ///
sphus     ///
wave   ///
Nl_mergeid_crypt 

   
*  Save
save "$share_w2_out\sharew2_gv_health.dta", replace 
   
*  codebook*
codebookout "$codebook\sharew2_gv_health.xls", replace


*>> WAVE 4
use "$share_w4_out\sharew4_rel6-1-0_nl_gv_health.dta", clear   // Open the dataset  
gen wave=4                                      // Create wave id 


*  Personal identifier & keep variables   
keep     ///
cusmoke  ///
casp     ///
eurod       ///
sphus       ///
wave     ///
Nl_mergeid_crypt

   
*  Save
save "$share_w4_out\sharew4_gv_health.dta", replace 
   
*  codebook*
codebookout "$codebook\sharew4_gv_health.xls", replace


*>> WAVE 5
use "$share_w5_out\sharew5_rel6-1-0_nl_gv_health.dta", clear   // Open the dataset  
gen wave=5                                      // Create wave id 


*  Personal identifier & keep variables
keep     ///
casp     ///
eurod       ///
sphus       ///
wave     ///
Nl_mergeid_crypt

   
*  Save
save "$share_w5_out\sharew5_gv_health.dta", replace 
   
*  codebook*
codebookout "$codebook\sharew5_gv_health.xls", replace



*---- [ 7.  (SHARE) Extract & Recode Variables from CV_R ]--------------------------------------------------------------*


*>> WAVE 1
use "$share_w1_out\sharew1_rel6-1-0_nl_cv_r.dta", clear  // Open the dataset  
gen wave=1                                   // Create wave id 

*  "deceased" variable creation
gen deceased = 0  // Since in this wave there is not the "deceased" variable (that identify the death of the respondent), 
               // as in the subsequent waves, we have to create it


*  Personal identifier & keep variables   
keep     ///
country     /// Country identifier
deceased    /// Deceased
mobirth     /// Month of birth
yrbirth     /// Year of birth
age_int     /// Age of respondent at the time of interview
partnerinhh /// Partner in household
hhsize      /// Household size
interview   /// 
int_year    /// Interview year
int_month   /// Interview month
wave     ///
Nl_mergeid_crypt  ///
gender      /// 
yrbirthp mobirthp    ///
fam_resp    /// "Family respondent"
hou_resp // "Household respondent"



*  Save
save "$share_w1_out\sharew1_cv_r.dta", replace 

*  codebook*
codebookout "$codebook\sharew1_cv_r.xls", replace


*>> WAVE 2
use "$share_w2_out\sharew2_rel6-1-0_nl_cv_r.dta", clear     // Open the dataset  
gen wave=2                                   // Create wave id 

*  Personal identifier & keep variables   
keep     ///
country     /// Country identifier
mobirth     /// Month of birth
yrbirth     /// Year of birth
age_int     /// Age of respondent at the time of interview
partnerinhh /// Partner in household
hhsize      /// Household size
int_year    /// Interview year
int_month   /// Interview month
deceased    /// Deceased
yrbirthp  mobirthp   ///
fam_resp    /// 
hou_resp    /// 
gender      /// 
interview   ///
wave     ///
Nl_mergeid_crypt
   
*  Save
save "$share_w2_out\sharew2_cv_r.dta", replace 
   
*  codebook*
codebookout "$codebook\sharew2_cv_r.xls", replace


*>> WAVE 4
use "$share_w4_out\sharew4_rel6-1-0_nl_cv_r.dta", clear     // Open the dataset  
gen wave=4                                   // Create wave id 

*  Personal identifier & keep variables   
keep     ///
country     /// Country identifier
mobirth     /// Month of birth
yrbirth     /// Year of birth
age_int     /// Age of respondent at the time of interview
partnerinhh /// Partner in household
hhsize      /// Household size
int_year    /// Interview year
int_month   /// Interview month
yrbirthp  mobirthp   ///
interview   ///
deceased    /// Deceased
gender      /// 
wave     ///
Nl_mergeid_crypt  ///

   
*  Save
save "$share_w4_out\sharew4_cv_r.dta", replace 
   
*  codebook*
codebookout "$codebook\sharew4_cv_r.xls", replace


*>> WAVE 5
use "$share_w5_out\sharew5_rel6-1-0_nl_cv_r.dta", clear     // Open the dataset  
gen wave=5                                   // Create wave id 

*  Personal identifier & keep variables
keep        ///
country        /// Country identifier
mobirth        /// Month of birth
yrbirth        /// Year of birth
age_int        /// Age of respondent at the time of interview
partnerinhh    /// Partner in household
hhsize         /// Household size
int_year       /// Interview year
int_month      /// Interview month
yrbirthp    mobirthp    ///
gender         ///
interview      ///
deceased       /// Deceased
wave        ///
Nl_mergeid_crypt     ///

   
*  Save
save "$share_w5_out\sharew5_cv_r.dta", replace 
   
*  codebook*
codebookout "$codebook\sharew5_cv_r.xls", replace



*---- [ 8.  (SHARE) Extract & Recode Variables from GV_Imputations ]----------------------------------------------------*


*>> WAVE 1
use "$share_w1_out\sharew1_rel6-1-0_nl_gv_imputations.dta", clear    // Open the dataset  
gen wave=1                                         // Create wave id 


*  Personal identifier & keep variables   
keep              ///
/// CONSUMPTION
      fahc*       /// Amount spent on food at home
      fohc*       /// Amount spent on food outside home
/// WEALTH & INCOME variables:
      hrass*         /// Household real assets (home*perho/100+vbus*sbus/100+car+ ores – mort)  (wave 1 2 4 5 6)
      hgfass*     /// Household gross financial assets (sum of bacc, bsmf and slti)       (wave 1 2 4 5 6)
      hnfass*     /// Household net financial assets (hgfass – liab)                      (wave 1 2 4 5 6)
      hnetw*         /// Household net worth                                        (wave 1 2 4 5 6)
      home*          /// Value of main residence                                    (wave 1 2 4 5 6)
      vbus*          /// Value of own business                                      (wave 1 2 4 5 6)
      sbus*          /// Share of own business                                      (wave 1 2 4 5 6)
      car*        /// Value of cars                                              (wave 1 2 4 5 6)
      ores*          /// Value of other real estate – Amount                           (wave 1 2 4 5 6)
      mort*          /// Mortgage on main residence                                    (wave 1 2 4 5 6)
      bacc*          /// Bank accounts                                           (wave 1 2 4 5 6)
      bsmf*          /// Bond, stock and mutual funds                               (wave 1 2 4 5 6)
      slti*       /// Savings for long-term investments                             (wave 1 2 4 5 6)
      liab*       /// Financial liabilities                                      (wave 1 2 4 5 6)
      liab*          /// financial liabilities
      mort*          /// mortgage on main residence
      otrf*          /// owner, tenant or rent free
      sbus*          /// share of own business
      slti*          /// savings for long-term investments
      vbus*       /// value of own business
      implicat*      ///   Implicat number
      exrate*        ///   Exchange rate
      thinc*         ///   Total household income - Version A
      hrass*         ///   Household real assets
/// SOCIO-DEMOGRAPHIC variables:
      gender*        ///   Gender
      yedu*          ///   Years of education
      isced*         ///   ISCED 1997 coding of education
      sphus*         ///   Self-perceived health - US scale
      mstat*         ///   Marital status
      nchild*        ///   Number of children
      ngrchild*      ///   Number of grandchildren
      eyesightr*     ///   Eyesight reading
      hearing*       ///   Hearing
      bmi*           ///   Body mass index
      weight*        ///   Weight
      height*        ///   Height
      esmoked*       ///   Ever smoked daily
      phinact*       ///   Physical inactivity
      orienti*       ///   Score of orientation in time test
      maxgrip*       ///   Maximum of grip strength measures
      doctor*        ///   Seen/Talked to medical doctor
      hospital*      ///   In hospital last 12 months
      thospital*     ///   Times being patient in hospital
      nhospital*     ///   Total nights stayed in hospital
      cjs*           ///   Current job situation
      pwork*         ///   Did any paid work
      empstat1*       /// Employee or self-employed first job
      empstat2*       /// Employee or self-employed second job
      fdistress*     ///   Household able to make ends meet
      nalm*          /// Number of activities last month
/// Other (e.g. ID)
      ghih           ///   Given help in the household (how many)    -> based on sp018 (waves 1 2 4 5 6)
      ghto           ///   Given help to others (how many)     -> based on sp008, sp011, sp013 (waves 1 2 4 5 6)
      maxgrip_f      /// 
      bmi_f          /// 
      orienti_f      /// 
      wave        ///
      Nl_mergeid_crypt   

*  mean value for income and wealth (based on the 5 SHARE imputation)
bys Nl_mergeid_crypt : egen income_implicatmean=mean(thinc)
bys Nl_mergeid_crypt : egen wealth_implicatmean=mean(hnetw)

*  We only keep one out of the five implicats:
keep if implicat==1 

*  Save
save "$share_w1_out\sharew1_gv_imputations.dta", replace 

*  codebook*
codebookout "$codebook\sharew1_gv_imputations.xls", replace


*>> WAVE 2
use "$share_w2_out\sharew2_rel6-1-0_nl_gv_imputations.dta", clear    // Open the dataset  
gen wave=2                                         // Create wave id 


*  Personal identifier & keep variables   
keep              ///
/// CONSUMPTION
      fahc*       /// Amount spent on food at home
      fohc*       /// Amount spent on food outside home
/// WEALTH & INCOME variables:
      hrass*         /// Household real assets (home*perho/100+vbus*sbus/100+car+ ores – mort)  (wave 1 2 4 5 6)
      hgfass*     /// Household gross financial assets (sum of bacc, bsmf and slti)       (wave 1 2 4 5 6)
      hnfass*     /// Household net financial assets (hgfass – liab)                      (wave 1 2 4 5 6)
      hnetw*         /// Household net worth                                        (wave 1 2 4 5 6)
      home*          /// Value of main residence                                    (wave 1 2 4 5 6)
      vbus*          /// Value of own business                                      (wave 1 2 4 5 6)
      sbus*          /// Share of own business                                      (wave 1 2 4 5 6)
      car*        /// Value of cars                                              (wave 1 2 4 5 6)
      ores*          /// Value of other real estate – Amount                           (wave 1 2 4 5 6)
      mort*          /// Mortgage on main residence                                    (wave 1 2 4 5 6)
      bacc*          /// Bank accounts                                           (wave 1 2 4 5 6)
      bsmf*          /// Bond, stock and mutual funds                               (wave 1 2 4 5 6)
      slti*       /// Savings for long-term investments                             (wave 1 2 4 5 6)
      liab*       /// Financial liabilities                                      (wave 1 2 4 5 6)
      bacc*          /// bank accounts
      bsmf*          /// bond, stock and mutual funds
      car*        /// value of cars
      home*          /// value of main residence
      liab*          /// financial liabilities
      mort*          /// mortgage on main residence
      ores*          /// value of other real estate - amount
      ores*          /// value of other real estate
      ores*          /// value of real estate - amount
      otrf*          /// owner, tenant or rent free
      sbus*          /// share of own business
      slti*          /// savings for long-term investments
      vbus*          /// value of own business
      implicat*      ///   Implicat number
      exrate*        ///   Exchange rate
      thinc2*        ///   Total household income - Version B
      thinc*         ///   Total household income - Version A
      hrass*         ///   Household real assets
      hgfass*        ///   Household gross financial assets
      hnfass*        ///   Household net financial assets
      gender*        ///   Gender
      yedu*          ///   Years of education
      isced*         ///   ISCED 1997 coding of education
      sphus*         ///   Self-perceived health - US scale
      mstat*         ///   Marital status
      nchild*        ///   Number of children
      ngrchild*      ///   Number of grandchildren
      eyesightr*     ///   Eyesight reading
      hearing*       ///   Hearing
      bmi*           ///   Body mass index
      weight*        ///   Weight
      height*        ///   Height
      esmoked*       ///   Ever smoked daily
      phinact*       ///   Physical inactivity
      orienti*       ///   Score of orientation in time test
      maxgrip*       ///   Maximum of grip strength measures
      doctor*        ///   Seen/Talked to medical doctor
      hospital*      ///   In hospital last 12 months
      thospital*     ///   Times being patient in hospital
      nhospital*     ///   Total nights stayed in hospital
      cjs*           ///   Current job situation
      pwork*         ///   Did any paid work
      empstat*       ///   Employee or self-employed
      fdistress*     ///   Household able to make ends meet
      nalm*          /// Number of activities last month
/// Other (e.g. ID)  
      ghih           ///   Given help in the household (how many)    -> based on sp018 (waves 1 2 4 5 6)
      ghto           ///   Given help to others (how many)     -> based on sp008, sp011, sp013 (waves 1 2 4 5 6)
      maxgrip_f      /// 
      bmi_f          /// 
      orienti_f      /// 
      wave        ///
      Nl_mergeid_crypt


*  mean value for income and wealth (based on the 5 SHARE imputation)
bys Nl_mergeid_crypt : egen income_implicatmean=mean(thinc)
bys Nl_mergeid_crypt : egen wealth_implicatmean=mean(hnetw)

*  We only keep one out of the five implicats:
keep if implicat==1 

*  Save
save "$share_w2_out\sharew2_gv_imputations.dta", replace 
   
*  codebook*
codebookout "$codebook\sharew2_gv_imputations.xls", replace


*>> WAVE 4
use "$share_w4_out\sharew4_rel6-1-0_nl_gv_imputations.dta", clear    // Open the dataset  
gen wave=4                                         // Create wave id 


*  Personal identifier & keep variables   
keep              ///
/// CONSUMPTION
      fahc        /// Amount spent on food at home
      fohc        /// Amount spent on food outside home
/// WEALTH & INCOME variables:
      hrass*         /// Household real assets (home*perho/100+vbus*sbus/100+car+ ores – mort)  (wave 1 2 4 5 6)
      hgfass*     /// Household gross financial assets (sum of bacc, bsmf and slti)       (wave 1 2 4 5 6)
      hnfass*     /// Household net financial assets (hgfass – liab)                      (wave 1 2 4 5 6)
      hnetw*         /// Household net worth                                        (wave 1 2 4 5 6)
      home*          /// Value of main residence                                    (wave 1 2 4 5 6)
      perho*         /// Percentage of house owned                      ---------------->    (wave     4 5 6)
      vbus*          /// Value of own business                                      (wave 1 2 4 5 6)
      sbus*          /// Share of own business                                      (wave 1 2 4 5 6)
      car*        /// Value of cars                                              (wave 1 2 4 5 6)
      ores*          /// Value of other real estate – Amount                           (wave 1 2 4 5 6)
      mort*          /// Mortgage on main residence                                    (wave 1 2 4 5 6)
      bacc*          /// Bank accounts                                           (wave 1 2 4 5 6)
      bsmf*          /// Bond, stock and mutual funds                               (wave 1 2 4 5 6)
      slti*       /// Savings for long-term investments                             (wave 1 2 4 5 6)
      liab*       /// Financial liabilities                                      (wave 1 2 4 5 6)
      bacc*          /// bank accounts
      bsmf*          /// bond, stock and mutual funds
      car*        /// value of cars
      home*          /// value of main residence
      liab*          /// financial liabilities
      mort*          /// mortgage on main residence
      ores*          /// value of other real estate - amount
      ores*          /// value of other real estate
      ores*          /// value of real estate - amount
      otrf*          /// owner, tenant or rent free
      perho*         /// percentage of house owned
      sbus*          /// share of own business
      slti*          /// savings for long-term investments
      vbus*          /// value of own business
      implicat*      ///   Implicat number
      exrate*        ///   Exchange rate
      thinc2*        ///   Total household income - Version B
      thinc*         ///   Total household income - Version A
      hrass*         ///   Household real assets
      hgfass*        ///   Household gross financial assets
      hnfass*        ///   Household net financial assets
      gender*        ///   Gender
      yedu*          ///   Years of education
      isced*         ///   ISCED 1997 coding of education
      sphus*         ///   Self-perceived health - US scale
      mstat*         ///   Marital status
      nchild*        ///   Number of children
      ngrchild*      ///   Number of grandchildren
      eyesightr*     ///   Eyesight reading
      hearing*       ///   Hearing
      bmi*           ///   Body mass index
      weight*        ///   Weight
      height*        ///   Height
      esmoked*       ///   Ever smoked daily
      phinact*       ///   Physical inactivity
      orienti*       ///   Score of orientation in time test
      maxgrip*       ///   Maximum of grip strength measures
      doctor*        ///   Seen/Talked to medical doctor
      hospital*      ///   In hospital last 12 months
      thospital*     ///   Times being patient in hospital
      nhospital*     ///   Total nights stayed in hospital
      cjs*           ///   Current job situation
      pwork*         ///   Did any paid work
      empstat*       ///   Employee or self-employed
      fdistress*     ///   Household able to make ends meet
      naly*          ///   Number of activities last year
      saly*          ///   Satisfied with no activities
/// Other (e.g. ID)
      ghih           ///   Given help in the household (how many)    -> based on sp018 (waves 1 2 4 5 6)
      ghto           ///   Given help to others (how many)     -> based on sp008, sp011, sp013 (waves 1 2 4 5 6)
      maxgrip_f      /// 
      bmi_f          /// 
      orienti_f      /// 
      wave        ///
      Nl_mergeid_crypt     ///
      

*  mean value for income and wealth (based on the 5 SHARE imputation)
bys Nl_mergeid_crypt : egen income_implicatmean=mean(thinc)
bys Nl_mergeid_crypt : egen wealth_implicatmean=mean(hnetw)

* We only keep one out of the five implicats:
keep if implicat==1 


*  Save
save "$share_w4_out\sharew4_gv_imputations.dta", replace 
   
*  codebook*
codebookout "$codebook\sharew4_gv_imputations.xls", replace


*>> WAVE 5
use "$share_w5_out\sharew5_rel6-1-0_nl_gv_imputations.dta", clear    // Open the dataset  
gen wave=5                                         // Create wave id 


*  Personal identifier & keep variables
keep              ///
/// CONSUMPTION
      fahc*       /// Amount spent on food at home
      fohc*       /// Amount spent on food outside home
/// WEALTH & INCOME variables:
      hrass*         /// Household real assets (home*perho/100+vbus*sbus/100+car+ ores – mort)  (wave 1 2 4 5 6)
      hgfass*     /// Household gross financial assets (sum of bacc, bsmf and slti)       (wave 1 2 4 5 6)
      hnfass*     /// Household net financial assets (hgfass – liab)                      (wave 1 2 4 5 6)
      hnetw*         /// Household net worth                                        (wave 1 2 4 5 6)
      home*          /// Value of main residence                                    (wave 1 2 4 5 6)
      perho*         /// Percentage of house owned             ---------------->          (wave     4 5 6)
      vbus*          /// Value of own business                                      (wave 1 2 4 5 6)
      sbus*          /// Share of own business                                      (wave 1 2 4 5 6)
      car*        /// Value of cars                                              (wave 1 2 4 5 6)
      ores*          /// Value of other real estate – Amount                           (wave 1 2 4 5 6)
      mort*          /// Mortgage on main residence                                    (wave 1 2 4 5 6)
      bacc*          /// Bank accounts                                           (wave 1 2 4 5 6)
      bsmf*          /// Bond, stock and mutual funds                               (wave 1 2 4 5 6)
      slti*       /// Savings for long-term investments                             (wave 1 2 4 5 6)
      liab*       /// Financial liabilities                                      (wave 1 2 4 5 6)
      bacc*          /// bank accounts
      bsmf*          /// bond, stock and mutual funds
      car*        /// value of cars
      home*          /// value of main residence
      liab*          /// financial liabilities
      mort*          /// mortgage on main residence
      ores*          /// value of other real estate - amount
      ores*          /// value of other real estate
      ores*          /// value of real estate - amount
      otrf*          /// owner, tenant or rent free
      perho*         /// percentage of house owned
      sbus*          /// share of own business
      slti*          /// savings for long-term investments
      vbus*          /// value of own business
      implicat*      ///   Implicat number
      exrate*        ///   Exchange rate
      thinc2*        ///   Total household income - Version B
      thinc*         ///   Total household income - Version A
      hrass*         ///   Household real assets
      hgfass*        ///   Household gross financial assets
      hnfass*        ///   Household net financial assets
      gender*        ///   Gender
      yedu*          ///   Years of education
      isced*         ///   ISCED 1997 coding of education
      sphus*         ///   Self-perceived health - US scale
      mstat*         ///   Marital status
      nchild*        ///   Number of children
      ngrchild*      ///   Number of grandchildren
      eyesightr*     ///   Eyesight reading
      hearing*       ///   Hearing
      bmi*           ///   Body mass index
      weight*        ///   Weight
      height*        ///   Height
      esmoked*       ///   Ever smoked daily
      phinact*       ///   Physical inactivity
      orienti*       ///   Score of orientation in time test
      maxgrip*       ///   Maximum of grip strength measures
      doctor*        ///   Seen/Talked to medical doctor
      hospital*      ///   In hospital last 12 months
      thospital*     ///   Times being patient in hospital
      nhospital*     ///   Total nights stayed in hospital
      cjs*           ///   Current job situation
      pwork*         ///   Did any paid work
      empstat*       ///   Employee or self-employed
      lookjob*       ///   Looking for job
      fdistress*     ///   Household able to make ends meet
      naly*          ///   Number of activities last year
      saly*          ///   Satisfied with no activities
/// Other (e.g. ID)
      ghih           ///   Given help in the household (how many)    -> based on sp018 (waves 1 2 4 5 6)
      ghto           ///   Given help to others (how many)     -> based on sp008, sp011, sp013 (waves 1 2 4 5 6)
      maxgrip_f      /// 
      bmi_f          /// 
      orienti_f      /// 
      wave        ///
      Nl_mergeid_crypt
      
*  mean value for income and wealth (based on the 5 SHARE imputation)
bys Nl_mergeid_crypt : egen income_implicatmean=mean(thinc)
bys Nl_mergeid_crypt : egen wealth_implicatmean=mean(hnetw)

*  We only keep one out of the five implicats:
keep if implicat==1 
   
*  Save
save "$share_w5_out\sharew5_gv_imputations.dta", replace 
   
*  codebook*
codebookout "$codebook\sharew5_gv_imputations.xls", replace


*---- [ 9.  (SHARE) Extract & Recode Variables from DN ]----------------------------------------------------------------*


*>> WAVE 1
use "$share_w1_out\sharew1_rel6-1-0_nl_dn.dta", clear    // Open the dataset  
gen wave=1                                // Create wave id 

*  Personal identifier & keep variables   
keep     ///
dn014_      /// Marital status
wave     ///
Nl_mergeid_crypt

*  Save
save "$share_w1_out\sharew1_dn.dta", replace 

*  codebook*
codebookout "$codebook\sharew1_dn.xls", replace


*>> WAVE 2
use "$share_w2_out\sharew2_rel6-1-0_nl_dn.dta", clear    // Open the dataset  
gen wave=2                                // Create wave id 

*  Personal identifier & keep variables   
keep     ///
dn014_      /// Marital status
dn044_      /// Marital status changed
wave     ///
Nl_mergeid_crypt
   
*  Save
save "$share_w2_out\sharew2_dn.dta", replace 
   
*  codebook*
codebookout "$codebook\sharew2_dn.xls", replace


*>> WAVE 4
use "$share_w4_out\sharew4_rel6-1-0_nl_dn.dta", clear    // Open the dataset  
gen wave=4                                // Create wave id 

*  Personal identifier & keep variables   
keep     ///
dn014_      /// Marital status
dn044_      /// Marital status changed
wave     ///
Nl_mergeid_crypt
   
*  Save
save "$share_w4_out\sharew4_dn.dta", replace 
   
*  codebook*
codebookout "$codebook\sharew4_dn.xls", replace


*>> WAVE 5
use "$share_w5_out\sharew5_rel6-1-0_nl_dn.dta", clear    // Open the dataset  
gen wave=5                                // Create wave id 


*  Personal identifier & keep variables
keep     ///
dn014_      /// Marital status
dn044_      /// Marital status changed
wave     ///
Nl_mergeid_crypt
   
*  Save
save "$share_w5_out\sharew5_dn.dta", replace 
   
*  codebook*
codebookout "$codebook\sharew5_dn.xls", replace


*---- [ 9.  (SHARE) Extract & Recode Variables from CH ]----------------------------------------------------------------*


*>> WAVE 1
use "$share_w1_out\sharew1_rel6-1-0_nl_ch.dta", clear    // Open the dataset  
gen wave=1                                            // Create wave id 

*  Save
save "$share_w1_out\sharew1_ch.dta", replace 

*  codebook*
codebookout "$codebook\sharew1_ch.xls", replace

*>> WAVE 2
use "$share_w2_out\sharew2_rel6-1-0_nl_ch.dta", clear   // Open the dataset  
gen wave=2                                         // Create wave id 

  
*  Save
save "$share_w2_out\sharew2_ch.dta", replace 
   
*  codebook*
codebookout "$codebook\sharew2_ch.xls", replace

*>> WAVE 4
use "$share_w4_out\sharew4_rel6-1-0_nl_ch.dta", clear   // Open the dataset  
gen wave=4                                            // Create wave id 
  
*  Save
save "$share_w4_out\sharew4_ch.dta", replace 
   
*  codebook*
codebookout "$codebook\sharew4_ch.xls", replace

*>> WAVE 5
use "$share_w5_out\sharew5_rel6-1-0_nl_ch.dta", clear   // Open the dataset  
gen wave=5                                            // Create wave id 

*  Save
save "$share_w5_out\sharew5_ch.dta", replace 
   
*  codebook*
codebookout "$codebook\sharew5_ch.xls", replace







*---- [10.  (SHARE) Extract & Recode Variables from SP ]----------------------------------------------------------------*


*>> WAVE 1
use "$share_w1_out\sharew1_rel6-1-0_nl_sp.dta", clear    // Open the dataset  
gen wave=1                                // Create wave id 


*  Personal identifier & keep variables   
keep        ///
sp008_      /// Given help last twelve months
sp009_1     /// To whom did you give help: person 1
sp009_2     /// To whom did you give help: person 2
sp009_3     /// To whom did you give help: person 3
sp010d1_1   /// Help given person 1: personal care
sp010d1_2   /// Help given person 2: personal care
sp010d1_3   /// Help given person 3: personal care
sp010d2_1   /// Help given person 1: practical household help
sp010d2_2   /// Help given person 2: practical household help
sp010d2_3   /// Help given person 3: practical household help
sp010d3_1   /// Help given person 1: help with paperwork
sp010d3_2   /// Help given person 2: help with paperwork
sp010d3_3   /// Help given person 3: help with paperwork
sp011_1     /// How often given help to person 1
sp011_2     /// How often given help to person 2
sp011_3     /// How often given help to person 3
sp012_1     /// Hours given help to person 1
sp012_2     /// Hours given help to person 2
sp012_3     /// Hours given help to person 3
sp013_1     /// Have you given help to others
sp013_2     /// Have you given help to others
sp014_      /// Looked after grandchildren
sp015d1     /// Looked after child of child 1
sp015d2     /// Looked after child of child 2
sp015d3     /// Looked after child of child 3
sp015d4     /// Looked after child of child 4
sp015d5     /// Looked after child of child 5
sp015d6     /// Looked after child of child 6
sp015d7     /// Looked after child of child 7
sp015d8     /// Looked after child of child 8
sp015d9     /// Looked after child of child 9
sp015d10    /// Looked after child of child 10
sp015d11    /// Looked after child of child 11
sp015d12    /// Looked after child of child 12
sp015d13    /// Looked after child of child 13
sp015d14    /// Looked after child of child 14
sp015d15    /// Looked after child of child 15
sp015d16    /// Looked after child of child 16
sp015d17    /// Looked after child of child 17
sp015d18    /// Looked after child of child 18
sp015d19    /// Looked after child of child 19
sp015d20    /// Looked after child of child 20
sp015d21    /// Looked after child of deceased child
sp016_1     /// How often did you look after child of child 1
sp016_2     /// How often did you look after child of child 2
sp016_3     /// How often did you look after child of child 3
sp016_4     /// How often did you look after child of child 4
sp016_5     /// How often did you look after child of child 5
sp016_6     /// How often did you look after child of child 6
sp016_7     /// How often did you look after child of child 7
sp016_8     /// How often did you look after child of child 8
sp016_9     /// How often did you look after child of child 9
sp016_10    /// How often did you look after child of child 10
sp016_11    /// How often did you look after child of child 11
sp016_12    /// How often did you look after child of child 12
sp016_13    /// How often did you look after child of child 13
sp016_14    /// How often did you look after child of child 14
sp016_17    /// How often do you look after child of child 17
sp017_1     /// Hours looked after child(ren) of child 1
sp017_2     /// Hours looked after child(ren) of child 2
sp017_3     /// Hours looked after child(ren) of child 3
sp017_4     /// Hours looked after child(ren) of child 4
sp017_5     /// Hours looked after child(ren) of child 5
sp017_6     /// Hours looked after child(ren) of child 6
sp017_7     /// Hours looked after child(ren) of child 7
sp017_8     /// Hours looked after child(ren) of child 8
sp017_9     /// Hours looked after child(ren) of child 9
sp017_10    /// Hours looked after child(ren) of child 10
sp017_11    /// Hours looked after child(ren) of child 11
sp017_12    /// Hours looked after child(ren) of child 12
sp017_13    /// Hours looked after child(ren) of child 13
sp017_14    /// Hours looked after child(ren) of child 14
sp017_17    /// Hours looked after child(ren) of child 17
sp018_      /// Given help to someone with personal care in the household
sp019d1     ///   R provided help with personal care to: spouse/partner
sp019d2     ///   R provided help with personal care to: mother
sp019d3     ///   R provided help with personal care to: father
sp019d4     ///   R provided help with personal care to: mother-in-law
sp019d5     ///   R provided help with personal care to: father-in-law
sp019d6     ///   R provided help with personal care to: stepmother
sp019d7     ///   R provided help with personal care to: stepfather
sp019d8     ///   R provided help with personal care to: brother
sp019d9     ///   R provided help with personal care to: sister
sp019d10 ///   R provided help with personal care to: child 1
sp019d11 ///   R provided help with personal care to: child 2
sp019d12 ///   R provided help with personal care to: child 3
sp019d13 ///   R provided help with personal care to: child 4
sp019d14 ///   R provided help with personal care to: child 5
sp019d15 ///   R provided help with personal care to: child 6
sp019d16 ///   R provided help with personal care to: child 7
sp019d17 ///   R provided help with personal care to: child 8
sp019d18 ///   R provided help with personal care to: child 9
sp019d19 ///   R provided help with personal care to: other child
sp019d20 ///   R provided help with personal care to: son-in-law
sp019d21 ///   R provided help with personal care to: daughter-in-law
sp019d22 ///   R provided help with personal care to: grandchild
sp019d23 ///   R provided help with personal care to: grandparent
sp019d24 ///   R provided help with personal care to: aunt
sp019d25 ///   R provided help with personal care to: uncle
sp019d26 ///   R provided help with personal care to: niece
sp019d27 ///   R provided help with personal care to: nephew
sp019d28 ///   R provided help with personal care to: other relative
sp019d29 ///   R provided help with personal care to: friend
sp019d30 ///   R provided help with personal care to: (ex-)colleague
sp019d31 ///   R provided help with personal care to: neighbour
sp019d32 ///   R provided help with personal care to: ex-spouse/partner
sp019d33 ///   R provided help with personal care to: other acquaintance
sp020       /// 
wave     ///
Nl_mergeid_crypt 

*  Save
save "$share_w1_out\sharew1_sp.dta", replace  

*  codebook*
codebookout "$codebook\sharew1_sp.xls", replace


*>> WAVE 2
use "$share_w2_out\sharew2_rel6-1-0_nl_sp.dta", clear   // Open the dataset  
gen wave=2                                // Create wave id 

*  Personal identifier & keep variables   
keep     ///
sp008_      /// Given help last twelve months
sp009_1     /// To whom did you give help: person 1
sp009_2     /// To whom did you give help: person 2
sp009_3     /// To whom did you give help: person 3
sp010d1_1   /// Help given person 1: personal care
sp010d1_2   /// Help given person 2: personal care
sp010d1_3   /// Help given person 3: personal care
sp010d2_1   /// Help given person 1: practical household help
sp010d2_2   /// Help given person 2: practical household help
sp010d2_3   /// Help given person 3: practical household help
sp010d3_1   /// Help given person 1: help with paperwork
sp010d3_2   /// Help given person 2: help with paperwork
sp010d3_3   /// Help given person 3: help with paperwork
sp011_1     /// How often given help to person 1
sp011_2     /// How often given help to person 2
sp011_3     /// How often given help to person 3
sp012_1     /// Hours given help to person 1
sp012_2     /// Hours given help to person 2
sp012_3     /// Hours given help to person 3
sp013_1     /// Have you given help to others
sp013_2     /// Have you given help to others
sp013_3     /// Have you given help to others
sp014_      /// Looked after grandchildren
sp015d1     /// Looked after child of child 1
sp015d2     /// Looked after child of child 2
sp015d3     /// Looked after child of child 3
sp015d4     /// Looked after child of child 4
sp015d5     /// Looked after child of child 5
sp015d6     /// Looked after child of child 6
sp015d7     /// Looked after child of child 7
sp015d8     /// Looked after child of child 8
sp015d9     /// Looked after child of child 9
sp015d10    /// Looked after child of child 10
sp015d11    /// Looked after child of child 11
sp015d12    /// Looked after child of child 12
sp015d13    /// Looked after child of child 13
sp015d14    /// Looked after child of child 14
sp015d15    /// Looked after child of child 15
sp015d16    /// Looked after child of child 16
sp015d17    /// Looked after child of child 17
sp015d18    /// Looked after child of child 18
sp015d19    /// Looked after child of child 19
sp015d20    /// Looked after child of child 20
sp015d21    /// Looked after child of deceased child
sp016_1     /// How often did you look after child of child 1
sp016_2     /// How often did you look after child of child 2
sp016_3     /// How often did you look after child of child 3
sp016_4     /// How often did you look after child of child 4
sp016_5     /// How often did you look after child of child 5
sp016_6     /// How often did you look after child of child 6
sp016_7     /// How often did you look after child of child 7
sp016_8     /// How often did you look after child of child 8
sp016_9     /// How often did you look after child of child 9
sp016_10    /// How often did you look after child of child 10
sp016_11    /// How often did you look after child of child 11
sp016_12    /// How often did you look after child of child 12
sp016_13    /// How often did you look after child of child 13
sp016_14    /// How often did you look after child of child 14
sp017_1     /// Hours looked after child(ren) of child 1
sp017_2     /// Hours looked after child(ren) of child 2
sp017_3     /// Hours looked after child(ren) of child 3
sp017_4     /// Hours looked after child(ren) of child 4
sp017_5     /// Hours looked after child(ren) of child 5
sp017_6     /// Hours looked after child(ren) of child 6
sp017_7     /// Hours looked after child(ren) of child 7
sp017_8     /// Hours looked after child(ren) of child 8
sp017_9     /// Hours looked after child(ren) of child 9
sp017_10    /// Hours looked after child(ren) of child 10
sp017_11    /// Hours looked after child(ren) of child 11
sp017_12    /// Hours looked after child(ren) of child 12
sp017_13    /// Hours looked after child(ren) of child 13
sp017_14    /// Hours looked after child(ren) of child 14
sp018_      /// Given help to someone with personal care in the household
sp019d1     /// R provided help with personal care to: spouse/partner
sp019d2     /// R provided help with personal care to: mother
sp019d3     /// R provided help with personal care to: father
sp019d4     /// R provided help with personal care to: mother-in-law
sp019d5     /// R provided help with personal care to: father-in-law
sp019d6     /// R provided help with personal care to: stepmother
sp019d7     /// R provided help with personal care to: stepfather
sp019d8     /// R provided help with personal care to: brother
sp019d9     /// R provided help with personal care to: sister
sp019d10    /// R provided help with personal care to: child 1
sp019d11    /// R provided help with personal care to: child 2
sp019d12    /// R provided help with personal care to: child 3
sp019d13    /// R provided help with personal care to: child 4
sp019d14    /// R provided help with personal care to: child 5
sp019d15    /// R provided help with personal care to: child 6
sp019d16    /// R provided help with personal care to: child 7
sp019d17    /// R provided help with personal care to: child 8
sp019d18    /// R provided help with personal care to: child 9
sp019d19    /// R provided help with personal care to: other child
sp019d20    /// R provided help with personal care to: son-in-law
sp019d21    /// R provided help with personal care to: daughter-in-law
sp019d22    /// R provided help with personal care to: grandchild
sp019d23    /// R provided help with personal care to: grandparent
sp019d24    /// R provided help with personal care to: aunt
sp019d25    /// R provided help with personal care to: uncle
sp019d26    /// R provided help with personal care to: niece
sp019d27    /// R provided help with personal care to: nephew
sp019d28    /// R provided help with personal care to: other relative
sp019d29    /// R provided help with personal care to: friend
sp019d30    /// R provided help with personal care to: (ex-)colleague
sp019d31    /// R provided help with personal care to: neighbour
sp019d32    /// R provided help with personal care to: ex-spouse/partner
sp019d33    /// R provided help with personal care to: other acquaintance
sp020       ///
wave     ///
Nl_mergeid_crypt
   
*  Save
save "$share_w2_out\sharew2_sp.dta", replace 
   
*  codebook*
codebookout "$codebook\sharew2_sp.xls", replace


*>> WAVE 4
use "$share_w4_out\sharew4_rel6-1-0_nl_sp.dta", clear    // Open the dataset  
gen wave=4                                   // Create wave id 


*  Rename other variables for consistency
rename sp009_1sp sp009_1 // To whom did you give help: person 1
rename sp009_2sp sp009_2 // To whom did you give help: person 2
rename sp009_3sp sp009_3 // To whom did you give help: person 3

*  Personal identifier & keep variables   
keep     ///
sp008_      /// Given help last twelve months
sp009_1     /// To whom did you give help: person 1
sp009_2     /// To whom did you give help: person 2
sp009_3     /// To whom did you give help: person 3
sp011_1     /// How often given help to person 1
sp011_2     /// How often given help to person 2
sp011_3     /// How often given help to person 3
sp013_1     /// Have you given help to others
sp013_2     /// Have you given help to others
sp013_3     /// Have you given help to others
sp014_      /// Looked after grandchildren
sp015d1     /// Looked after child of child 1
sp015d2     /// Looked after child of child 2
sp015d3     /// Looked after child of child 3
sp015d4     /// Looked after child of child 4
sp015d5     /// Looked after child of child 5
sp015d6     /// Looked after child of child 6
sp015d7     /// Looked after child of child 7
sp015d8     /// Looked after child of child 8
sp015d9     /// Looked after child of child 9
sp015d10    /// Looked after child of child 10
sp015d11    /// Looked after child of child 11
sp015d12    /// Looked after child of child 12
sp015d13    /// Looked after child of child 13
sp015d14    /// Looked after child of child 14
sp015d15    /// Looked after child of child 15
sp015d16    /// Looked after child of child 16
sp015d17    /// Looked after child of child 17
sp015d18    /// Looked after child of child 18
sp015d19    /// Looked after child of child 19
sp015d20    /// Looked after child of child 20
sp015d21    /// Looked after child of deceased child
sp016_1     /// How often did you look after child of child 1
sp016_2     /// How often did you look after child of child 2
sp016_3     /// How often did you look after child of child 3
sp016_4     /// How often did you look after child of child 4
sp016_5     /// How often did you look after child of child 5
sp016_6     /// How often did you look after child of child 6
sp016_7     /// How often did you look after child of child 7
sp016_8     /// How often did you look after child of child 8
sp016_9     /// How often did you look after child of child 9
sp016_10    /// How often did you look after child of child 10
sp016_11    /// How often did you look after child of child 11
sp016_12    /// How often did you look after child of child 12
sp016_13    /// How often did you look after child of child 13
sp016_14    /// How often did you look after child of child 14
sp016_15    /// How often do you look after child of child 15
sp016_16    /// How often do you look after child of child 16
sp016_17    /// How often do you look after child of child 17
sp016_18    /// How often do you look after child of child 18
sp016_19    /// How often do you look after child of child 19
sp016_20    /// How often do you look after child of child 20
sp018_      /// Given help to someone with personal care in the household
sp019d1sn   /// R provided help with personal care to: social network person 1
sp019d2sn   /// R provided help with personal care to: social network person 2
sp019d3sn   /// R provided help with personal care to: social network person 3
sp019d4sn   /// R provided help with personal care to: social network person 4
sp019d5sn   /// R provided help with personal care to: social network person 5
sp019d6sn   /// R provided help with personal care to: social network person 6
sp019d7sn   /// R provided help with personal care to: social network person 7
sp019d1sp   /// R provided help with personal care to: spouse/partner
sp019d2sp   /// R provided help with personal care to: mother
sp019d3sp   /// R provided help with personal care to: father
sp019d4sp   /// R provided help with personal care to: mother-in-law
sp019d5sp   /// R provided help with personal care to: father-in-law
sp019d6sp   /// R provided help with personal care to: stepmother
sp019d7sp   /// R provided help with personal care to: stepfather
sp019d8sp   /// R provided help with personal care to: brother
sp019d9sp   /// R provided help with personal care to: sister
sp019d19sp  /// R provided help with personal care to: child
sp019d20sp  /// R provided help with personal care to: son-in-law
sp019d21sp  /// R provided help with personal care to: daughter-in-law
sp019d22sp  /// R provided help with personal care to: grandchild
sp019d23sp  /// R provided help with personal care to: grandparent
sp019d24sp  /// R provided help with personal care to: aunt
sp019d25sp  /// R provided help with personal care to: uncle
sp019d26sp  /// R provided help with personal care to: niece
sp019d27sp  /// R provided help with personal care to: nephew
sp019d28sp  /// R provided help with personal care to: other relative
sp019d29sp  /// R provided help with personal care to: friend
sp019d30sp  /// R provided help with personal care to: ex-colleague
sp019d31sp  /// R provided help with personal care to: neighbour
sp019d32sp  /// R provided help with personal care to: ex-spouse/partner
sp019d34sp  /// R provided help with personal care to: step-child/current partner's child
sp019d35sp  /// R provided help with personal care to: minister, priest, or other clergy
sp019d36sp  /// R provided help with personal care to: therapist or other professional helper
sp019d37sp  /// R provided help with personal care to: housekeeper/home health care provider
sp019dno    /// R provided help with personal care to: NONE OF THESE
sp020       ///
wave     ///
Nl_mergeid_crypt
   
*  Save
save "$share_w4_out\sharew4_sp.dta", replace 
   
*  codebook*
codebookout "$codebook\sharew4_sp.xls", replace


*>> WAVE 5
use "$share_w5_out\sharew5_rel6-1-0_nl_sp.dta", clear    // Open the dataset  
gen wave=5                                   // Create wave id 

*  Personal identifier & keep variables
keep     ///
sp008_      /// Given help last twelve months
sp009_1     /// To whom did you give help: person 1
sp009_2     /// To whom did you give help: person 2
sp009_3     /// To whom did you give help: person 3
sp011_1     /// How often given help to person 1
sp011_2     /// How often given help to person 2
sp011_3     /// How often given help to person 3
sp013_1     /// Have you given help to others
sp013_2     /// Have you given help to others
sp013_3     /// Have you given help to others
sp014_      /// Looked after grandchildren
sp015d1     /// Looked after child of child 1
sp015d2     /// Looked after child of child 2
sp015d3     /// Looked after child of child 3
sp015d4     /// Looked after child of child 4
sp015d5     /// Looked after child of child 5
sp015d6     /// Looked after child of child 6
sp015d7     /// Looked after child of child 7
sp015d8     /// Looked after child of child 8
sp015d9     /// Looked after child of child 9
sp015d10    /// Looked after child of child 10
sp015d11    /// Looked after child of child 11
sp015d12    /// Looked after child of child 12
sp015d13    /// Looked after child of child 13
sp015d14    /// Looked after child of child 14
sp015d15    /// Looked after child of child 15
sp015d16    /// Looked after child of child 16
sp015d17    /// Looked after child of child 17
sp015d18    /// Looked after child of child 18
sp015d19    /// Looked after child of child 19
sp015d20    /// Looked after child of child 20
sp015d21    /// Looked after child of deceased child
sp016_1     /// How often did you look after child of child 1
sp016_2     /// How often did you look after child of child 2
sp016_3     /// How often did you look after child of child 3
sp016_4     /// How often did you look after child of child 4
sp016_5     /// How often did you look after child of child 5
sp016_6     /// How often did you look after child of child 6
sp016_7     /// How often did you look after child of child 7
sp016_8     /// How often did you look after child of child 8
sp016_9     /// How often did you look after child of child 9
sp016_10    /// How often did you look after child of child 10
sp016_11    /// How often did you look after child of child 11
sp016_12    /// How often did you look after child of child 12
sp016_13    /// How often did you look after child of child 13
sp016_14    /// How often did you look after child of child 14
sp016_15    /// How often do you look after child of child 15
sp016_16    /// How often do you look after child of child 16
sp016_17    /// How often do you look after child of child 17
sp016_18    /// How often do you look after child of child 18
sp016_19    /// How often do you look after child of child 19
sp016_20    /// How often do you look after child of child 20
sp018_      /// Given help to someone with personal care in the household
sp019d1     /// R provided help with personal care to: spouse/partner
sp019d2     /// R provided help with personal care to: mother
sp019d3     /// R provided help with personal care to: father
sp019d4     /// R provided help with personal care to: mother-in-law
sp019d5     /// R provided help with personal care to: father-in-law
sp019d6     /// R provided help with personal care to: stepmother
sp019d7     /// R provided help with personal care to: stepfather
sp019d8     /// R provided help with personal care to: brother
sp019d9     /// R provided help with personal care to: sister
sp019d10    /// R provided help with personal care to: child 1
sp019d11    /// R provided help with personal care to: child 2
sp019d12    /// R provided help with personal care to: child 3
sp019d13    /// R provided help with personal care to: child 4
sp019d14    /// R provided help with personal care to: child 5
sp019d15    /// R provided help with personal care to: child 6
sp019d16    /// R provided help with personal care to: child 7
sp019d17    /// R provided help with personal care to: child 8
sp019d18    /// R provided help with personal care to: child 9
sp019d19    /// R provided help with personal care to: other child
sp019d20    /// R provided help with personal care to: son-in-law
sp019d21    /// R provided help with personal care to: daughter-in-law
sp019d22    /// R provided help with personal care to: grandchild
sp019d23    /// R provided help with personal care to: grandparent
sp019d24    /// R provided help with personal care to: aunt
sp019d25    /// R provided help with personal care to: uncle
sp019d26    /// R provided help with personal care to: niece
sp019d27    /// R provided help with personal care to: nephew
sp019d28    /// R provided help with personal care to: other relative
sp019d29    /// R provided help with personal care to: friend
sp019d30    /// R provided help with personal care to: (ex-)colleague
sp019d31    /// R provided help with personal care to: neighbour
sp019d32    /// R provided help with personal care to: ex-spouse/partner
sp019d33    /// R provided help with personal care to: other acquaintance
sp020       ///
wave     ///
Nl_mergeid_crypt
   
*  Save
save "$share_w5_out\sharew5_sp.dta", replace 
   
*  codebook*
codebookout "$codebook\sharew5_sp.xls", replace



*---- [11.  (SHARE) Extract & Recode Variables from SN ]----------------------------------------------------------------*


*>> WAVE 4
use "$share_w4_out\sharew4_rel6-1-0_nl_sn.dta", clear    // Open the dataset  
gen wave=4                                   // Create wave id 

*  Personal identifier & keep variables   
keep     ///
sn005_1  /// Network relationship: SN person #
sn005_2     ///
sn005_3     ///
sn005_4     ///
sn005_5     ///
sn005_6     ///
sn005_7  ///
Nl_mergeid_crypt

*  Save
save "$share_w4_out\sharew4_sn.dta", replace  

*  codebook*
codebookout "$codebook\sharew4_sn.xls", replace



*---- [12.  (SHARE) Merge modules per wave ]----------------------------------------------------------------------------*


*>>   Wave 1 
use "$share_w1_out\sharew1_cv_r.dta", clear 

   merge 1:1 Nl_mergeid_crypt using "$share_w1_out\sharew1_mh.dta"            
   ta _merge
   keep if _merge==3
   drop _merge
   
   merge 1:1 Nl_mergeid_crypt using "$share_w1_out\sharew1_gv_health.dta"     
   ta _merge
   drop _merge
   
   merge 1:1 Nl_mergeid_crypt using "$share_w1_out\sharew1_ph.dta"            
   ta _merge
   drop _merge
   
   merge 1:1 Nl_mergeid_crypt using "$share_w1_out\sharew1_gv_imputations.dta"   
   ta _merge
   drop _merge
   
   merge 1:1 Nl_mergeid_crypt using "$share_w1_out\sharew1_dn.dta"            
   ta _merge
   drop _merge

   merge 1:1 Nl_mergeid_crypt using "$share_w1_out\sharew1_br.dta"            
   ta _merge
   drop _merge

   merge 1:1 Nl_mergeid_crypt using "$share_w1_out\sharew1_sp.dta"            
   ta _merge
   drop _merge

   merge 1:1 Nl_mergeid_crypt using "$share_w1_out\sharew1_technical_variables.dta"             
   ta _merge
   drop _merge

   merge 1:1 Nl_mergeid_crypt using "$share_w1_out\sharew1_ch.dta"            
   ta _merge
   drop _merge

*Save    
save "$share_w1_out\sharew1_merged_a.dta", replace


*>>   Wave 2
use "$share_w2_out\sharew2_cv_r.dta", clear 

   merge 1:1 Nl_mergeid_crypt using "$share_w2_out\sharew2_ph.dta"            
   ta _merge
   keep if _merge==3
   drop _merge
   
   merge 1:1 Nl_mergeid_crypt using "$share_w2_out\sharew2_mh.dta"            
   ta _merge
   drop _merge
   
   merge 1:1 Nl_mergeid_crypt using "$share_w2_out\sharew2_gv_health.dta"     
   ta _merge
   drop _merge
   
   merge 1:1 Nl_mergeid_crypt using "$share_w2_out\sharew2_gv_imputations.dta"   
   ta _merge
   drop _merge
   
   merge 1:1 Nl_mergeid_crypt using "$share_w2_out\sharew2_dn.dta"            
   ta _merge
   drop _merge

   merge 1:1 Nl_mergeid_crypt using "$share_w2_out\sharew2_br.dta"            
   ta _merge
   drop _merge

   merge 1:1 Nl_mergeid_crypt using "$share_w2_out\sharew2_sp.dta"            
   ta _merge
   drop _merge

   merge 1:1 Nl_mergeid_crypt using "$share_w2_out\sharew2_technical_variables.dta"             
   ta _merge
   drop _merge

   merge 1:1 Nl_mergeid_crypt using "$share_w2_out\sharew2_ch.dta"            
   ta _merge
   drop _merge


*Save    
save "$share_w2_out\sharew2_merged_a.dta", replace


*>>   Wave 4
use "$share_w4_out\sharew4_cv_r.dta", clear 

   merge 1:1 Nl_mergeid_crypt using "$share_w4_out\sharew4_ph.dta"            
   ta _merge
   keep if _merge==3
   drop _merge
   
   merge 1:1 Nl_mergeid_crypt using "$share_w4_out\sharew4_mh.dta"            
   ta _merge
   drop _merge
   
   merge 1:1 Nl_mergeid_crypt using "$share_w4_out\sharew4_gv_health.dta"     
   ta _merge
   drop _merge
   
   merge 1:1 Nl_mergeid_crypt using "$share_w4_out\sharew4_gv_imputations.dta"   
   ta _merge
   drop _merge
   
   merge 1:1 Nl_mergeid_crypt using "$share_w4_out\sharew4_dn.dta"            
   ta _merge
   drop _merge

   merge 1:1 Nl_mergeid_crypt using "$share_w4_out\sharew4_br.dta"            
   ta _merge
   drop _merge

   merge 1:1 Nl_mergeid_crypt using "$share_w4_out\sharew4_sp.dta"            
   ta _merge
   drop _merge

   merge 1:1 Nl_mergeid_crypt using "$share_w4_out\sharew4_sn.dta"            
   ta _merge
   drop _merge

   merge 1:1 Nl_mergeid_crypt using "$share_w4_out\sharew4_technical_variables.dta"             
   ta _merge
   drop _merge

   merge 1:1 Nl_mergeid_crypt using "$share_w4_out\sharew4_ch.dta"            
   ta _merge
   drop _merge
   
*>> Encoding this variable because it is str4 in master but int in using data (when you'll do the append)
rename ph013 ph013_old 
encode ph013, gen(ph013)
drop ph013_old 



*Save    
save "$share_w4_out\sharew4_merged_a.dta", replace


*>>   Wave 5
use "$share_w5_out\sharew5_cv_r.dta", clear 

   merge 1:1 Nl_mergeid_crypt using "$share_w5_out\sharew5_ph.dta"            
   ta _merge
   keep if _merge==3
   drop _merge
   
   merge 1:1 Nl_mergeid_crypt using "$share_w5_out\sharew5_mh.dta"            
   ta _merge
   drop _merge
   
   merge 1:1 Nl_mergeid_crypt using "$share_w5_out\sharew5_gv_health.dta"     
   ta _merge
   drop _merge
   
   merge 1:1 Nl_mergeid_crypt using "$share_w5_out\sharew5_gv_imputations.dta"   
   ta _merge
   drop _merge
   
   merge 1:1 Nl_mergeid_crypt using "$share_w5_out\sharew5_dn.dta"            
   ta _merge
   drop _merge

   merge 1:1 Nl_mergeid_crypt using "$share_w5_out\sharew5_br.dta"            
   ta _merge
   drop _merge

   merge 1:1 Nl_mergeid_crypt using "$share_w5_out\sharew5_sp.dta"            
   ta _merge
   drop _merge

   merge 1:1 Nl_mergeid_crypt using "$share_w5_out\sharew5_ch.dta"            
   ta _merge
   drop _merge   
   
   merge 1:1 Nl_mergeid_crypt using "$share_w5_out\sharew5_technical_variables.dta"             
   ta _merge
   drop _merge




*Save    
save "$share_w5_out\sharew5_merged_a.dta", replace


*---- [13.  (SHARE) Append waves to panel long format ]-----------------------------------------------------------------*


*  Append single wave files to one long file:
use          "$share_w1_out\sharew1_merged_a.dta", clear
append using "$share_w2_out\sharew2_merged_a.dta"
append using "$share_w4_out\sharew4_merged_a.dta"
append using "$share_w5_out\sharew5_merged_a.dta"
append using "$share_wX_out\sharewX_rel6-1-0_nl_gv_allwaves_cv_r.dta"




*---- [14.  (SHARE) Fix & (re)generate variables, labels, etc. + Long format save ]-------------------------------------*


*>>   Drop if wave is missing
drop if wave>=.

*>>   "Illogical" variables: 
   // (Just to be sure) Check for deviations within gender or isced: 
   // if gender deviates between waves, one information must be wrong
   // as there is no way to know which is the wrong information, both
   // are set to -99 (i.e. implausible value/suspected wrong)

* Gender
sort Nl_mergeid_crypt
egen  gender_change = sd(gender), by(Nl_mergeid_crypt)
ta       gender_change
replace gender = -99 if gender_change > 0 & gender_change < . 
drop  gender_change 
recode  gender (-99=.)

* Year of Birth
egen  yrbirth_change = sd(yrbirth), by(Nl_mergeid_crypt)
ta       yrbirth_change
replace yrbirth = -99 if yrbirth_change > 0 & yrbirth_change < . 
drop  yrbirth_change 
recode  yrbirth (-99=.)


// *  Eligibility 
//       (we can do this later actually)
//    // In wave 1 all household members born 1954 or earlier are eligible for an interview. Starting in wave 2, for new   //
//    // countries or refreshment samples, there is only one selected respondent per household who has to be born 1956 or //
//    // earlier in wave 2, 1960 or earlier in wave 4, 1962 or earlier in wave 5 and 1964 or earlier in wave 6. In      //
//    // addition – in all waves – current partners living in the same household are interviewed regardless of their age. //
//    
// drop if yrbirth>1954 & wave==1   // (96 observations deleted)
// drop if yrbirth>1956 & wave==2   // (55 observations deleted)
// drop if yrbirth>1960 & wave==4   // (46 observations deleted)
// drop if yrbirth>1962 & wave==5   // (57 observations deleted)
// 
// drop if age_int<50            // (30 observations deleted)
// 
// di in red "did not meet the original SHARE sample criteria, i.e. 50 years of age or older (N=284)"

*>> Recode wave id 
recode wave (4=3) (5=4) (6=5) (7=6)
label define lab_wave_year ///
  1 "[1] 2004-05"    ///
  2 "[2] 2006-07"    ///
  ///          /// <- gap here (No third wave "SHARELIFE")
  3 "[4] 2011-12"    ///
  4 "[5]    2013"    ///
  5 "[6]    2015"    /// 
  6 "[7]    2017"
label values wave lab_wave_year

* // Drop superfluous variables
drop deceased spheu spheu2 sphus sphus2 nl_hhid6 nl_coupleid6 nl_mergeidp1 nl_mergeidp2 nl_mergeidp3 nl_mergeidp4 nl_mergeidp5 nl_mergeidp6 Nl_hhid1_crypt Nl_hhid2_crypt Nl_hhid3_crypt Nl_hhid4_crypt Nl_hhid5_crypt Nl_coupleid1_crypt Nl_coupleid2_crypt Nl_coupleid3_crypt Nl_coupleid4_crypt Nl_coupleid5_crypt 


* // compress dataset
compress

* // Remove any notes
notes drop *


*---- [ 2.  (SHARE) Looking at data, and creating dependent variable(s)]---------------------------------------------*

*>> Dependent variables (Frailty Index)
   // (All the variable that will compose the Frailty Index will have the "FI_" prefix)


*  Self reported health 
   // I recode the variable, in accordance to Romero-Ortuno and Kenny (2012): 


recode srh (1=0) (2=0.25) (3=0.5) (4=0.75) (5=1), gen(FI_srh)  //    1.Excellent -> 0
                                                //    2.Very good -> 0.25
                                                // 3.Good      -> 0.5
                                                // 4.Fair      -> 0.75
                                                // 5.Poor      -> 1

*>> Engagement in activities requiring moderate or vigorous physical activity: hardly ever, or never

tab br015_, miss  // Sports or activities that are vigorous
tab br016_, miss  // Activities requiring a moderate level of energy
               // -> the above mentioned variables require a recode

*Sports or activities that are vigorous
ta br015_, miss
ta br015_, miss nola

*Activities requiring a moderate level of energy
ta br016_, miss
ta br016_, miss nola

*Recode -2 and -1 to Missing for both variables
recode br015_ br016_ (-2 -1 = .) 
ta br015_, miss // -> missing values = 0.67%
ta br016_, miss // -> missing values = 0.67%

*Generate a new variable in accordance to Romero-Ortuno and Kenny (2012)
gen FI_phactiv = 1
replace FI_phactiv = 0 if br015_<4 | br016_<4
replace FI_phactiv = . if br015_==. & br016_==.
label variable FI_phactiv "Engagement in activities requiring moderate or vigorous physical activity"

*Let's check what we have done
*list pid wave FI_phactiv br015_ br016_ in 50/100, sepby(pid)
tab FI_phactiv, miss // -> missing values = 0.65%


*>> ADL & IADL
tab1 ph049d1 ph049d2 ph049d3 ph049d4 ph049d5 ph049d6 ph049d8 ph049d9 ph049d10 ph049d11 ph049d12 ph049d13, miss       // (49d*)
tab1 ph049d1 ph049d2 ph049d3 ph049d4 ph049d5 ph049d6 ph049d8 ph049d9 ph049d10 ph049d11 ph049d12 ph049d13, miss nola // (49d*)

* recode to missing
recode ph049d1 ph049d2 ph049d3 ph049d4 ph049d5 ph049d6 ph049d8 ph049d9 ph049d10 ph049d11 ph049d12 ph049d13 (-2 -1 = .)

tab1 ph049d1 ph049d2 ph049d3 ph049d4 ph049d5 ph049d6 ph049d8 ph049d9 ph049d10 ph049d11 ph049d12 ph049d13, miss
                                    // <- all of these variables have 0.35% missing values

tab1 ph048d1 ph048d3 ph048d5 ph048d7 ph048d9, miss       // (48d*)
tab1 ph048d1 ph048d3 ph048d5 ph048d7 ph048d9, miss nola // (48d*)

* recode to missing
recode ph048d1 ph048d3 ph048d5 ph048d7 ph048d9  (-2 -1 = .)

tab1 ph048d1 ph048d3 ph048d5 ph048d7 ph048d9, miss // <-- 0.34% missing

*Rename new variables in accordance to Romero-Ortuno and Kenny (2012)
rename ph049d3       FI_bathing     // -> Difficulties: bathing or showering
rename ph048d5       FI_stairs      // -> Difficulties: climbing one flight of stairs
rename ph049d12   FI_garden      // -> Difficulties: doing work around the house or garden
rename ph049d1       FI_dressing    // -> Difficulties: dressing, including shoes and socks
rename ph049d4       FI_eating      // -> Difficulties: eating, cutting up food
rename ph049d5       FI_bed      // -> Difficulties: getting in or out of bed
rename ph048d3       FI_chair       // -> Difficulties: getting up from chair
rename ph048d9       FI_lift5kg     // -> Difficulties: lifting or carrying weights over 5 kilos
rename ph049d13   FI_money       // -> Difficulties: managing money
rename ph049d8       FI_hotmeal     // -> Difficulties: preparing a hot meal
rename ph048d7       FI_arms        // -> Difficulties: reaching or extending arms above shoulder
rename ph049d9       FI_shopping    // -> Difficulties: shopping for groceries
rename ph049d11   FI_medications // -> Difficulties: taking medications
rename ph049d6       FI_toilet      // -> Difficulties: using the toilet, incl getting up or down
rename ph048d1       FI_walk100     // -> Difficulties: walking 100 metres
rename ph049d2       FI_walkRoom    // -> Difficulties: walking across a room
rename ph049d10   FI_phone    // -> Difficulties: telephone calls


*>> Diminution in the desire for food and/or eating less than usual
tab mh011_, miss     	// Appetite
tab mh011_, miss nola   // Appetite

tab mh012_, miss     	// Eating more or less
tab mh012_, miss nola   // Eating more or less

recode mh011_ mh012_ (-2 -1 = .)
tab mh011_, miss     // Appetite
tab mh012_, miss     // Eating more or less

tab mh011_ mh012_, miss
tab mh011_ mh012_, miss nola

*Create a new variable in accordance to Romero-Ortuno and Kenny (2012)
gen FI_appetite = 0
replace FI_appetite = 1 if mh011_==1 | mh012_==1 // Diminution in desire for food
replace FI_appetite = . if mh011_==. & mh012_==.

*Let's check what we have done
*list pid wave FI_appetite mh011_ mh012_ in 1281/1509, sepby(pid)
*list pid wave FI_appetite mh011_ mh012_ if mh012_!=. in 43000/45000, sepby(pid)

tab FI_appetite wave, miss col nofre 

*>> Long term-illness
tab ph004_, miss
tab ph004_, miss nola

* Create a new variable in accordance to Romero-Ortuno and Kenny (2012)
recode ph004_ (-2 -1 = .) (5=0), gen(FI_longtermill)

tab FI_longtermill, miss // -> missing 0.32%

*>> Fatigue
tab mh013_, miss
tab mh013_, miss nola

* Create a new variable in accordance to Romero-Ortuno and Kenny (2012)
recode mh013_ (-2 -1 = .) (5=0), gen(FI_fatigue)

tab FI_fatigue, miss // missing 2.33%

*>> Sad or depressed
tab mh002_, miss     // <-- Sad or depressed last month
tab mh002_, miss nola

* Create a new variable in accordance to Romero-Ortuno and Kenny (2012)
recode mh002_ (-2 -1 = .) (5=0), gen(FI_sad)

tab FI_sad, miss // missing 2.29%

*>> Lack of enjoyment
tab mh016, miss      // <-- Sad or depressed last month
tab mh016, miss nola

* Create a new variable in accordance to Romero-Ortuno and Kenny (2012)
recode mh016 (-2 -1 = .) (2=0), gen(FI_enjoyment)

tab FI_enjoyment, miss // missing 2.39%

*>> Hopelessness
tab mh003_, miss     // <-- Hopes for the future
tab mh003_, miss nola

* Create a new variable in accordance to Romero-Ortuno and Kenny (2012)
recode mh003_ (-2 -1 = .) (1=0) (2=1), gen(FI_hopelessness)

tab FI_hopelessness, miss // missing 2.39%

*>> Doctor told you had: [Condition]
tab ph006d1,  miss         //<-- Doctor told you had: heart attack
tab ph006d1,  miss nola
tab ph006d2,  miss         //<-- Doctor told you had: high blood pressure or hypertension
tab ph006d2,  miss nola
tab ph006d4,  miss         //<-- Doctor told you had: stroke
tab ph006d4,  miss nola
tab ph006d5,  miss         //<-- Doctor told you had: diabetes or high blood sugar
tab ph006d5,  miss nola
tab ph006d6,  miss         //<-- Doctor told you had: chronic lung disease
tab ph006d6,  miss nola
tab ph006d8,  miss         //<-- Doctor told you had: arthritis
tab ph006d8,  miss nola
tab ph006d9,  miss         //<-- Doctor told you had: osteoporosis (Remember that you have a problem with this variable: 
tab ph006d9,  miss nola    //      see the "Dataset Creation" do-file)
tab ph006d10, miss         //<-- Doctor told you had: cancer
tab ph006d10, miss nola
tab ph006d14, miss         //<-- Doctor told you had: hip fracture or femoral fracture
tab ph006d14, miss nola
tab ph006d12, miss         //<-- Doctor told you had: Parkinson disease
tab ph006d12, miss nola

recode   ph006d1     /// Doctor told you had: heart attack
      ph006d2     /// Doctor told you had: high blood pressure or hypertension
      ph006d4     /// Doctor told you had: stroke
      ph006d5     /// Doctor told you had: diabetes or high blood sugar
      ph006d6     /// Doctor told you had: chronic lung disease
      ph006d8     /// Doctor told you had: arthritis
      ph006d9     /// Doctor told you had: osteoporosis
      ph006d10 /// Doctor told you had: cancer
      ph006d14 /// Doctor told you had: hip fracture or femoral fracture
      ph006d12    /// Doctor told you had: Parkinson disease
      (-2 -1 = .)

* Create a new variable in accordance to Romero-Ortuno and Kenny (2012)
rename ph006d1 FI_heartattack // Doctor told you had: heart attack
rename ph006d2 FI_hypertension   // Doctor told you had: high blood pressure or hypertension
rename ph006d4 FI_stroke      // Doctor told you had: stroke
rename ph006d5 FI_diabetes    // Doctor told you had: diabetes or high blood sugar
rename ph006d6 FI_lungdisease // Doctor told you had: chronic lung disease
rename ph006d8 FI_arthritis   // Doctor told you had: arthritis
rename ph006d9 FI_osteoporosis   // Doctor told you had: osteoporosis
rename ph006d10 FI_cancer     // Doctor told you had: cancer
rename ph006d14 FI_fracture      // Doctor told you had: hip fracture or femoral fracture
rename ph006d12 FI_parkinson  // Doctor told you had: Parkinson disease

tab FI_heartattack, miss   // Doctor told you had: heart attack
tab FI_hypertension, miss  // Doctor told you had: high blood pressure or hypertension
tab FI_stroke, miss     // Doctor told you had: stroke
tab FI_diabetes, miss      // Doctor told you had: diabetes or high blood sugar
tab FI_lungdisease, miss   // Doctor told you had: chronic lung disease
tab FI_arthritis, miss     // Doctor told you had: arthritis
tab FI_osteoporosis, miss  // Doctor told you had: osteoporosis
tab FI_cancer, miss     // Doctor told you had: cancer
tab FI_fracture, miss      // Doctor told you had: hip fracture or femoral fracture
               // <-- All the missing values are <0.42

*>> Impaired orientation to date, month, year, and day of the week (i.e. less than good)
tab orienti, miss       // <-- Score of orientation in time test
tab orienti, miss nola

*>> We can keep only non-imputed values if we want
tab orienti_f, miss 
tab orienti_f, miss nola
// replace orienti = . if orienti_f==14

* Create a new variable in accordance to Romero-Ortuno and Kenny (2012)
recode orienti (-2 -1 = .) (0/3=1) (4=0), gen(FI_orienti)

tab FI_orienti, miss // missing 2.75%
tab orienti FI_orienti, miss

*>> BMI *>> We can keep only non-imputed values if we want
sum bmi  // <-- Body Mass Index
tab bmi_f
tab bmi_f, nola
// replace bmi = . if bmi_f==14

* Generating a new BMI categorical variable
* See -> http://apps.who.int/bmi/?introPage=intro_3.html (WHO)
recode bmi  (00.00 / 18.5 =   1 "Underweight")  	///
         	(18.50 / 25.0 =   0 "Normal weight")   	///
         	(25.00 / 30.0 =   2 "Overweight")   	///
         	(30.00 / 9999 =   3 "Obese"),       	///
gen(bmi_cat)

* Create a new variable in accordance to Romero-Ortuno and Kenny (2012)
gen FI_bmi = . 
replace FI_bmi = 0 		if bmi_cat == 0 
replace FI_bmi = 0.5 	if bmi_cat == 2 
replace FI_bmi = 1 		if bmi_cat == 1 | bmi_cat == 3

* Let's check if what we have done it's right: 
ta bmi_cat FI_bmi, miss

*>> Bothered by: Condition
tab ph010d3, miss       // Bothered by: breathlessness
tab ph010d3 wave, miss  // Question not asked in wave 5 and 6

tab ph010d7, miss // Bothered by: falling down
tab ph010d8, miss // Bothered by: fear of falling down
tab ph010d9, miss // Bothered by: dizziness, faints or blackouts

tab ph010d7, miss nola // Bothered by: falling down
tab ph010d8, miss nola // Bothered by: fear of falling down
tab ph010d9, miss nola // Bothered by: dizziness, faints or blackouts

* Create a new variable in accordance to Romero-Ortuno and Kenny (2012)
recode ph010d7 (-2 -1 = .), gen(FI_falling)  // Bothered by: falling down
recode ph010d8 (-2 -1 = .), gen(FI_fearfall) // Bothered by: fear of falling down
recode ph010d9 (-2 -1 = .), gen(FI_dizziness)   // Bothered by: dizziness, faints or blackouts

*>> Grip Strenght in KG (by Body Mass Index)
tab maxgrip, miss       // missing values (by design) = 5.54% (699 observations)
tab maxgrip, miss nola
recode maxgrip (-99=.)

*>> We can keep only non-imputed values if we want
tab maxgrip_f, missing  // + 0.13% missing values imputed
tab maxgrip_f, miss nola
// replace maxgrip = . if maxgrip_f==-99 | maxgrip_f==14

* Create a new variable following precisely Romero-Ortuno and Kenny (2012)
gen   FI_maxgrip = 0
replace FI_maxgrip = . if maxgrip==.

replace  FI_maxgrip = 1                                           		///
   if                                                       			///
   (                                                                 	///
      gender == 1                                           			/// <<< Male
      &                                                  				///
      (                                                              	///
         (bmi <= 24 & maxgrip <= 29 & maxgrip !=.)             			///      - For BMI <= 24, GS <= 29
         |                                               				///
         (bmi >  24 & bmi   <= 28 & maxgrip <= 30 & maxgrip !=.)  		///      - For BMI > 24 and <= 28, GS <= 30
         |                                               				///
         (bmi >  28 & maxgrip <= 32 & maxgrip !=.)                   	///      - For BMI > 28, GS <= 32
      )                                                              	///
   )                                                     				///
                                                         				///
   |                                                     				///
                                                         				///
   (                                                                 	///
      gender == 2                                           			/// <<< Female
      &                                                  				///
      (                                                              	///
         (bmi <= 23 & maxgrip <= 17 & maxgrip !=.)             			///      - For BMI <= 23, GS <= 17
         |                                               				///
         (bmi >  23 & bmi   <= 26 & maxgrip <= 17.3 & maxgrip !=.)   	///      - For BMI > 23 and <= 26, GS <= 17.3
         |                                               				///
         (bmi >  26 & bmi   <= 29 & maxgrip <= 18.0 & maxgrip !=.)   	///      - For BMI > 26 and <= 29, GS <= 18
         |                                               				///
         (bmi >  29 & maxgrip <= 21 & maxgrip !=.)                   	///      - For BMI > 29, GS <= 21
      )                                                              	///
   )                                                                 	///

ta FI_maxgrip, miss // Confirm missing values = 8.58%



* Store the variables in FrailtyVars (only orienti, bmi, and maxgrip -were- imputed)
global FrailtyVars      ///
         FI_bathing        /// Difficulties: bathing or showering
         FI_stairs         /// Difficulties: climbing one flight of stairs
         FI_garden         /// Difficulties: doing work around the house or garden
         FI_dressing       /// Difficulties: dressing, including shoes and socks
         FI_eating         /// Difficulties: eating, cutting up food
         FI_bed            /// Difficulties: getting in or out of bed
         FI_chair          /// Difficulties: getting up from chair
         FI_lift5kg        /// Difficulties: lifting or carrying weights over 5 kilos
         FI_money          /// Difficulties: managing money
         FI_hotmeal        /// Difficulties: preparing a hot meal
         FI_arms           /// Difficulties: reaching or extending arms above shoulder
         FI_shopping       /// Difficulties: shopping for groceries
         FI_medications    /// Difficulties: taking medications
         FI_toilet         /// Difficulties: using the toilet, incl getting up or down
         FI_walk100        /// Difficulties: walking 100 metres
         FI_walkRoom       /// Difficulties: walking across a room
         FI_arthritis      /// Doctor told you had: arthritis
         FI_cancer         /// Doctor told you had: cancer
         FI_lungdisease    /// Doctor told you had: chronic lung disease
         FI_diabetes       /// Doctor told you had: diabetes or high blood sugar
         FI_heartattack    /// Doctor told you had: heart attack
         FI_hypertension   /// Doctor told you had: high blood pressure or hypertension
         FI_fracture       /// Doctor told you had: hip fracture or femoral fracture
         FI_stroke         /// Doctor told you had: stroke
         FI_phactiv        /// Engagement in activities requiring moderate or vigorous physical activity
         FI_appetite       /// FI_appetite
         FI_bmi            /// FI_bmi
         FI_sad            /// RECODE of mh002_ (Sad or depressed last month)
         FI_hopelessness   /// RECODE of mh003_ (Hopes for the future)
         FI_fatigue        /// RECODE of mh013_ (Fatigue)
         FI_enjoyment      /// RECODE of mh016_ (Enjoyment)
         FI_orienti        /// RECODE of orienti (Score of orientation in time test)
         FI_longtermill    /// RECODE of ph004_ (Long-term illness)
         FI_falling        /// RECODE of ph010d7 (Bothered by: falling down)
         FI_fearfall       /// RECODE of ph010d8 (Bothered by: fear of falling down)
         FI_dizziness      /// RECODE of ph010d9 (Bothered by: dizziness, faints or blackouts)
         FI_srh            /// RECODE of srh (Self-report of health)
         FI_maxgrip        /// Grip strenght
         FI_phone          /// Diffic, nola miss // ulties: telephone calls
         FI_parkinson       // Doctor told you had: Parkinson disease


*>> Creation of the index
*>> Generate the Frailty Index
gen fi =       (                 ///
            (FI_bathing      )   +  /// Difficulties: bathing or showering
            (FI_stairs       )   +  /// Difficulties: climbing one flight of stairs
            (FI_garden       )   +  /// Difficulties: doing work around the house or garden
            (FI_dressing     )   +  /// Difficulties: dressing, including shoes and socks
            (FI_eating       )   +  /// Difficulties: eating, cutting up food
            (FI_bed          )   +  /// Difficulties: getting in or out of bed
            (FI_chair        )   +  /// Difficulties: getting up from chair
            (FI_lift5kg      )   +  /// Difficulties: lifting or carrying weights over 5 kilos
            (FI_money        )   +  /// Difficulties: managing money
            (FI_hotmeal      )   +  /// Difficulties: preparing a hot meal
            (FI_arms         )   +  /// Difficulties: reaching or extending arms above shoulder
            (FI_shopping     )   +  /// Difficulties: shopping for groceries
            (FI_medications  )   +  /// Difficulties: taking medications
            (FI_toilet       )   +  /// Difficulties: using the toilet, incl getting up or down
            (FI_walk100      )   +  /// Difficulties: walking 100 metres
            (FI_walkRoom     )   +  /// Difficulties: walking across a room
            (FI_arthritis    )   +  /// Doctor told you had: arthritis
            (FI_cancer       )   +  /// Doctor told you had: cancer
            (FI_lungdisease  )   +  /// Doctor told you had: chronic lung disease
            (FI_diabetes     )   +  /// Doctor told you had: diabetes or high blood sugar
            (FI_heartattack  )   +  /// Doctor told you had: heart attack
            (FI_hypertension )   +  /// Doctor told you had: high blood pressure or hypertension
            (FI_fracture     )   +  /// Doctor told you had: hip fracture or femoral fracture
            (FI_stroke       )   +  /// Doctor told you had: stroke
            (FI_phactiv      )   +  /// Engagement in activities requiring moderate or vigorous physical activity
            (FI_appetite     )   +  /// FI_appetite
            (FI_bmi          )   +  /// FI_bmi
            (FI_sad          )   +  /// RECODE of mh002_ (Sad or depressed last month)
            (FI_hopelessness )   +  /// RECODE of mh003_ (Hopes for the future)
            (FI_fatigue      )   +  /// RECODE of mh013_ (Fatigue)
            (FI_enjoyment    )   +  /// RECODE of mh016_ (Enjoyment)
            (FI_orienti      )   +  /// RECODE of orienti (Score of orientation in time test)
            (FI_longtermill  )   +  /// RECODE of ph004_ (Long-term illness)
            (FI_falling      )   +  /// RECODE of ph010d7 (Bothered by: falling down)
            (FI_fearfall     )   +  /// RECODE of ph010d8 (Bothered by: fear of falling down)
            (FI_dizziness    )   +  /// RECODE of ph010d9 (Bothered by: dizziness, faints or blackouts)
            (FI_srh          )   +  /// RECODE of srh (Self-report of health)
            (FI_maxgrip      )   +  /// Grip strenght
            (FI_phone       ) +  /// Diffic, nola miss // ulties: telephone calls
            (FI_parkinson   )    /// Doctor told you had: Parkinson disease
            ) / 40

label variable fi "Frailty Index"

*>>	Creation of the index without mental health items
gen fi_excl_mh =    (                 		///
					(FI_bathing      )   +  /// Difficulties: bathing or showering
					(FI_stairs       )   +  /// Difficulties: climbing one flight of stairs
					(FI_garden       )   +  /// Difficulties: doing work around the house or garden
					(FI_dressing     )   +  /// Difficulties: dressing, including shoes and socks
					(FI_eating       )   +  /// Difficulties: eating, cutting up food
					(FI_bed          )   +  /// Difficulties: getting in or out of bed
					(FI_chair        )   +  /// Difficulties: getting up from chair
					(FI_lift5kg      )   +  /// Difficulties: lifting or carrying weights over 5 kilos
					(FI_money        )   +  /// Difficulties: managing money
					(FI_hotmeal      )   +  /// Difficulties: preparing a hot meal
					(FI_arms         )   +  /// Difficulties: reaching or extending arms above shoulder
					(FI_shopping     )   +  /// Difficulties: shopping for groceries
					(FI_medications  )   +  /// Difficulties: taking medications
					(FI_toilet       )   +  /// Difficulties: using the toilet, incl getting up or down
					(FI_walk100      )   +  /// Difficulties: walking 100 metres
					(FI_walkRoom     )   +  /// Difficulties: walking across a room
					(FI_arthritis    )   +  /// Doctor told you had: arthritis
					(FI_cancer       )   +  /// Doctor told you had: cancer
					(FI_lungdisease  )   +  /// Doctor told you had: chronic lung disease
					(FI_diabetes     )   +  /// Doctor told you had: diabetes or high blood sugar
					(FI_heartattack  )   +  /// Doctor told you had: heart attack
					(FI_hypertension )   +  /// Doctor told you had: high blood pressure or hypertension
					(FI_fracture     )   +  /// Doctor told you had: hip fracture or femoral fracture
					(FI_stroke       )   +  /// Doctor told you had: stroke
					(FI_phactiv      )   +  /// Engagement in activities requiring moderate or vigorous physical activity
					(FI_bmi          )   +  /// FI_bmi
					(FI_orienti      )   +  /// RECODE of orienti (Score of orientation in time test)
					(FI_longtermill  )   +  /// RECODE of ph004_ (Long-term illness)
					(FI_falling      )   +  /// RECODE of ph010d7 (Bothered by: falling down)
					(FI_fearfall     )   +  /// RECODE of ph010d8 (Bothered by: fear of falling down)
					(FI_dizziness    )   +  /// RECODE of ph010d9 (Bothered by: dizziness, faints or blackouts)
					(FI_srh          )   +  /// RECODE of srh (Self-report of health)
					(FI_maxgrip      )   +  /// Grip strenght
					(FI_phone       ) +  /// Diffic, nola miss // ulties: telephone calls
					(FI_parkinson   )    /// Doctor told you had: Parkinson disease
					) / 35

label variable fi "Frailty Index Excluding Mental Health variables"


*---- [ 3.  (SHARE) Looking at data, and creating independent variables]---------------------------------------------*


*>> Level of education recoding, ISCED
fre isced

recode isced (0 1 2 = 0 "Low") (3 4 = 1 "Medium") (5 6 = 2 "High"), gen(isced_new)

rename isced isced_old
rename isced_new isced
ta isced_old isced
drop isced_old

*>> We can keep only non-imputed values if we want
// replace isced = . if isced_f == 14 // we exclude the imputed values 


*>> Marital Status
ta mstat
ta mstat, nola

recode mstat   (1 2 3   = 0)              /// "Married (living/not living with spouse) or Registered partnership"
            (4       = 1)              /// "Never married"
            (5       = 2)              /// "Divorced"
            (6       = 3)              /// "Widowed"
                     , gen(marital)

lab var marital "Marital Status"
label define lab_mstat                                   ///
   0 "Married/Registered partnership (living/not living w/ spouse"   /// 
   1 "Never married"                                  ///
   2 "Divorced"                                       ///
   3 "Widowed"                                        //
label values marital lab_mstat

*>> We can keep only non-imputed values if we want
// replace marital = . if mstat_f == 14 // we exclude all the imputed values

*>> Number of living sons and daughters 
recode nchild (3/100 = 3), gen(nchild_cat)

label define lab_nchild ///
   0 "Childless"     ///
   1 "1"          ///
   2 "2"          ///
   3 "3+"
label values nchild* 

*>> We can keep only non-imputed values if we want
// replace nchild = . if nchild_f == 14 // we exclude all the imputed values 


*>> Employment status
ta cjs, miss
ta cjs gender, miss col nofre       /// The categories "unemployed", "sick/disabled" and "homemakers" differentiates by sex, 
                           //    (e.g. including mostly homemakers among females and unemployed, sick and disabled 
                           // among males).
ta cjs, miss nola
recode cjs (-99 97 = .) (3 4 5 = 3) // Employment status has three groups:
                           // retired, employed and non-employed (i.e. unemployed, sick/disabled and homemakers). 
 
label define lab_cjs          ///
   1 "Retired"                ///                                 
   2 "Employed or self-employed" ///                           
   3 "Non-employed"
label values cjs lab_cjs




*---- [16.  (SHARE) Final Save      ]-----------------------------------------------------------------------------------*

dropmiss, force 

*>> Final Save for SHARE (long)
save "$share_all_out\SHARE_LONG_6.1.0.dta", replace

   *>>   Put a "_w" suffix on each variable of the dataset ("_w" means wave)
foreach x of var * { 
   rename `x' `x'_w
} 
   // ... Except for this variable 
rename Nl_mergeid_crypt_w Nl_mergeid_crypt



*>> Reshape the datset (wide)
reshape wide            /// 
country_w gender_w mobirth_w yrbirth_w age_int_w mobirthp_w yrbirthp_w partnerinhh_w hhsize_w fam_resp_w hou_resp_w interview_w int_year_w int_month_w mh002__w mh003__w mh004__w mh005__w mh006__w mh007__w mh008__w mh009__w mh010__w mh011__w mh012__w mh013__w mh014__w mh015__w mh016__w mh017__w casp_w cusmoke_w drinkin2_w eurod_w ph004__w ph005__w FI_heartattack_w FI_hypertension_w FI_stroke_w FI_diabetes_w FI_lungdisease_w FI_arthritis_w FI_osteoporosis_w FI_cancer_w FI_parkinson_w FI_fracture_w ph010d3_w ph010d7_w ph010d8_w ph010d9_w ph013__w ph043__w ph044__w ph046__w FI_walk100_w FI_chair_w FI_stairs_w FI_arms_w FI_lift5kg_w FI_dressing_w FI_walkRoom_w FI_bathing_w FI_eating_w FI_bed_w FI_toilet_w ph049d7_w FI_hotmeal_w FI_shopping_w FI_phone_w FI_medications_w FI_garden_w FI_money_w srh_w ph012_w implicat_w exrate_w home_w mort_w ores_w fahc_w fohc_w bacc_w bsmf_w slti_w vbus_w sbus_w car_w liab_w thinc_w hnetw_w hrass_w hgfass_w hnfass_w yedu_w yedu_p_w mstat_w nchild_w ngrchild_w eyesightr_w hearing_w bmi_w weight_w height_w esmoked_w phinact_w orienti_w maxgrip_w doctor_w hospital_w thospital_w nhospital_w cjs_w pwork_w empstat1_w empstat2_w ghto_w ghih_w otrf_w fdistress_w nalm_w home_f_w mort_f_w ores_f_w fahc_f_w fohc_f_w bacc_f_w bsmf_f_w slti_f_w vbus_f_w sbus_f_w car_f_w liab_f_w thinc_f_w hrass_f_w hgfass_f_w hnfass_f_w hnetw_f_w gender_f_w yedu_f_w yedu_p_f_w isced_f_w sphus_f_w mstat_f_w nchild_f_w ngrchild_f_w eyesightr_f_w hearing_f_w bmi_f_w weight_f_w height_f_w esmoked_f_w phinact_f_w orienti_f_w maxgrip_f_w doctor_f_w hospital_f_w thospital_f_w nhospital_f_w cjs_f_w pwork_f_w empstat1_f_w empstat2_f_w otrf_f_w fdistress_f_w nalm_f_w income_implicatmean_w wealth_implicatmean_w dn014__w br001__w br002__w br003__w br010__w br015__w br016__w sp008__w sp009_1_w sp009_2_w sp009_3_w sp010d1_1_w sp010d1_2_w sp010d1_3_w sp010d2_1_w sp010d2_2_w sp010d2_3_w sp010d3_1_w sp010d3_2_w sp010d3_3_w sp011_1_w sp011_2_w sp011_3_w sp012_1_w sp012_2_w sp012_3_w sp013_1_w sp013_2_w sp014__w sp015d1_w sp015d2_w sp015d3_w sp015d4_w sp015d5_w sp015d6_w sp015d7_w sp015d8_w sp015d9_w sp015d10_w sp015d11_w sp015d12_w sp015d13_w sp015d14_w sp015d15_w sp015d16_w sp015d17_w sp015d18_w sp015d19_w sp015d20_w sp015d21_w sp016_1_w sp016_2_w sp016_3_w sp016_4_w sp016_5_w sp016_6_w sp016_7_w sp016_8_w sp016_11_w sp016_12_w sp016_14_w sp016_17_w sp017_1_w sp017_2_w sp017_3_w sp017_4_w sp017_5_w sp017_6_w sp017_7_w sp017_8_w sp017_11_w sp017_12_w sp017_14_w sp017_17_w sp018__w sp019d1_w sp019d2_w sp019d3_w sp019d4_w sp019d5_w sp019d6_w sp019d7_w sp019d8_w sp019d9_w sp019d10_w sp019d11_w sp019d12_w sp019d13_w sp019d14_w sp019d15_w sp019d16_w sp019d17_w sp019d18_w sp019d19_w sp019d20_w sp019d21_w sp019d22_w sp019d23_w sp019d24_w sp019d25_w sp019d26_w sp019d27_w sp019d28_w sp019d29_w sp019d30_w sp019d31_w sp019d32_w sp019d33_w sp020__w fin_resp_w mn005__w language_w ch001__w ch002__w ch005_1_w ch005_2_w ch005_3_w ch005_4_w ch005_5_w ch005_6_w ch005_7_w ch005_8_w ch005_9_w ch005_10_w ch005_11_w ch005_12_w ch005_13_w ch005_14_w ch005_15_w ch005_16_w ch005_17_w ch006_1_w ch006_2_w ch006_3_w ch006_4_w ch006_5_w ch006_6_w ch006_7_w ch006_8_w ch006_9_w ch006_10_w ch006_11_w ch006_12_w ch006_13_w ch006_14_w ch006_15_w ch006_16_w ch006_17_w ch007_1_w ch007_2_w ch007_3_w ch007_4_w ch007_5_w ch007_6_w ch007_7_w ch007_8_w ch007_9_w ch007_10_w ch007_11_w ch007_12_w ch007_13_w ch007_14_w ch007_15_w ch007_16_w ch007_17_w ch008c_1_w ch008c_2_w ch008c_3_w ch008c_4_w ch008c_5_w ch008c_6_w ch008c_7_w ch008c_8_w ch008c_9_w ch008c_10_w ch008c_11_w ch008c_12_w ch008c_14_w ch010_1_w ch010_2_w ch010_3_w ch010_4_w ch011_1_w ch011_2_w ch011_3_w ch011_4_w ch012_1_w ch012_2_w ch012_3_w ch012_4_w ch013_1_w ch013_2_w ch013_3_w ch013_4_w ch014_1_w ch014_2_w ch014_3_w ch014_4_w ch015_1_w ch015_2_w ch015_3_w ch015_4_w ch016_1_w ch016_2_w ch016_3_w ch016_4_w ch017_1_w ch017_2_w ch017_3_w ch017_4_w ch018d1_1_w ch018d1_2_w ch018d1_3_w ch018d1_4_w ch018d2_1_w ch018d2_2_w ch018d2_3_w ch018d2_4_w ch018d3_1_w ch018d3_2_w ch018d3_3_w ch018d3_4_w ch018d4_1_w ch018d4_2_w ch018d4_3_w ch018d4_4_w ch018d5_1_w ch018d5_2_w ch018d5_3_w ch018d5_4_w ch018d6_1_w ch018d6_2_w ch018d6_3_w ch018d6_4_w ch018d7_1_w ch018d7_2_w ch018d7_3_w ch018d7_4_w ch018d8_1_w ch018d8_2_w ch018d8_3_w ch018d8_4_w ch018d9_1_w ch018d9_2_w ch018d9_3_w ch018d9_4_w ch018d10_1_w ch018d10_2_w ch018d10_3_w ch018d10_4_w ch018d11_1_w ch018d11_2_w ch018d11_3_w ch018d11_4_w ch018d12_1_w ch018d12_2_w ch018d12_3_w ch018d12_4_w ch018d13_1_w ch018d13_2_w ch018d13_3_w ch018d13_4_w ch018d95_1_w ch018d95_2_w ch018d95_3_w ch018d95_4_w ch018dno_1_w ch018dno_2_w ch018dno_3_w ch018dno_4_w ch018dot_1_w ch018dot_2_w ch018dot_3_w ch018dot_4_w ch019_1_w ch019_2_w ch019_3_w ch019_4_w ch020_1_w ch020_2_w ch020_3_w ch020_4_w ch021__w ch022__w ch023__w chselch1_w chselch2_w chselch3_w chselch4_w Nl_mergeidp1_crypt_w thinc2_w empstat_w thinc2_f_w empstat_f_w dn044__w br022__w Nl_mergeidp2_crypt_w perho_w naly_w saly_w perho_f_w naly_f_w saly_f_w sp016_16_w sp019d1sn_w sp019d2sn_w sp019d3sn_w sp019d4sn_w sp019d5sn_w sp019d6sn_w sp019d7sn_w sp019d1sp_w sp019d2sp_w sp019d3sp_w sp019d4sp_w sp019d5sp_w sp019d6sp_w sp019d7sp_w sp019d8sp_w sp019d9sp_w sp019d19sp_w sp019d20sp_w sp019d21sp_w sp019d22sp_w sp019d23sp_w sp019d24sp_w sp019d25sp_w sp019d26sp_w sp019d27sp_w sp019d28sp_w sp019d29sp_w sp019d30sp_w sp019d31sp_w sp019d32sp_w sp019d34sp_w sp019d35sp_w sp019d36sp_w sp019d37sp_w sp019dno_w sn005_1_w sn005_2_w sn005_3_w sn005_4_w sn005_5_w sn005_6_w sn005_7_w ch002_1_w ch002_2_w ch002_3_w ch002_4_w ch002_5_w ch002_6_w ch002_7_w ch002_8_w ch002_9_w ch002_10_w ch002_11_w ch002_12_w ch002_16_w ch010_5_w ch010_6_w ch010_7_w ch011_5_w ch011_6_w ch011_7_w ch011_8_w ch012_5_w ch012_6_w ch012_7_w ch012_8_w ch012_9_w ch012_10_w ch012_11_w ch012_12_w ch012_16_w ch013_5_w ch013_6_w ch013_7_w ch013_8_w ch013_9_w ch013_10_w ch013_11_w ch013_12_w ch014_5_w ch014_6_w ch014_7_w ch014_8_w ch014_9_w ch014_10_w ch014_11_w ch014_12_w ch014_13_w ch014_14_w ch014_16_w ch015_5_w ch015_6_w ch015_7_w ch015_8_w ch015_9_w ch015_10_w ch015_16_w ch016_5_w ch016_6_w ch016_7_w ch016_8_w ch016_9_w ch016_10_w ch016_11_w ch016_12_w ch016_13_w ch016_14_w ch016_16_w ch017_5_w ch017_6_w ch017_7_w ch017_8_w ch017_9_w ch017_10_w ch017_11_w ch017_12_w ch017_16_w ch018d1_5_w ch018d1_6_w ch018d1_7_w ch018d1_8_w ch018d1_9_w ch018d1_10_w ch018d1_11_w ch018d1_12_w ch018d1_16_w ch018d2_5_w ch018d2_6_w ch018d2_7_w ch018d2_8_w ch018d2_9_w ch018d2_10_w ch018d2_11_w ch018d2_12_w ch018d2_16_w ch018d3_5_w ch018d3_6_w ch018d3_7_w ch018d3_8_w ch018d3_9_w ch018d3_10_w ch018d3_11_w ch018d3_12_w ch018d3_16_w ch018d4_5_w ch018d4_6_w ch018d4_7_w ch018d4_8_w ch018d4_9_w ch018d4_10_w ch018d4_11_w ch018d4_12_w ch018d4_16_w ch018d5_5_w ch018d5_6_w ch018d5_7_w ch018d5_8_w ch018d5_9_w ch018d5_10_w ch018d5_11_w ch018d5_12_w ch018d5_16_w ch018d6_5_w ch018d6_6_w ch018d6_7_w ch018d6_8_w ch018d6_9_w ch018d6_10_w ch018d6_11_w ch018d6_12_w ch018d6_16_w ch018d7_5_w ch018d7_6_w ch018d7_7_w ch018d7_8_w ch018d7_9_w ch018d7_10_w ch018d7_11_w ch018d7_12_w ch018d7_16_w ch018d8_5_w ch018d8_6_w ch018d8_7_w ch018d8_8_w ch018d8_9_w ch018d8_10_w ch018d8_11_w ch018d8_12_w ch018d8_16_w ch018d9_5_w ch018d9_6_w ch018d9_7_w ch018d9_8_w ch018d9_9_w ch018d9_10_w ch018d9_11_w ch018d9_12_w ch018d9_16_w ch018d10_5_w ch018d10_6_w ch018d10_7_w ch018d10_8_w ch018d10_9_w ch018d10_10_w ch018d10_11_w ch018d10_12_w ch018d10_16_w ch018d11_5_w ch018d11_6_w ch018d11_7_w ch018d11_8_w ch018d11_9_w ch018d11_10_w ch018d11_11_w ch018d11_12_w ch018d11_16_w ch018d12_5_w ch018d12_6_w ch018d12_7_w ch018d12_8_w ch018d12_9_w ch018d12_10_w ch018d12_11_w ch018d12_12_w ch018d12_16_w ch018d13_5_w ch018d13_6_w ch018d13_7_w ch018d13_8_w ch018d13_9_w ch018d13_10_w ch018d13_16_w ch018d95_5_w ch018d95_6_w ch018d95_7_w ch018d95_8_w ch018d95_9_w ch018d95_10_w ch018d95_11_w ch018d95_12_w ch018d95_16_w ch018dno_5_w ch018dno_6_w ch018dno_7_w ch018dno_8_w ch018dno_9_w ch018dno_10_w ch018dno_16_w ch018dot_5_w ch018dot_6_w ch018dot_7_w ch018dot_8_w ch018dot_9_w ch018dot_10_w ch018dot_11_w ch018dot_12_w ch018dot_16_w ch019_5_w ch019_6_w ch019_7_w ch019_8_w ch019_9_w ch019_10_w ch019_11_w ch019_12_w ch019_16_w ch020_5_w ch020_6_w ch020_7_w ch020_8_w ch020_9_w ch020_10_w ch020_16_w ch504_1_w ch504_2_w ch504_3_w ch504_4_w ch504_5_w ch504_6_w ch504_7_w ch504_8_w ch504_9_w ch504_10_w ch504_11_w ch504_12_w ch504_13_w ch504_14_w ch504_15_w ch504_17_w ch505_1_w ch505_2_w ch505_3_w ch505_4_w ch505_5_w ch505_6_w ch505_7_w ch505_8_w ch505_9_w ch505_10_w ch505_11_w ch505_12_w ch505_13_w ch505_14_w ch505_17_w ch508__w ch509d1_w ch509d2_w ch509d3_w ch509d4_w ch509d5_w ch509d6_w ch510_1_w ch510_2_w ch510_6_w ch511__w ch512d1_w ch512d2_w ch512d3_w ch512d4_w ch512d5_w ch512d6_w ch514__w ch515d1_w ch515d2_w ch515d3_w ch515d4_w ch515d5_w ch515d6_w ch515d7_w ch515d8_w ch515d9_w ch516_1_w ch516_2_w ch516_3_w ch516_4_w ch516_5_w ch516_6_w ch516_7_w ch516_8_w ch517__w ch518d1_w ch518d2_w ch518d3_w ch518d4_w ch518d5_w ch518d6_w ch518d7_w ch518d8_w ch518d9_w ch518d10_w ch518d11_w ch518d12_w ch519_1_w ch519_2_w ch519_3_w ch519_4_w ch519_5_w ch519_6_w ch519_7_w ch519_8_w ch520_1_w ch520_2_w ch520_3_w ch520_4_w ch520_5_w ch520_6_w ch520_7_w ch520_8_w ch524__w ch525d1_w ch525d2_w ch525d3_w ch525d4_w ch525d5_w ch525d6_w ch525d7_w ch525d8_w ch525d9_w ch525d10_w ch525d12_w ch525d13_w ch525d14_w ch525d16_w ch526_1_w ch526_2_w ch526_3_w ch526_4_w ch526_5_w ch526_6_w ch526_7_w ch526_8_w Nl_mergeidp4_crypt_w ph013_w ph012__w lookjob_w lookjob_f_w ch513d1_1_w ch513d1_2_w ch513d1_3_w ch513d1_4_w ch513d1_5_w ch513d1_6_w ch513d2_1_w ch513d2_2_w ch513d2_3_w ch513d2_4_w ch513d2_5_w ch513d2_6_w ch513d3_1_w ch513d3_2_w ch513d3_3_w ch513d3_4_w ch513d3_5_w ch513d3_6_w ch513d4_1_w ch513d4_2_w ch513d4_3_w ch513d4_4_w ch513d4_5_w ch513d4_6_w ch513d5_1_w ch513d5_2_w ch513d5_3_w ch513d5_4_w ch513d5_5_w ch513d5_6_w ch513d6_1_w ch513d6_2_w ch513d6_3_w ch513d6_4_w ch513d6_5_w ch513d6_6_w ch513d7_1_w ch513d7_2_w ch513d7_3_w ch513d7_4_w ch513d7_5_w ch513d7_6_w ch513d8_1_w ch513d8_2_w ch513d8_3_w ch513d8_4_w ch513d8_5_w ch513d8_6_w ch513d9_1_w ch513d9_2_w ch513d9_3_w ch513d9_4_w ch513d9_5_w ch513d9_6_w ch513d10_1_w ch513d10_2_w ch513d10_3_w ch513d10_4_w ch513d10_5_w ch513d10_6_w ch513d11_1_w ch513d11_2_w ch513d11_3_w ch513d11_4_w ch513d11_5_w ch513d11_6_w ch513d12_1_w ch513d12_2_w ch513d12_3_w ch513d12_4_w ch513d12_5_w ch513d12_6_w ch513d95_1_w ch513d95_2_w ch513d95_3_w ch513d95_4_w ch513d95_5_w ch513d95_6_w ch513dot_1_w ch513dot_2_w ch513dot_3_w ch513dot_4_w ch513dot_5_w ch513dot_6_w Nl_mergeidp5_crypt_w FI_srh_w FI_phactiv_w FI_appetite_w FI_longtermill_w FI_fatigue_w FI_sad_w FI_enjoyment_w FI_hopelessness_w FI_orienti_w bmi_cat_w FI_bmi_w FI_falling_w FI_fearfall_w FI_dizziness_w FI_maxgrip_w fi_w isced_w marital_w nchild_cat_w fi_excl_mh_w ///
, i(Nl_mergeid_crypt) j(wave_w)

*  Remember the following: 
      // wave = 1 -> [1] 2004-05 (2968; 23.54)
      // wave = 2 -> [2] 2006-07 (2683; 21.28)
      // wave = 3 -> [4] 2011-12 (2789; 22.12)
      // wave = 4 -> [5]    2013 (4168; 33.06) 

*>> Final Save for SHARE (long)
save "$share_all_out\SHARE_WIDE_6.1.0.dta", replace



*---- [17.     (CBS) Files "Pop."  ]-----------------------------------------------------------------------------------*

*************************
*  POPULATIEKINDTABV1   *
*************************

*>> Open the dataset 
use "$cbs_filePop_in\POPULATIEKINDTABV1.dta", clear

encode   RINPERSOONS,   gen(rinpersoons)
gen         rinpersoon     = real(RINPERSOON)

*>> Label variables 
*  NL 
label variable RINPERSOONS    "codering voor de kwaliteit van de omzetting van een bsn/sofinummer naar rinpersoon"
label variable RINPERSOON  "betekenis- en dimensieloos identificatienummer ter vervanging van het sofi-nummer/bsn"

*  EN 
label variable rinpersoons    "encoding for the quality of the conversion of a bsn / sofi number to rinperson"
label variable rinpersoon  "meaning and dimensionless identification number to replace the social security number / bsn"


*>> About RINPERSOONS label values: 
   // "A" "RINPERSOON NIET IN GBA/BRP, POLISNUMMER"
   // "C" "RINPERSOON NIET IN GBA/BRP, CITONUMMER"
   // "D" "RINPERSOON NIET IN GBA/BRP, DOODGEBORENE"
   // "E" "RINPERSOON NIET IN GBA/BRP, ENQUETE NR"
   // "F" "RINPERSOON NIET IN GBA/BRP, NIET SOFINRPROEF"
   // "G" "RINPERSOON NIET IN GBA/BRP, GEEN SOFINR"
   // "H" "RINPERSOON NIET IN GBA/BRP, HO CORRESNUMMER"
   // "K" "RINPERSOON NIET IN GBA/BRP, KENTEKENS (RDW)"
   // "N" "RINPERSOON IN BRP, GEEN ANUMMER BEKEND"
   // "O" "RINPERSOON NIET IN GBA/BRP, ONDERWIJSNUMMER"
   // "R" "RINPERSOON WEL IN GBA/BRP"
   // "S" "RINPERSOON NIET IN GBA/BRP, WEL SOFINRPROEF"
   // "V" "RINPERSOON NIET IN GBA/BRP, SATELLIET VEILIGHEID"
   // "Z" "RINPERSOON NIET IN GBA/BRP, SATELLIET GEZONDHEID EN ZORG"

*>> // compress dataset
compress

*>> // Remove any notes
notes drop *

// *>> Order variables 
// order                                        /// 
// RINPERSOONS rinpersoons                         ///
// RINPERSOON rinpersoon                           ///

*>> Sort dataset 
sort RINPERSOON RINPERSOONS

*>> Generate new ID variable (because the zero at the beginning is problematic)
gen pid = RINPERSOONS + RINPERSOON 

*>> Save 
save "$cbs_filePop_out\populatiekindtabv1.dta", replace




*********************
*  POPULATIETABV1    *
*********************

*>> Open the dataset 
use "$cbs_filePop_in\POPULATIETABV1.dta", clear

encode   RINPERSOONS,   gen(rinpersoons)
gen   rinpersoon     = real(RINPERSOON)
gen   share          = real(SHARE)
gen   partner     = real(PARTNER)
gen   populatie      = real(POPULATIE)

*>> Label variables 
*  NL 
label variable RINPERSOONS    "codering voor de kwaliteit van de omzetting van een bsn/sofinummer naar rinpersoon"
label variable RINPERSOON  "betekenis- en dimensieloos identificatienummer ter vervanging van het sofi-nummer/bsn"
label variable SHARE       "persoon zit in de SHARE-steekproef"
label variable PARTNER     "persoon is partner van een SHARE-persoon, en kan ook zelf in SHARE zitten"
label variable POPULATIE   "persoon zit in de SHARE-steekproef en heeft 1 of meer kinderen"

*  EN 
label variable rinpersoons    "encoding for the quality of the conversion of a bsn / sofi number to rinperson"
label variable rinpersoon  "meaning and dimensionless identification number to replace the social security number / bsn"
label variable share       "person is in the SHARE sample"
label variable partner     "person is a partner of a SHARE person, and can also be in SHARE himself"
label variable populatie   "person is in the SHARE sample and has 1 or more children"

*>> // compress dataset
compress

*>> // Remove any notes
notes drop *

// *>> Order variables 
// order                ///
// RINPERSOONS rinpersoons ///
// RINPERSOON  rinpersoon  ///
// SHARE       share       ///
// PARTNER  partner  ///
// POPULATIE   populatie   

*>> Sort dataset 
sort RINPERSOON RINPERSOONS

*>> Generate new ID variable (because the zero at the beginning is problematic)
gen pid = RINPERSOONS + RINPERSOON 

*>> Save 
save "$cbs_filePop_out\populatietabv1.dta", replace




*---- [17.1.      (CBS) File 1      ]-----------------------------------------------------------------------------------*

   *  Open the dataset 
use "$cbs_file1_in\FILE1BACKGROUNDPARENTS20190101ANAV1.dta", clear 

   *  Create a codebook
codebookout "$codebook\FILE1BACKGROUNDPARENTS20190101ANAV1", replace

*>> Convert from string to numeric (or missing)
   *  Personal IDs
encode   RINPERSOONS,   gen(rinpersoons)
gen   rinpersoon     = real(RINPERSOON)
gen   vrlhuishoudnr  = real(VRLHUISHOUDNR)

   *  Gender
gen   vrlgbageslacht = real(VRLGBAGESLACHT)
recode   vrlgbageslacht (. = .a) if vrlgbageslacht == . & VRLGBAGESLACHT == " "  // Recode missing (.a = "Unknown")

   *  Generation 
gen   vrlgbageneratie = real(VRLGBAGENERATIE)
recode   vrlgbageneratie (. = .a) if vrlgbageneratie == . & VRLGBAGENERATIE == " " 

   *  Year of birth
gen   vrlgbageboortejaar = real(VRLGBAGEBOORTEJAAR)
recode   vrlgbageboortejaar (. = .a) if vrlgbageboortejaar == . & VRLGBAGEBOORTEJAAR == " " 

   *  Month of birth
gen   vrlgbageboortemaand = real(VRLGBAGEBOORTEMAAND)
recode   vrlgbageboortemaand (. = .a) if vrlgbageboortemaand == . & VRLGBAGEBOORTEMAAND == " " 

   *  Migration background (CBS definition)
gen   vrlgbaherkomstgroepering = real(VRLGBAHERKOMSTGROEPERING)
recode   vrlgbaherkomstgroepering (. = .a) if vrlgbaherkomstgroepering == . & VRLGBAHERKOMSTGROEPERING == " " 

*>> Date and time 
   *  Date of death
gen double  vrlgbadatumoverlijden = clock(VRLGBADATUMOVERLIJDEN, "YMD")    // Creating new variable readable by Stata
format      vrlgbadatumoverlijden %tc                             // date/time format -> this new date and time variable is now readable by Stata
recode      vrlgbadatumoverlijden (. = .b) if vrlgbadatumoverlijden == . & VRLGBADATUMOVERLIJDEN == " "     // Recode missing (.b = "Alive")

   *  Starting date of the household
gen double  vrldatumaanvanghh = clock(VRLDATUMAANVANGHH, "YMD")   
format      vrldatumaanvanghh %tc
recode      vrldatumaanvanghh (. = .c) if vrldatumaanvanghh == . & VRLDATUMAANVANGHH == " " // Recode missing (.c = "Date unknown")

gen double vrldatumeindehh = clock(VRLDATUMEINDEHH, "YMD")                          // (?) why some "dates of termination" are in the 2050? 
format vrldatumeindehh %tc
recode      vrldatumeindehh (. = .c) if vrldatumeindehh == . & VRLDATUMEINDEHH == " "        // Recode missing (.c = "Date unknown")

*>> Label variables 
   * EN 
label variable rinpersoons                "Coding for the quality of the conversion of a BSN/sofin number to rinperso"
label variable rinpersoon                 "Meaningless and dimensionless identification number to replace the social security number"
label variable vrlgbageslacht             "Gender"
label variable vrlgbageneratie            "Migrant Generation"
label variable vrlgbageboortejaar         "Year of birth"
label variable vrlgbageboortemaand        "Month of birth"
label variable vrlgbaherkomstgroepering   "Migration background (CBS definition)"
label variable vrlgbadatumoverlijden      "Date of death"
label variable vrldatumaanvanghh          "Starting date of the household"
label variable vrldatumeindehh            "Date of termination of the household"
label variable vrlhuishoudnr              "Unique household identification number at reference time"

   * NL 
label variable RINPERSOONS "codering voor de kwaliteit van de omzetting van een bsn/sofinummer naar rinpersoon"
label variable RINPERSOON "betekenis- en dimensieloos identificatienummer ter vervanging van het sofi-nummer/bsn"
label variable VRLGBAGESLACHT "geslacht"
label variable VRLGBAGENERATIE "generatie"
label variable VRLGBAGEBOORTEJAAR "geboortejaar"
label variable VRLGBAGEBOORTEMAAND "geboortemaand"
label variable VRLGBAHERKOMSTGROEPERING "migratieachtergrond (cbs definitie)"
label variable VRLGBADATUMOVERLIJDEN "datum van overlijden"
label variable VRLDATUMAANVANGHH "aanvangsdatum van het huishouden."
label variable VRLDATUMEINDEHH "be indigingsdatum van het huishouden."
label variable VRLHUISHOUDNR "uniek identificatienummer huishouden op peilmoment."


*>> Label Define  
 
label define VRLGBAGESLACHT_lab     /// 
.a    "Unknown"                     ///
1  "Men"                         ///
2  "Women"
 
label define VRLGBAGENERATIE_lab       /// 
.a    "Unknown"                     ///
0  "Native"                      ///
1  "First generation immigrant"     ///
2  "Second generation immigrant"
 
label define VRLGBAGEBOORTEMAAND_lab    /// 
.a    "Unknown"                     ///
01    "January"                     /// 
02    "February"                    /// 
03    "March"                       /// 
04    "April"                       /// 
05    "May"                         /// 
06    "June"                        /// 
07    "July"                        /// 
08    "August"                      /// 
09    "September"                   /// 
10    "October"                     /// 
11    "November"                    /// 
12    "December"

label define VRLGBADATUMOVERLIJDEN_lab  /// 
.b    "Alive"

label define VRLDATUMAANVANGHH_lab     /// 
.c    "Date unknown"

label define VRLDATUMEINDEHH_lab       /// 
.c    "Date unknown"

label define VRLGBAHERKOMSTGROEPERING_lab          /// 
.a     "Disclosed"                           /// 
0000 "Unknown / Not applicable"                       /// 
1234 "Netherlands (asylum seeker centers)"            /// 
5001 "Canada"                                         /// 
5002 "Frankrijk"                                      /// 
5003 "Zwitserland"                                    /// 
5004 "Rhodesië"                                       /// 
5005 "Malawi"                                         /// 
5006 "Cuba"                                           /// 
5007 "Suriname"                                       /// 
5008 "Tunesië"                                        /// 
5009 "Oostenrijk"                                     /// 
5010 "België"                                         /// 
5011 "Botswana"                                       /// 
5012 "Iran"                                           /// 
5013 "Nieuwzeeland"                                   /// 
5014 "Zuidafrika"                                     /// 
5015 "Denemarken"                                     /// 
5016 "Noordjemen"                                     /// 
5017 "Hongarije"                                      /// 
5018 "Saoediarabië"                                   /// 
5019 "Liberia"                                        /// 
5020 "Etiopië"                                        /// 
5021 "Chili"                                          /// 
5022 "Marokko"                                        /// 
5023 "Togo"                                           /// 
5024 "Ghana"                                          /// 
5025 "Laos"                                           /// 
5026 "Angola"                                         /// 
5027 "Filipijnen"                                     /// 
5028 "Zambia"                                         /// 
5029 "Mali"                                           /// 
5030 "Ivoorkust"                                      /// 
5031 "Burma"                                          /// 
5032 "Monaco"                                         /// 
5033 "Colombia"                                       /// 
5034 "Albanië"                                        /// 
5035 "Kameroen"                                       /// 
5036 "Zuidviëtnam"                                    /// 
5037 "Singapore"                                      /// 
5038 "Paraguay"                                       /// 
5039 "Zweden"                                         /// 
5040 "Cyprus"                                         /// 
5041 "Australisch Nieuwguinea"                        /// 
5042 "Brunei"                                         /// 
5043 "Irak"                                           /// 
5044 "Mauritius"                                      /// 
5045 "Vaticaanstad"                                   /// 
5046 "Kashmir"                                        /// 
5047 "Myanmar"                                        /// 
5048 "Jemen"                                          /// 
5049 "Slovenië"                                       /// 
5050 "Zaïre"                                          /// 
5051 "Kroatië"                                        /// 
5052 "Taiwan"                                         /// 
5053 "Rusland"                                        /// 
5054 "Armenië"                                        /// 
5055 "Ascension"                                      /// 
5056 "Azoren"                                         /// 
5057 "Bahrein"                                        /// 
5058 "Bhutan"                                         /// 
5059 "Britse Antillen"                                /// 
5060 "Comoren"                                        /// 
5061 "Falklandeilanden"                               /// 
5062 "Frans Guyana"                                   /// 
5063 "Frans Somaliland"                               /// 
5064 "Gilbert- en Ellice-eilanden"                    /// 
5065 "Groenland"                                      /// 
5066 "Guadeloupe"                                     /// 
5067 "Kaapverdische Eilanden"                         /// 
5068 "Macau"                                          /// 
5069 "Martinique"                                     /// 
5070 "Mozambique"                                     /// 
5071 "Pitcairneilanden"                               /// 
5072 "Guinee Bissau"                                  /// 
5073 "Réunion"                                        /// 
5074 "Saint Pierre en Miquelon"                       /// 
5075 "Seychellen en Amiranten"                        /// 
5076 "Tonga"                                          /// 
5077 "Wallis en Futuna"                               /// 
5078 "Zuidwest Afrika"                                /// 
5079 "Frans Indië"                                    /// 
5080 "Johnston"                                       /// 
5081 "Kedah"                                          /// 
5082 "Kelantan"                                       /// 
5083 "Malakka"                                        /// 
5084 "Mayotte"                                        /// 
5085 "Negri Sembilan"                                 /// 
5086 "Pahang"                                         /// 
5087 "Perak"                                          /// 
5088 "Perlis"                                         /// 
5089 "Portugees Indië"                                /// 
5090 "Selangor"                                       /// 
5091 "Sikkim"                                         /// 
5092 "Sint Vincent en de Grenadinen"                  /// 
5093 "Spitsbergen"                                    /// 
5094 "Trengganu"                                      /// 
5095 "Aruba"                                          /// 
5096 "Burkina Faso"                                   /// 
5097 "Azerbajdsjan"                                   /// 
5098 "Belarus (Wit-Rusland)"                          /// 
5099 "Kazachstan"                                     /// 
5100 "Macedonië"                                      /// 
5101 "Timor Leste"                                    /// 
5102 "Servië en Montenegro"                           /// 
5103 "Servië"                                         /// 
5104 "Montenegro"                                     /// 
5105 "Kosovo"                                         /// 
5106 "Bonaire"                                        /// 
5107 "Curaçao"                                        /// 
5108 "Saba"                                           /// 
5109 "Sint Eustatius"                                 /// 
5110 "Sint Maarten"                                   /// 
5111 "Zuid-Soedan"                                    /// 
5112 "Gazastrook en Westelijke Jordaanoever"          /// 
5113 "Republiek Noord-Macedonië"                      /// 
6000 "Moldavië"                                       /// 
6001 "Burundi"                                        /// 
6002 "Finland"                                        /// 
6003 "Griekenland"                                    /// 
6004 "Guatemala"                                      /// 
6005 "Nigeria"                                        /// 
6006 "Libië"                                          /// 
6007 "Ierland"                                        /// 
6008 "Brazilië"                                       /// 
6009 "Rwanda"                                         /// 
6010 "Venezuela"                                      /// 
6011 "IJsland"                                        /// 
6012 "Liechtenstein"                                  /// 
6013 "Somalia"                                        /// 
6014 "Verenigde Staten van Amerika"                   /// 
6015 "Bolivia"                                        /// 
6016 "Australië"                                      /// 
6017 "Jamaica"                                        /// 
6018 "Luxemburg"                                      /// 
6019 "Tsjaad"                                         /// 
6020 "Mauritanië"                                     /// 
6021 "Kyrgyzstan"                                     /// 
6022 "China"                                          /// 
6023 "Afganistan"                                     /// 
6024 "Indonesië"                                      /// 
6025 "Guyana"                                         /// 
6026 "Noordviëtnam"                                   /// 
6027 "Noorwegen"                                      /// 
6028 "San Marino"                                     /// 
6029 "Duitsland"                                      /// 
6030 "Nederland"                                      /// 
6031 "Kambodja"                                       /// 
6032 "Fiji"                                           /// 
6033 "Bahama-eilanden"                                /// 
6034 "Israël"                                         /// 
6035 "Nepal"                                          /// 
6036 "Zuidkorea"                                      /// 
6037 "Spanje"                                         /// 
6038 "Oekraine"                                       /// 
6039 "Grootbrittannië"                                /// 
6040 "Niger"                                          /// 
6041 "Haïti"                                          /// 
6042 "Jordanië"                                       /// 
6043 "Turkije"                                        /// 
6044 "Trinidad en Tobago"                             /// 
6045 "Joegoslavië"                                    /// 
6046 "Bovenvolta"                                     /// 
6047 "Algerije"                                       /// 
6048 "Gabon"                                          /// 
6049 "Noordkorea"                                     /// 
6050 "Oezbekistan"                                    /// 
6051 "Sierra Leone"                                   /// 
6052 "Brits Honduras"                                 /// 
6053 "Canarische eilanden"                            /// 
6054 "Frans Polynesië"                                /// 
6055 "Gibraltar"                                      /// 
6056 "Portugees Timor"                                /// 
6057 "Tadzjikistan"                                   /// 
6058 "Britse Salomons-eilanden"                       /// 
6059 "São Tomé en Principe"                           /// 
6060 "Sint Helena"                                    /// 
6061 "Tristan Da Cunha"                               /// 
6062 "Westsamoa"                                      /// 
6063 "Toerkmenistan"                                  /// 
6064 "Georgië"                                        /// 
6065 "Bosnië-Herzegovina"                             /// 
6066 "Tsjechië"                                       /// 
6067 "Slowakije"                                      /// 
6068 "Federale Republiek Joegoslavië"                 /// 
6069 "Democratische Republiek Congo"                  /// 
7001 "Uganda"                                         /// 
7002 "Kenya"                                          /// 
7003 "Malta"                                          /// 
7004 "Barbados"                                       /// 
7005 "Andorra"                                        /// 
7006 "Mexico"                                         /// 
7007 "Costa Rica"                                     /// 
7008 "Gambia"                                         /// 
7009 "Syrië"                                          /// 
7011 "Nederlandse Antillen (oud)"                     /// 
7012 "Zuidjemen"                                      /// 
7014 "Egypte"                                         /// 
7015 "Argentinië"                                     /// 
7016 "Lesotho"                                        /// 
7017 "Honduras"                                       /// 
7018 "Nicaragua"                                      /// 
7020 "Pakistan"                                       /// 
7021 "Senegal"                                        /// 
7023 "Dahomey"                                        /// 
7024 "Bulgarije"                                      /// 
7026 "Maleisië"                                       /// 
7027 "Dominicaanse Republiek"                         /// 
7028 "Polen"                                          /// 
7029 "Rusland (oud)"                                  /// 
7030 "Britse Maagdeneilanden"                         /// 
7031 "Tanzania"                                       /// 
7032 "El Salvador"                                    /// 
7033 "Sri Lanka"                                      /// 
7034 "Soedan"                                         /// 
7035 "Japan"                                          /// 
7036 "Hongkong"                                       /// 
7037 "Panama"                                         /// 
7038 "Uruguay"                                        /// 
7039 "Ecuador"                                        /// 
7040 "Guinee"                                         /// 
7041 "Maldiven"                                       /// 
7042 "Thailand"                                       /// 
7043 "Libanon"                                        /// 
7044 "Italië"                                         /// 
7045 "Koeweit"                                        /// 
7046 "India"                                          /// 
7047 "Roemenië"                                       /// 
7048 "Tsjechoslowakije"                               /// 
7049 "Peru"                                           /// 
7050 "Portugal"                                       /// 
7051 "Oman"                                           /// 
7052 "Mongolië"                                       /// 
7053 "Samoa"                                          /// 
7054 "Verenigde Arabische Emiraten"                   /// 
7055 "Tibet"                                          /// 
7057 "Nauru"                                          /// 
7058 "Nederlands Nieuwguinea"                         /// 
7059 "Tanganyika"                                     /// 
7060 "Palestina"                                      /// 
7062 "Brits Westindië"                                /// 
7063 "Portugees Afrika"                               /// 
7064 "Letland"                                        /// 
7065 "Estland"                                        /// 
7066 "Litouwen"                                       /// 
7067 "Brits Afrika"                                   /// 
7068 "Belgisch Congo"                                 /// 
7070 "Brits Indië"                                    /// 
7071 "Noordrhodesië"                                  /// 
7072 "Zuidrhodesië"                                   /// 
7073 "Saarland"                                       /// 
7074 "Frans Indo China"                               /// 
7075 "Brits Westborneo"                               /// 
7076 "Goudkust"                                       /// 
7077 "Ras-El-Cheima"                                  /// 
7079 "Frans Congo"                                    /// 
7080 "Siam"                                           /// 
7082 "Brits Oostafrika"                               /// 
7083 "Brits Noordborneo"                              /// 
7084 "Bangladesh"                                     /// 
7085 "Duitse Democratische Republiek"                 /// 
7087 "Madeira-eilanden"                               /// 
7088 "Amerikaanse Maagdeneilanden"                    /// 
7089 "Australische Salomonseilanden"                  /// 
7091 "Spaanse Sahara"                                 /// 
7092 "Caymaneilanden"                                 /// 
7093 "Caicoseilanden"                                 /// 
7094 "Turkseilanden"                                  /// 
7095 "Brits Territorium in Antarctica"                /// 
7096 "Brits Territorium in de Indische Oceaan"        /// 
7097 "Cookeilanden"                                   /// 
7098 "Tokelau-eilanden"                               /// 
7099 "Nieuwcaledonië"                                 /// 
8000 "Hawaii-eilanden"                                /// 
8001 "Guam"                                           /// 
8002 "Amerikaans Samoa"                               /// 
8003 "Midway"                                         /// 
8004 "Ryukyueilanden"                                 /// 
8005 "Wake"                                           /// 
8006 "Pacific eilanden"                               /// 
8008 "Grenada"                                        /// 
8009 "Marianen"                                       /// 
8010 "Cabinda"                                        /// 
8011 "Canton en Enderbury"                            /// 
8012 "Christmaseiland"                                /// 
8013 "Cocoseilanden"                                  /// 
8014 "Faeröer"                                        /// 
8015 "Montserrat"                                     /// 
8016 "Norfolk"                                        /// 
8017 "Belize"                                         /// 
8018 "Tasmanië"                                       /// 
8019 "Turks- en Caicoseilanden"                       /// 
8020 "Puerto Rico"                                    /// 
8021 "Papua-Nieuwguinea"                              /// 
8022 "Solomoneilanden"                                /// 
8023 "Benin"                                          /// 
8024 "Viëtnam"                                        /// 
8025 "Kaapverdië"                                     /// 
8026 "Seychellen"                                     /// 
8027 "Kiribati"                                       /// 
8028 "Tuvalu"                                         /// 
8029 "Sint Lucia"                                     /// 
8030 "Dominica"                                       /// 
8031 "Zimbabwe"                                       /// 
8032 "Doebai"                                         /// 
8033 "Nieuwehebriden"                                 /// 
8034 "Kanaaleilanden"                                 /// 
8035 "Man"                                            /// 
8036 "Anguilla"                                       /// 
8037 "Saint Kitts-Nevis"                              /// 
8038 "Antigua"                                        /// 
8039 "Sint Vincent"                                   /// 
8040 "Gilberteilanden"                                /// 
8041 "Panamakanaalzone"                               /// 
8042 "Saint Kitts-Nevis-Anguilla"                     /// 
8043 "Belau"                                          /// 
8044 "Republiek van Palau"                            /// 
8045 "Antigua en Barbuda"                             /// 
9000 "Newfoundland"                                   /// 
9001 "Nyasaland"                                      /// 
9003 "Eritrea"                                        /// 
9005 "Ifni"                                           /// 
9006 "Brits Kameroen"                                 /// 
9007 "Kaiser Wilhelmsland"                            /// 
9008 "Kongo"                                          /// 
9009 "Kongo Kinshasa"                                 /// 
9010 "Madagaskar"                                     /// 
9013 "Kongo Brazzaville"                              /// 
9014 "Leewardeilanden"                                /// 
9015 "Windwardeilanden"                               /// 
9016 "Frans gebied van Afars en Issa's"               /// 
9017 "Phoenixeilanden"                                /// 
9020 "Portugees Guinee"                               /// 
9022 "Duits Zuidwestafrika"                           /// 
9023 "Namibië"                                        /// 
9027 "Brits Somaliland"                               /// 
9028 "Italiaans Somaliland"                           /// 
9030 "Nederlands Indië"                               /// 
9031 "Brits Guyana"                                   /// 
9036 "Swaziland"                                      /// 
9037 "Katar"                                          /// 
9041 "Aden"                                           /// 
9042 "Zuidarabische Federatie"                        /// 
9043 "Equatoriaalguinee"                              /// 
9044 "Spaans Guinee"                                  /// 
9047 "Verenigde Arabische Republiek"                  /// 
9048 "Bermuda"                                        /// 
9049 "Sovjetunie"                                     /// 
9050 "Duits Oostafrika"                               /// 
9051 "Zanzibar"                                       /// 
9052 "Ceylon"                                         /// 
9053 "Muscat en Oman"                                 /// 
9054 "Trucial Oman"                                   /// 
9055 "Indo China"                                     /// 
9056 "Marshalleilanden"                               /// 
9057 "Sarawak"                                        /// 
9058 "Brits Borneo"                                   /// 
9060 "Sabah"                                          /// 
9061 "Aboe Dhabi"                                     /// 
9062 "Adjman"                                         /// 
9063 "Basoetoland"                                    /// 
9064 "Bechuanaland"                                   /// 
9065 "Foedjaira"                                      /// 
9066 "Frans Kameroen"                                 /// 
9067 "Johore"                                         /// 
9068 "Korea"                                          /// 
9069 "Labuan"                                         /// 
9070 "Oem el Koewein"                                 /// 
9071 "Oostenrijk-Hongarije"                           /// 
9072 "Portugees Oost Afrika"                          /// 
9073 "Portugees West Afrika"                          /// 
9074 "Sjardja"                                        /// 
9075 "Straits Settlements"                            /// 
9076 "Abessinië"                                      /// 
9077 "Frans West Afrika"                              /// 
9078 "Frans Equatoriaal Afrika"                       /// 
9081 "Oeroendi"                                       /// 
9082 "Roeanda-Oeroendi"                               /// 
9084 "Goa"                                            /// 
9085 "Dantzig"                                        /// 
9086 "Centrafrika"                                    /// 
9087 "Djibouti"                                       /// 
9088 "Transjordanië"                                  /// 
9089 "Bondsrepubliek Duitsland"                       /// 
9090 "Vanuatu"                                        /// 
9091 "Niue"                                           /// 
9092 "Spaans Noordafrika"                             /// 
9093 "Westelijke Sahara"                              /// 
9094 "Micronesia"                                     /// 
9095 "Svalbardeilanden"                               /// 
9999 "International area"
 
*>> Label values 
label values rinpersoons RINPERSOONS_lab
label values vrlgbageslacht VRLGBAGESLACHT_lab
label values vrlgbageneratie VRLGBAGENERATIE_lab
label values vrlgbageboortemaand VRLGBAGEBOORTEMAAND_lab
label values vrlgbaherkomstgroepering VRLGBAHERKOMSTGROEPERING_lab
label values vrlgbadatumoverlijden VRLGBADATUMOVERLIJDEN_lab
label values vrldatumaanvanghh VRLDATUMAANVANGHH_lab
label values vrldatumeindehh VRLDATUMEINDEHH_lab

// *>> Order variables 
// order                                     ///
// RINPERSOON rinpersoon                        ///
// RINPERSOONS rinpersoons                      ///
// VRLDATUMAANVANGHH vrldatumaanvanghh             ///
// VRLDATUMEINDEHH vrldatumeindehh              ///
// VRLGBADATUMOVERLIJDEN vrlgbadatumoverlijden     ///
// VRLGBAGEBOORTEJAAR vrlgbageboortejaar           ///
// VRLGBAGEBOORTEMAAND vrlgbageboortemaand         ///
// VRLGBAGENERATIE vrlgbageneratie              ///
// VRLGBAGESLACHT vrlgbageslacht                   ///
// VRLGBAHERKOMSTGROEPERING vrlgbaherkomstgroepering  ///
// VRLHUISHOUDNR vrlhuishoudnr 

*>> // compress dataset
compress

*>> // Remove any notes
notes drop *

*>> Sort dataset 
sort RINPERSOON RINPERSOONS

*>> Generate new ID variable (because the zero at the beginning is problematic)
gen pid = RINPERSOONS + RINPERSOON 

*>> Save 
save "$cbs_file1_out\file1backgroundparents20190101anav1.dta", replace


*---- [17.2.      (CBS) File 2      ]-----------------------------------------------------------------------------------*

   *  Open the dataset 
use "$cbs_file2_in\FILE2BACKGROUNDCHILDREN20190101ANAV1.dta", clear

   *  Create a codebook
codebookout "$codebook\FILE2BACKGROUNDCHILDREN20190101ANAV1", replace

*>> Convert from string to numeric (or missing) -> Personal IDs, etc.
encode   RINPERSOONS,   gen(rinpersoons)
encode   RINPERSOONSPA,    gen(rinpersoonspa)
encode   RINPERSOONSMA,    gen(rinpersoonsma)
gen   rinpersoon     = real(RINPERSOON)
gen   rinpersoonpa   = real(RINPERSOONPA)
gen   rinpersoonma   = real(RINPERSOONMA)
gen   vrlhuishoudnr  = real(VRLHUISHOUDNR)      

*>> Convert from string to numeric (or missing) -> Other variables 

   *  Migration background (CBS definition)
gen   vrlgbaherkomstgroepering   = real(VRLGBAHERKOMSTGROEPERING)
recode   vrlgbaherkomstgroepering   (. = .a) if vrlgbaherkomstgroepering == . & VRLGBAHERKOMSTGROEPERING == " " 

   *  Year of birth
gen   vrlgbageboortejaar         = real(VRLGBAGEBOORTEJAAR)
recode   vrlgbageboortejaar         (. = .a) if vrlgbageboortejaar == . & VRLGBAGEBOORTEJAAR == " " 

   *  Gender 
gen   vrlgbageslacht             = real(VRLGBAGESLACHT)
recode   vrlgbageslacht             (. = .a) if vrlgbageslacht == . & VRLGBAGESLACHT == " "  // Recode missing (.a = "Unknown")

   *  Month of birth
gen   vrlgbageboortemaand     = real(VRLGBAGEBOORTEMAAND)
recode   vrlgbageboortemaand     (. = .a) if vrlgbageboortemaand == . & VRLGBAGEBOORTEMAAND == " " 

   *  Generation 
gen   vrlgbageneratie         = real(VRLGBAGENERATIE)
recode   vrlgbageneratie         (. = .a) if vrlgbageneratie == . & VRLGBAGENERATIE == " " 

   *  Birth municipality
gen   vrlgbageboortegemeente     = real(VRLGBAGEBOORTEGEMEENTE)
recode  vrlgbageboortegemeente      (. = .a) if vrlgbageboortegemeente == . & VRLGBAGEBOORTEGEMEENTE == "----"    // unknown
recode   vrlgbageboortegemeente     (. = .d) if vrlgbageboortegemeente == . & VRLGBAGEBOORTEGEMEENTE == " "    // other missing 

   *  Level of education in 18 categories n highest level of education
gen   oplnivsoi2016agg4hbmetnirwo   = real(OPLNIVSOI2016AGG4HBMETNIRWO)
recode  oplnivsoi2016agg4hbmetnirwo (. = .a) if oplnivsoi2016agg4hbmetnirwo == . & OPLNIVSOI2016AGG4HBMETNIRWO == " "

   *  Translation of historical gemcode to code of the year concerned 
gen   geboortegemeente        = real(GEBOORTEGEMEE) 
recode  geboortegemeente (. = .a) if geboortegemeente == . & GEBOORTEGEMEENTE == "----"   // unknown
recode   geboortegemeente (. = .d) if geboortegemeente == . & GEBOORTEGEMEENTE == " "        // other missing 

*>> Duplicate variable
clonevar gewichthoogsteopl = GEWICHTHOOGSTEOPL  

*>> Date and time 
   *  Starting date of the household
gen double  vrldatumaanvanghh          = clock(VRLDATUMAANVANGHH, "YMD")               // Creating new variable readable by Stata
format      vrldatumaanvanghh %tc                                             // date/time format -> this new date and time variable is now readable by Stata
recode      vrldatumaanvanghh (. = .c) if vrldatumaanvanghh == . & VRLDATUMAANVANGHH == " " // Recode missing (.c = "Date unknown")

   *  End date of the household
gen double  vrldatumeindehh         = clock(VRLDATUMEINDEHH, "YMD") 
format      vrldatumeindehh %tc
recode      vrldatumeindehh (. = .c) if vrldatumeindehh == . & VRLDATUMEINDEHH == " "        // Recode missing (.c = "Date unknown")

   *  Date of death
gen double  vrlgbadatumoverlijden      = clock(VRLGBADATUMOVERLIJDEN, "YMD")
format      vrlgbadatumoverlijden %tc
recode      vrlgbadatumoverlijden (. = .b) if vrlgbadatumoverlijden == . & VRLGBADATUMOVERLIJDEN == " "     // Recode missing (.b = "Alive")

*>> Label variables 
label variable rinpersoons                "Encoding for the quality of the conversion of a BSN / sofi number to rinperson"
label variable rinpersoon              "Meaning and dimensionless identification number to replace the social security number / BSN"
label variable vrlgbaherkomstgroepering     "Migration background (CBS definition)"
label variable vrlgbageboortejaar           "Year of birth"
label variable vrlgbageslacht             "Gender"
label variable vrlgbageboortemaand           "Month of birth"
label variable vrlgbageneratie               "Generation"
label variable vrlgbadatumoverlijden        "Date of death"
label variable vrlgbageboortegemeente     "Birth municipality"
label variable rinpersoonma                  "Together with rinpersoonsma this is the (legal) mother"
label variable rinpersoonpa                  "Together with rinperspa this is the (legal) father"
label variable rinpersoonspa              "Kind of rinperson (legal) father"
label variable rinpersoonsma           "Kind of rinperson (legal) mother"
label variable oplnivsoi2016agg4hbmetnirwo   "Level of education in 18 categories n highest level of education"
label variable gewichthoogsteopl          "Overweight; 1 for register records, <> 1 for ebb records"
label variable vrldatumaanvanghh          "Starting date of the household"
label variable vrldatumeindehh            "End date of the household"
label variable vrlhuishoudnr              "Unique household identification number at the reference point"
label variable geboortegemeente           "Translation of historical gemcode to code of the year concerned"

label variable RINPERSOONS "codering voor de kwaliteit van de omzetting van een bsn/sofinummer naar rinpersoon"
label variable RINPERSOON "betekenis- en dimensieloos identificatienummer ter vervanging van het sofi-nummer/bsn"
label variable VRLGBAHERKOMSTGROEPERING "migratieachtergrond (cbs definitie)"
label variable VRLGBAGEBOORTEJAAR "geboortejaar"
label variable VRLGBAGESLACHT "geslacht"
label variable VRLGBAGEBOORTEMAAND "geboortemaand"
label variable VRLGBAGENERATIE "generatie (migratie)"
label variable VRLGBADATUMOVERLIJDEN "datum van overlijden"
label variable VRLGBAGEBOORTEGEMEENTE "geboortegemeente"
label variable RINPERSOONMA "samen met rinpersoonsma is dit de (juridische) moeder"
label variable RINPERSOONPA "samen met rinpersoonspa is dit de (juridische)  vader"
label variable RINPERSOONSPA "soort rinpersoon (juridische) vader"
label variable RINPERSOONSMA "soort rinpersoon (juridische) moeder"
label variable OPLNIVSOI2016AGG4HBMETNIRWO "opleidingsniveau in 18 categorie n hoogst behaalde opleiding"
label variable GEWICHTHOOGSTEOPL "ophooggewicht; 1 bij registerrecords, <>1 bij ebb-records"
label variable VRLDATUMAANVANGHH "aanvangsdatum van het huishouden."
label variable VRLDATUMEINDEHH "be indigingsdatum van het huishouden."
label variable VRLHUISHOUDNR "uniek identificatienummer huishouden op peilmoment."
label variable GEBOORTEGEMEENTE "vertaling van historische gemcode naar code van betreffende jaar"

*>> Label define 
   * RINPERSOONS
capture label drop RINPERSOONS_lab 
label define RINPERSOONS_lab                             /// 
/// "A" "RINPERSON NOT IN GBA / BRP, POLICY NUMBER"
/// "C" "RINPERSON NOT IN GBA / BRP, CITONUMMER"
/// "D" "RINPERSON NOT IN GBA / BRP, BIRTHBORN"
/// "E" "RINPERSON NOT IN GBA / BRP, SURVEY NR"
/// "F" "RINPERSON NOT IN GBA / BRP, NOT SOFINR TEST"
/// "G" "RINPERSON NOT IN GBA / BRP, NO SOFINR"
/// "H" "RINPERSON NOT IN GBA / BRP, HO CORRESNUMMER"
/// "K" "RINPERSON NOT IN GBA / BRP, LICENSES (RDW)"
/// "N" "RINPERSON IN BRP, NO ANUMBER KNOWN"
/// "O" "RINPERSON NOT IN GBA / BRP, EDUCATIONAL NUMBER"
1 "(R) RINPERSON IN GBA / BRP"
/// "S" "RINPERSON NOT IN GBA / BRP, SOFINR TEST"
/// "V" "RINPERSON NOT IN GBA / BRP, SATELLITE SECURITY"
// "Z" "RINPERSON NOT IN GBA / BRP, SATELLITE HEALTH AND CARE"

   * VRLDATUMAANVANGHH
label define VRLDATUMAANVANGHH_lab                          /// 
.c    "Date unknown"

   * VRLGBAHERKOMSTGROEPERING
capture label drop VRLGBAHERKOMSTGROEPERING_lab 
label define VRLGBAHERKOMSTGROEPERING_lab             /// 
.a     "Disclosed"                              /// 
0000 "Unknown / Not applicable"                          /// 
1234 "Netherlands (asylum seeker centers)"               /// 
5001 "Canada"                                /// 
5002 "Frankrijk"                                      ///                                  
5003 "Zwitserland"                                    ///                              
5004 "Rhodesië"                                       ///                               
5005 "Malawi"                                         ///                
5006 "Cuba"                                           ///                    
5007 "Suriname"                                       ///                               
5008 "Tunesië"                                        ///                 
5009 "Oostenrijk"                                     ///                               
5010 "België"                                         ///                    
5011 "Botswana"                                       ///                              
5012 "Iran"                                           ///                      
5013 "Nieuwzeeland"                                   ///                         
5014 "Zuidafrika"                                     ///                                
5015 "Denemarken"                                     ///                          
5016 "Noordjemen"                                     ///                          
5017 "Hongarije"                                      ///                                
5018 "Saoediarabië"                                   ///                            
5019 "Liberia"                                        ///                    
5020 "Etiopië"                                        ///                   
5021 "Chili"                                          ///                      
5022 "Marokko"                                        ///                               
5023 "Togo"                                           ///                    
5024 "Ghana"                                          ///                  
5025 "Laos"                                           ///                     
5026 "Angola"                                         ///                  
5027 "Filipijnen"                                     ///                                  
5028 "Zambia"                                         ///                
5029 "Mali"                                           ///                     
5030 "Ivoorkust"                                      ///                                
5031 "Burma"                                          ///                  
5032 "Monaco"                                         ///                                
5033 "Colombia"                                       ///                               
5034 "Albanië"                                        ///                 
5035 "Kameroen"                                       ///                             
5036 "Zuidviëtnam"                                    ///                            
5037 "Singapore"                                      ///                               
5038 "Paraguay"                                       ///                                
5039 "Zweden"                                         ///                
5040 "Cyprus"                                         ///                  
5041 "Australisch Nieuwguinea"                        ///                                               
5042 "Brunei"                                         ///                   
5043 "Irak"                                           ///                      
5044 "Mauritius"                                      ///                                
5045 "Vaticaanstad"                                   ///                            
5046 "Kashmir"                                        ///                                 
5047 "Myanmar"                                        ///                              
5048 "Jemen"                                          ///                  
5049 "Slovenië"                                       ///                                 
5050 "Zaïre"                                          ///                     
5051 "Kroatië"                                        ///                   
5052 "Taiwan"                                         ///                  
5053 "Rusland"                                        ///                 
5054 "Armenië"                                        ///                                
5055 "Ascension"                                      ///                               
5056 "Azoren"                                         ///                  
5057 "Bahrein"                                        ///                 
5058 "Bhutan"                                         ///                  
5059 "Britse Antillen"                                ///                             
5060 "Comoren"                                        ///                              
5061 "Falklandeilanden"                               ///                                        
5062 "Frans Guyana"                                   ///                           
5063 "Frans Somaliland"                               ///                                        
5064 "Gilbert- en Ellice-eilanden"                    ///                                                 
5065 "Groenland"                                      ///                              
5066 "Guadeloupe"                                     ///                           
5067 "Kaapverdische Eilanden"                         ///                                
5068 "Macau"                                          ///                 
5069 "Martinique"                                     ///                              
5070 "Mozambique"                                     ///                         
5071 "Pitcairneilanden"                               ///                                          
5072 "Guinee Bissau"                                  ///                           
5073 "Réunion"                                        ///                                
5074 "Saint Pierre en Miquelon"                       ///                                                
5075 "Seychellen en Amiranten"                        ///                                               
5076 "Tonga"                                          ///                   
5077 "Wallis en Futuna"                               ///                                         
5078 "Zuidwest Afrika"                                ///                         
5079 "Frans Indië"                                    ///                               
5080 "Johnston"                                       ///                                
5081 "Kedah"                                          ///                  
5082 "Kelantan"                                       ///                                
5083 "Malakka"                                        ///                                
5084 "Mayotte"                                        ///                                
5085 "Negri Sembilan"                                 ///                          
5086 "Pahang"                                         ///                
5087 "Perak"                                          ///                    
5088 "Perlis"                                         ///                     
5089 "Portugees Indië"                                ///                         
5090 "Selangor"                                       ///                                 
5091 "Sikkim"                                         ///                   
5092 "Sint Vincent en de Grenadinen"                  ///                                          
5093 "Spitsbergen"                                    ///                             
5094 "Trengganu"                                      ///                              
5095 "Aruba"                                          ///                   
5096 "Burkina Faso"                                   ///                             
5097 "Azerbajdsjan"                                   ///                            
5098 "Belarus (Wit-Rusland)"                          ///                                   
5099 "Kazachstan"                                     ///                              
5100 "Macedonië"                                      ///                            
5101 "Timor Leste"                                    ///                             
5102 "Servië en Montenegro"                           ///                                 
5103 "Servië"                                         ///                    
5104 "Montenegro"                                     ///                          
5105 "Kosovo"                                         ///                
5106 "Bonaire"                                        ///                 
5107 "Curaçao"                                        ///                                 
5108 "Saba"                                           ///                    
5109 "Sint Eustatius"                                 ///                             
5110 "Sint Maarten"                                   ///                            
5111 "Zuid-Soedan"                                    ///                            
5112 "Gazastrook en Westelijke Jordaanoever"          ///                                               
5113 "Republiek Noord-Macedonië"                      ///                                         
6000 "Moldavië"                                       ///                               
6001 "Burundi"                                        ///                 
6002 "Finland"                                        ///                 
6003 "Griekenland"                                    ///                            
6004 "Guatemala"                                      ///                             
6005 "Nigeria"                                        ///                   
6006 "Libië"                                          ///                      
6007 "Ierland"                                        ///                   
6008 "Brazilië"                                       ///                  
6009 "Rwanda"                                         ///                                
6010 "Venezuela"                                      ///                              
6011 "IJsland"                                        ///                    
6012 "Liechtenstein"                                  ///                            
6013 "Somalia"                                        ///                 
6014 "Verenigde Staten van Amerika"                   ///                                         
6015 "Bolivia"                                        ///                    
6016 "Australië"                                      ///                                 
6017 "Jamaica"                                        ///                 
6018 "Luxemburg"                                      ///                            
6019 "Tsjaad"                                         ///                   
6020 "Mauritanië"                                     ///                              
6021 "Kyrgyzstan"                                     ///                              
6022 "China"                                          ///                    
6023 "Afganistan"                                     ///                               
6024 "Indonesië"                                      ///                               
6025 "Guyana"                                         ///                
6026 "Noordviëtnam"                                   ///                         
6027 "Noorwegen"                                      ///                           
6028 "San Marino"                                     ///                             
6029 "Duitsland"                                      ///                                
6030 "Nederland"                                      ///                              
6031 "Kambodja"                                       ///                              
6032 "Fiji"                                           ///                        
6033 "Bahama-eilanden"                                ///                                      
6034 "Israël"                                         ///                     
6035 "Nepal"                                          ///                   
6036 "Zuidkorea"                                      ///                               
6037 "Spanje"                                         ///                  
6038 "Oekraine"                                       ///                                
6039 "Grootbrittannië"                                ///                         
6040 "Niger"                                          ///                    
6041 "Haïti"                                          ///                      
6042 "Jordanië"                                       ///                                 
6043 "Turkije"                                        ///                   
6044 "Trinidad en Tobago"                             ///                                     
6045 "Joegoslavië"                                    ///                              
6046 "Bovenvolta"                                     ///                             
6047 "Algerije"                                       ///                  
6048 "Gabon"                                          ///                  
6049 "Noordkorea"                                     ///                            
6050 "Oezbekistan"                                    ///                            
6051 "Sierra Leone"                                   ///                             
6052 "Brits Honduras"                                 ///                          
6053 "Canarische eilanden"                            ///                                     
6054 "Frans Polynesië"                                ///                         
6055 "Gibraltar"                                      ///                                 
6056 "Portugees Timor"                                ///                                        
6057 "Tadzjikistan"                                   ///                               
6058 "Britse Salomons-eilanden"                       ///                                               
6059 "São Tomé en Principe"                           ///                                   
6060 "Sint Helena"                                    ///                              
6061 "Tristan Da Cunha"                               ///                                        
6062 "Westsamoa"                                      ///                           
6063 "Toerkmenistan"                                  ///                         
6064 "Georgië"                                        ///                 
6065 "Bosnië-Herzegovina"                             ///                                    
6066 "Tsjechië"                                       ///                                  
6067 "Slowakije"                                      ///                                
6068 "Federale Republiek Joegoslavië"                 ///                                        
6069 "Democratische Republiek Congo"                  ///                                                      
7001 "Uganda"                                         ///                
7002 "Kenya"                                          ///                   
7003 "Malta"                                          ///                   
7004 "Barbados"                                       ///                               
7005 "Andorra"                                        ///                                 
7006 "Mexico"                                         ///                
7007 "Costa Rica"                                     ///                                
7008 "Gambia"                                         ///                
7009 "Syrië"                                          ///                     
7011 "Nederlandse Antillen (oud)"                     ///                                              
7012 "Zuidjemen"                                      ///                             
7014 "Egypte"                                         ///                  
7015 "Argentinië"                                     ///                               
7016 "Lesotho"                                        ///                 
7017 "Honduras"                                       ///                               
7018 "Nicaragua"                                      ///                               
7020 "Pakistan"                                       ///                                 
7021 "Senegal"                                        ///                 
7023 "Dahomey"                                        ///                              
7024 "Bulgarije"                                      ///                                 
7026 "Maleisië"                                       ///                                 
7027 "Dominicaanse Republiek"                         ///                                               
7028 "Polen"                                          ///                    
7029 "Rusland (oud)"                                  ///                           
7030 "Britse Maagdeneilanden"                         ///                                               
7031 "Tanzania"                                       ///                                
7032 "El Salvador"                                    ///                               
7033 "Sri Lanka"                                      ///                                 
7034 "Soedan"                                         ///                
7035 "Japan"                                          ///                    
7036 "Hongkong"                                       ///                              
7037 "Panama"                                         ///                                
7038 "Uruguay"                                        ///                                
7039 "Ecuador"                                        ///                                 
7040 "Guinee"                                         ///                
7041 "Maldiven"                                       ///                               
7042 "Thailand"                                       ///                                 
7043 "Libanon"                                        ///                 
7044 "Italië"                                         ///                      
7045 "Koeweit"                                        ///                                
7046 "India"                                          ///                     
7047 "Roemenië"                                       ///                             
7048 "Tsjechoslowakije"                               ///                                        
7049 "Peru"                                           ///                     
7050 "Portugal"                                       ///                                 
7051 "Oman"                                           ///                  
7052 "Mongolië"                                       ///                               
7053 "Samoa"                                          ///                  
7054 "Verenigde Arabische Emiraten"                   ///                                         
7055 "Tibet"                                          ///                     
7057 "Nauru"                                          ///                   
7058 "Nederlands Nieuwguinea"                         ///                                             
7059 "Tanganyika"                                     ///                             
7060 "Palestina"                                      ///                                 
7062 "Brits Westindië"                                ///                         
7063 "Portugees Afrika"                               ///                                         
7064 "Letland"                                        ///                 
7065 "Estland"                                        ///                 
7066 "Litouwen"                                       ///                               
7067 "Brits Afrika"                                   ///                                
7068 "Belgisch Congo"                                 ///                          
7070 "Brits Indië"                                    ///                                 
7071 "Noordrhodesië"                                  ///                       
7072 "Zuidrhodesië"                                   ///                            
7073 "Saarland"                                       ///                                 
7074 "Frans Indo China"                               ///                                         
7075 "Brits Westborneo"                               ///                                      
7076 "Goudkust"                                       ///                              
7077 "Ras-El-Cheima"                                  ///                          
7079 "Frans Congo"                                    ///                            
7080 "Siam"                                           ///                    
7082 "Brits Oostafrika"                               ///                          
7083 "Brits Noordborneo"                              ///                                     
7084 "Bangladesh"                                     ///                             
7085 "Duitse Democratische Republiek"                 ///                                                       
7087 "Madeira-eilanden"                               ///                                      
7088 "Amerikaanse Maagdeneilanden"                    ///                                     
7089 "Australische Salomonseilanden"                  ///                                         
7091 "Spaanse Sahara"                                 ///                        
7092 "Caymaneilanden"                                 ///                                      
7093 "Caicoseilanden"                                 ///                          
7094 "Turkseilanden"                                  ///                           
7095 "Brits Territorium in Antarctica"                ///                                              
7096 "Brits Territorium in de Indische Oceaan"        ///                                                   
7097 "Cookeilanden"                                   ///                          
7098 "Tokelau-eilanden"                               ///                                       
7099 "Nieuwcaledonië"                                 ///                                       
8000 "Hawaii-eilanden"                                ///                                         
8001 "Guam"                                           ///                  
8002 "Amerikaans Samoa"                               ///                                    
8003 "Midway"                                         ///                                
8004 "Ryukyueilanden"                                 ///                        
8005 "Wake"                                           ///                   
8006 "Pacific eilanden"                               ///                          
8008 "Grenada"                                        ///                                
8009 "Marianen"                                       ///                               
8010 "Cabinda"                                        ///                                 
8011 "Canton en Enderbury"                            ///                                  
8012 "Christmaseiland"                                ///                                         
8013 "Cocoseilanden"                                  ///                          
8014 "Faeröer"                                        ///                 
8015 "Montserrat"                                     ///                             
8016 "Norfolk"                                        ///                 
8017 "Belize"                                         ///                    
8018 "Tasmanië"                                       ///                               
8019 "Turks- en Caicoseilanden"                       ///                                                
8020 "Puerto Rico"                                    ///                              
8021 "Papua-Nieuwguinea"                              ///                                  
8022 "Solomoneilanden"                                ///                                      
8023 "Benin"                                          ///                    
8024 "Viëtnam"                                        ///                                
8025 "Kaapverdië"                                     ///                             
8026 "Seychellen"                                     ///                              
8027 "Kiribati"                                       ///                    
8028 "Tuvalu"                                         ///                   
8029 "Sint Lucia"                                     ///                                 
8030 "Dominica"                                       ///                               
8031 "Zimbabwe"                                       ///                             
8032 "Doebai"                                         ///                  
8033 "Nieuwehebriden"                                 ///                                      
8034 "Kanaaleilanden"                                 ///                        
8035 "Man"                                            ///                    
8036 "Anguilla"                                       ///                                  
8037 "Saint Kitts-Nevis"                              ///                                          
8038 "Antigua"                                        ///                 
8039 "Sint Vincent"                                   ///                              
8040 "Gilberteilanden"                                ///                         
8041 "Panamakanaalzone"                               ///                                   
8042 "Saint Kitts-Nevis-Anguilla"                     ///                                                  
8043 "Belau"                                          ///                    
8044 "Republiek van Palau"                            ///                                     
8045 "Antigua en Barbuda"                             ///                                    
9000 "Newfoundland"                                   ///                        
9001 "Nyasaland"                                      ///                              
9003 "Eritrea"                                        ///                    
9005 "Ifni"                                           ///                       
9006 "Brits Kameroen"                                 ///                        
9007 "Kaiser Wilhelmsland"                            ///                                     
9008 "Kongo"                                          ///                  
9009 "Kongo Kinshasa"                                 ///                        
9010 "Madagaskar"                                     ///                            
9013 "Kongo Brazzaville"                              ///                                        
9014 "Leewardeilanden"                                ///                                      
9015 "Windwardeilanden"                               ///                                    
9016 "Frans gebied van Afars en Issa's"               ///                                          
9017 "Phoenixeilanden"                                ///                                       
9020 "Portugees Guinee"                               ///                                      
9022 "Duits Zuidwestafrika"                           ///                                     
9023 "Namibië"                                        ///                                
9027 "Brits Somaliland"                               ///                                          
9028 "Italiaans Somaliland"                           ///                                      
9030 "Nederlands Indië"                               ///                                        
9031 "Brits Guyana"                                   ///                            
9036 "Swaziland"                                      ///                               
9037 "Katar"                                          ///                    
9041 "Aden"                                           ///                   
9042 "Zuidarabische Federatie"                        ///                                 
9043 "Equatoriaalguinee"                              ///                                       
9044 "Spaans Guinee"                                  ///                         
9047 "Verenigde Arabische Republiek"                  ///                                       
9048 "Bermuda"                                        ///                               
9049 "Sovjetunie"                                     ///                              
9050 "Duits Oostafrika"                               ///                                          
9051 "Zanzibar"                                       ///                                 
9052 "Ceylon"                                         ///                  
9053 "Muscat en Oman"                                 ///                                      
9054 "Trucial Oman"                                   ///                           
9055 "Indo China"                                     ///                               
9056 "Marshalleilanden"                               ///                                       
9057 "Sarawak"                                        ///                                
9058 "Brits Borneo"                                   ///                             
9060 "Sabah"                                          ///                   
9061 "Aboe Dhabi"                                     ///                             
9062 "Adjman"                                         ///                
9063 "Basoetoland"                                    ///                            
9064 "Bechuanaland"                                   ///                          
9065 "Foedjaira"                                      ///                                
9066 "Frans Kameroen"                                 ///                                       
9067 "Johore"                                         ///                  
9068 "Korea"                                          ///                   
9069 "Labuan"                                         ///                
9070 "Oem el Koewein"                                 ///                                       
9071 "Oostenrijk-Hongarije"                           ///                                    
9072 "Portugees Oost Afrika"                          ///                                   
9073 "Portugees West Afrika"                          ///                                  
9074 "Sjardja"                                        ///                   
9075 "Straits Settlements"                            ///                                       
9076 "Abessinië"                                      ///                                
9077 "Frans West Afrika"                              ///                                        
9078 "Frans Equatoriaal Afrika"                       ///                                  
9081 "Oeroendi"                                       ///                               
9082 "Roeanda-Oeroendi"                               ///                                    
9084 "Goa"                                            ///                     
9085 "Dantzig"                                        ///                 
9086 "Centrafrika"                                    ///                               
9087 "Djibouti"                                       ///                  
9088 "Transjordanië"                                  ///                           
9089 "Bondsrepubliek Duitsland"                       ///                                               
9090 "Vanuatu"                                        ///                                
9091 "Niue"                                           ///                     
9092 "Spaans Noordafrika"                             ///                                     
9093 "Westelijke Sahara"                              ///                                       
9094 "Micronesia"                                     ///                              
9095 "Svalbardeilanden"                               ///                                       
9999 "International area"

* VRLGBAGESLACHT
capture label drop VRLGBAGESLACHT_lab 
label define VRLGBAGESLACHT_lab                    ///
.a    "Unknown"                                    ///
1  "Men"                                        ///
2  "Women"

* VRLGBAGEBOORTEMAAND
capture label drop VRLGBAGEBOORTEMAAND_lab 
label define VRLGBAGEBOORTEMAAND_lab                  /// 
.a    "Unknown"                                    ///
01    "January"                                    /// 
02    "February"                                   /// 
03    "March"                                      /// 
04    "April"                                      /// 
05    "May"                                        /// 
06    "June"                                       /// 
07    "July"                                       /// 
08    "August"                                     /// 
09    "September"                                  /// 
10    "October"                                    /// 
11    "November"                                   /// 
12    "December"

* VRLGBAGENERATIE
capture label drop VRLGBAGENERATIE_lab
label define VRLGBAGENERATIE_lab                      /// 
.a    "Unknown"                                    ///
0  "Native"                                     ///
1  "First generation immigrant"                    ///
2  "Second generation immigrant"

* VRLGBAGEBOORTEGEMEENTE
capture label drop VRLGBAGEBOORTEGEMEENTE_lab
label define VRLGBAGEBOORTEGEMEENTE_lab               ///
.a  "Unknown"                                                 ///
.d    "Other missing"                                       ///
0001 "Adorp"                                                ///
0002 "Aduard"                                               ///
0003 "Appingedam"                                           ///
0004 "Baflo"                                                ///
0005 "Bedum"                                                ///
0006 "Beerta"                                               ///
0007 "Bellingwedde"                                         ///
0008 "Bierum"                                               ///
0009 "Ten Boer"                                             ///
0010 "Delfzijl"                                             ///
0011 "Eenrum"                                               ///
0012 "Ezinge"                                               ///
0013 "Finsterwolde"                                         ///
0014 "Groningen"                                            ///
0015 "Grootegast"                                           ///
0016 "Grijpskerk"                                           ///
0017 "Haren"                                                ///
0018 "Hoogezand-Sappemeer"                                  ///
0019 "Hefshuizen"                                           ///
0020 "Kantens"                                              ///
0021 "Kloosterburen"                                        ///
0022 "Leek"                                                 ///
0023 "Leens"                                                ///
0024 "Loppersum"                                            ///
0025 "Marum"                                                ///
0026 "Meeden"                                               ///
0027 "Middelstum"                                           ///
0028 "Midwolda"                                             ///
0029 "Muntendam"                                            ///
0030 "Nieuwe Pekela"                                        ///
0031 "Nieuweschans"                                         ///
0032 "Nieuwolda"                                            ///
0033 "Oosterbroek"                                          ///
0034 "Almere"                                               ///
0035 "Oldehove"                                             ///
0036 "Oldekerk"                                             ///
0037 "Stadskanaal"                                          ///
0038 "Oude Pekela"                                          ///
0039 "Scheemda"                                             ///
0040 "Slochteren"                                           ///
0041 "Stedum"                                               ///
0042 "Termunten"                                            ///
0043 "Uithuizen"                                            ///
0044 "Uithuizermeeden"                                      ///
0045 "Ulrum"                                                ///
0046 "Usquert"                                              ///
0047 "Veendam"                                              ///
0048 "Vlagtwedde"                                           ///
0049 "Warffum"                                              ///
0050 "Zeewolde"                                             ///
0051 "Skarsterlân"                                          ///
0052 "Winschoten"                                           ///
0053 "Winsum"                                               ///
0054 "'t Zandt"                                             ///
0055 "Boarnsterhim"                                         ///
0056 "Zuidhorn"                                             ///
0057 "Boornsterhem"                                         ///
0058 "Dongeradeel"                                          ///
0059 "Achtkarspelen"                                        ///
0060 "Ameland"                                              ///
0061 "Baarderadeel"                                         ///
0062 "Barradeel"                                            ///
0063 "het Bildt"                                            ///
0064 "Bolsward"                                             ///
0065 "Dantumadeel"                                          ///
0066 "Dokkum"                                               ///
0067 "Doniawerstal"                                         ///
0068 "Ferwerderadeel"                                       ///
0069 "Franeker"                                             ///
0070 "Franekeradeel"                                        ///
0071 "Gaasterland"                                          ///
0072 "Harlingen"                                            ///
0073 "Haskerland"                                           ///
0074 "Heerenveen"                                           ///
0075 "Hemelumer Oldeferd"                                   ///
0076 "Hennaarderadeel"                                      ///
0077 "Hindeloopen"                                          ///
0078 "Idaarderadeel"                                        ///
0079 "Kollumerland en Nieuwkruisland"                       ///
0080 "Leeuwarden"                                           ///
0081 "Leeuwarderadeel"                                      ///
0082 "Lemsterland"                                          ///
0083 "Menaldumadeel"                                        ///
0084 "Oostdongeradeel"                                      ///
0085 "Ooststellingwerf"                                     ///
0086 "Opsterland"                                           ///
0087 "Rauwerderhem"                                         ///
0088 "Schiermonnikoog"                                      ///
0089 "Sloten (F.)"                                          ///
0090 "Smallingerland"                                       ///
0091 "Sneek"                                                ///
0092 "Stavoren"                                             ///
0093 "Terschelling"                                         ///
0094 "Tietjerksteradeel"                                    ///
0095 "Utingeradeel"                                         ///
0096 "Vlieland"                                             ///
0097 "Westdongeradeel"                                      ///
0098 "Weststellingwerf"                                     ///
0099 "Wonseradeel"                                          ///
0100 "Workum"                                               ///
0101 "Wymbritseradeel"                                      ///
0102 "IJlst"                                                ///
0103 "Littenseradeel"                                       ///
0104 "Nijefurd"                                             ///
0105 "Anloo"                                                ///
0106 "Assen"                                                ///
0107 "Beilen"                                               ///
0108 "Borger"                                               ///
0109 "Coevorden"                                            ///
0110 "Dalen"                                                ///
0111 "Diever"                                               ///
0112 "Dwingeloo"                                            ///
0113 "Eelde"                                                ///
0114 "Emmen"                                                ///
0115 "Gasselte"                                             ///
0116 "Gieten"                                               ///
0117 "Havelte"                                              ///
0118 "Hoogeveen"                                            ///
0119 "Meppel"                                               ///
0120 "Norg"                                                 ///
0121 "Nijeveen"                                             ///
0122 "Odoorn"                                               ///
0123 "Oosterhesselen"                                       ///
0124 "Peize"                                                ///
0125 "Roden"                                                ///
0126 "Rolde"                                                ///
0127 "Ruinen"                                               ///
0128 "Ruinerwold"                                           ///
0129 "Schoonebeek"                                          ///
0130 "Sleen"                                                ///
0131 "Smilde"                                               ///
0132 "Vledder"                                              ///
0133 "Vries"                                                ///
0134 "Westerbork"                                           ///
0135 "De Wijk"                                              ///
0136 "Zuidlaren"                                            ///
0137 "Zuidwolde"                                            ///
0138 "Zweeloo"                                              ///
0139 "Scharsterland"                                        ///
0140 "Littenseradiel"                                       ///
0141 "Almelo"                                               ///
0142 "Ambt Delden"                                          ///
0143 "Avereest"                                             ///
0144 "Bathmen"                                              ///
0145 "Blankenham"                                           ///
0146 "Blokzijl"                                             ///
0147 "Borne"                                                ///
0148 "Dalfsen"                                              ///
0149 "Denekamp"                                             ///
0150 "Deventer"                                             ///
0151 "Diepenheim"                                           ///
0152 "Diepenveen"                                           ///
0153 "Enschede"                                             ///
0154 "Genemuiden"                                           ///
0155 "Giethoorn"                                            ///
0156 "Goor"                                                 ///
0157 "Gramsbergen"                                          ///
0158 "Haaksbergen"                                          ///
0159 "Den Ham"                                              ///
0160 "Hardenberg"                                           ///
0161 "Hasselt"                                              ///
0162 "Heino"                                                ///
0163 "Hellendoorn"                                          ///
0164 "Hengelo"                                              ///
0165 "Holten"                                               ///
0166 "Kampen"                                               ///
0167 "Kuinre"                                               ///
0168 "Losser"                                               ///
0169 "Markelo"                                              ///
0170 "Nieuwleusen"                                          ///
0171 "Noordoostpolder"                                      ///
0172 "Oldemarkt"                                            ///
0173 "Oldenzaal"                                            ///
0174 "Olst"                                                 ///
0175 "Ommen"                                                ///
0176 "Ootmarsum"                                            ///
0177 "Raalte"                                               ///
0178 "Rijssen"                                              ///
0179 "Stad Delden"                                          ///
0180 "Staphorst"                                            ///
0181 "Steenwijk"                                            ///
0182 "Steenwijkerwold"                                      ///
0183 "Tubbergen"                                            ///
0184 "Urk"                                                  ///
0185 "Vollenhove"                                           ///
0186 "Vriezenveen"                                          ///
0187 "Wanneperveen"                                         ///
0188 "Weerselo"                                             ///
0189 "Wierden"                                              ///
0190 "Wijhe"                                                ///
0191 "IJsselmuiden"                                         ///
0192 "Zwartsluis"                                           ///
0193 "Zwolle"                                               ///
0194 "Brederwiede"                                          ///
0195 "IJsselham"                                            ///
0196 "Rijnwaarden"                                          ///
0197 "Aalten"                                               ///
0198 "Ammerzoden"                                           ///
0199 "Angerlo"                                              ///
0200 "Apeldoorn"                                            ///
0201 "Appeltern"                                            ///
0202 "Arnhem"                                               ///
0203 "Barneveld"                                            ///
0204 "Batenburg"                                            ///
0205 "Beesd"                                                ///
0206 "Bemmel"                                               ///
0207 "Bergh"                                                ///
0208 "Bergharen"                                            ///
0209 "Beuningen"                                            ///
0210 "Beusichem"                                            ///
0211 "Borculo"                                              ///
0212 "Brakel"                                               ///
0213 "Brummen"                                              ///
0214 "Buren"                                                ///
0215 "Buurmalsen"                                           ///
0216 "Culemborg"                                            ///
0217 "Deil"                                                 ///
0218 "Didam"                                                ///
0219 "Dinxperlo"                                            ///
0220 "Dodewaard"                                            ///
0221 "Doesburg"                                             ///
0222 "Doetinchem"                                           ///
0223 "Doornspijk"                                           ///
0224 "Dreumel"                                              ///
0225 "Druten"                                               ///
0226 "Duiven"                                               ///
0227 "Echteld"                                              ///
0228 "Ede"                                                  ///
0229 "Eibergen"                                             ///
0230 "Elburg"                                               ///
0231 "Elst"                                                 ///
0232 "Epe"                                                  ///
0233 "Ermelo"                                               ///
0234 "Est en Opijnen"                                       ///
0235 "Ewijk"                                                ///
0236 "Geldermalsen"                                         ///
0237 "Gendringen"                                           ///
0238 "Gendt"                                                ///
0239 "Gorssel"                                              ///
0240 "Groenlo"                                              ///
0241 "Groesbeek"                                            ///
0242 "Haaften"                                              ///
0243 "Harderwijk"                                           ///
0244 "Hattem"                                               ///
0245 "Hedel"                                                ///
0246 "Heerde"                                               ///
0247 "Heerewaarden"                                         ///
0248 "Hengelo (Gld.)"                                       ///
0249 "Herwen en Aerdt"                                      ///
0250 "Herwijnen"                                            ///
0251 "Heteren"                                              ///
0252 "Heumen"                                               ///
0253 "Hoevelaken"                                           ///
0254 "Horssen"                                              ///
0255 "Huissen"                                              ///
0256 "Hummelo en Keppel"                                    ///
0257 "Kerkwijk"                                             ///
0258 "Kesteren"                                             ///
0259 "Laren (Gld.)"                                         ///
0260 "Lichtenvoorde"                                        ///
0261 "Lienden"                                              ///
0262 "Lochem"                                               ///
0263 "Maasdriel"                                            ///
0264 "Maurik"                                               ///
0265 "Millingen aan de Rijn"                                ///
0266 "Neede"                                                ///
0267 "Nijkerk"                                              ///
0268 "Nijmegen"                                             ///
0269 "Oldebroek"                                            ///
0270 "Ophemert"                                             ///
0271 "Overasselt"                                           ///
0272 "Pannerden"                                            ///
0273 "Putten"                                               ///
0274 "Renkum"                                               ///
0275 "Rheden"                                               ///
0276 "Rossum"                                               ///
0277 "Rozendaal"                                            ///
0278 "Ruurlo"                                               ///
0279 "Scherpenzeel"                                         ///
0280 "Steenderen"                                           ///
0281 "Tiel"                                                 ///
0282 "Ubbergen"                                             ///
0283 "Valburg"                                              ///
0284 "Varik"                                                ///
0285 "Voorst"                                               ///
0286 "Vorden"                                               ///
0287 "Vuren"                                                ///
0288 "Waardenburg"                                          ///
0289 "Wageningen"                                           ///
0290 "Wamel"                                                ///
0291 "Warnsveld"                                            ///
0292 "Wehl"                                                 ///
0293 "Westervoort"                                          ///
0294 "Winterswijk"                                          ///
0295 "Wisch"                                                ///
0296 "Wijchen"                                              ///
0297 "Zaltbommel"                                           ///
0298 "Zelhem"                                               ///
0299 "Zevenaar"                                             ///
0300 "Zoelen"                                               ///
0301 "Zutphen"                                              ///
0302 "Nunspeet"                                             ///
0303 "Dronten"                                              ///
0304 "Neerijnen"                                            ///
0305 "Abcoude"                                              ///
0306 "Amerongen"                                            ///
0307 "Amersfoort"                                           ///
0308 "Baarn"                                                ///
0309 "Benschop"                                             ///
0310 "De Bilt"                                              ///
0311 "Breukelen"                                            ///
0312 "Bunnik"                                               ///
0313 "Bunschoten"                                           ///
0314 "Cothen"                                               ///
0315 "Doorn"                                                ///
0316 "Driebergen-Rijsenburg"                                ///
0317 "Eemnes"                                               ///
0318 "Harmelen"                                             ///
0319 "Hoenkoop"                                             ///
0320 "Hoogland"                                             ///
0321 "Houten"                                               ///
0322 "Jutphaas"                                             ///
0323 "Kamerik"                                              ///
0324 "Kockengen"                                            ///
0325 "Langbroek"                                            ///
0326 "Leersum"                                              ///
0327 "Leusden"                                              ///
0328 "Linschoten"                                           ///
0329 "Loenen"                                               ///
0330 "Loosdrecht"                                           ///
0331 "Lopik"                                                ///
0332 "Maarn"                                                ///
0333 "Maarssen"                                             ///
0334 "Maartensdijk"                                         ///
0335 "Montfoort"                                            ///
0336 "Mijdrecht"                                            ///
0337 "Nigtevecht"                                           ///
0338 "Polsbroek"                                            ///
0339 "Renswoude"                                            ///
0340 "Rhenen"                                               ///
0341 "Snelrewaard"                                          ///
0342 "Soest"                                                ///
0343 "Stoutenburg"                                          ///
0344 "Utrecht"                                              ///
0345 "Veenendaal"                                           ///
0346 "Vinkeveen en Waverveen"                               ///
0347 "Vleuten-De Meern"                                     ///
0348 "Vreeswijk"                                            ///
0349 "Willeskop"                                            ///
0350 "Wilnis"                                               ///
0351 "Woudenberg"                                           ///
0352 "Wijk bij Duurstede"                                   ///
0353 "IJsselstein"                                          ///
0354 "Zegveld"                                              ///
0355 "Zeist"                                                ///
0356 "Nieuwegein"                                           ///
0357 "Egmond"                                               ///
0358 "Aalsmeer"                                             ///
0359 "Abbekerk"                                             ///
0360 "Akersloot"                                            ///
0361 "Alkmaar"                                              ///
0362 "Amstelveen"                                           ///
0363 "Amsterdam"                                            ///
0364 "Andijk"                                               ///
0365 "Graft-De Rijp"                                        ///
0366 "Anna Paulowna"                                        ///
0367 "Assendelft"                                           ///
0368 "Avenhorn"                                             ///
0369 "Barsingerhorn"                                        ///
0370 "Beemster"                                             ///
0371 "Beets"                                                ///
0372 "Bennebroek"                                           ///
0373 "Bergen (NH.)"                                         ///
0374 "Berkhout"                                             ///
0375 "Beverwijk"                                            ///
0376 "Blaricum"                                             ///
0377 "Bloemendaal"                                          ///
0378 "Blokker"                                              ///
0379 "Bovenkarspel"                                         ///
0380 "Broek in Waterland"                                   ///
0381 "Bussum"                                               ///
0382 "Callantsoog"                                          ///
0383 "Castricum"                                            ///
0384 "Diemen"                                               ///
0385 "Edam-Volendam"                                        ///
0386 "Egmond aan Zee"                                       ///
0387 "Egmond-Binnen"                                        ///
0388 "Enkhuizen"                                            ///
0389 "Graft"                                                ///
0390 "'s-Graveland"                                         ///
0391 "Grootebroek"                                          ///
0392 "Haarlem"                                              ///
0393 "Haarlemmerliede en Spaarnwoude"                       ///
0394 "Haarlemmermeer"                                       ///
0395 "Harenkarspel"                                         ///
0396 "Heemskerk"                                            ///
0397 "Heemstede"                                            ///
0398 "Heerhugowaard"                                        ///
0399 "Heiloo"                                               ///
0400 "Den Helder"                                           ///
0401 "Hensbroek"                                            ///
0402 "Hilversum"                                            ///
0403 "Hoogkarspel"                                          ///
0404 "Hoogwoud"                                             ///
0405 "Hoorn"                                                ///
0406 "Huizen"                                               ///
0407 "Ilpendam"                                             ///
0408 "Jisp"                                                 ///
0409 "Katwoude"                                             ///
0410 "Koedijk"                                              ///
0411 "Koog aan de Zaan"                                     ///
0412 "Niedorp"                                              ///
0413 "Krommenie"                                            ///
0414 "Kwadijk"                                              ///
0415 "Landsmeer"                                            ///
0416 "Langedijk"                                            ///
0417 "Laren"                                                ///
0418 "Limmen"                                               ///
0419 "Marken"                                               ///
0420 "Medemblik"                                            ///
0421 "Middelie"                                             ///
0422 "Midwoud"                                              ///
0423 "Monnickendam"                                         ///
0424 "Muiden"                                               ///
0425 "Naarden"                                              ///
0426 "Nederhorst den Berg"                                  ///
0427 "Nibbixwoud"                                           ///
0428 "Nieuwe-Niedorp"                                       ///
0429 "Obdam"                                                ///
0430 "Oosthuizen"                                           ///
0431 "Oostzaan"                                             ///
0432 "Opmeer"                                               ///
0433 "Opperdoes"                                            ///
0434 "Oterleek"                                             ///
0435 "Oudendijk"                                            ///
0436 "Oude-Niedorp"                                         ///
0437 "Ouder-Amstel"                                         ///
0438 "Oudorp"                                               ///
0439 "Purmerend"                                            ///
0440 "De Rijp"                                              ///
0441 "Schagen"                                              ///
0442 "Schellinkhout"                                        ///
0443 "Schermerhorn"                                         ///
0444 "Schoorl"                                              ///
0445 "Sint Maarten"                                         ///
0446 "Sint Pancras"                                         ///
0447 "Sijbekarspel"                                         ///
0448 "Texel"                                                ///
0449 "Twisk"                                                ///
0450 "Uitgeest"                                             ///
0451 "Uithoorn"                                             ///
0452 "Ursem"                                                ///
0453 "Velsen"                                               ///
0454 "Venhuizen"                                            ///
0455 "Warder"                                               ///
0456 "Warmenhuizen"                                         ///
0457 "Weesp"                                                ///
0458 "Schermer"                                             ///
0459 "Wervershoof"                                          ///
0460 "Westwoud"                                             ///
0461 "Westzaan"                                             ///
0462 "Wieringen"                                            ///
0463 "Wieringermeer"                                        ///
0464 "Wieringerwaard"                                       ///
0465 "Winkel"                                               ///
0466 "Wognum"                                               ///
0467 "Wormer"                                               ///
0468 "Wormerveer"                                           ///
0469 "Wijdenes"                                             ///
0470 "Wijdewormer"                                          ///
0471 "Zaandam"                                              ///
0472 "Zaandijk"                                             ///
0473 "Zandvoort"                                            ///
0474 "Zuid- en Noord-Schermer"                              ///
0475 "Zwaag"                                                ///
0476 "Zijpe"                                                ///
0477 "Albrandswaard (oud)"                                  ///
0478 "Zeevang"                                              ///
0479 "Zaanstad"                                             ///
0480 "Ter Aar"                                              ///
0481 "Abbenbroek"                                           ///
0482 "Alblasserdam"                                         ///
0483 "Alkemade"                                             ///
0484 "Alphen aan den Rijn"                                  ///
0485 "Ameide"                                               ///
0486 "Ammerstol"                                            ///
0487 "Arkel"                                                ///
0488 "Asperen"                                              ///
0489 "Barendrecht"                                          ///
0490 "Benthuizen"                                           ///
0491 "Bergambacht"                                          ///
0492 "Bergschenhoek"                                        ///
0493 "Berkel en Rodenrijs"                                  ///
0494 "Berkenwoude"                                          ///
0495 "Bleiswijk"                                            ///
0496 "Bleskensgraaf en Hofwege"                             ///
0497 "Bodegraven"                                           ///
0498 "Drechterland"                                         ///
0499 "Boskoop"                                              ///
0500 "Brandwijk"                                            ///
0501 "Brielle"                                              ///
0502 "Capelle aan den IJssel"                               ///
0503 "Delft"                                                ///
0504 "Dirksland"                                            ///
0505 "Dordrecht"                                            ///
0506 "Driebruggen"                                          ///
0507 "Dubbeldam"                                            ///
0508 "Everdingen"                                           ///
0509 "Geervliet"                                            ///
0510 "Giessenburg"                                          ///
0511 "Goedereede"                                           ///
0512 "Gorinchem"                                            ///
0513 "Gouda"                                                ///
0514 "Gouderak"                                             ///
0515 "Goudriaan"                                            ///
0516 "Goudswaard"                                           ///
0517 "'s-Gravendeel"                                        ///
0518 "'s-Gravenhage"                                        ///
0519 "'s-Gravenzande"                                       ///
0520 "Groot-Ammers"                                         ///
0521 "Haastrecht"                                           ///
0522 "Hagestein"                                            ///
0523 "Hardinxveld-Giessendam"                               ///
0524 "Hazerswoude"                                          ///
0525 "Heenvliet"                                            ///
0526 "Heerjansdam"                                          ///
0527 "Hei- en Boeicop"                                      ///
0528 "Heinenoord"                                           ///
0529 "Noorder-Koggenland"                                   ///
0530 "Hellevoetsluis"                                       ///
0531 "Hendrik-Ido-Ambacht"                                  ///
0532 "Stede Broec"                                          ///
0533 "Heukelum"                                             ///
0534 "Hillegom"                                             ///
0535 "Hoogblokland"                                         ///
0536 "Hoornaar"                                             ///
0537 "Katwijk"                                              ///
0538 "Kedichem"                                             ///
0539 "Klaaswaal"                                            ///
0540 "Koudekerk aan den Rijn"                               ///
0541 "Krimpen aan de Lek"                                   ///
0542 "Krimpen aan den IJssel"                               ///
0543 "Langerak"                                             ///
0544 "Leerbroek"                                            ///
0545 "Leerdam"                                              ///
0546 "Leiden"                                               ///
0547 "Leiderdorp"                                           ///
0548 "Leidschendam"                                         ///
0549 "Leimuiden"                                            ///
0550 "Lekkerkerk"                                           ///
0551 "Lexmond"                                              ///
0552 "De Lier"                                              ///
0553 "Lisse"                                                ///
0554 "Maasdam"                                              ///
0555 "Maasland"                                             ///
0556 "Maassluis"                                            ///
0557 "Meerkerk"                                             ///
0558 "Wester-Koggenland"                                    ///
0559 "Middelharnis"                                         ///
0560 "Moerkapelle"                                          ///
0561 "Molenaarsgraaf"                                       ///
0562 "Monster"                                              ///
0563 "Moordrecht"                                           ///
0564 "Mijnsheerenland"                                      ///
0565 "Naaldwijk"                                            ///
0566 "Nieuw-Beijerland"                                     ///
0567 "Nieuwerkerk aan den IJssel"                           ///
0568 "Bernisse"                                             ///
0569 "Nieuwkoop"                                            ///
0570 "Nieuwland"                                            ///
0571 "Nieuw-Lekkerland"                                     ///
0572 "Nieuwpoort"                                           ///
0573 "Nieuwveen"                                            ///
0574 "Noordeloos"                                           ///
0575 "Noordwijk"                                            ///
0576 "Noordwijkerhout"                                      ///
0577 "Nootdorp"                                             ///
0578 "Numansdorp"                                           ///
0579 "Oegstgeest"                                           ///
0580 "Oostflakkee"                                          ///
0581 "Oostvoorne"                                           ///
0582 "Ottoland"                                             ///
0583 "Oud-Alblas"                                           ///
0584 "Oud-Beijerland"                                       ///
0585 "Binnenmaas"                                           ///
0586 "Oudenhoorn"                                           ///
0587 "Ouderkerk aan den IJssel"                             ///
0588 "Korendijk"                                            ///
0589 "Oudewater"                                            ///
0590 "Papendrecht"                                          ///
0591 "Piershil"                                             ///
0592 "Poortugaal"                                           ///
0593 "Puttershoek"                                          ///
0594 "Pijnacker"                                            ///
0595 "Reeuwijk"                                             ///
0596 "Rhoon"                                                ///
0597 "Ridderkerk"                                           ///
0598 "Rockanje"                                             ///
0599 "Rotterdam"                                            ///
0600 "Rozenburg"                                            ///
0601 "Rijnsaterwoude"                                       ///
0602 "Rijnsburg"                                            ///
0603 "Rijswijk"                                             ///
0604 "Sassenheim"                                           ///
0605 "Schelluinen"                                          ///
0606 "Schiedam"                                             ///
0607 "Schipluiden"                                          ///
0608 "Schoonhoven"                                          ///
0609 "Schoonrewoerd"                                        ///
0610 "Sliedrecht"                                           ///
0611 "Cromstrijen"                                          ///
0612 "Spijkenisse"                                          ///
0613 "Albrandswaard"                                        ///
0614 "Westvoorne"                                           ///
0615 "Stolwijk"                                             ///
0616 "Streefkerk"                                           ///
0617 "Strijen"                                              ///
0618 "Tienhoven (ZH.)"                                      ///
0619 "Valkenburg (ZH.)"                                     ///
0620 "Vianen"                                               ///
0621 "Vierpolders"                                          ///
0622 "Vlaardingen"                                          ///
0623 "Vlist"                                                ///
0624 "Voorburg"                                             ///
0625 "Voorhout"                                             ///
0626 "Voorschoten"                                          ///
0627 "Waddinxveen"                                          ///
0628 "Warmond"                                              ///
0629 "Wassenaar"                                            ///
0630 "Wateringen"                                           ///
0631 "Westmaas"                                             ///
0632 "Woerden"                                              ///
0633 "Woubrugge"                                            ///
0634 "Wijngaarden"                                          ///
0635 "Zevenhoven"                                           ///
0636 "Zevenhuizen"                                          ///
0637 "Zoetermeer"                                           ///
0638 "Zoeterwoude"                                          ///
0639 "Zuid-Beijerland"                                      ///
0640 "Zuidland"                                             ///
0641 "Zwartewaal"                                           ///
0642 "Zwijndrecht"                                          ///
0643 "Nederlek"                                             ///
0644 "Ouderkerk"                                            ///
0645 "Jacobswoude"                                          ///
0646 "Rijneveld"                                            ///
0647 "Moerhuizen"                                           ///
0648 "Aardenburg"                                           ///
0649 "Arnemuiden"                                           ///
0650 "Axel"                                                 ///
0651 "Baarland"                                             ///
0652 "Biervliet"                                            ///
0653 "Gaasterlân-Sleat"                                     ///
0654 "Borsele"                                              ///
0655 "Breskens"                                             ///
0656 "Brouwershaven"                                        ///
0657 "Bruinisse"                                            ///
0658 "Cadzand"                                              ///
0659 "Clinge"                                               ///
0660 "Domburg"                                              ///
0661 "Driewegen"                                            ///
0662 "Duiveland"                                            ///
0663 "Ellewoutsdijk"                                        ///
0664 "Goes"                                                 ///
0665 "Graauw en Langendam"                                  ///
0666 "'s-Gravenpolder"                                      ///
0667 "Groede"                                               ///
0668 "West Maas en Waal"                                    ///
0669 "'s-Heer-Abtskerke"                                    ///
0670 "'s-Heer-Arendskerke"                                  ///
0671 "'s-Heerenhoek"                                        ///
0672 "Heinkenszand"                                         ///
0673 "Hoedekenskerke"                                       ///
0674 "Hoek"                                                 ///
0675 "Hontenisse"                                           ///
0676 "Hoofdplaat"                                           ///
0677 "Hulst"                                                ///
0678 "Kapelle"                                              ///
0679 "Kattendijke"                                          ///
0680 "Kloetinge"                                            ///
0681 "Koewacht"                                             ///
0682 "Kortgene"                                             ///
0683 "Wymbritseradiel"                                      ///
0684 "Krabbendijke"                                         ///
0685 "Kruiningen"                                           ///
0686 "Mariekerke"                                           ///
0687 "Middelburg"                                           ///
0688 "Middenschouwen"                                       ///
0689 "Giessenlanden"                                        ///
0690 "Nieuwvliet"                                           ///
0691 "Nisse"                                                ///
0692 "Oostburg"                                             ///
0693 "Graafstroom"                                          ///
0694 "Liesveld"                                             ///
0695 "Oudelande"                                            ///
0696 "Oud-Vossemeer"                                        ///
0697 "Overslag"                                             ///
0698 "Ovezande"                                             ///
0699 "Philippine"                                           ///
0700 "Poortvliet"                                           ///
0701 "Retranchement"                                        ///
0702 "Rilland-Bath"                                         ///
0703 "Reimerswaal"                                          ///
0704 "Sas van Gent"                                         ///
0705 "Scherpenisse"                                         ///
0706 "Schoondijke"                                          ///
0707 "Zederik"                                              ///
0708 "Sint-Annaland"                                        ///
0709 "Sint Jansteen"                                        ///
0710 "Wûnseradiel"                                          ///
0711 "Sint-Maartensdijk"                                    ///
0712 "Sint Philipsland"                                     ///
0713 "Sluis (oud)"                                          ///
0714 "Stavenisse"                                           ///
0715 "Terneuzen"                                            ///
0716 "Tholen"                                               ///
0717 "Veere"                                                ///
0718 "Vlissingen"                                           ///
0719 "Vogelwaarde"                                          ///
0720 "Valkenisse"                                           ///
0721 "Waarde"                                               ///
0722 "Waterlandkerkje"                                      ///
0723 "Wemeldinge"                                           ///
0724 "Westdorpe"                                            ///
0725 "Westerschouwen"                                       ///
0726 "Westkapelle"                                          ///
0727 "Wissenkerke"                                          ///
0728 "Wolphaartsdijk"                                       ///
0729 "Yerseke"                                              ///
0730 "IJzendijke"                                           ///
0731 "Zaamslag"                                             ///
0732 "Zierikzee"                                            ///
0733 "Lingewaal"                                            ///
0734 "Zuiddorpe"                                            ///
0735 "Zuidzande"                                            ///
0736 "De Ronde Venen"                                       ///
0737 "Tytsjerksteradiel"                                    ///
0738 "Aalburg"                                              ///
0739 "Aarle-Rixtel"                                         ///
0740 "Almkerk"                                              ///
0741 "Alphen en Riel"                                       ///
0742 "Andel"                                                ///
0743 "Asten"                                                ///
0744 "Baarle-Nassau"                                        ///
0745 "Bakel en Milheeze"                                    ///
0746 "Beek en Donk"                                         ///
0747 "Beers"                                                ///
0748 "Bergen op Zoom"                                       ///
0749 "Bergeyk"                                              ///
0750 "Berghem"                                              ///
0751 "Berkel-Enschot"                                       ///
0752 "Berlicum"                                             ///
0753 "Best"                                                 ///
0754 "Bladel en Netersel"                                   ///
0755 "Boekel"                                               ///
0756 "Boxmeer"                                              ///
0757 "Boxtel"                                               ///
0758 "Breda"                                                ///
0759 "Budel"                                                ///
0760 "Chaam"                                                ///
0761 "Cuijk en Sint Agatha"                                 ///
0762 "Deurne"                                               ///
0763 "Diessen"                                              ///
0764 "Dinteloord en Prinsenland"                            ///
0765 "Pekela"                                               ///
0766 "Dongen"                                               ///
0767 "Drunen"                                               ///
0768 "Den Dungen"                                           ///
0769 "Dussen"                                               ///
0770 "Eersel"                                               ///
0771 "Eethen"                                               ///
0772 "Eindhoven"                                            ///
0773 "Empel en Meerwijk"                                    ///
0774 "Engelen"                                              ///
0775 "Erp"                                                  ///
0776 "Esch"                                                 ///
0777 "Etten-Leur"                                           ///
0778 "Fijnaart en Heijningen"                               ///
0779 "Geertruidenberg"                                      ///
0780 "Geffen"                                               ///
0781 "Geldrop"                                              ///
0782 "Gemert"                                               ///
0783 "Giessen"                                              ///
0784 "Gilze en Rijen"                                       ///
0785 "Goirle"                                               ///
0786 "Grave"                                                ///
0787 "'s-Gravenmoer"                                        ///
0788 "Haaren"                                               ///
0789 "Halsteren"                                            ///
0790 "Haps"                                                 ///
0791 "Heesch"                                               ///
0792 "Heeswijk-Dinther"                                     ///
0793 "Heeze"                                                ///
0794 "Helmond"                                              ///
0795 "Helvoirt"                                             ///
0796 "'s-Hertogenbosch"                                     ///
0797 "Heusden"                                              ///
0798 "Hilvarenbeek"                                         ///
0799 "Hoeven"                                               ///
0800 "Hoogeloon, Hapert en Casteren"                        ///
0801 "Hooge en Lage Mierde"                                 ///
0802 "Hooge en Lage Zwaluwe"                                ///
0803 "Huijbergen"                                           ///
0804 "Klundert"                                             ///
0805 "Leende"                                               ///
0806 "Liempde"                                              ///
0807 "Lieshout"                                             ///
0808 "Lith"                                                 ///
0809 "Loon op Zand"                                         ///
0810 "Luyksgestel"                                          ///
0811 "Maarheeze"                                            ///
0812 "Made en Drimmelen"                                    ///
0813 "Megen, Haren en Macharen"                             ///
0814 "Mierlo"                                               ///
0815 "Mill en Sint Hubert"                                  ///
0816 "Moergestel"                                           ///
0817 "Nieuw-Ginneken"                                       ///
0818 "Nieuw-Vossemeer"                                      ///
0819 "Nistelrode"                                           ///
0820 "Nuenen, Gerwen en Nederwetten"                        ///
0821 "Nuland"                                               ///
0822 "Oeffelt"                                              ///
0823 "Oirschot"                                             ///
0824 "Oisterwijk"                                           ///
0825 "Oost-, West- en Middelbeers"                          ///
0826 "Oosterhout"                                           ///
0827 "Oploo, Sint Anthonis en Ledeacker"                    ///
0828 "Oss"                                                  ///
0829 "Ossendrecht"                                          ///
0830 "Oudenbosch"                                           ///
0831 "Oud en Nieuw Gastel"                                  ///
0832 "Prinsenbeek"                                          ///
0833 "Putte"                                                ///
0834 "Raamsdonk"                                            ///
0835 "Ravenstein"                                           ///
0836 "Reusel"                                               ///
0837 "Riethoven"                                            ///
0838 "Roosendaal en Nispen"                                 ///
0839 "Rosmalen"                                             ///
0840 "Rucphen"                                              ///
0841 "Rijsbergen"                                           ///
0842 "Rijswijk (NB.)"                                       ///
0843 "Schaijk"                                              ///
0844 "Schijndel"                                            ///
0845 "Sint-Michielsgestel"                                  ///
0846 "Sint-Oedenrode"                                       ///
0847 "Someren"                                              ///
0848 "Son en Breugel"                                       ///
0849 "Sprang-Capelle"                                       ///
0850 "Standdaarbuiten"                                      ///
0851 "Steenbergen"                                          ///
0852 "Waterland"                                            ///
0853 "Terheijden"                                           ///
0854 "Teteringen"                                           ///
0855 "Tilburg"                                              ///
0856 "Uden"                                                 ///
0857 "Udenhout"                                             ///
0858 "Valkenswaard"                                         ///
0859 "Veen"                                                 ///
0860 "Veghel"                                               ///
0861 "Veldhoven"                                            ///
0862 "Vessem, Wintelre en Knegsel"                          ///
0863 "Vierlingsbeek"                                        ///
0864 "Vlijmen"                                              ///
0865 "Vught"                                                ///
0866 "Waalre"                                               ///
0867 "Waalwijk"                                             ///
0868 "Wanroij"                                              ///
0869 "Waspik"                                               ///
0870 "Werkendam"                                            ///
0871 "Westerhoven"                                          ///
0872 "Willemstad"                                           ///
0873 "Woensdrecht"                                          ///
0874 "Woudrichem"                                           ///
0875 "Wouw"                                                 ///
0876 "Wijk en Aalburg"                                      ///
0877 "Zeeland"                                              ///
0878 "Zevenbergen"                                          ///
0879 "Zundert"                                              ///
0880 "Wormerland"                                           ///
0881 "Onderbanken"                                          ///
0882 "Landgraaf"                                            ///
0883 "Amby"                                                 ///
0884 "Amstenrade"                                           ///
0885 "Arcen en Velden"                                      ///
0886 "Baexem"                                               ///
0887 "Beegden"                                              ///
0888 "Beek"                                                 ///
0889 "Beesel"                                               ///
0890 "Belfeld"                                              ///
0891 "Bemelen"                                              ///
0892 "Berg en Terblijt"                                     ///
0893 "Bergen (L.)"                                          ///
0894 "Bingelrade"                                           ///
0895 "Bocholtz"                                             ///
0896 "Borgharen"                                            ///
0897 "Born"                                                 ///
0898 "Broekhuizen"                                          ///
0899 "Brunssum"                                             ///
0900 "Bunde"                                                ///
0901 "Cadier en Keer"                                       ///
0902 "Echt"                                                 ///
0903 "Elsloo"                                               ///
0904 "Eijgelshoven"                                         ///
0905 "Eijsden"                                              ///
0906 "Geleen"                                               ///
0907 "Gennep"                                               ///
0908 "Geulle"                                               ///
0909 "Grathem"                                              ///
0910 "Grevenbicht"                                          ///
0911 "Gronsveld"                                            ///
0912 "Grubbenvorst"                                         ///
0913 "Gulpen"                                               ///
0914 "Haelen"                                               ///
0915 "Heel en Panheel"                                      ///
0916 "Heer"                                                 ///
0917 "Heerlen"                                              ///
0918 "Helden"                                               ///
0919 "Herten"                                               ///
0920 "Heythuysen"                                           ///
0921 "Hoensbroek"                                           ///
0922 "Horn"                                                 ///
0923 "Horst"                                                ///
0924 "Hulsberg"                                             ///
0925 "Hunsel"                                               ///
0926 "Itteren"                                              ///
0927 "Jabeek"                                               ///
0928 "Kerkrade"                                             ///
0929 "Kessel"                                               ///
0930 "Klimmen"                                              ///
0931 "Limbricht"                                            ///
0932 "Linne"                                                ///
0933 "Maasbracht"                                           ///
0934 "Maasbree"                                             ///
0935 "Maastricht"                                           ///
0936 "Margraten"                                            ///
0937 "Meerlo"                                               ///
0938 "Meerssen"                                             ///
0939 "Melick en Herkenbosch"                                ///
0940 "Merkelbeek"                                           ///
0941 "Meijel"                                               ///
0942 "Mheer"                                                ///
0943 "Montfort"                                             ///
0944 "Mook en Middelaar"                                    ///
0945 "Munstergeleen"                                        ///
0946 "Nederweert"                                           ///
0947 "Neer"                                                 ///
0948 "Nieuwenhagen"                                         ///
0949 "Nieuwstadt"                                           ///
0950 "Noorbeek"                                             ///
0951 "Nuth"                                                 ///
0952 "Obbicht en Papenhoven"                                ///
0953 "Ohé en Laak"                                          ///
0954 "Oirsbeek"                                             ///
0955 "Ottersum"                                             ///
0956 "Posterholt"                                           ///
0957 "Roermond"                                             ///
0958 "Roggel"                                               ///
0959 "Roosteren"                                            ///
0960 "Schaesberg"                                           ///
0961 "Schimmert"                                            ///
0962 "Schinnen"                                             ///
0963 "Schinveld"                                            ///
0964 "Sevenum"                                              ///
0965 "Simpelveld"                                           ///
0966 "Sint Geertruid"                                       ///
0967 "Sint Odilienberg"                                     ///
0968 "Sittard"                                              ///
0969 "Slenaken"                                             ///
0970 "Spaubeek"                                             ///
0971 "Stein"                                                ///
0972 "Stevensweert"                                         ///
0973 "Stramproy"                                            ///
0974 "Susteren"                                             ///
0975 "Swalmen"                                              ///
0976 "Tegelen"                                           ///
0977 "Thorn"                                             ///
0978 "Ubach over Worms"                                  ///
0979 "Ulestraten"                                        ///
0980 "Urmond"                                            ///
0981 "Vaals"                                             ///
0982 "Valkenburg-Houthem"                                ///
0983 "Venlo"                                             ///
0984 "Venray"                                            ///
0985 "Vlodrop"                                           ///
0986 "Voerendaal"                                        ///
0987 "Wanssum"                                           ///
0988 "Weert"                                             ///
0989 "Wessem"                                            ///
0990 "Wittem"                                            ///
0991 "Wijlre"                                            ///
0992 "Wijnandsrade"                                      ///
0993 "Meerlo-Wanssum"                                    ///
0994 "Valkenburg aan de Geul"                            ///
0995 "Lelystad"                                          ///
0996 "Openbaar Lichaam Z.IJ.P."                          ///
0997 "Centraal persoonsregister (CPR)"                   ///
0998 "Buitenland"                                        ///
0999 "Niet-gemeentelijk ingedeeld"                       ///
1000 "Aagtekerke"                                        ///
1001 "Aalst"                                             ///
1002 "Aarlanderveen"                                     ///
1003 "Abcoude-Baambrugge"                                ///
1004 "Abcoude-Proosdij"                                  ///
1005 "Achttienhoven (U.)"                                ///
1006 "Aengwirden"                                        ///
1007 "Alem, Maren en Kessel"                             ///
1008 "Alphen"                                            ///
1009 "Ambt-Almelo"                                       ///
1010 "Ambt-Doetinchem"                                   ///
1011 "Ambt-Hardenberg"                                   ///
1012 "Ambt-Ommen"                                        ///
1013 "Ambt-Vollenhove"                                   ///
1014 "Ankeveen"                                          ///
1015 "Baardwijk"                                         ///
1016 "Balgoij"                                           ///
1017 "Barwoutswaarder"                                   ///
1018 "Bath"                                              ///
1019 "Bellingwolde"                                      ///
1020 "Besoijen"                                          ///
1021 "Beugen en Rijkevoort"                              ///
1022 "Biggekerke"                                        ///
1023 "Bokhoven"                                          ///
1024 "Den Bommel"                                        ///
1025 "Bommenede"                                         ///
1026 "Borkel en Schaft"                                  ///
1027 "Boschkapelle"                                      ///
1028 "Breukelen-Nijenrode"                               ///
1029 "Breukelen-Sint Pieters"                            ///
1030 "Broek"                                             ///
1031 "Broek op Langedijk"                                ///
1032 "Broeksittard"                                      ///
1033 "Buggenum"                                          ///
1034 "Buiksloot"                                         ///
1035 "Burgh"                                             ///
1036 "Capelle"                                           ///
1037 "Charlois"                                          ///
1038 "Colijnsplaat"                                      ///
1039 "Cromvoirt"                                         ///
1040 "Delfshaven"                                        ///
1041 "Deurne en Liessel"                                 ///
1042 "Deursen en Dennenburg"                             ///
1043 "Dieden, Demen en Langel"                           ///
1044 "Dinther"                                           ///
1045 "Dommelen"                                          ///
1046 "Doorwerth"                                         ///
1047 "Dreischor"                                         ///
1048 "Driebergen"                                        ///
1049 "Drongelen"                                         ///
1050 "Duivendijke"                                       ///
1051 "Duizel en Steensel"                                ///
1052 "Eede"                                              ///
1053 "Elkerzee"                                          ///
1054 "Ellemeet"                                          ///
1055 "Elten"                                             ///
1056 "Emmikhoven"                                        ///
1057 "Escharen"                                          ///
1058 "Gameren"                                           ///
1059 "Gassel"                                            ///
1060 "Genderen"                                          ///
1061 "Gestel en Blaarthem"                               ///
1062 "Giessen-Nieuwkerk"                                 ///
1063 "Giessendam"                                        ///
1064 "Ginneken en Bavel"                                 ///
1065 "Grafhorst"                                         ///
1066 "Groote Lindt"                                      ///
1067 "Grijpskerke"                                       ///
1068 "Haamstede"                                         ///
1069 "Haarzuilens"                                       ///
1070 "Hardinxveld"                                       ///
1071 "Hedikhuizen"                                       ///
1072 "Heeswijk"                                          ///
1073 "Heille"                                            ///
1074 "Hekelingen"                                        ///
1075 "Hekendorp"                                         ///
1076 "Hemmen"                                            ///
1077 "Hengstdijk"                                        ///
1078 "Herkingen"                                         ///
1079 "Herpen"                                            ///
1080 "Herpt"                                             ///
1081 "Hillegersberg"                                     ///
1082 "Hof van Delft"                                     ///
1083 "Hoogezand"                                         ///
1084 "Hoogkerk"                                          ///
1085 "Hoogvliet"                                         ///
1086 "Houthem"                                           ///
1087 "Houtrijk en Polanen"                               ///
1088 "Huisseling en Neerloon"                            ///
1089 "Hurwenen"                                          ///
1090 "Ittervoort"                                        ///
1091 "Jaarsveld"                                         ///
1092 "Kamperveen"                                        ///
1093 "Katendrecht"                                       ///
1094 "Kats"                                              ///
1095 "Kerkwerve"                                         ///
1096 "Kethel en Spaland"                                 ///
1097 "Kortenhoef"                                        ///
1098 "Koudekerke"                                        ///
1099 "Kralingen"                                         ///
1100 "Laag-Nieuwkoop"                                    ///
1101 "Lange Ruige Weide"                                 ///
1102 "Lierop"                                            ///
1103 "Linden"                                            ///
1104 "Lithoijen"                                         ///
1105 "Loenersloot"                                       ///
1106 "Lonneker"                                          ///
1107 "Loosduinen"                                        ///
1108 "Maarsseveen"                                       ///
1109 "Maashees en Overloon"                              ///
1110 "Maasniel"                                          ///
1111 "Meeuwen"                                           ///
1112 "Meliskerke"                                        ///
1113 "Melissant"                                         ///
1114 "Mesch"                                             ///
1115 "Nederhemert"                                       ///
1116 "Neeritter"                                         ///
1117 "Nieuw- en Sint Joosland"                           ///
1118 "Nieuw-Helvoet"                                     ///
1119 "Nieuwe Tonge"                                      ///
1120 "Nieuwendam"                                        ///
1121 "Nieuwenhoorn"                                      ///
1122 "Nieuwerkerk"                                       ///
1123 "Nieuwkuijk"                                        ///
1124 "Noord-Scharwoude"                                  ///
1125 "Noord-Waddinxveen"                                 ///
1126 "Noordbroek"                                        ///
1127 "Noorddijk"                                         ///
1128 "Noordgouwe"                                        ///
1129 "Noordwelle"                                        ///
1130 "Nunhem"                                            ///
1131 "Odijk"                                             ///
1132 "Oerle"                                             ///
1133 "Ooltgensplaat"                                     ///
1134 "Oost- en West-Barendrecht"                         ///
1135 "Oost- en West-Souburg"                             ///
1136 "Oosterland"                                        ///
1137 "Oostkapelle"                                       ///
1138 "Ossenisse"                                         ///
1139 "Oud en Nieuw Mathenesse"                           ///
1140 "Oud-Valkenburg"                                    ///
1141 "Oud-Vroenhoven"                                    ///
1142 "Ouddorp"                                           ///
1143 "Oude-Tonge"                                        ///
1144 "Oudenrijn"                                         ///
1145 "Oudheusden"                                        ///
1146 "Oudkarspel"                                        ///
1147 "Oudshoorn"                                         ///
1148 "Ouwerkerk"                                         ///
1149 "Overschie"                                         ///
1150 "Oijen en Teeffelen"                                ///
1151 "Papekop"                                           ///
1152 "Pernis"                                            ///
1153 "Petten"                                            ///
1154 "Peursum"                                           ///
1155 "Poederoijen"                                       ///
1156 "Princenhage"                                       ///
1157 "Ransdorp"                                          ///
1158 "Reek"                                              ///
1159 "Renesse"                                           ///
1160 "Rietveld"                                          ///
1161 "Rilland"                                           ///
1162 "Rimburg"                                           ///
1163 "Ritthem"                                           ///
1164 "Ruwiel"                                            ///
1165 "Rijckholt"                                         ///
1166 "Rijsenburg"                                        ///
1167 "Sambeek"                                           ///
1168 "Sappemeer"                                         ///
1169 "Schalkwijk"                                        ///
1170 "Schiebroek"                                        ///
1171 "Schin op Geul"                                     ///
1172 "Schore"                                            ///
1173 "Schoten"                                           ///
1174 "Schoterland"                                       ///
1175 "Serooskerke (Schouwen-Duivenland)"                 ///
1176 "Serooskerke (Walcheren)"                           ///
1177 "Sint Anna Termuiden"                               ///
1178 "Sint Kruis"                                        ///
1179 "Sint Laurens"                                      ///
1180 "Sint Pieter"                                       ///
1181 "Sloten (NH.)"                                      ///
1182 "Sluipwijk"                                         ///
1183 "Soerendonk"                                        ///
1184 "Sommelsdijk"                                       ///
1185 "Spaarndam"                                         ///
1186 "Spanbroek"                                         ///
1187 "Sprang"                                            ///
1188 "Stad aan 't Haringvliet"                           ///
1189 "Stad-Almelo"                                       ///
1190 "Stad-Doetinchem"                                   ///
1191 "Stad-Hardenberg"                                   ///
1192 "Stad-Ommen"                                        ///
1193 "Stad-Vollenhove"                                   ///
1194 "Stein (ZH.)"                                       ///
1195 "Stellendam"                                        ///
1196 "Stiphout"                                          ///
1197 "Stompwijk"                                         ///
1198 "Stoppeldijk"                                       ///
1199 "Stratum"                                           ///
1200 "Strucht"                                           ///
1201 "Strijp"                                            ///
1202 "Tienhoven (U.)"                                    ///
1203 "Tongelre"                                          ///
1204 "Tudderen (Drostambt)"                              ///
1205 "Tull en 't Waal"                                   ///
1206 "Veldhoven en Meerveldhoven"                        ///
1207 "Veldhuizen"                                        ///
1208 "Velp"                                              ///
1209 "Veur"                                              ///
1210 "Vlaardinger-Ambacht"                               ///
1211 "Vleuten"                                           ///
1212 "Vlierden"                                          ///
1213 "Vreeland"                                          ///
1214 "Vrouwenpolder"                                     ///
1215 "Vrijenban"                                         ///
1216 "Vrijhoeve-Capelle"                                 ///
1217 "Waarder"                                           ///
1218 "Wadenoijen"                                        ///
1219 "Watergraafsmeer"                                   ///
1220 "Wedde"                                             ///
1221 "Weesperkarspel"                                    ///
1222 "de Werken en Sleeuwijk"                            ///
1223 "Werkhoven"                                         ///
1224 "Westbroek"                                         ///
1225 "Wildervank"                                        ///
1226 "Willige-Langerak"                                  ///
1227 "Wilsum"                                            ///
1228 "Woensel"                                           ///
1229 "Wijk aan Zee en Duin"                              ///
1230 "IJsselmonde"                                       ///
1231 "IJzendoorn"                                        ///
1232 "Zalk en Veecaten"                                  ///
1233 "Zeelst"                                            ///
1234 "Zegwaart"                                          ///
1235 "Zesgehuchten"                                      ///
1236 "Zonnemaire"                                        ///
1237 "Zoutelande"                                        ///
1238 "Zuid-Scharwoude"                                   ///
1239 "Zuid-Waddinxveen"                                  ///
1240 "Zuidbroek (Gr.)"                                   ///
1241 "Zuidschalkwijk"                                    ///
1242 "Zuilen"                                            ///
1243 "Zuilichem"                                         ///
1244 "Zwammerdam"                                        ///
1245 "Zwollerkerspel"                                    ///
1246 "Bangert"                                           ///
1247 "Beek (NB.)"                                        ///
1248 "Driel"                                             ///
1249 "Nieuwer-Amstel"                                    ///
1250 "Onstwedde"                                         ///
1251 "Etten en Leur"                                     ///
1252 "Valkenburg (L.)"                                   ///
1253 "Wissekerke"                                        ///
1254 "Borssele"                                          ///
1255 "Eethen, Genderen en Heesbeen"                      ///
1256 "Koudekerk"                                         ///
1257 "Staveren"                                          ///
1258 "Rijsoort en Strevelshoek"                          ///
1259 "Millingen"                                         ///
1260 "Hemelumer Oldephaerd en Noordwolde"                ///
1262 "Bleskensgraaf"                                     ///
1263 "Drongelen, Haagoord, Gansoyen, Doevere"            ///
1264 "Meeuwen, Heel en Babyloniënbroek"                  ///
1265 "Dussen, Munster en Muilkerk"                       ///
1301 "Abtsregt"                                          ///
1302 "Achthoven"                                         ///
1303 "Achttienhoven (ZH.)"                               ///
1304 "Ackersdijk en Vrouwenregt"                         ///
1305 "Benthorn"                                          ///
1306 "Berkenrode"                                        ///
1307 "Biert"                                             ///
1308 "Biesland"                                          ///
1309 "Bijlmermeer"                                       ///
1310 "Cabouw"                                            ///
1311 "Cillaarshoek"                                      ///
1312 "Darthuizen"                                        ///
1313 "Dorth"                                             ///
1314 "Duist"                                             ///
1315 "Edam"                                              ///
1316 "Etersheim"                                         ///
1317 "Gapinge"                                           ///
1318 "Gerverscop"                                        ///
1319 "Goidschalxoord"                                    ///
1320 "'s-Gravenambacht"                                  ///
1321 "Gravesloot"                                        ///
1322 "Groeneveld"                                        ///
1323 "Groet"                                             ///
1324 "Grosthuizen"                                       ///
1325 "Haarlemmerliede"                                   ///
1326 "'s-Heer Hendrikskinderen"                          ///
1327 "Heer Oudelands Ambacht"                            ///
1328 "Hodenpijl"                                         ///
1329 "Hofwegen"                                          ///
1330 "Hoog en Woud Harnasch"                             ///
1331 "Hoogeveen in Delfland"                             ///
1332 "Hoogeveen in Rijnland"                             ///
1333 "Hoogmade"                                          ///
1334 "Kalslagen"                                         ///
1335 "Kamerik Houtdijken"                                ///
1336 "Kamerik Mijzijde"                                  ///
1337 "Kijfhoek"                                          ///
1338 "Kleine Lindt"                                      ///
1339 "Kleverskerke"                                      ///
1340 "Laagblokland"                                      ///
1341 "Loenen en Wolveren"                                ///
1342 "Maarssenbroek"                                     ///
1343 "Meerdervoort"                                      ///
1344 "Middelburg (ZH.)"                                  ///
1345 "De Mijl"                                           ///
1346 "Naters"                                            ///
1347 "Nederslingelandt"                                  ///
1348 "Nieuwland, Kortland en 's-Graveland"               ///
1349 "Nieuwveen in Delfland"                             ///
1350 "Noord-Polsbroek"                                   ///
1351 "Onwaard"                                           ///
1352 "Oost-Barendrecht"                                  ///
1353 "Oost-Souburg"                                      ///
1355 "Oud-Wulven"                                        ///
1356 "Oude en Nieuwe Struiten"                           ///
1357 "Oudhuizen"                                         ///
1358 "Oukoop"                                            ///
1359 "Portengen"                                         ///
1360 "Rhijnauwen"                                        ///
1361 "Rietwijkeroord"                                    ///
1362 "Rijsoort"                                          ///
1363 "Roxenisse"                                         ///
1364 "Ruijven"                                           ///
1365 "Sandelinge-Ambacht"                                ///
1366 "Schardam"                                          ///
1367 "Scharwoude"                                        ///
1368 "Schellingwoude"                                    ///
1369 "Schokland"                                         ///
1370 "Schonauwen"                                        ///
1371 "Schuddebeurs en Simonshaven"                       ///
1372 "Sint Anthonypolder"                                ///
1373 "Sint Maartensregt"                                 ///
1374 "Spaarnwoude"                                       ///
1375 "Spijk"                                             ///
1376 "Steenbergen en Kruisland"                          ///
1377 "Sterkenburg"                                       ///
1378 "Stormpolder"                                       ///
1380 "Strevelshoek"                                      ///
1381 "Strijensas"                                        ///
1382 "Teckop"                                            ///
1383 "Tempel"                                            ///
1384 "Veenhuizen"                                        ///
1385 "de Vennip"                                         ///
1386 "Verwolde"                                          ///
1387 "Vinkeveen"                                         ///
1388 "Vliet"                                             ///
1390 "Vrije en Lage Boekhorst"                           ///
1391 "Vrijhoeven"                                        ///
1392 "de Vuursche"                                       ///
1393 "Waverveen"                                         ///
1394 "West-Barendrecht"                                  ///
1395 "West-Souburg"                                      ///
1396 "Wieldrecht"                                        ///
1397 "Wimmenum"                                          ///
1398 "Wulverhorst"                                       ///
1399 "Zevender"                                          ///
1400 "Zouteveen"                                         ///
1401 "Zuid-Polsbroek"                                    ///
1402 "Zuidbroek (ZH.)"                                   ///
1403 "Zuidwijk"                                          ///
1404 "De Noordoostelijke Polder"                         ///
1507 "Horst aan de Maas"                                 ///
1509 "Oude IJsselstreek"                                 ///
1525 "Teylingen"                                         ///
1581 "Utrechtse Heuvelrug"                               ///
1586 "Oost Gelre"                                        ///
1598 "Koggenland"                                        ///
1621 "Lansingerland"                                     ///
1640 "Leudal"                                            ///
1641 "Maasgouw"                                          ///
1651 "Eemsmond"                                          ///
1652 "Gemert-Bakel"                                      ///
1655 "Halderberge"                                       ///
1658 "Heeze-Leende"                                      ///
1659 "Laarbeek"                                          ///
1661 "Reiderland"                                        ///
1663 "De Marne"                                          ///
1665 "Made"                                              ///
1666 "Zevenhuizen-Moerkapelle"                           ///
1667 "Reusel-De Mierden"                                 ///
1669 "Roerdalen"                                         ///
1670 "Roggel en Neer"                                    ///
1671 "Maasdonk"                                          ///
1672 "Rijnwoude"                                         ///
1673 "Liemeer"                                           ///
1674 "Roosendaal"                                        ///
1676 "Schouwen-Duiveland"                                ///
1679 "Ambt Montfort"                                     ///
1680 "Aa en Hunze"                                       ///
1681 "Borger-Odoorn"                                     ///
1684 "Cuijk"                                             ///
1685 "Landerd"                                           ///
1690 "De Wolden"                                         ///
1691 "St. Anthonis"                                      ///
1695 "Noord-Beveland"                                    ///
1696 "Wijdemeren"                                        ///
1697 "Middenveld"                                        ///
1698 "Sluis-Aardenburg"                                  ///
1699 "Noordenveld"                                       ///
1700 "Twenterand"                                        ///
1701 "Westerveld"                                        ///
1702 "Sint Anthonis"                                     ///
1705 "Lingewaard"                                        ///
1706 "Cranendonck"                                       ///
1708 "Steenwijkerland"                                   ///
1709 "Moerdijk"                                          ///
1711 "Echt-Susteren"                                     ///
1714 "Sluis"                                             ///
1719 "Drimmelen"                                         ///
1721 "Bernheze"                                          ///
1722 "Ferwerderadiel"                                    ///
1723 "Alphen-Chaam"                                      ///
1724 "Bergeijk"                                          ///
1728 "Bladel"                                            ///
1729 "Gulpen-Wittem"                                     ///
1730 "Tynaarlo"                                          ///
1731 "Midden-Drenthe"                                    ///
1734 "Overbetuwe"                                        ///
1735 "Hof van Twente"                                    ///
1740 "Neder-Betuwe"                                      ///
1742 "Rijssen-Holten"                                    ///
1771 "Geldrop-Mierlo"                                    ///
1773 "Olst-Wijhe"                                        ///
1774 "Dinkelland"                                        ///
1783 "Westland"                                          ///
1842 "Midden-Delfland"                                   ///
1859 "Berkelland"                                        ///
1876 "Bronckhorst"                                       ///
1883 "Sittard-Geleen"                                    ///
1884 "Kaag en Braassem"                                  ///
1891 "Dantumadiel"                                       ///
1892 "Zuidplas"                                          ///
1894 "Peel en Maas"                                      ///
1895 "Oldambt"                                           ///
1896 "Zwartewaterland"                                   ///
1900 "Súdwest-Fryslân"                                   ///
1901 "Bodegraven-Reeuwijk"                               ///
1903 "Eijsden-Margraten"                                 ///
1904 "Stichtse Vecht"                                    ///
1908 "Menameradiel"                                      ///
1911 "Hollands Kroon"                                    ///
1916 "Leidschendam-Voorburg"                             ///
1921 "De Friese Meren"                                   ///
1924 "Goeree-Overflakkee"                                ///
1926 "Pijnacker-Nootdorp"                                ///
1927 "Molenwaard"                                        ///
1930 "Nissewaard"                                        ///
1931 "Krimpenerwaard"                                    ///
1937 "Heel"                                              ///
1940 "De Fryske Marren"                                  ///
1942 "Gooise Meren"                                      ///
1945 "Berg en Dal"                                       ///
1948 "Meierijstad"                                       ///
1949 "Waadhoeke"                                         ///
1950 "Westerwolde"                                       ///
1952 "Midden-Groningen"                                  ///
1954 "Beekdaelen"                                        ///
1955 "Montferland"                                       ///
1959 "Altena"                                            ///
1960 "West Betuwe"                                       ///
1961 "Vijfheerenlanden"                                  ///
1963 "Hoeksche Waard"                                    ///
1966 "Het Hogeland"                                      ///
1969 "Westerkwartier"                                    ///
1970 "Noardeast-Fryslân"                                 ///
1978 "Molenlanden"                                       ///
1987 "Menterwolde"                                       ///
3001 "Aruba"                                             ///
3002 "Bonaire"                                           ///
3003 "Curaçao"                                           ///
3004 "Saba"                                              ///
3005 "Sint Eustatius"                                    ///
3006 "Sint Maarten"


   * OPLNIVSOI2016AGG4HBMETNIRWO
capture label drop OPLNIVSOI2016AGG4HBMETNIRWO_lab
label define OPLNIVSOI2016AGG4HBMETNIRWO_lab             /// 
.a     "Unknown"                                   ///
1110 "Primary education (Basisonderwijs) z.n.d."         /// 
1111 "Primary education (Basisonderwijs) gr1-2"          /// 
1112 "Primary education (Basisonderwijs) gr3-8"          /// 
1210 "Vmbo-b/k, mbo1 z.n.d."                       /// 
1211 "Practical education (Praktijkonderwijs)"           /// 
1212 "Vmbo-b/k"                                 /// 
1213 "Mbo1"                                     /// 
1220 "Vmbo-g/t, havo-, vwo-onderbouw"                 /// 
1221 "Vmbo-g/t"                                 /// 
1222 "Havo-, vwo-onderbouw"                           /// 
2110 "Mbo2 en mbo3 z.n.d."                            /// 
2111 "Mbo2"                                     /// 
2112 "Mbo3"                                     /// 
2120 "Mbo4 z.n.d."                                 /// 
2121 "Mbo4"                                     /// 
2130 "Havo, vwo z.n.d."                            /// 
2131 "Havo-bovenbouw"                              /// 
2132 "Vwo-bovenbouw"                               /// 
3110 "Hbo, wo-bachelor z.n.d."                        /// 
3111 "Hbo-associate degree"                        /// 
3112 "Hbo-bachelor"                             /// 
3113 "Wo-bachelor"                                 /// 
3210 "Hbo-, wo-master, doctor z.n.d."                 /// 
3211 "Hbo-master"                                  /// 
3212 "Wo-master"                                /// 
3213 "Doctor"                                   /// 
9999 "Weet niet of onbekend"

   *  VRLGBADATUMOVERLIJDEN
capture label drop VRLGBADATUMOVERLIJDEN_lab
label define VRLGBADATUMOVERLIJDEN_lab                /// 
.b    "Alive"

   *  VRLDATUMEINDEHH
capture label drop VRLDATUMEINDEHH_lab
label define VRLDATUMEINDEHH_lab                      /// 
.c    "Date unknown"

*>> Label values 
label values oplnivsoi2016agg4hbmetnirwo OPLNIVSOI2016AGG4HBMETNIRWO_lab
label values rinpersoonsma RINPERSOONSMA_lab
label values rinpersoonspa RINPERSOONSPA_lab
label values vrlgbageboortegemeente geboortegemeente VRLGBAGEBOORTEGEMEENTE_lab
label values vrlgbageneratie VRLGBAGENERATIE_lab
label values vrlgbageboortemaand VRLGBAGEBOORTEMAAND_lab
label values vrlgbageslacht VRLGBAGESLACHT_lab
label values vrlgbaherkomstgroepering VRLGBAHERKOMSTGROEPERING_lab
label values rinpersoons RINPERSOONS_lab
label values vrlgbadatumoverlijden VRLGBADATUMOVERLIJDEN_lab
label values vrldatumaanvanghh VRLDATUMAANVANGHH_lab
label values vrldatumeindehh VRLDATUMEINDEHH_lab

*>> // compress dataset
compress

*>> // Remove any notes
notes drop *

// *>> Order variables 
// order                                           /// 
// RINPERSOONS  rinpersoons                           /// 
// RINPERSOON  rinpersoon                             /// 
// VRLGBAHERKOMSTGROEPERING  vrlgbaherkomstgroepering          /// 
// VRLGBAGEBOORTEJAAR  vrlgbageboortejaar                   /// 
// VRLGBAGESLACHT  vrlgbageslacht                        /// 
// VRLGBAGEBOORTEMAAND  vrlgbageboortemaand              /// 
// VRLGBAGENERATIE  vrlgbageneratie                      /// 
// VRLGBADATUMOVERLIJDEN  vrlgbadatumoverlijden             /// 
// VRLGBAGEBOORTEGEMEENTE  vrlgbageboortegemeente           /// 
// RINPERSOONMA  rinpersoonma                            /// 
// RINPERSOONPA  rinpersoonpa                            /// 
// RINPERSOONSPA  rinpersoonspa                       /// 
// RINPERSOONSMA  rinpersoonsma                       /// 
// OPLNIVSOI2016AGG4HBMETNIRWO  oplnivsoi2016agg4hbmetnirwo    /// 
// gewichthoogsteopl  gewichthoogsteopl                  /// 
// VRLDATUMAANVANGHH  vrldatumaanvanghh                  /// 
// VRLDATUMEINDEHH  vrldatumeindehh                      /// 
// VRLHUISHOUDNR  vrlhuishoudnr                       /// 
// GEBOORTEGEMEENTE  geboortegemeente 

*>> Sort dataset 
sort RINPERSOON RINPERSOONS

*>> Generate new ID variable (because the zero at the beginning is problematic)
gen pid = RINPERSOONS + RINPERSOON 
gen pid_pa = RINPERSOONSPA + RINPERSOONPA
gen pid_ma = RINPERSOONSMA + RINPERSOONMA

*>> Save 
save "$cbs_file2_out\file2backgroundchildren20190101anav1.dta", replace 



*---- [17.3.      (CBS) File 3      ]-----------------------------------------------------------------------------------*

use "$cbs_file3_in\FILE3LIVINGTOGETHERCHILD2018ANAV1.dta", clear
codebookout "$codebook\FILE3LIVINGTOGETHERCHILD2018ANAV1", replace

*>> Convert from string to numeric (or missing)
encode  RINPERSOONS,                gen(rinpersoons)
encode  RINPERSOONS1PARTNER,           gen(rinpersoons1partner)
encode  KOPPELPOPULATIEKINDTABVV,      gen(koppelpopulatiekindtabvv)
gen      rinpersoon                    = real(RINPERSOON)
gen      rinpersoon1partner               = real(RINPERSOON1PARTNER)
gen   gbaredeneindesamenwoonperiode1  = real(GBAREDENEINDESAMENWOONPERIODE1)

*>> Date and time 
gen double gbaaanvangsamenwoonperiode1       = clock(GBAAANVANGSAMENWOONPERIODE1, "YMD")  // Creating new variable readable by Stata
format gbaaanvangsamenwoonperiode1 %tc

gen double gbaeindesamenwoonperiode1      = clock(GBAEINDESAMENWOONPERIODE1, "YMD")
format gbaeindesamenwoonperiode1 %tc


*>> Label variables 
label variable rinpersoons                   "Encoding for the quality of the conversion of a BSN / sofi number to rinperson"
label variable rinpersoon                 "Meaning and dimensionless identification number to replace the social security number / BSN"
label variable gbaaanvangsamenwoonperiode1      "Date commencement of cohabitation period"
label variable gbaeindesamenwoonperiode1     "Date end of cohabitation period"
label variable gbaredeneindesamenwoonperiode1   "Reason for the end of the cohabitation period"
label variable rinpersoon1partner            "Together with rinpersoons1partner this number identifies the partner"
label variable rinpersoons1partner           "Together with rinperson1partner this number identifies the partner"
label variable koppelpopulatiekindtabvv      "Fictitious variable indicates whether it is (1) / not (empty) in file"

label variable RINPERSOONS "codering voor de kwaliteit van de omzetting van een bsn/sofinummer naar rinpersoon"
label variable RINPERSOON "betekenis- en dimensieloos identificatienummer ter vervanging van het sofi-nummer/bsn"
label variable GBAAANVANGSAMENWOONPERIODE1 "datum aanvang van samenwoonperiode"
label variable GBAEINDESAMENWOONPERIODE1 "datum einde van samenwoonperiode"
label variable GBAREDENEINDESAMENWOONPERIODE1 "reden voor het einde van de samenwoonperiode"
label variable RINPERSOON1PARTNER "samen met rinpersoons1partner identificeert dit nummer de partner"
label variable RINPERSOONS1PARTNER "samen met rinpersoon1partner identificeert dit nummer de partner"
label variable KOPPELPOPULATIEKINDTABVV "fictieve variabele geeft aan of deze wel(1)/niet(leeg) voorkomt in bestand"

*>> Label define 

 * GBAREDENEINDESAMENWOONPERIODE1
capture label drop GBAREDENEINDESAMENWOON_lab
label define GBAREDENEINDESAMENWOON_lab                           /// 
0 "Living period existed on yyyy1231"                             ///
1 "Living period ended by moving person"                          ///
2 "Living period ended by moving partner of person"                  ///
3 "Coupling period ended by simultaneous movement of person and partner"   ///
4 "Living period ended by emigration of person"                      ///
5 "Living period ended by emigration of partner of person"              ///
6 "Coupling period ended by simultaneous emigration of person and partner"    ///
7 "Living period ended by death of person"                           ///
8 "Living period ended by partner of person's death"                 ///
9 "Coupling period ended by simultaneous death of person and partner"      ///
10 "Living period ended, other reasons"


*>> Label values
label values rinpersoons RINPERSOONS_lab
label values gbaredeneindesamenwoon GBAREDENEINDESAMENWOON_lab
label values rinpersoons1partner RINPERSOONS1PARTNER_lab

*>> // compress dataset
compress

*>> // Remove any notes
notes drop *

// *>> Order variables 
// order                                              /// 
// RINPERSOONS rinpersoons                               ///
// RINPERSOON rinpersoon                                 ///
// GBAAANVANGSAMENWOONPERIODE1 gbaaanvangsamenwoonperiode1     ///
// GBAEINDESAMENWOONPERIODE1 gbaeindesamenwoonperiode1         ///
// GBAREDENEINDESAMENWOONPERIODE1 gbaredeneindesamenwoonperiode1  ///
// RINPERSOON1PARTNER rinpersoon1partner                    ///
// RINPERSOONS1PARTNER rinpersoons1partner                  ///
// KOPPELPOPULATIEKINDTABVV koppelpopulatiekindtabvv 

*>> Sort dataset 
sort RINPERSOON RINPERSOONS

*>> Generate new ID variable (because the zero at the beginning is problematic)
gen pid = RINPERSOONS + RINPERSOON 
gen pid_cohab_partner = RINPERSOONS1PARTNER + RINPERSOON1PARTNER 

*>> Save 
save "$cbs_file3_out\file3livingtogetherchild2018anav1.dta", replace


*---- [17.4.      (CBS) File 4      ]-----------------------------------------------------------------------------------*

use "$cbs_file4_in\FILE4MARRIAGECHILD2018ANAV1.dta", clear
codebookout "$codebook\FILE4MARRIAGECHILD2018ANAV1", replace

*>> Convert from string to numeric (or missing) - IDs
encode   RINPERSOONS,            gen(rinpersoons)
encode   RINPERSOONSVERBINTENISP,   gen(rinpersoonsverbintenisp)
encode   TYPEVERBINTENIS,        gen(typeverbintenis)
encode   KOPPELPOPULATIEKINDTABVV,  gen(koppelpopulatiekindtabvv)
gen      rinpersoon              = real(RINPERSOON)
gen      rinpersoonverbintenisp     = real(RINPERSOONVERBINTENISP)

*>> Date and time 
gen double  aanvangverbintenis      = clock(AANVANGVERBINTENIS, "YMD") 
format      aanvangverbintenis %tc

gen double  eindeverbintenis     = clock(EINDEVERBINTENIS, "YMD") 
format      eindeverbintenis %tc
recode      eindeverbintenis (. = .a) if eindeverbintenis>=. & EINDEVERBINTENIS=="88888888"


*>> Convert from string to numeric (or missing) - Other variables
encode   REDENBEEINDIGINGVERBINTENIS,  gen(redenbeeindigingverbintenis)


*>> Label variables 
label variable rinpersoons                "Encoding for the quality of the conversion of a BSN / sofi number to rinperson"
label variable rinpersoon              "Meaning and dimensionless identification number to replace the social security number / BSN"
label variable aanvangverbintenis         "Commencement date of the commitment"
label variable eindeverbintenis        "Date of termination of the commitment"
label variable redenbeeindigingverbintenis   "Reason for termination of the commitment"
label variable rinpersoonsverbintenisp       "Commitment Partner Person ID Origin Indicator"
label variable rinpersoonverbintenisp     "Person id of the commitment partner"
label variable typeverbintenis            "Marriage or registered partnership"
label variable koppelpopulatiekindtabvv   "Fictitious variable indicates whether it is (1) / not (empty) in file"

label variable RINPERSOONS                "codering voor de kwaliteit van de omzetting van een bsn/sofinummer naar rinpersoon"
label variable RINPERSOON              "betekenis- en dimensieloos identificatienummer ter vervanging van het sofi-nummer/bsn"
label variable AANVANGVERBINTENIS         "datum aanvang van de verbintenis"
label variable EINDEVERBINTENIS        "datum be indiging van de verbintenis"
label variable REDENBEEINDIGINGVERBINTENIS   "reden be indiging van de verbintenis"
label variable RINPERSOONSVERBINTENISP       "indicator voor de oorsprong van persoon-id van de verbintenispartner"
label variable RINPERSOONVERBINTENISP     "persoon-id van de verbintenispartner"
label variable TYPEVERBINTENIS            "huwelijk of geregistreerd partnerschap"
label variable KOPPELPOPULATIEKINDTABVV   "fictieve variabele geeft aan of deze wel(1)/niet(leeg) voorkomt in bestand"

*>> Label define 

*  EINDEVERBINTENIS
capture label drop EINDEVERBINTENIS_lab 
label define EINDEVERBINTENIS_lab               /// 
.a "Ongoing commitment" 

* REDENBEEINDIGINGVERBINTENIS
capture label drop REDENBEEINDIGINGVERBINTENIS_lab
label define REDENBEEINDIGINGVERBINTENIS_lab       /// 
1 "(-) Unknown"                           ///
2 "(D) Disbanded by death of person"            ///
3 "(H) Partnership turned into marriage"        ///
4 "(O) Disbanded due to death of partner"          ///
5 "(S) Disbanded by divorce / divorce"
// "(P)" "Marriage turned into partnership"


* TYPEVERBINTENIS
capture label drop TYPEVERBINTENIS_lab 
label define TYPEVERBINTENIS_lab             /// 
1 "(H) marriage"                          /// 
2 "(P) registered partnership"

*>> Label values 
label values rinpersoons RINPERSOONS_lab
label values eindeverbintenis EINDEVERBINTENIS_lab
label values redenbeeindigingverbintenis REDENBEEINDIGINGVERBINTENIS_lab
label values rinpersoonsverbintenisp RINPERSOONSVERBINTENISP_lab
label values typeverbintenis TYPEVERBINTENIS_lab

*>> // compress dataset
compress

*>> // Remove any notes
notes drop *

// *>> Order variables 
// order                                        /// 
// RINPERSOONS rinpersoons                         ///
// RINPERSOON rinpersoon                           ///
// AANVANGVERBINTENIS aanvangverbintenis                 ///
// EINDEVERBINTENIS eindeverbintenis                  ///
// REDENBEEINDIGINGVERBINTENIS redenbeeindigingverbintenis ///
// RINPERSOONSVERBINTENISP rinpersoonsverbintenisp       ///
// RINPERSOONVERBINTENISP rinpersoonverbintenisp         ///
// TYPEVERBINTENIS typeverbintenis                    ///
// KOPPELPOPULATIEKINDTABVV koppelpopulatiekindtabvv 

*>> Sort dataset 
sort RINPERSOON RINPERSOONS

*>> Generate new ID variable (because the zero at the beginning is problematic)
gen pid = RINPERSOONS + RINPERSOON 
gen pid_mar_partner = RINPERSOONSVERBINTENISP + RINPERSOONVERBINTENISP

*>> Save 
save "$cbs_file4_out\file4marriagechild2018anav1.dta", replace



*---- [17.5.      (CBS) File 5      ]-----------------------------------------------------------------------------------*

use "$cbs_file5_in\FILE5LIVINGTOGETHERPARENT2018ANAV1.dta", clear
codebookout "$codebook\FILE5LIVINGTOGETHERPARENT2018ANAV1", replace 

*>> Convert from string to numeric (or missing)
encode   RINPERSOONS,               gen(rinpersoons)
encode   RINPERSOONS1PARTNER,          gen(rinpersoons1partner)
gen   rinpersoon                 = real(RINPERSOON)
gen   rinpersoon1partner            = real(RINPERSOON1PARTNER)
gen   gbaredeneindesamenwoonperiode1   = real(GBAREDENEINDESAMENWOONPERIODE1)
encode   KOPPELPOPULATIETABVV,         gen(koppelpopulatietabvv)

*>> Date and time 
   *  Start date of cohabitation period
gen double  gbaaanvangsamenwoonperiode1   = clock(GBAAANVANGSAMENWOONPERIODE1, "YMD") 
format      gbaaanvangsamenwoonperiode1 %tc

   * Date end of cohabitation period
gen double  gbaeindesamenwoonperiode1     = clock(GBAEINDESAMENWOONPERIODE1, "YMD")
format      gbaeindesamenwoonperiode1 %tc

*>> Label variables 
label variable rinpersoons                   "Encoding for the quality of the conversion of a BSN / sofi number to rinperson"
label variable rinpersoon                 "Meaning and dimensionless identification number to replace the social security number / BSN"
label variable gbaaanvangsamenwoonperiode1      "Start date of cohabitation period"
label variable gbaeindesamenwoonperiode1     "Date end of cohabitation period"
label variable gbaredeneindesamenwoonperiode1   "Reason for the end of the cohabitation period"
label variable rinpersoon1partner            "Together with rinpersoons1partner this number identifies the partner"
label variable rinpersoons1partner           "Together with rinperson1partner this number identifies the partner"
label variable koppelpopulatietabvv          "Fictitious variable indicates whether it is (1) / not (empty) in file"

label variable RINPERSOONS "codering voor de kwaliteit van de omzetting van een bsn/sofinummer naar rinpersoon"
label variable RINPERSOON "betekenis- en dimensieloos identificatienummer ter vervanging van het sofi-nummer/bsn"
label variable GBAAANVANGSAMENWOONPERIODE1 "datum aanvang van samenwoonperiode"
label variable GBAEINDESAMENWOONPERIODE1 "datum einde van samenwoonperiode"
label variable GBAREDENEINDESAMENWOONPERIODE1 "reden voor het einde van de samenwoonperiode"
label variable RINPERSOON1PARTNER "samen met rinpersoons1partner identificeert dit nummer de partner"
label variable RINPERSOONS1PARTNER "samen met rinpersoon1partner identificeert dit nummer de partner"
label variable KOPPELPOPULATIETABVV "fictieve variabele geeft aan of deze wel(1)/niet(leeg) voorkomt in bestand"

   *  GBAREDENEINDESAMENWOONPERIODE1
capture label drop GBAREDENEINDESAMENWOONP1_lab
label define GBAREDENEINDESAMENWOONP1_lab                                        /// 
 0    "SAMENWOONPERIODE BESTOND nog OP JJJJ1231"                                 ///
 1    "SAMENWOONPERIODE GEËINDIGD DOOR VERHUIZING VAN PERSOON"                      ///
 2    "SAMENWOONPERIODE GEËINDIGD DOOR VERHUIZING VAN PARTNER VAN PERSOON"             ///
 3    "SAMENWOONPERIODE GEËINDIGD DOOR GELIJKTIJDIGE VERHUIZING VAN  PERSOON EN PARTNER"  ///
 4    "SAMENWOONPERIODE GEËINDIGD DOOR EMIGRATIE VAN  PERSOON"                      ///
 5    "SAMENWOONPERIODE GEËINDIGD DOOR EMIGRATIE VAN PARTNER VAN PERSOON"           ///
 6    "SAMENWOONPERIODE GEËINDIGD DOOR GELIJKTIJDIGE EMIGRATIE VAN PERSOON EN PARTNER"    ///
 7    "SAMENWOONPERIODE GEËINDIGD DOOR OVERLIJDEN VAN PERSOON"                      ///
 8    "SAMENWOONPERIODE GEËINDIGD DOOR OVERLIJDEN VAN PARTNER VAN PERSOON"             ///
 9    "SAMENWOONPERIODE GEËINDIGD DOOR GELIJKTIJDIG OVERLIJDEN VAN PERSOON EN PARTNER"    ///
10    "SAMENWOONPERIODE GEËINDIGD, OVERIGE REDENEN"                                 


   *  GBAREDENEINDESAMENWOONPERIODE1
capture label drop gbaredeneindesamenwoonp1_lab
label define gbaredeneindesamenwoonp1_lab                                     /// 
0  "Living period existed on yyyy1231"                               ///
1  "Living period ended by moving person"                               ///
2  "Living period ended by moving partner of person"                    ///
3  "Coupling period ended by simultaneous movement of person and partner"     ///
4  "Living period ended by person emigration"                           ///
5  "Living period ended by emigration of partner of person"                ///
6  "Coupling period ended by simultaneous emigration of person and partner"   ///
7  "Living period ended by death of person"                          ///
8  "Coupling period ended by death of partner of person"                   ///
9  "Living period ended by simultaneous death of person and partner"          ///
10    "Living period ended for other reasons"

*>> Label values 
* EN
label values rinpersoons               rinpersoons_lab
label values rinpersoons               rinpersoons_lab
label values rinpersoon                rinpersoon_lab
label values gbaaanvangsamenwoonperiode1  gbaaanvangsamenwoonperiode1_lab
label values gbaeindesamenwoonperiode1       gbaeindesamenwoonperiode1_lab
label values gbaredeneindesamenwoonperiode1 gbaredeneindesamenwoonp1_lab
label values rinpersoon1partner        rinpersoon1partner_lab
label values rinpersoons1partner          rinpersoons1partner_lab
label values koppelpopulatietabvv         koppelpopulatietabvv_lab

* NL
// label values RINPERSOONS               RINPERSOONS_lab
// label values RINPERSOONS               RINPERSOONS_lab
// label values RINPERSOON                RINPERSOON_lab
// label values GBAAANVANGSAMENWOONPERIODE1  GBAAANVANGSAMENWOONPERIODE1_lab
// label values GBAEINDESAMENWOONPERIODE1       GBAEINDESAMENWOONPERIODE1_lab
// label values GBAREDENEINDESAMENWOONPERIODE1 GBAREDENEINDESAMENWOONP1_lab
// label values RINPERSOON1PARTNER        RINPERSOON1PARTNER_lab
// label values RINPERSOONS1PARTNER          RINPERSOONS1PARTNER_lab
// label values KOPPELPOPULATIETABVV         KOPPELPOPULATIETABVV_lab

// *>> Order variables 
// order                                              ///
// RINPERSOONS rinpersoons                               ///
// RINPERSOON rinpersoon                                 ///
// GBAAANVANGSAMENWOONPERIODE1 gbaaanvangsamenwoonperiode1     ///
// GBAEINDESAMENWOONPERIODE1 gbaeindesamenwoonperiode1         ///
// GBAREDENEINDESAMENWOONPERIODE1 gbaredeneindesamenwoonperiode1  ///
// RINPERSOON1PARTNER rinpersoon1partner                    ///
// RINPERSOONS1PARTNER rinpersoons1partner                  ///
// KOPPELPOPULATIETABVV koppelpopulatietabvv 

*>> Sort dataset 
sort RINPERSOON RINPERSOONS

*>> // compress dataset
compress

*>> // Remove any notes
notes drop *

*>> Sort dataset 
sort RINPERSOON RINPERSOONS

*>> Generate new ID variable (because the zero at the beginning is problematic)
gen pid = RINPERSOONS + RINPERSOON 
gen pid_cohab_partner = RINPERSOONS1PARTNER + RINPERSOON1PARTNER

*>> Save 
save "$cbs_file5_out\file5livingtogetherparent2018anav1.dta", replace



*---- [17.6.      (CBS) File 6      ]-----------------------------------------------------------------------------------*

use "$cbs_file6_in\FILE6MARRIAGEPARENT2018ANAV1.dta", clear
codebookout "$codebook\FILE6MARRIAGEPARENT2018ANAV1", replace

*>> Convert from string to numeric (or missing)
encode   RINPERSOONS,               gen(rinpersoons)
gen   rinpersoon                 = real(RINPERSOON)
encode   RINPERSOONSVERBINTENISP,      gen(rinpersoonsverbintenisp)
gen   rinpersoonverbintenisp        = real(RINPERSOONVERBINTENISP)
encode   KOPPELPOPULATIETABVV,         gen(koppelpopulatietabvv)
encode   REDENBEEINDIGINGVERBINTENIS,  gen(redenbeeindigingverbintenis)
encode   TYPEVERBINTENIS,           gen(typeverbintenis)

*>> Date and time 
gen double  aanvangverbintenis   = clock(AANVANGVERBINTENIS, "YMD") 
format      aanvangverbintenis %tc

gen double  eindeverbintenis  = clock(EINDEVERBINTENIS, "YMD") 
format      eindeverbintenis %tc
recode      eindeverbintenis (. = .a) if eindeverbintenis>=. & EINDEVERBINTENIS=="88888888"


*>> Label define 

   *  EINDEVERBINTENIS
capture label drop EINDEVERBINTENIS_lab 
label define EINDEVERBINTENIS_lab                                       /// 
.a "Ongoing commitment" 

   *  REDENBEEINDIGINGVERBINTENIS
capture label drop REDENBEEINDIGINGVERBINTENIS_lab
label define REDENBEEINDIGINGVERBINTENIS_lab                               /// 
1  "(-) Unknown"                                                  ///
2  "(D) Disbanded by death of person"                                   ///
3  "(H) Partnership turned into marriage"                                  ///
4  "(O) Disbanded due to death of partner"                                 ///
5  "(S) Disbanded by divorce / divorce"
// "(P)" "Marriage turned into partnership"

   *   TYPEVERBINTENIS
capture label drop TYPEVERBINTENIS_lab
label define TYPEVERBINTENIS_lab                                        /// 
1 "(H) Marriage"                                                  ///
2 "(P) Registered partnership"

*>> Label variables
label variable rinpersoons                "Encoding for the quality of the conversion of a BSN / sofi number to rinperson"
label variable rinpersoon              "Meaning and dimensionless identification number to replace the social security number / BSN"
label variable aanvangverbintenis         "Commencement date of the commitment"
label variable eindeverbintenis        "Date of termination of the commitment"
label variable redenbeeindigingverbintenis   "Reason for termination of the commitment"
label variable rinpersoonsverbintenisp       "Commitment Partner Person ID Origin Indicator"
label variable rinpersoonverbintenisp     "Person ID of the commitment partner"
label variable typeverbintenis            "Marriage or registered partnership"
label variable koppelpopulatietabvv       "Fictitious variable indicates whether it is (1) / not (empty) in file"

*>> Label values 
label values rinpersoons RINPERSOONS_lab
label values rinpersoon RINPERSOON_lab
label values aanvangverbintenis AANVANGVERBINTENIS_lab
label values eindeverbintenis EINDEVERBINTENIS_lab
label values redenbeeindigingverbintenis REDENBEEINDIGINGVERBINTENIS_lab
label values rinpersoonsverbintenisp RINPERSOONSVERBINTENISP_lab
label values rinpersoonverbintenisp RINPERSOONVERBINTENISP_lab
label values typeverbintenis TYPEVERBINTENIS_lab
label values koppelpopulatietabvv KOPPELPOPULATIETABVV_lab
label values rinpersoonsverbintenisp RINPERSOONSVERBINTENISP_lab

// *>> Order variables 
// order                                           ///
// RINPERSOONS rinpersoons                            ///
// RINPERSOON rinpersoon                              ///
// AANVANGVERBINTENIS aanvangverbintenis                    ///
// EINDEVERBINTENIS eindeverbintenis                     ///
// REDENBEEINDIGINGVERBINTENIS redenbeeindigingverbintenis  ///
// RINPERSOONSVERBINTENISP rinpersoonsverbintenisp          ///
// RINPERSOONVERBINTENISP rinpersoonverbintenisp            ///
// TYPEVERBINTENIS typeverbintenis                       ///
// KOPPELPOPULATIETABVV koppelpopulatietabvv 

*>> Sort dataset 
sort RINPERSOON RINPERSOONS

*>> // compress dataset
compress

*>> // Remove any notes
notes drop *

*>> Generate new ID variable (because the zero at the beginning is problematic)
gen pid = RINPERSOONS + RINPERSOON 
gen pid_mar_partner = RINPERSOONSVERBINTENISP + RINPERSOONVERBINTENISP 

*>> Save 
save "$cbs_file6_out\file6marriageparent2018anav1.dta", replace



*---- [17.7.      (CBS) File 7      ]-----------------------------------------------------------------------------------*

*>> Start the loop
foreach n of numlist 2004/2018 {

*>> Open the dataset 
use "$cbs_file7_in\FILE7YEARLYINFOCHILD`n'1299ANAV1.dta", clear

*>> Create the codebook
codebookout "$codebook\FILE7YEARLYINFOCHILD`n'1299ANAV1", replace

*>> Convert from string to numeric (or missing)
encode   RINPERSOONS,         gen(rinpersoons)
encode   RINPERSOONSMA,          gen(rinpersoonsma)
gen     rinpersoon            = real(RINPERSOON)
gen      rinpersoonpa         = real(RINPERSOONPA)
gen      rinpersoonma         = real(RINPERSOONMA)
encode   RINPERSOONSPA,          gen(rinpersoonspa)
gen      gebjaaroudstekindhh     = real(GEBJAAROUDSTEKINDHH)
gen   gebjaarjongstekindhh    = real(GEBJAARJONGSTEKINDHH)

*>> Duplicate variables 
clonevar aantalkindhh         = AANTALKINDHH 
clonevar aantalpershh         = AANTALPERSHH 
clonevar afstandma         = AFSTANDMA 
clonevar afstandpa            = AFSTANDPA

*>> Label variables 
   *  NL
label variable RINPERSOONS       "Codering voor de kwaliteit van de omzetting van een bsn/sofinummer naar rinperso"
label variable RINPERSOON        "Betekenis- en dimensieloos identificatienummer ter vervanging van het sofi-numme"
label variable RINPERSOONSMA     "Soort rinpersoon (juridische) moeder"
label variable RINPERSOONPA         "Samen met rinpersoonspa is dit de (juridische) vader"
label variable RINPERSOONMA         "Samen met rinpersoonsma is dit de (juridische) moeder"
label variable RINPERSOONSPA     "Soort rinpersoon (juridische) vader"
label variable AANTALKINDHH         "Aantal personen met plaats (positie) in het huishouden 'thuiswonend kind'."
label variable GEBJAAROUDSTE~H      "Geboortejaar oudste thuiswonend kind in het huishouden."
label variable GEBJAARJONGST~H      "Geboortejaar jongste thuiswonend kind in het huishouden."
label variable AANTALPERSHH         "Aantal personen in het huishouden"
label variable AFSTANDMA         "AFSTANDMA"
label variable AFSTANDPA         "AFSTANDPA"

   *  EN 
label variable rinpersoons       "Encoding for the quality of the conversion of a bsn / sofi number to rinperso"
label variable rinpersoon        "Meaningless and dimensionless identification number to replace the social security number"
label variable rinpersoonsma     "Type of person (legal) mother"
label variable rinpersoonpa         "Together with rinperspa, this is the (legal) father"
label variable rinpersoonma         "Together with rinpersoonsma this is the (legal) mother"
label variable rinpersoonspa     "Type of rinperson (legal) father"
label variable aantalkindhh         "Number of persons with place (position) in the household 'child living at home'."
label variable gebjaaroudste~h      "Year of birth of oldest child living at home in the household."
label variable gebjaarjongst~h      "Year of birth of the youngest child living at home in the household."
label variable aantalpershh         "Number of persons in the household"
label variable afstandma         "DISTANCE MA"
label variable afstandpa         "DISTANCE PA"

// *>> Order variables 
// order                               ///
// RINPERSOONS rinpersoons                ///
// RINPERSOON rinpersoon                  ///
// RINPERSOONSMA rinpersoonsma            ///
// RINPERSOONPA rinpersoonpa              ///
// RINPERSOONMA rinpersoonma              ///
// RINPERSOONSPA rinpersoonspa            ///
// AANTALKINDHH aantalkindhh              ///
// GEBJAAROUDSTEKINDHH gebjaaroudstekindhh   ///
// GEBJAARJONGSTEKINDHH gebjaarjongstekindhh    ///
// AANTALPERSHH aantalpershh              ///
// AFSTANDMA afstandma                 ///
// AFSTANDPA afstandpa

*>> Sort dataset 
sort RINPERSOON RINPERSOONS

*>> // compress dataset
compress

*>> // Remove any notes
notes drop *

*>> Generate new ID variable (because the zero at the beginning is problematic)
gen pid = RINPERSOONS + RINPERSOON 
gen pid_pa = RINPERSOONSPA + RINPERSOONPA
gen pid_ma = RINPERSOONSMA + RINPERSOONMA

*>> Save 
save "$cbs_file7_out\file7yearlyinfochild`n'1299anav1.dta", replace
}




*---- [17.8.      (CBS) File 8      ]-----------------------------------------------------------------------------------*

use "$cbs_file8_in\FILE8GRANDCHILDRENANAV1.dta", clear
codebookout "$codebook\FILE8GRANDCHILDRENANAV1", replace

*>> Convert from string to numeric (or missing)
encode	RINPERSOONS,            	gen(rinpersoons)
gen   	rinpersoon              	= real(RINPERSOON)
gen   	rinpersoonkind          	= real(RINPERSOONKIND)
gen   	rinpersoonouder2        	= real(RINPERSOONOUDER2)
encode	RINPERSOONSKIND,        	gen(rinpersoonskind)
encode	RINPERSOONSOUDER2,         	gen(rinpersoonsouder2)
encode	KOPPELPOPULATIEKINDTABVV,  	gen(koppelpopulatiekindtabvv)
gen   	vrlgbageslacht             	= real(VRLGBAGESLACHT)
gen   	vrlgbageboortemaand     	= real(VRLGBAGEBOORTEMAAND)
gen   	vrlgbageboortejaar      	= real(VRLGBAGEBOORTEJAAR) 

*>> Label define 
   *  VRLGBAGESLACHT 
capture label drop VRLGBAGESLACHT_lab
label define VRLGBAGESLACHT_lab        	///
.a "Unknown"                        	///
1  "Men"                            	///
2  "Women" 

* VRLGBAGEBOORTEMAAND
capture label drop VRLGBAGEBOORTEMAAND_lab 
label define VRLGBAGEBOORTEMAAND_lab      	/// 
.a    "Unknown"   							///
01    "January"   							/// 
02    "February"  							/// 
03    "March"     							/// 
04    "April"     							/// 
05    "May"       							/// 
06    "June"      							/// 
07    "July"      							/// 
08    "August"    							/// 
09    "September" 							/// 
10    "October"   							/// 
11    "November"  							/// 
12    "December"


* RINPERSOONSOUDER2
capture label drop RINPERSOONSOUDER2_lab 
label define RINPERSOONSOUDER2_lab           	/// 
1 "(G) RINPERSON NOT IN GBA / BRP, NO SOFINR"   ///
2 "(R) RINPERSON IN GBA / BRP"
 
* RINPERSOONSKIND
capture label drop RINPERSOONSKIND_lab 
label define RINPERSOONSKIND_lab             	/// 
1 "(D) RINPERSON NOT IN GBA / BRP, BIRTHBORN"   /// 
2 "(N) RINPERSON IN BRP, NO ANUMMER KNOWN"      /// 
3 "(R) RINPERSON IN GBA / BRP"

*>> Label variables
label variable RINPERSOONS "codering voor de kwaliteit van de omzetting van een bsn/sofinummer naar rinpersoon"
label variable RINPERSOON "betekenis- en dimensieloos identificatienummer ter vervanging van het sofi-nummer/bsn"
label variable RINPERSOONKIND "betekenis- en dimensieloos identificatienummer ter vervanging van het sofi-nummer/bsn"
label variable RINPERSOONOUDER2 "betekenis- en dimensieloos identificatienummer ter vervanging van het sofi-nummer/bsn"
label variable RINPERSOONSKIND "codering voor de kwaliteit van de omzetting van een bsn/sofinummer naar rinpersoon"
label variable RINPERSOONSOUDER2 "codering voor de kwaliteit van de omzetting van een bsn/sofinummer naar rinpersoon"
label variable KOPPELPOPULATIEKINDTABVV "fictieve variabele geeft aan of deze wel(1)/niet(leeg) voorkomt in bestand"
label variable VRLGBAGESLACHT "geslacht"
label variable VRLGBAGEBOORTEMAAND "geboortemaand"
label variable VRLGBAGEBOORTEJAAR "geboortejaar"

label variable rinpersoons "encoding for the quality of the conversion of a bsn / sofi number to rinperson"
label variable rinpersoon "meaning and dimensionless identification number to replace the social security number / bsn"
label variable rinpersoonkind "meaning and dimensionless identification number to replace the social security number / bsn"
label variable rinpersoonouder2 "meaning and dimensionless identification number to replace the social security number / bsn"
label variable rinpersoonskind "encoding for the quality of the conversion of a bsn / sofi number to rinperson"
label variable rinpersoonsouder2 "encoding for the quality of the conversion of a bsn / sofi number to rinperson"
label variable koppelpopulatiekindtabvv "fictitious variable indicates whether it is (1) / not (empty) in file"
label variable vrlgbageslacht "gender"
label variable vrlgbageboortemaand "month of birth"
label variable vrlgbageboortejaar "year of birth"

*>> Label values
label value vrlgbageslacht VRLGBAGESLACHT_lab
label value vrlgbageboortemaand VRLGBAGEBOORTEMAAND_lab
label value rinpersoonsouder2 RINPERSOONSOUDER2_lab
label value rinpersoonskind RINPERSOONSKIND_lab


*>> Drop where we have missing information
drop if rinpersoonskind 	== 1 	// 1 (D) RINPERSON NOT IN GBA / BRP, BIRTHBORN
drop if rinpersoonskind 	== 2 	// 2 (N) RINPERSON IN BRP, NO ANUMMER KNOWN
drop if rinpersoonsouder2 	== 1 	// 1 (G) RINPERSON NOT IN GBA / BRP, NO SOFINR

*>> Sort dataset 
sort RINPERSOON RINPERSOONS

*>> // compress dataset
compress 

*>> // Remove any notes
notes drop *

*>> Generate new ID variable (because the zero at the beginning is problematic)
gen pid_zero 	= RINPERSOONS + RINPERSOON 
gen ch_pid 		= RINPERSOONSKIND + RINPERSOONKIND 
gen pid_ouder	= RINPERSOONSOUDER2 + RINPERSOONOUDER2

*>> Save 
save "$cbs_file8_out\file8grandchildrenanav1.dta", replace



*---- [17.9.      (CBS) File 9      ]-----------------------------------------------------------------------------------*

foreach n of numlist 2003/2010 {
use "$cbs_file9_in\FILE9INCOMEPARENT`n'0101ANAV1.dta", clear
codebookout "$codebook\FILE9INCOMEPARENT`n'0101ANAV1", replace

*>> Convert from string to numeric (or missing) - IDs
encode   RINPERSOONS,      gen(rinpersoons)
gen   rinpersoon        = real(RINPERSOON)
gen   percpersink       = real(PERCPERSINK)
gen   psecj             = real(PSECJ)
gen   poshhk            = real(POSHHK)
gen   bvrpercgestinkh   = real(BVRPERCGESTINKH)

*>> Duplicate variables 
clonevar persink        = PERSINK 
clonevar bvrgestinkh    = BVRGESTINKH 

*>> Label variables 
   *  NL
label variable RINPERSOONS "codering voor de kwaliteit van de omzetting van een bsn/sofinummer naar rinpersoon"
label variable RINPERSOON "betekenis- en dimensieloos identificatienummer ter vervanging van het sofi-nummer/bsn"
label variable PERCPERSINK "percentielgroepen persoonlijk inkomen van personen met inkomen in particuliere huishoudens"
label variable PSECJ "sociaaleconomische categorie op jaarbasis"
label variable POSHHK "positie in het huishouden ten opzichte van de hoofdkostwinner"
label variable PERSINK "persoonlijk inkomen"
label variable BVRGESTINKH "gestandaardiseerd besteedbaar inkomen van het huishouden"
label variable BVRPERCGESTINKH "percentielgroepen gestandaardiseerd besteedbaar inkomen particuliere huishoudens"

   *  EN
label variable rinpersoons "encoding for the quality of the conversion of a bsn / sofi number to rinperso"
label variable rinpersoon "meaningless and dimensionless identification number to replace the social security number"
label variable percpersink "percentile groups personal income of persons with income in private h"
label variable psecj "socio-economic category on an annual basis"
label variable poshhk "household position in relation to the main breadwinner"
label variable persink "personal income"
label variable bvrgestinkh "standardized disposable household income"
label variable bvrpercgestinkh "percentile groups standardized disposable income private households"

*>> Label define 
   *  PERCPERSINK 
capture label drop PERCPERSINK_lab
label define PERCPERSINK_lab           ///
 0 "0 to 1%"                        /// 
 1 "1 to 2%"                        /// 
 2 "2 to 3%"                        /// 
 3 "3 to 4%"                        /// 
 4 "4 to 5%"                        /// 
 5 "5 to 6%"                        /// 
 6 "6 to 7%"                        /// 
 7 "7 to 8%"                        /// 
 8 "8 to 9%"                        /// 
 9 "9 to 10%"                       /// 
10 "10 to 11%"                         /// 
11 "11 to 12%"                         /// 
12 "12 to 13%"                         /// 
13 "13 to 14%"                         /// 
14 "14 to 15%"                         /// 
15 "15 to 16%"                         /// 
16 "16 to 17%"                         /// 
17 "17 to 18%"                         /// 
18 "18 to 19%"                         /// 
19 "19 to 20%"                         /// 
20 "20 to 21%"                         /// 
21 "21 to 22%"                         /// 
22 "22 to 23%"                         /// 
23 "23 to 24%"                         /// 
24 "24 to 25%"                         /// 
25 "25 to 26%"                         /// 
26 "26 to 27%"                         /// 
27 "27 to 28%"                         /// 
28 "28 to 29%"                         /// 
29 "29 to 30%"                         /// 
30 "30 to 31%"                         /// 
31 "31 to 32%"                         /// 
32 "32 to 33%"                         /// 
33 "33 to 34%"                         /// 
34 "34 to 35%"                         /// 
35 "35 to 36%"                         /// 
36 "36 to 37%"                         /// 
37 "37 to 38%"                         /// 
38 "38 to 39%"                         /// 
39 "39 to 40%"                         /// 
40 "40 to 41%"                         /// 
41 "41 to 42%"                         /// 
42 "42 to 43%"                         /// 
43 "43 to 44%"                         /// 
44 "44 to 45%"                         /// 
45 "45 to 46%"                         /// 
46 "46 to 47%"                         /// 
47 "47 to 48%"                         /// 
48 "48 to 49%"                         /// 
49 "49 to 50%"                         /// 
50 "50 to 51%"                         /// 
51 "51 to 52%"                         /// 
52 "52 to 53%"                         /// 
53 "53 to 54%"                         /// 
54 "54 to 55%"                         /// 
55 "55 to 56%"                         /// 
56 "56 to 57%"                         /// 
57 "57 to 58%"                         /// 
58 "58 to 59%"                         /// 
59 "59 to 60%"                         /// 
60 "60 to 61%"                         /// 
61 "61 to 62%"                         /// 
62 "62 to 63%"                         /// 
63 "63 to 64%"                         /// 
64 "64 to 65%"                         /// 
65 "65 to 66%"                         /// 
66 "66 to 67%"                         /// 
67 "67 to 68%"                         /// 
68 "68 to 69%"                         /// 
69 "69 to 70%"                         /// 
70 "70 to 71%"                         /// 
71 "71 to 72%"                         /// 
72 "72 to 73%"                         /// 
73 "73 to 74%"                         /// 
74 "74 to 75%"                         /// 
75 "75 to 76%"                         /// 
76 "76 to 77%"                         /// 
77 "77 to 78%"                         /// 
78 "78 to 79%"                         /// 
79 "79 to 80%"                         /// 
80 "80 to 81%"                         /// 
81 "81 to 82%"                         /// 
82 "82 to 83%"                         /// 
83 "83 to 84%"                         /// 
84 "84 to 85%"                         /// 
85 "85 to 86%"                         /// 
86 "86 to 87%"                         /// 
87 "87 to 88%"                         /// 
88 "88 to 89%"                         /// 
89 "89 to 90%"                         /// 
90 "90 to 91%"                         /// 
91 "91 to 92%"                         /// 
92 "92 to 93%"                         /// 
93 "93 to 94%"                         /// 
94 "94 to 95%"                         /// 
95 "95 to 96%"                         /// 
96 "96 to 97%"                         /// 
97 "97 to 98%"                         /// 
98 "98 to 99%"                         /// 
99 "99 to 100%"

   *  PSECJ 
capture label drop PSECJ_lab
label define PSECJ_lab                                         ///
   11 "Employee"                                            ///
   12 "Head leader of big stockholders"                           ///
   13 "Entrepreneur"                                           ///
   14 "Other self-employed person"                             ///
   15 "Assisting family member"                                ///
   21 "Unemployment benefit recipient"                            ///
   22 "Social assistance recipient"                               ///
   23 "Recipient of social security benefit other"                   ///
   24 "Recipient of sickness / disability benefit"                   ///
   25 "Pension recipient"                                      ///
   26 "Not yet attending school / schoolchild / student with income"       ///
   31 "Not yet attending school / schoolchild / student without income"    ///
   32 "Other without income"                                   ///
   99 "Belongs to household with no perceived income"

   *  POSHHK 
capture label drop POSHHK_lab
label define POSHHK_lab                                        ///
   1 "Main breadwinner"                                        ///
   2 "Main breadwinner, with partner"                             ///
   3 "Married partner"                                      ///
   4 "Unmarried partner"                                       ///
   5 "Minor child"                                          ///
   6 "Child of age"                                         ///
   7 "Other household member"                                     ///
   9 "Household unknown"

   *  PERSINK 
capture label drop PERSINK_lab
label define PERSINK_lab                                       ///
999999999 "Belongs to a household with no perceived income"

   *  BVRGESTINKH
capture label drop BVRGESTINKH_lab
label define BVRGESTINKH_lab                                   ///
999999999 "Household income unknown"


   *  BVRPERCGESTINKH
capture label drop BVRPERCGESTINKH_lab
label define BVRPERCGESTINKH_lab                               ///
 0 "0 to 1%"                                                ///
 1 "1 to 2%"                                                ///
 2 "2 to 3%"                                                ///
 3 "3 to 4%"                                                ///
 4 "4 to 5%"                                                ///
 5 "5 to 6%"                                                ///
 6 "6 to 7%"                                                ///
 7 "7 to 8%"                                                ///
 8 "8 to 9%"                                                ///
 9 "9 to 10%"                                               ///
10 "10 to 11%"                                              ///
11 "11 to 12%"                                              ///
12 "12 to 13%"                                              ///
13 "13 to 14%"                                              ///
14 "14 to 15%"                                              ///
15 "15 to 16%"                                              ///
16 "16 to 17%"                                              ///
17 "17 to 18%"                                              ///
18 "18 to 19%"                                              ///
19 "19 to 20%"                                              ///
20 "20 to 21%"                                              ///
21 "21 to 22%"                                              ///
22 "22 to 23%"                                              ///
23 "23 to 24%"                                              ///
24 "24 to 25%"                                              ///
25 "25 to 26%"                                              ///
26 "26 to 27%"                                              ///
27 "27 to 28%"                                              ///
28 "28 to 29%"                                              ///
29 "29 to 30%"                                              ///
30 "30 to 31%"                                              ///
31 "31 to 32%"                                              ///
32 "32 to 33%"                                              ///
33 "33 to 34%"                                              ///
34 "34 to 35%"                                              ///
35 "35 to 36%"                                              ///
36 "36 to 37%"                                              ///
37 "37 to 38%"                                              ///
38 "38 to 39%"                                              ///
39 "39 to 40%"                                              ///
40 "40 to 41%"                                              ///
41 "41 to 42%"                                              ///
42 "42 to 43%"                                              ///
43 "43 to 44%"                                              ///
44 "44 to 45%"                                              ///
45 "45 to 46%"                                              ///
46 "46 to 47%"                                              ///
47 "47 to 48%"                                              ///
48 "48 to 49%"                                              ///
49 "49 to 50%"                                              ///
50 "50 to 51%"                                              ///
51 "51 to 52%"                                              ///
52 "52 to 53%"                                              ///
53 "53 to 54%"                                              ///
54 "54 to 55%"                                              ///
55 "55 to 56%"                                              ///
56 "56 to 57%"                                              ///
57 "57 to 58%"                                              ///
58 "58 to 59%"                                              ///
59 "59 to 60%"                                              ///
60 "60 to 61%"                                              ///
61 "61 to 62%"                                              ///
62 "62 to 63%"                                              ///
63 "63 to 64%"                                              ///
64 "64 to 65%"                                              ///
65 "65 to 66%"                                              ///
66 "66 to 67%"                                              ///
67 "67 to 68%"                                              ///
68 "68 to 69%"                                              ///
69 "69 to 70%"                                              ///
70 "70 to 71%"                                              ///
71 "71 to 72%"                                              ///
72 "72 to 73%"                                              ///
73 "73 to 74%"                                              ///
74 "74 to 75%"                                              ///
75 "75 to 76%"                                              ///
76 "76 to 77%"                                              ///
77 "77 to 78%"                                              ///
78 "78 to 79%"                                              ///
79 "79 to 80%"                                              ///
80 "80 to 81%"                                              ///
81 "81 to 82%"                                              ///
82 "82 to 83%"                                              ///
83 "83 to 84%"                                              ///
84 "84 to 85%"                                              ///
85 "85 to 86%"                                              ///
86 "86 to 87%"                                              ///
87 "87 to 88%"                                              ///
88 "88 to 89%"                                              ///
89 "89 to 90%"                                              ///
90 "90 to 91%"                                              ///
91 "91 to 92%"                                              ///
92 "92 to 93%"                                              ///
93 "93 to 94%"                                              ///
94 "94 to 95%"                                              ///
95 "95 to 96%"                                              ///
96 "96 to 97%"                                              ///
97 "97 to 98%"                                              ///
98 "98 to 99%"                                              ///
99 "99 to 100%"

*>> Label values
label value percpersink PERCPERSINK_lab
label value psecj PSECJ_lab
label value poshhk POSHHK_lab
label value persink PERSINK_lab
label value bvrgestinkh BVRGESTINKH_lab
label value bvrpercgestinkh BVRPERCGESTINKH_lab

// *>> Order variables 
// order                      ///
// RINPERSOONS rinpersoons       ///
// RINPERSOON rinpersoon         ///
// PERCPERSINK percpersink       ///
// PSECJ psecj                ///
// POSHHK poshhk                 ///
// PERSINK persink            ///
// BVRGESTINKH bvrgestinkh       ///
// BVRPERCGESTINKH bvrpercgestinkh 

*>> Sort dataset 
sort RINPERSOON RINPERSOONS

*>> // compress dataset
compress

*>> // Remove any notes
notes drop *

*>> Generate new ID variable (because the zero at the beginning is problematic)
gen pid = RINPERSOONS + RINPERSOON 

*>> Save 
save "$cbs_file9_out\file9incomeparent`n'0101anav1.dta", replace

}




*---- [17.10.     (CBS) File 10     ]-----------------------------------------------------------------------------------*

foreach n of numlist 2003/2018 {
use "$cbs_file10_in\FILE10INCOMECHILD`n'0101ANAV1.dta", clear
codebookout "$codebook\FILE10INCOMECHILD`n'0101ANAV1", replace

*>> Convert from string to numeric (or missing) - IDs
encode   RINPERSOONS,      gen(rinpersoons)
gen   rinpersoon        = real(RINPERSOON)
gen   percpersink       = real(PERCPERSINK)
gen   poshhk            = real(POSHHK)
gen   psecj             = real(PSECJ)
gen   inpsecj        = real(INPSECJ)
gen   inpposhhk         = real(INPPOSHHK)
gen   bvrpercgestinkh   = real(BVRPERCGESTINKH)


*>> Duplicate variables 
clonevar persink        = PERSINK 
clonevar inppersink  = INPPERSINK
clonevar inpp100ppers   = INPP100PPERS 
clonevar inhp100hgest   = INHP100HGEST
clonevar inhgestinkh    = INHGESTINKH
clonevar bvrgestinkh    = BVRGESTINKH

*>> Label variables 
   *  NL
label variable RINPERSOONS "codering voor de kwaliteit van de omzetting van een bsn/sofinummer naar rinpersoon"
label variable RINPERSOON "betekenis- en dimensieloos identificatienummer ter vervanging van het sofi-nummer/bsn"
label variable PERSINK "persoonlijk inkomen"
label variable PERCPERSINK "percentielgroepen persoonlijk inkomen van personen met inkomen in particuliere huishoudens"
label variable POSHHK "positie in het huishouden ten opzichte van de hoofdkostwinner"
label variable PSECJ "sociaaleconomische categorie op jaarbasis"
label variable INPSECJ "sociaaleconomische categorie op jaarbasis"
label variable INPPOSHHK "positie van de persoon in het huishouden ten opzichte van de hoofdkostwinner"
label variable INPPERSINK "15 persoonlijk inkomen"
label variable INPP100PPERS "percentielgroepen persoonlijk inkomen van personen met inkomen in particuliere huishoudens"
label variable INHP100HGEST "percentielgroepen gestandaardiseerd besteedbaar inkomen particuliere huishoudens"
label variable INHGESTINKH "gestandaardiseerd besteedbaar inkomen van het huishouden"
label variable BVRPERCGESTINKH "percentielgroepen gestandaardiseerd besteedbaar inkomen particuliere huishoudens"
label variable BVRGESTINKH "gestandaardiseerd besteedbaar inkomen van het huishouden"

   *  EN
label variable rinpersoons "encoding for the quality of the conversion of a bsn / sofi number to rinperson"
label variable rinpersoon "meaning and dimensionless identification number to replace the social security number / bsn"
label variable persink "personal income"
label variable percpersink "Personal income percentile groups of persons with private household income"
label variable poshhk "household position in relation to the main breadwinner"
label variable psecj "socio-economic category on an annual basis"
label variable inpsecj "socio-economic category on an annual basis"
label variable inpposhhk "position of the person in the household in relation to the main breadwinner"
label variable inppersink "15 personal income"
label variable inpp100ppers "Personal income percentile groups of persons with private household income"
label variable inhp100hgest "percentile groups standardized disposable income private households"
label variable inhgestinkh "standardized disposable household income"
label variable bvrpercgestinkh "percentile groups standardized disposable income private households"
label variable bvrgestinkh "standardized disposable household income"

*>> Label define 
   *  PERSINK 
capture label drop PERSINK_lab
label define PERSINK_lab                                                   ///
999999999 "Belongs to a household with no perceived income"


   *  PERCPERSINK 
capture label drop PERCPERSINK_lab
label define PERCPERSINK_lab                                               ///
 0 "0 to 1%"                                                            ///
 1 "1 to 2%"                                                            ///
 2 "2 to 3%"                                                            ///
 3 "3 to 4%"                                                            ///
 4 "4 to 5%"                                                            ///
 5 "5 to 6%"                                                            ///
 6 "6 to 7%"                                                            ///
 7 "7 to 8%"                                                            ///
 8 "8 to 9%"                                                            ///
 9 "9 to 10%"                                                           ///
10 "10 to 11%"                                                          ///
11 "11 to 12%"                                                          ///
12 "12 to 13%"                                                          ///
13 "13 to 14%"                                                          ///
14 "14 to 15%"                                                          ///
15 "15 to 16%"                                                          ///
16 "16 to 17%"                                                          ///
17 "17 to 18%"                                                          ///
18 "18 to 19%"                                                          ///
19 "19 to 20%"                                                          ///
20 "20 to 21%"                                                          ///
21 "21 to 22%"                                                          ///
22 "22 to 23%"                                                          ///
23 "23 to 24%"                                                          ///
24 "24 to 25%"                                                          ///
25 "25 to 26%"                                                          ///
26 "26 to 27%"                                                          ///
27 "27 to 28%"                                                          ///
28 "28 to 29%"                                                          ///
29 "29 to 30%"                                                          ///
30 "30 to 31%"                                                          ///
31 "31 to 32%"                                                          ///
32 "32 to 33%"                                                          ///
33 "33 to 34%"                                                          ///
34 "34 to 35%"                                                          ///
35 "35 to 36%"                                                          ///
36 "36 to 37%"                                                          ///
37 "37 to 38%"                                                          ///
38 "38 to 39%"                                                          ///
39 "39 to 40%"                                                          ///
40 "40 to 41%"                                                          ///
41 "41 to 42%"                                                          ///
42 "42 to 43%"                                                          ///
43 "43 to 44%"                                                          ///
44 "44 to 45%"                                                          ///
45 "45 to 46%"                                                          ///
46 "46 to 47%"                                                          ///
47 "47 to 48%"                                                          ///
48 "48 to 49%"                                                          ///
49 "49 to 50%"                                                          ///
50 "50 to 51%"                                                          ///
51 "51 to 52%"                                                          ///
52 "52 to 53%"                                                          ///
53 "53 to 54%"                                                          ///
54 "54 to 55%"                                                          ///
55 "55 to 56%"                                                          ///
56 "56 to 57%"                                                          ///
57 "57 to 58%"                                                          ///
58 "58 to 59%"                                                          ///
59 "59 to 60%"                                                          ///
60 "60 to 61%"                                                          ///
61 "61 to 62%"                                                          ///
62 "62 to 63%"                                                          ///
63 "63 to 64%"                                                          ///
64 "64 to 65%"                                                          ///
65 "65 to 66%"                                                          ///
66 "66 to 67%"                                                          ///
67 "67 to 68%"                                                          ///
68 "68 to 69%"                                                          ///
69 "69 to 70%"                                                          ///
70 "70 to 71%"                                                          ///
71 "71 to 72%"                                                          ///
72 "72 to 73%"                                                          ///
73 "73 to 74%"                                                          ///
74 "74 to 75%"                                                          ///
75 "75 to 76%"                                                          ///
76 "76 to 77%"                                                          ///
77 "77 to 78%"                                                          ///
78 "78 to 79%"                                                          ///
79 "79 to 80%"                                                          ///
80 "80 to 81%"                                                          ///
81 "81 to 82%"                                                          ///
82 "82 to 83%"                                                          ///
83 "83 to 84%"                                                          ///
84 "84 to 85%"                                                          ///
85 "85 to 86%"                                                          ///
86 "86 to 87%"                                                          ///
87 "87 to 88%"                                                          ///
88 "88 to 89%"                                                          ///
89 "89 to 90%"                                                          ///
90 "90 to 91%"                                                          ///
91 "91 to 92%"                                                          ///
92 "92 to 93%"                                                          ///
93 "93 to 94%"                                                          ///
94 "94 to 95%"                                                          ///
95 "95 to 96%"                                                          ///
96 "96 to 97%"                                                          ///
97 "97 to 98%"                                                          ///
98 "98 to 99%"                                                          ///
99 "99 to 100%"


   *  POSHHK 
capture label drop POSHHK_lab
label define POSHHK_lab                                                 ///
   1 "Main breadwinner"                                                 ///
   2 "Main breadwinner, with partner"                                      ///
   3 "Married partner"                                               ///
   4 "Unmarried partner"                                                ///
   5 "Minor child"                                                   ///
   6 "Adult child"                                                   ///
   7 "Other household member"                                              ///
   9 "Household unknown"

   *  PSECJ 
capture label drop PSECJ_lab
label define PSECJ_lab                                                  ///
   11 "Employee"                                                     ///
   12 "Director-majority shareholder"                                      ///
   13 "Self-employed entrepreneur"                                      ///
   14 "Other self-employed"                                             ///
   15 "Assisting family member"                                         ///
   21 "Unemployment benefit recipient"                                     ///
   22 "Social assistance recipient"                                        ///
   23 "Recipient of social security benefit other"                            ///
   24 "Recipient of sickness / disability benefit"                            ///
   25 "Pensioner recipient"                                             ///
   26 "Not yet attending school/schoolchild/student with income"                 ///
   31 "Not yet attending school/schoolchild/student without income"              ///
   32 "Other without income"                                            ///
   99 "Belongs to household with no perceived income"


   *  INPSECJ 
capture label drop INPSECJ_lab
label define INPSECJ_lab                                                /// 
   11 "Werknemer"                                                       /// 
   12 "Directeur-grootaandeelhouder"                                       /// 
   13 "Zelfstandig ondernemer"                                          /// 
   14 "Overige zelfstandige"                                            /// 
   15 "Meewerkend gezinslid"                                            /// 
   21 "Ontvanger werkloosheidsuitkering"                                   /// 
   22 "Ontvanger bijstandsuitkering"                                       /// 
   23 "Ontvanger uitkering sociale voorziening overig"                        /// 
   24 "Ontvanger uitkering ziekte/arbeidsongeschiktheid"                         /// 
   25 "Ontvanger pensioenuitkering"                                        /// 
   26 "Nog niet schoolgaand/scholier/student met inkomen"                        /// 
   31 "Nog niet schoolgaand/scholier/student zonder inkomen"                     /// 
   32 "Overig zonder inkomen"                                              /// 
   99 "Behoort tot huishouden zonder waargenomen inkomen"                                                         


   *  INPPOSHHK 
capture label drop INPPOSHHK_lab
label define INPPOSHHK_lab                                                 ///
   1 "Main breadwinner without partner"                                    ///
   2 "Main breadwinner with partner"                                       ///
   3 "Married partner"                                               ///
   4 "Unmarried partner"                                                ///
   5 "Minor child"                                                   ///
   6 "Child of age"                                                  ///
   7 "Other household member"                                              ///
   9 "Household unknown"                                                      

//    *  INPPERSINK 
// capture label drop INPPERSINK_lab
// label define INPPERSINK_lab         // may not label 9999999999 because they are all missing
// 9999999999 "Belongs to a household with no perceived income"


   *  INPP100PPERS 
capture label drop INPP100PPERS_lab
label define INPP100PPERS_lab                                           ///
  -3 "Persons in institutional households"                                    ///
  -2 "Persons in private households with no perceived income"                    ///
  -1 "Persons without personal income"                                        ///
   1 "1st percentile"                                                   ///
   2 "2nd percentile"                                                   ///
   3 "3rd percentile"                                                   ///
   4 "4th percentile"                                                   ///
   5 "5th percentile"                                                   ///
   6 "6th percentile"                                                   ///
   7 "7th percentile"                                                   ///
   8 "8th percentile"                                                   ///
   9 "9th percentile"                                                   ///
  10 "10th percentile"                                                  ///
  11 "11th percentile"                                                  ///
  12 "12th percentile"                                                  ///
  13 "13th percentile"                                                  ///
  14 "14th percentile"                                                  ///
  15 "15th percentile"                                                  ///
  16 "16th percentile"                                                  ///
  17 "17th percentile"                                                  ///
  18 "18th percentile"                                                  ///
  19 "19th percentile"                                                  ///
  20 "20th percentile"                                                  ///
  21 "21st percentile"                                                  ///
  22 "22nd percentile"                                                  ///
  23 "23rd percentile"                                                  ///
  24 "24th percentile"                                                  ///
  25 "25th percentile"                                                  ///
  26 "26th percentile"                                                  ///
  27 "27th percentile"                                                  ///
  28 "28th percentile"                                                  ///
  29 "29th percentile"                                                  ///
  30 "30th percentile"                                                  ///
  31 "31st percentile"                                                  ///
  32 "32nd percentile"                                                  ///
  33 "33rd percentile"                                                  ///
  34 "34th percentile"                                                  ///
  35 "35th percentile"                                                  ///
  36 "36th percentile"                                                  ///
  37 "37th percentile"                                                  ///
  38 "38th percentile"                                                  ///
  39 "39th percentile"                                                  ///
  40 "40th percentile"                                                  ///
  41 "41st percentile"                                                  ///
  42 "42nd percentile"                                                  ///
  43 "43rd percentile"                                                  ///
  44 "44th percentile"                                                  ///
  45 "45th percentile"                                                  ///
  46 "46th percentile"                                                  ///
  47 "47th percentile"                                                  ///
  48 "48th percentile"                                                  ///
  49 "49th percentile"                                                  ///
  50 "50th percentile"                                                  ///
  51 "51st percentile"                                                  ///
  52 "52nd percentile"                                                  ///
  53 "53rd percentile"                                                  ///
  54 "54th percentile"                                                  ///
  55 "55th percentile"                                                  ///
  56 "56th percentile"                                                  ///
  57 "57th percentile"                                                  ///
  58 "58th percentile"                                                  ///
  59 "59th percentile"                                                  ///
  60 "60th percentile"                                                  ///
  61 "61st percentile"                                                  ///
  62 "62nd percentile"                                                  ///
  63 "63rd percentile"                                                  ///
  64 "64th percentile"                                                  ///
  65 "65th percentile"                                                  ///
  66 "66th percentile"                                                  ///
  67 "67th percentile"                                                  ///
  68 "68th percentile"                                                  ///
  69 "69th percentile"                                                  ///
  70 "70th percentile"                                                  ///
  71 "71st percentile"                                                  ///
  72 "72nd percentile"                                                  ///
  73 "73rd percentile"                                                  ///
  74 "74th percentile"                                                  ///
  75 "75th percentile"                                                  ///
  76 "76th percentile"                                                  ///
  77 "77th percentile"                                                  ///
  78 "78th percentile"                                                  ///
  79 "79th percentile"                                                  ///
  80 "80th percentile"                                                  ///
  81 "81st percentile"                                                  ///
  82 "82nd percentile"                                                  ///
  83 "83rd percentile"                                                  ///
  84 "84th percentile"                                                  ///
  85 "85th percentile"                                                  ///
  86 "86th percentile"                                                  ///
  87 "87th percentile"                                                  ///
  88 "88th percentile"                                                  ///
  89 "89th percentile"                                                  ///
  90 "90th percentile"                                                  ///
  91 "91st percentile"                                                  ///
  92 "92nd percentile"                                                  ///
  93 "93rd percentile"                                                  ///
  94 "94th percentile"                                                  ///
  95 "95th percentile"                                                  ///
  96 "96th percentile"                                                  ///
  97 "97th percentile"                                                  ///
  98 "98th percentile"                                                  ///
  99 "99th percentile"                                                  ///
 100 "100th percentile"                                                    


   *  INHP100HGEST 
capture label drop INHP100HGEST_lab
label define INHP100HGEST_lab                                           ///
  -2 "Institutional household"                                             ///
  -1 "Private household with an unknown income"                               ///
   1 "1st percentile"                                                   ///
   2 "2nd percentile"                                                   ///
   3 "3rd percentile"                                                   ///
   4 "4th percentile"                                                   ///
   5 "5th percentile"                                                   ///
   6 "6th percentile"                                                   ///
   7 "7th percentile"                                                   ///
   8 "8th percentile"                                                   ///
   9 "9th percentile"                                                   ///
  10 "10th percentile"                                                  ///
  11 "11th percentile"                                                  ///
  12 "12th percentile"                                                  ///
  13 "13th percentile"                                                  ///
  14 "14th percentile"                                                  ///
  15 "15th percentile"                                                  ///
  16 "16th percentile"                                                  ///
  17 "17th percentile"                                                  ///
  18 "18th percentile"                                                  ///
  19 "19th percentile"                                                  ///
  20 "20th percentile"                                                  ///
  21 "21st percentile"                                                  ///
  22 "22nd percentile"                                                  ///
  23 "23rd percentile"                                                  ///
  24 "24th percentile"                                                  ///
  25 "25th percentile"                                                  ///
  26 "26th percentile"                                                  ///
  27 "27th percentile"                                                  ///
  28 "28th percentile"                                                  ///
  29 "29th percentile"                                                  ///
  30 "30th percentile"                                                  ///
  31 "31st percentile"                                                  ///
  32 "32nd percentile"                                                  ///
  33 "33rd percentile"                                                  ///
  34 "34th percentile"                                                  ///
  35 "35th percentile"                                                  ///
  36 "36th percentile"                                                  ///
  37 "37th percentile"                                                  ///
  38 "38th percentile"                                                  ///
  39 "39th percentile"                                                  ///
  40 "40th percentile"                                                  ///
  41 "41st percentile"                                                  ///
  42 "42nd percentile"                                                  ///
  43 "43rd percentile"                                                  ///
  44 "44th percentile"                                                  ///
  45 "45th percentile"                                                  ///
  46 "46th percentile"                                                  ///
  47 "47th percentile"                                                  ///
  48 "48th percentile"                                                  ///
  49 "49th percentile"                                                  ///
  50 "50th percentile"                                                  ///
  51 "51st percentile"                                                  ///
  52 "52nd percentile"                                                  ///
  53 "53rd percentile"                                                  ///
  54 "54th percentile"                                                  ///
  55 "55th percentile"                                                  ///
  56 "56th percentile"                                                  ///
  57 "57th percentile"                                                  ///
  58 "58th percentile"                                                  ///
  59 "59th percentile"                                                  ///
  60 "60th percentile"                                                  ///
  61 "61st percentile"                                                  ///
  62 "62nd percentile"                                                  ///
  63 "63rd percentile"                                                  ///
  64 "64th percentile"                                                  ///
  65 "65th percentile"                                                  ///
  66 "66th percentile"                                                  ///
  67 "67th percentile"                                                  ///
  68 "68th percentile"                                                  ///
  69 "69th percentile"                                                  ///
  70 "70th percentile"                                                  ///
  71 "71st percentile"                                                  ///
  72 "72nd percentile"                                                  ///
  73 "73rd percentile"                                                  ///
  74 "74th percentile"                                                  ///
  75 "75th percentile"                                                  ///
  76 "76th percentile"                                                  ///
  77 "77th percentile"                                                  ///
  78 "78th percentile"                                                  ///
  79 "79th percentile"                                                  ///
  80 "80th percentile"                                                  ///
  81 "81st percentile"                                                  ///
  82 "82nd percentile"                                                  ///
  83 "83rd percentile"                                                  ///
  84 "84th percentile"                                                  ///
  85 "85th percentile"                                                  ///
  86 "86th percentile"                                                  ///
  87 "87th percentile"                                                  ///
  88 "88th percentile"                                                  ///
  89 "89th percentile"                                                  ///
  90 "90th percentile"                                                  ///
  91 "91st percentile"                                                  ///
  92 "92nd percentile"                                                  ///
  93 "93rd percentile"                                                  ///
  94 "94th percentile"                                                  ///
  95 "95th percentile"                                                  ///
  96 "96th percentile"                                                  ///
  97 "97th percentile"                                                  ///
  98 "98th percentile"                                                  ///
  99 "99th percentile"                                                  ///
 100 "100th percentile"


//    *  INHGESTINKH
// capture label drop INHGESTINKH_lab
// label define INHGESTINKH_lab           //  may not label 9999999999 because they are all missing
// 9999999999 "Household income unknown"


   *  BVRPERCGESTINKH 
capture label drop BVRPERCGESTINKH_lab
label define BVRPERCGESTINKH_lab       ///
 0 "0 to 1%"                        /// 
 1 "1 to 2%"                        /// 
 2 "2 to 3%"                        /// 
 3 "3 to 4%"                        /// 
 4 "4 to 5%"                        /// 
 5 "5 to 6%"                        /// 
 6 "6 to 7%"                        /// 
 7 "7 to 8%"                        /// 
 8 "8 to 9%"                        /// 
 9 "9 to 10%"                       /// 
10 "10 to 11%"                         /// 
11 "11 to 12%"                         /// 
12 "12 to 13%"                         /// 
13 "13 to 14%"                         /// 
14 "14 to 15%"                         /// 
15 "15 to 16%"                         /// 
16 "16 to 17%"                         /// 
17 "17 to 18%"                         /// 
18 "18 to 19%"                         /// 
19 "19 to 20%"                         /// 
20 "20 to 21%"                         /// 
21 "21 to 22%"                         /// 
22 "22 to 23%"                         /// 
23 "23 to 24%"                         /// 
24 "24 to 25%"                         /// 
25 "25 to 26%"                         /// 
26 "26 to 27%"                         /// 
27 "27 to 28%"                         /// 
28 "28 to 29%"                         /// 
29 "29 to 30%"                         /// 
30 "30 to 31%"                         /// 
31 "31 to 32%"                         /// 
32 "32 to 33%"                         /// 
33 "33 to 34%"                         /// 
34 "34 to 35%"                         /// 
35 "35 to 36%"                         /// 
36 "36 to 37%"                         /// 
37 "37 to 38%"                         /// 
38 "38 to 39%"                         /// 
39 "39 to 40%"                         /// 
40 "40 to 41%"                         /// 
41 "41 to 42%"                         /// 
42 "42 to 43%"                         /// 
43 "43 to 44%"                         /// 
44 "44 to 45%"                         /// 
45 "45 to 46%"                         /// 
46 "46 to 47%"                         /// 
47 "47 to 48%"                         /// 
48 "48 to 49%"                         /// 
49 "49 to 50%"                         /// 
50 "50 to 51%"                         /// 
51 "51 to 52%"                         /// 
52 "52 to 53%"                         /// 
53 "53 to 54%"                         /// 
54 "54 to 55%"                         /// 
55 "55 to 56%"                         /// 
56 "56 to 57%"                         /// 
57 "57 to 58%"                         /// 
58 "58 to 59%"                         /// 
59 "59 to 60%"                         /// 
60 "60 to 61%"                         /// 
61 "61 to 62%"                         /// 
62 "62 to 63%"                         /// 
63 "63 to 64%"                         /// 
64 "64 to 65%"                         /// 
65 "65 to 66%"                         /// 
66 "66 to 67%"                         /// 
67 "67 to 68%"                         /// 
68 "68 to 69%"                         /// 
69 "69 to 70%"                         /// 
70 "70 to 71%"                         /// 
71 "71 to 72%"                         /// 
72 "72 to 73%"                         /// 
73 "73 to 74%"                         /// 
74 "74 to 75%"                         /// 
75 "75 to 76%"                         /// 
76 "76 to 77%"                         /// 
77 "77 to 78%"                         /// 
78 "78 to 79%"                         /// 
79 "79 to 80%"                         /// 
80 "80 to 81%"                         /// 
81 "81 to 82%"                         /// 
82 "82 to 83%"                         /// 
83 "83 to 84%"                         /// 
84 "84 to 85%"                         /// 
85 "85 to 86%"                         /// 
86 "86 to 87%"                         /// 
87 "87 to 88%"                         /// 
88 "88 to 89%"                         /// 
89 "89 to 90%"                         /// 
90 "90 to 91%"                         /// 
91 "91 to 92%"                         /// 
92 "92 to 93%"                         /// 
93 "93 to 94%"                         /// 
94 "94 to 95%"                         /// 
95 "95 to 96%"                         /// 
96 "96 to 97%"                         /// 
97 "97 to 98%"                         /// 
98 "98 to 99%"                         /// 
99 "99 to 100%"


   *  BVRGESTINKH 
capture label drop BVRGESTINKH_lab
label define BVRGESTINKH_lab           ///
999999999 "Household income unknown"


*>> Label values
label value persink PERSINK_lab
label value percpersink PERCPERSINK_lab
label value poshhk POSHHK_lab
label value psecj PSECJ_lab
label value inpsecj INPSECJ_lab
label value inpposhhk INPPOSHHK_lab
label value inppersink INPPERSINK_lab
label value inpp100ppers INPP100PPERS_lab
label value inhp100hgest INHP100HGEST_lab
label value inhgestinkh INHGESTINKH_lab
label value bvrpercgestinkh BVRPERCGESTINKH_lab
label value bvrgestinkh BVRGESTINKH_lab


// *>> Order variables 
// order                               /// 
// RINPERSOONS rinpersoons                /// 
// RINPERSOON rinpersoon                  /// 
// PERSINK persink                     /// 
// PERCPERSINK percpersink                /// 
// POSHHK poshhk                          /// 
// PSECJ psecj                         /// 
// INPSECJ inpsecj                     /// 
// INPPOSHHK inpposhhk                    /// 
// INPPERSINK inppersink                  /// 
// INPP100PPERS inpp100ppers                 /// 
// INHP100HGEST inhp100hgest                 /// 
// INHGESTINKH inhgestinkh                /// 
// BVRPERCGESTINKH bvrpercgestinkh           /// 
// BVRGESTINKH bvrgestinkh                         

*>> Sort dataset 
sort RINPERSOON RINPERSOONS

*>> // compress dataset
compress

*>> // Remove any notes
notes drop *

*>> Generate new ID variable (because the zero at the beginning is problematic)
gen pid = RINPERSOONS + RINPERSOON 

*>> Save 
save "$cbs_file10_out\file10incomechild`n'0101anav1.dta", replace 
}



*---- [17.11.A.   (CBS) File 11 - A ]-----------------------------------------------------------------------------------*

   * Medicine Child
foreach n of numlist 2006/2017 {
use "$cbs_file11_in\FILE11AMEDICINECHILD`n'ANAV1.dta", clear
codebookout "$codebook\FILE11AMEDICINECHILD`n'ANAV1", replace

*>> Convert from string to numeric (or missing)
encode   RINPERSOONS,            gen(rinpersoons)
gen      rinpersoon           = real(RINPERSOON)
encode   KOPPELPOPULATIEKINDTABVV,  gen(koppelpopulatiekindtabvv)


*>> Duplicate variables 
clonevar zvwkeerstelijnspsycho   = ZVWKEERSTELIJNSPSYCHO
clonevar zvwkgenbasggz        = ZVWKGENBASGGZ
clonevar zvwkggz           = ZVWKGGZ
clonevar zvwkspecggz          = ZVWKSPECGGZ
clonevar zvwktotaal        = ZVWKTOTAAL

*>> Label variables 
   *  NL
label variable RINPERSOONS "codering voor de kwaliteit van de omzetting van een bsn/sofinummer naar rinpersoon"
label variable RINPERSOON "betekenis- en dimensieloos identificatienummer ter vervanging van het sofi-nummer/bsn"
label variable ZVWKEERSTELIJNSPSYCHO "kosten van eerstelijnspsychologische zorg binnen de basisverzekering"
label variable ZVWKGENBASGGZ "kosten van basis-ggz-zorg binnen de basisverzekering"
label variable ZVWKGGZ "kosten van ggz-zorg binnen de basisverzekering"
label variable ZVWKSPECGGZ "kosten van specialistische ggz-zorg binnen de basisverzekering"
label variable ZVWKTOTAAL "totale kosten van zorg binnen de basisverzekering"
label variable KOPPELPOPULATIEKINDTABVV "fictieve variabele geeft aan of deze wel(1)/niet(leeg) voorkomt in bestand"

   *  EN
label variable rinpersoons "encoding for the quality of the conversion of a bsn / sofi number to rinperson"
label variable rinpersoon "meaning and dimensionless identification number to replace the social security number / bsn"
label variable zvwkeerstelijnspsycho "costs of primary psychological care within the basic insurance"
label variable zvwkgenbasggz "costs of basic mental healthcare within the basic insurance"
label variable zvwkggz "costs of mental health care within the basic insurance"
label variable zvwkspecggz "costs of specialist mental healthcare within the basic insurance"
label variable zvwktotaal "total costs of care within the basic insurance"
label variable koppelpopulatiekindtabvv "fictitious variable indicates whether it is (1) / not (empty) in file"


// *>> Order variables 
// order                                     ///
// RINPERSOONS rinpersoons                      ///
// RINPERSOON rinpersoon                        ///
// ZVWKEERSTELIJNSPSYCHO zvwkeerstelijnspsycho        ///
// ZVWKGENBASGGZ zvwkgenbasggz                     ///
// ZVWKGGZ zvwkggz                              ///
// ZVWKSPECGGZ zvwkspecggz                      ///
// ZVWKTOTAAL zvwktotaal                        ///
// KOPPELPOPULATIEKINDTABVV koppelpopulatiekindtabvv                                   

*>> Sort dataset 
sort RINPERSOON RINPERSOONS

*>> // compress dataset
compress

*>> // Remove any notes
notes drop *

*>> Generate new ID variable (because the zero at the beginning is problematic)
gen pid = RINPERSOONS + RINPERSOON 

*>> Save 
save "$cbs_file11_out\file11amedicinechild`n'anav1.dta", replace

}




*---- [17.11.B.   (CBS) File 11 - B ]-----------------------------------------------------------------------------------*

   * Care Costs Child
foreach n of numlist 2009/2017 {
use "$cbs_file11_in\FILE11BCARECOSTSCHILD`n'ANAV1.dta", clear
codebookout "$codebook\FILE11BCARECOSTSCHILD`n'ANAV1", replace

*>> Convert from string to numeric (or missing)
encode   RINPERSOONS,            gen(rinpersoons)
gen      rinpersoon           = real(RINPERSOON)
encode   KOPPELPOPULATIEKINDTABVV,  gen(koppelpopulatiekindtabvv)


*>> Duplicate variables 
clonevar zvwkeerstelijnspsycho = ZVWKEERSTELIJNSPSYCHO
clonevar zvwkgenbasggz  = ZVWKGENBASGGZ
clonevar zvwkggz     = ZVWKGGZ
clonevar zvwkspecggz    = ZVWKSPECGGZ
clonevar zvwktotaal  = ZVWKTOTAAL

*>> Label variables 
   *  NL
label variable RINPERSOONS "codering voor de kwaliteit van de omzetting van een bsn/sofinummer naar rinpersoon"
label variable RINPERSOON "betekenis- en dimensieloos identificatienummer ter vervanging van het sofi-nummer/bsn"
label variable ZVWKEERSTELIJNSPSYCHO "kosten van eerstelijnspsychologische zorg binnen de basisverzekering"
label variable ZVWKGENBASGGZ "kosten van basis-ggz-zorg binnen de basisverzekering"
label variable ZVWKGGZ "kosten van ggz-zorg binnen de basisverzekering"
label variable ZVWKSPECGGZ "kosten van specialistische ggz-zorg binnen de basisverzekering"
label variable ZVWKTOTAAL "totale kosten van zorg binnen de basisverzekering"
label variable KOPPELPOPULATIEKINDTABVV "fictieve variabele geeft aan of deze wel(1)/niet(leeg) voorkomt in bestand"

   *  EN
label variable rinpersoons "encoding for the quality of the conversion of a bsn / sofi number to rinperson"
label variable rinpersoon "meaning and dimensionless identification number to replace the social security number / bsn"
label variable zvwkeerstelijnspsycho "costs of primary psychological care within the basic insurance"
label variable zvwkgenbasggz "costs of basic mental healthcare within the basic insurance"
label variable zvwkggz "costs of mental health care within the basic insurance"
label variable zvwkspecggz "costs of specialist mental healthcare within the basic insurance"
label variable zvwktotaal "total costs of care within the basic insurance"
label variable koppelpopulatiekindtabvv "fictitious variable indicates whether it is (1) / not (empty) in file"


// *>> Order variables 
// order                                     ///
// RINPERSOONS rinpersoons                      ///
// RINPERSOON rinpersoon                        ///
// ZVWKEERSTELIJNSPSYCHO zvwkeerstelijnspsycho        ///
// ZVWKGENBASGGZ zvwkgenbasggz                     ///
// ZVWKGGZ zvwkggz                              ///
// ZVWKSPECGGZ zvwkspecggz                      ///
// ZVWKTOTAAL zvwktotaal                        ///
// KOPPELPOPULATIEKINDTABVV koppelpopulatiekindtabvv                                   

*>> Sort dataset 
sort RINPERSOON RINPERSOONS

*>> // compress dataset
compress

*>> // Remove any notes
notes drop *

*>> Generate new ID variable (because the zero at the beginning is problematic)
gen pid = RINPERSOONS + RINPERSOON 

*>> Save 
save "$cbs_file11_out\file11bcarecostschild`n'anav1.dta", replace
}



*---- [17.12.A.   (CBS) File 12 - A ]-----------------------------------------------------------------------------------*


   * Medicine Parent
foreach n of numlist 2006/2017 {
use "$cbs_file12_in\FILE12AMEDICINEPARENT`n'ANAV1.dta", clear
codebookout "$codebook\FILE12AMEDICINEPARENT`n'ANAV1", replace

*>> Convert from string to numeric (or missing)
encode   RINPERSOONS,         gen(rinpersoons)
gen      rinpersoon        = real(RINPERSOON)
encode   KOPPELPOPULATIETABVV,   gen(koppelpopulatietabvv)


*>> Duplicate variables 
clonevar zvwkeerstelijnspsycho   = ZVWKEERSTELIJNSPSYCHO
clonevar zvwkgenbasggz        = ZVWKGENBASGGZ
clonevar zvwkggz           = ZVWKGGZ
clonevar zvwkspecggz          = ZVWKSPECGGZ
clonevar zvwktotaal        = ZVWKTOTAAL

*>> Label variables 
   *  NL
label variable RINPERSOONS "codering voor de kwaliteit van de omzetting van een bsn/sofinummer naar rinpersoon"
label variable RINPERSOON "betekenis- en dimensieloos identificatienummer ter vervanging van het sofi-nummer/bsn"
label variable ZVWKEERSTELIJNSPSYCHO "kosten van eerstelijnspsychologische zorg binnen de basisverzekering"
label variable ZVWKGENBASGGZ "kosten van basis-ggz-zorg binnen de basisverzekering"
label variable ZVWKGGZ "kosten van ggz-zorg binnen de basisverzekering"
label variable ZVWKSPECGGZ "kosten van specialistische ggz-zorg binnen de basisverzekering"
label variable ZVWKTOTAAL "totale kosten van zorg binnen de basisverzekering"
label variable KOPPELPOPULATIETABVV "fictieve variabele geeft aan of deze wel(1)/niet(leeg) voorkomt in bestand"

   *  EN
label variable rinpersoons "encoding for the quality of the conversion of a bsn / sofi number to rinperson"
label variable rinpersoon "meaning and dimensionless identification number to replace the social security number / bsn"
label variable zvwkeerstelijnspsycho "costs of primary psychological care within the basic insurance"
label variable zvwkgenbasggz "costs of basic mental healthcare within the basic insurance"
label variable zvwkggz "costs of mental health care within the basic insurance"
label variable zvwkspecggz "costs of specialist mental healthcare within the basic insurance"
label variable zvwktotaal "total costs of care within the basic insurance"
label variable koppelpopulatietabvv "fictitious variable indicates whether it is (1) / not (empty) in file"


// *>> Order variables 
// order                                     ///
// RINPERSOONS rinpersoons                      ///
// RINPERSOON rinpersoon                        ///
// ZVWKEERSTELIJNSPSYCHO zvwkeerstelijnspsycho        ///
// ZVWKGENBASGGZ zvwkgenbasggz                     ///
// ZVWKGGZ zvwkggz                              ///
// ZVWKSPECGGZ zvwkspecggz                      ///
// ZVWKTOTAAL zvwktotaal                        ///
// KOPPELPOPULATIETABVV koppelpopulatietabvv                                  

*>> Sort dataset 
sort RINPERSOON RINPERSOONS

*>> // compress dataset
compress

*>> // Remove any notes
notes drop *

*>> Generate new ID variable (because the zero at the beginning is problematic)
gen pid = RINPERSOONS + RINPERSOON 

*>> Save 
save "$cbs_file12_out\file12amedicineparent`n'anav1.dta", replace

}


*---- [17.12.B.   (CBS) File 12 - B ]-----------------------------------------------------------------------------------*

   * Care Costs Parent
foreach n of numlist 2009/2017 {
use "$cbs_file12_in\FILE12BCARECOSTSPARENT`n'ANAV1.dta", clear
codebookout "$codebook\FILE12BCARECOSTSPARENT`n'ANAV1", replace

*>> Convert from string to numeric (or missing)
encode   RINPERSOONS,         gen(rinpersoons)
gen      rinpersoon        = real(RINPERSOON)
encode   KOPPELPOPULATIETABVV,   gen(koppelpopulatietabvv)


*>> Duplicate variables 

clonevar zvwkeerstelijnspsycho   = ZVWKEERSTELIJNSPSYCHO
clonevar zvwkgenbasggz        = ZVWKGENBASGGZ
clonevar zvwkggz           = ZVWKGGZ
clonevar zvwkspecggz          = ZVWKSPECGGZ
clonevar zvwktotaal        = ZVWKTOTAAL

*>> Label variables 
   *  NL
label variable RINPERSOONS "codering voor de kwaliteit van de omzetting van een bsn/sofinummer naar rinpersoon"
label variable RINPERSOON "betekenis- en dimensieloos identificatienummer ter vervanging van het sofi-nummer/bsn"
label variable ZVWKEERSTELIJNSPSYCHO "kosten van eerstelijnspsychologische zorg binnen de basisverzekering"
label variable ZVWKGENBASGGZ "kosten van basis-ggz-zorg binnen de basisverzekering"
label variable ZVWKGGZ "kosten van ggz-zorg binnen de basisverzekering"
label variable ZVWKSPECGGZ "kosten van specialistische ggz-zorg binnen de basisverzekering"
label variable ZVWKTOTAAL "totale kosten van zorg binnen de basisverzekering"
label variable KOPPELPOPULATIETABVV "fictieve variabele geeft aan of deze wel(1)/niet(leeg) voorkomt in bestand"

   *  EN
label variable rinpersoons "encoding for the quality of the conversion of a bsn / sofi number to rinperson"
label variable rinpersoon "meaning and dimensionless identification number to replace the social security number / bsn"
label variable zvwkeerstelijnspsycho "costs of primary psychological care within the basic insurance"
label variable zvwkgenbasggz "costs of basic mental healthcare within the basic insurance"
label variable zvwkggz "costs of mental health care within the basic insurance"
label variable zvwkspecggz "costs of specialist mental healthcare within the basic insurance"
label variable zvwktotaal "total costs of care within the basic insurance"
label variable koppelpopulatietabvv "fictitious variable indicates whether it is (1) / not (empty) in file"


// *>> Order variables 
// order                                     ///
// RINPERSOONS rinpersoons                      ///
// RINPERSOON rinpersoon                        ///
// ZVWKEERSTELIJNSPSYCHO zvwkeerstelijnspsycho        ///
// ZVWKGENBASGGZ zvwkgenbasggz                     ///
// ZVWKGGZ zvwkggz                              ///
// ZVWKSPECGGZ zvwkspecggz                      ///
// ZVWKTOTAAL zvwktotaal                        ///
// KOPPELPOPULATIETABVV koppelpopulatietabvv                                  

*>> Sort dataset 
sort RINPERSOON RINPERSOONS

*>> // compress dataset
compress

*>> // Remove any notes
notes drop *

*>> Generate new ID variable (because the zero at the beginning is problematic)
gen pid = RINPERSOONS + RINPERSOON 

*>> Save 
save "$cbs_file12_out\file12bcarecostsparent`n'anav1.dta", replace

}

************************************************************************************************* 
* This section modifies CBS files in order to identify and match family members (i.e. fathers, 	* 
* mothers, children, partners)                                                                  * 
*************************************************************************************************  


*>> File 1  ------------------------------------------------------------------------------------------------------------*
   //    File 1 is okay as it is. No need to modify it

*>> File 2  ------------------------------------------------------------------------------------------------------------*
   *>> Fathers 
   //    This dataset is about the demographic and socioeconomic background of children (prefix: "ch_")
   
   *  Open the dataset 
use "$cbs_file2_out\file2backgroundchildren20190101anav1.dta", clear 

   *  Put a "ch_" prefix on each variable of the dataset ("ch" means children)
foreach x of var * { 
   rename `x' ch_`x' 
} 

   *  Count how many children have RINPERSOONPA or MA missing
count if ch_RINPERSOONPA=="---------"
count if ch_RINPERSOONMA=="---------"
count if ch_RINPERSOONPA=="---------" & ch_RINPERSOONMA=="---------"

   *  Below we modify the name of some ID variables, in order to identify fathers and mothers 
preserve    // Preserve the dataset as it is 

   *  Clone the ID variables in this way because later you want to match RINPERSOON from SHARE (parents) with ch_RINPERSOONPA (fathers) and ch_RINPERSOONSPA (mothers)
clonevar pid  = ch_pid_pa
clonevar RINPERSOON  = ch_RINPERSOONPA 
clonevar RINPERSOONS = ch_RINPERSOONSPA 

*>> Drop if ch_RINPERSOONPA is missing
drop if ch_RINPERSOONPA=="---------"


   *  Save the dataset for FATHERS
save "$cbs_file2_out\file2backgroundchildren20190101anav1_pa.dta", replace  

   *>> Mothers 
restore // Restore the dataset as its previous stage

   *  Rename the IDs in this way (as we did it before, but this time we do it for mothers)
clonevar pid  = ch_pid_ma
clonevar RINPERSOON  = ch_RINPERSOONMA 
clonevar RINPERSOONS = ch_RINPERSOONSMA 

*>> Drop if ch_RINPERSOONMA is missing
drop if ch_RINPERSOONMA=="---------"

   *  Save the dataset for MOTHERS
save "$cbs_file2_out\file2backgroundchildren20190101anav1_ma.dta", replace  

   *>> Append the two dataset (Fathers+Mothers)
use          "$cbs_file2_out\file2backgroundchildren20190101anav1_pa.dta", clear 
append using "$cbs_file2_out\file2backgroundchildren20190101anav1_ma.dta" 

   *>> Save the newdataset that contains the IDs of both fathers and mothers
save "$cbs_file2_out\file2backgroundchildren20190101anav1_pama.dta", replace  

   *>> Erase those two temporary datasets 
erase "$cbs_file2_out\file2backgroundchildren20190101anav1_pa.dta"
erase "$cbs_file2_out\file2backgroundchildren20190101anav1_ma.dta" 

*>> File 3  ------------------------------------------------------------------------------------------------------------*
   //    This dataset is about the cohabitation of children (prefix "ch_" also here)
   
   *>> Open the dataset
use "$cbs_file3_out\file3livingtogetherchild2018anav1.dta", clear 

   *  Some variable's name are too long for the loop we are going to do. We rename them: 
rename GBAREDENEINDESAMENWOONPERIODE1 GBAREDENEINDESAMENWOONP1
rename gbaredeneindesamenwoonperiode1 gbaredeneindesamenwoonp1

   *  Put a "ch_" prefix in every variable of the dataset (we are saying that the variables are referred to the children)
foreach x of var * { 
   rename `x' ch_`x'_ 
} 

   *  We didn't want this renamed. Let's correct
rename ch_pid_ ch_pid

   *  We can see that we have many spells of marriage for the same person. Here we check for them: 
duplicates report ch_pid

   *  Create a new variable with the total number of spells of cohabitation for the same child  
duplicates tag ch_pid, gen(tot_spells)
replace tot_spells=tot_spells+1                                // increment by one to match the real number of spells

   *  Let's check what we have done 
duplicates report ch_pid 
fre tot_spells    // Okay, they match 

   *  Sort the dataset 
sort ch_pid

   *  // list the variables of interest 
// list ch_RINPERSOON ch_RINPERSOON1PARTNER ch_gbaaanvangsam ch_gbaeindesamen ch_gbaredeneindesamenwoonp1 tot_spells, sepby(ch_RINPERSOON)

   *  Okay, but this is not enough. How many spells? Let's create a variable that count them. 
   *  Sort by personal ID and by the "End date of cohabitation"
sort ch_pid ch_GBAEINDESAMEN

   *  Generate the number of spells (this will be necessary to: 1, reshape the dataset in wide form; 2, match every child with their episodes of cohabitation)
bys ch_pid: gen n_spells=(_n) 


   *  Let's check what we have done 
   *  1.: Whether the personal IDs "ch_RINPERSOON" and "ch_RINPERSOONS" and the number of spells are unique IDs
isid ch_pid n_spells // Okay

   *  2.: Whether there is something strange with the new created variable 
tab tot_spells n_spells, miss

   *  3.: Check by // listing some variables of interest 
sort ch_pid n_spells // sort the dataset according to the personal IDs and the increasing number of spells
// list ch_RINPERSOON ch_RINPERSOON1PARTNER ch_gbaaanvangsam ch_gbaeindesamen ch_gbaredeneindesamenwoonp1 tot_spells n_spells, sepby(ch_RINPERSOON)

   *>> Reshape in wide form so that we can merge the files later (we need to have many marital spells in the same row for the same children) 
reshape wide ch_RINPERSOONS_ ch_RINPERSOON_ ch_GBAAANVANGSAMENWOONPERIODE1_ ch_GBAEINDESAMENWOONPERIODE1_ ch_GBAREDENEINDESAMENWOONP1_ ch_RINPERSOON1PARTNER_ ch_RINPERSOONS1PARTNER_ ch_KOPPELPOPULATIEKINDTABVV_ ch_rinpersoons_ ch_rinpersoons1partner_ ch_koppelpopulatiekindtabvv_ ch_rinpersoon_ ch_rinpersoon1partner_ ch_gbaredeneindesamenwoonp1_ ch_gbaaanvangsamenwoonperiode1_ ch_gbaeindesamenwoonperiode1_ ch_pid_cohab_partner_ tot_spells, i(ch_pid) j(n_spells)

   *  Let's check whether the personal IDs (ch_RINPERSOON and ch_RINPERSOONS) are unique IDs now
isid ch_pid

   *>> Save this new dataset 
save "$cbs_file3_out\file3livingtogetherchild2018anav1_wide.dta", replace  

   
*>> File 4  ------------------------------------------------------------------------------------------------------------*
   //    This dataset is about the legal marriage of children (prefix "ch_" also here)
   
   *>> Open the dataset 
use "$cbs_file4_out\file4marriagechild2018anav1.dta", clear

   *  Put a "ch_" prefix in every variable of the dataset (we are saying that the variables are referred to the children)
foreach x of var * { 
   rename `x' ch_`x' 
} 

   *  We can see that we have many spells of marriage for the same child. Here we check for them: 
duplicates tag ch_pid, gen(tot_spells)      // total number of spells for the same person 
replace tot_spells=tot_spells+1                                // increment by one to match the real number of spells

   *  Some checks of what we have done 
duplicates report ch_pid
fre tot_spells    // Okay, they match 

   *  Sort the dataset 
sort ch_pid

   *  // list the variables of interest 
// list ch_RINPERSOON ch_RINPERSOONS ch_aanvangverbintenis ch_eindeverbintenis ch_redenbeeindigingverbintenis ch_rinpersoonsverbintenisp ch_rinpersoonverbintenisp ch_koppelpopulatiekindtabvv tot_spells, sepby(ch_RINPERSOON)

   *  How many spells? 
sort ch_pid ch_EINDEVERBINTENIS
   
   *  Let's create a new variable in the same way as we did it before 
gen n_spells = 0                 // "Empty" variable 
bys ch_pid: replace n_spells=_n    // Cumulative number of spells 

   *  Check 
tab tot_spells n_spells, miss 

   *  Let's check whether the personal IDs (ch_RINPERSOON and ch_RINPERSOONS) and the number of spells are unique IDs
isid ch_pid n_spells

   *  Check by // listing some variables of interest 
sort ch_pid
// list ch_RINPERSOON ch_RINPERSOONS ch_aanvangverbintenis ch_eindeverbintenis ch_redenbeeindigingverbintenis ch_rinpersoonsverbintenisp ch_rinpersoonverbintenisp ch_koppelpopulatiekindtabvv n_spells tot_spells, sepby(ch_RINPERSOON)

   *>> Reshape in wide form so that we can have many marital spells in the same row for the same individual 
reshape wide ch_RINPERSOONS ch_RINPERSOON ch_AANVANGVERBINTENIS ch_EINDEVERBINTENIS ch_REDENBEEINDIGINGVERBINTENIS ch_RINPERSOONSVERBINTENISP ch_RINPERSOONVERBINTENISP ch_TYPEVERBINTENIS ch_KOPPELPOPULATIEKINDTABVV ch_rinpersoons ch_rinpersoonsverbintenisp ch_typeverbintenis ch_koppelpopulatiekindtabvv ch_rinpersoon ch_rinpersoonverbintenisp ch_aanvangverbintenis ch_eindeverbintenis ch_redenbeeindigingverbintenis ch_pid_mar_partner tot_spells, i(ch_pid) j(n_spells)

   *  Let's check whether the personal IDs (ch_RINPERSOON and ch_RINPERSOONS) are unique IDs now
isid ch_pid

   *>> Save this new dataset 
save "$cbs_file4_out\file4marriagechild2018anav1_wide.dta", replace 


*>> File 5  ------------------------------------------------------------------------------------------------------------*
   
   //    This is a dataset about the cohabitation of parents (SHARE respondents)
   
   *  Open the dataset 
use "$cbs_file5_out\file5livingtogetherparent2018anav1.dta", clear

*>> We can have many spells of marriage. Here we check for them: 
duplicates tag pid, gen(tot_spells)
replace tot_spells=tot_spells+1

*>> Check 
sort pid
// list RINPERSOON RINPERSOONS gbaredeneindesamenwoonperiode1 gbaaanvangsamenwoonperiode1 gbaeindesamenwoonperiode1 tot_spells, sepby(RINPERSOON) 

*>> How many spells? 
sort pid GBAEINDESAMENWOONPERIODE1
gen n_spells = 0
bys pid (GBAEINDESAMENWOONPERIODE1): replace n_spells=_n  // if tot_spells>0
isid pid n_spells

*>> Check 
sort pid gbaeindesamenwoonperiode1 
// list RINPERSOON RINPERSOONS gbaredeneindesamenwoonperiode1 gbaaanvangsamenwoonperiode1 GBAEINDESAMENWOONPERIODE1 gbaeindesamenwoonperiode1 n_spells tot_spells, sepby(RINPERSOON) 

*>> Check *>> Reshape in wide form so that we can have many marital spells in the same row for the same individual 
reshape wide RINPERSOONS RINPERSOON GBAAANVANGSAMENWOONPERIODE1 GBAEINDESAMENWOONPERIODE1 GBAREDENEINDESAMENWOONPERIODE1 RINPERSOON1PARTNER RINPERSOONS1PARTNER KOPPELPOPULATIETABVV rinpersoons rinpersoons1partner rinpersoon rinpersoon1partner gbaredeneindesamenwoonperiode1 koppelpopulatietabvv gbaaanvangsamenwoonperiode1 gbaeindesamenwoonperiode1 pid_cohab_partner tot_spells, i(pid) j(n_spells)

*  Let's check whether the personal IDs (RINPERSOON and RINPERSOONS) are unique IDs now
isid pid

*>> Save this new dataset 
save "$cbs_file5_out\file5livingtogetherparent2018anav1_wide.dta", replace

*>> File 6  ------------------------------------------------------------------------------------------------------------*
   
   //    This is a dataset about the marriage of parents (SHARE respondents)
   
   *  Open the dataset 
use "$cbs_file6_out\file6marriageparent2018anav1.dta", clear

*>> We can have many spells of marriage. Here we check for them: 
duplicates tag pid, gen(tot_spells)
replace tot_spells=tot_spells+1

*>> Check 
sort pid
// list RINPERSOON RINPERSOONS RINPERSOONVERBINTENISP redenbeeindigingverbintenis typeverbintenis aanvangverbintenis eindeverbintenis tot_spells, sepby(RINPERSOON) 

*>> How many spells? 
sort pid EINDEVERBINTENIS
gen n_spells = 0
bys pid (EINDEVERBINTENIS): replace n_spells=_n  // if tot_spells>0
isid pid n_spells

*>> Check 
sort pid RINPERSOONS EINDEVERBINTENIS 
// list RINPERSOON RINPERSOONS RINPERSOONVERBINTENISP redenbeeindigingverbintenis typeverbintenis aanvangverbintenis eindeverbintenis n_spells tot_spells, sepby(RINPERSOON) 

*>> Check *>> Reshape in wide form so that we can have many marital spells in the same row for the same individual 
reshape wide RINPERSOONS RINPERSOON AANVANGVERBINTENIS EINDEVERBINTENIS REDENBEEINDIGINGVERBINTENIS RINPERSOONSVERBINTENISP RINPERSOONVERBINTENISP TYPEVERBINTENIS KOPPELPOPULATIETABVV rinpersoons rinpersoon rinpersoonsverbintenisp rinpersoonverbintenisp koppelpopulatietabvv redenbeeindigingverbintenis typeverbintenis aanvangverbintenis eindeverbintenis pid_mar_partner tot_spells, i(pid) j(n_spells)

*  Let's check whether the personal IDs (RINPERSOON and RINPERSOONS) are unique IDs now
isid pid

*>> Save this new dataset 
save "$cbs_file6_out\file6marriageparent2018anav1_wide.dta", replace 


*>> File 7  ------------------------------------------------------------------------------------------------------------*

   // This dataset contains household and geographic information on children (e.g. Number of persons in the household, distance from PA and MA, etc.)
   // Therefore, here we will have "ch_" as a prefix in the variables 


*>> Start the loop
foreach n of numlist 2004/2018 {
   
   *>> Open the dataset
use "$cbs_file7_out\file7yearlyinfochild`n'1299anav1.dta", clear

   *>>   Put a "ch_" prefix on each variable of the dataset ("ch" means children)
foreach x of var * { 
   rename `x' ch_`x' 
} 

   *>>   Put a "y_n" suffix on each variable of the dataset ("y" year)
foreach x of var ch_AANTALKINDHH ch_GEBJAAROUDSTEKINDHH ch_GEBJAARJONGSTEKINDHH ch_AANTALPERSHH ch_AFSTANDMA ch_AFSTANDPA ch_gebjaaroudstekindhh ch_gebjaarjongstekindhh ch_aantalkindhh ch_aantalpershh ch_afstandma ch_afstandpa { 
   rename `x' `x'y_`n' 
} 

   *  Count how many children have RINPERSOONPA or MA missing
count if ch_RINPERSOONPA=="---------"
count if ch_RINPERSOONMA=="---------"

   *>>   Below we modify the name of some ID variables, in order to identify fathers and mothers 
preserve    // Preserve the dataset as it is 

   *>>   Clone the ID variables in this way because later you want to match RINPERSOON from SHARE (parents) with ch_RINPERSOONPA (fathers) and ch_RINPERSOONSPA (mothers)
clonevar pid  = ch_pid_pa
clonevar RINPERSOON  = ch_RINPERSOONPA 
clonevar RINPERSOONS = ch_RINPERSOONSPA 

*>> Drop if ch_RINPERSOONPA is missing
drop if ch_RINPERSOONPA=="---------"
drop if RINPERSOON==" "

   *>>   Save the dataset for FATHERS
save "$cbs_file7_out\file7yearlyinfochild`n'1299anav1_pa.dta", replace  

   *>> Mothers 
restore // Restore the dataset as its previous stage

   *  Rename the IDs in this way (as we did it before, but this time we do it for mothers)
clonevar pid  = ch_pid_ma 
clonevar RINPERSOON  = ch_RINPERSOONMA 
clonevar RINPERSOONS = ch_RINPERSOONSMA 

*>> Drop if ch_RINPERSOONMA is missing
drop if ch_RINPERSOONMA=="---------"
drop if RINPERSOON==" "

   *  Save the dataset for MOTHERS
save "$cbs_file7_out\file7yearlyinfochild`n'1299anav1_ma.dta", replace  

   *>> Append the two dataset (Fathers+Mothers)
use          "$cbs_file7_out\file7yearlyinfochild`n'1299anav1_pa.dta", clear 
append using "$cbs_file7_out\file7yearlyinfochild`n'1299anav1_ma.dta" 

   *>> Save the newdataset that contains the IDs of both fathers and mothers
save "$cbs_file7_out\file7yearlyinfochild`n'1299anav1_pama.dta", replace  

   *>> Erase those two temporary datasets 
erase "$cbs_file7_out\file7yearlyinfochild`n'1299anav1_pa.dta"
erase "$cbs_file7_out\file7yearlyinfochild`n'1299anav1_ma.dta" 

}

*>> File 8  ------------------------------------------------------------------------------------------------------------*
   //    This dataset is about the demographics of grandchildren (prefix: "grch_")
   
   *  Open the dataset 
use "$cbs_file8_out\file8grandchildrenanav1.dta", clear 


   *  Put a "grch_" prefix on each variable of the dataset ("grch_" means grandchildren)
foreach x of var * { 
   rename `x' grch_`x' 
} 

   * Rename grch_pid because we need this variable in this way to recognize information on grandchildren
rename grch_pid_zero ch_pid 

   *  We can see that we have many spells for the same person. Here we check for them: 
duplicates report ch_pid

   *  Create a new variable with the total number of spells of cohabitation for the same grandchild   
duplicates tag 	ch_pid, gen(tot_spells)
replace 		tot_spells=tot_spells+1                                // increment by one to match the real number of spells

   *  Let's check what we have done 
duplicates report ch_pid 
fre tot_spells    // Okay, they match 

   *  Sort the dataset 
sort ch_pid grch_vrlgbageboortejaar grch_vrlgbageboortemaand

   *  // list the variables of interest 
list ch_pid grch_RINPERSOON *pid* tot_spells, sepby(ch_pid)

*>> Okay, but this is not enough. How many spells? Let's create a variable that count them. 
   *  Generate the number of spells (this will be necessary to: 1, reshape the dataset in wide form; 2, match every child with their episodes of cohabitation)
bys ch_pid: gen n_spells=(_n) 


   *  Let's check what we have done 
   *  1.: Whether the personal IDs "ch_RINPERSOON" and "ch_RINPERSOONS" and the number of spells are unique IDs
isid ch_pid n_spells // Okay

   *  2.: Whether there is something strange with the new created variable 
tab tot_spells n_spells, miss

   *  3.: Check by // listing some variables of interest 
sort ch_pid  grch_vrlgbageboortejaar grch_vrlgbageboortemaand n_spells // sort the dataset according to the personal IDs and the increasing number of spells
// list ch_RINPERSOON ch_RINPERSOON1PARTNER ch_gbaaanvangsam ch_gbaeindesamen ch_gbaredeneindesamenwoonp1 tot_spells n_spells, sepby(ch_RINPERSOON)



   *>> Reshape in wide form so that we can merge the files later (we need to have many marital spells in the same row for the same children) 
reshape wide grch_RINPERSOONS grch_RINPERSOON grch_RINPERSOONKIND grch_RINPERSOONOUDER2 grch_RINPERSOONSKIND grch_RINPERSOONSOUDER2 grch_KOPPELPOPULATIEKINDTABVV grch_VRLGBAGESLACHT grch_VRLGBAGEBOORTEMAAND grch_VRLGBAGEBOORTEJAAR grch_rinpersoons grch_rinpersoon grch_rinpersoonkind grch_rinpersoonouder2 grch_rinpersoonskind grch_rinpersoonsouder2 grch_koppelpopulatiekindtabvv grch_vrlgbageslacht grch_vrlgbageboortemaand grch_vrlgbageboortejaar grch_ch_pid grch_pid_ouder, i(ch_pid) j(n_spells)

   *  Let's check whether the personal IDs (ch_RINPERSOON and ch_RINPERSOONS) are unique IDs now
isid ch_pid 

   *>> Save this new dataset 
save "$cbs_file8_out\file8grandchildrenanav1_new.dta", replace 

*>> File 9  ------------------------------------------------------------------------------------------------------------*

   // This dataset contains income information on parents 


*>> Start the loop
foreach n of numlist 2003/2010 {
   
   *>> Open the dataset
use "$cbs_file9_out\file9incomeparent`n'0101anav1.dta", clear

   *>>   Put a "y_n" suffix on each variable of the dataset ("y" year)
foreach x of var PERCPERSINK PSECJ POSHHK PERSINK BVRGESTINKH BVRPERCGESTINKH percpersink psecj poshhk bvrpercgestinkh persink bvrgestinkh  { 
   rename `x' `x'y_`n' 
} 


   *  Save the dataset
save "$cbs_file9_out\file9incomeparent`n'0101anav1_new.dta", replace  


}

*>> File 10 ------------------------------------------------------------------------------------------------------------*

   // This dataset contains income information on children
   // Therefore, here we will have "ch_" as a prefix in the variables 
   
   // Attention: here we don't have RINPERSOONPA and RINPERSOONMA. This is why below we do a merge m:1
 

*>> Start the loop
foreach n of numlist 2003/2018 {
   
   *>> Open the dataset
use "$cbs_file10_out\file10incomechild`n'0101anav1.dta", clear

   *>>   Put a "ch_" prefix on each variable of the dataset ("ch" means children)
foreach x of var * { 
   rename `x' ch_`x' 
} 

   *>>   Put a "y_n" suffix on each variable of the dataset ("y" year)
foreach x of var ch_PERSINK ch_PERCPERSINK ch_POSHHK ch_PSECJ ch_INPSECJ ch_INPPOSHHK ch_INPPERSINK ch_INPP100PPERS ch_INHP100HGEST ch_INHGESTINKH ch_BVRPERCGESTINKH ch_BVRGESTINKH ch_percpersink ch_poshhk ch_psecj ch_inpsecj ch_inpposhhk ch_bvrpercgestinkh ch_persink ch_inppersink ch_inpp100ppers ch_inhp100hgest ch_inhgestinkh ch_bvrgestinkh  { 
   rename `x' `x'y_`n' 
} 



   *>> Save the newdataset that contains the IDs of both fathers and mothers
save "$cbs_file10_out\file10incomechild`n'0101anav1_new.dta", replace  


}

*>> File 11 - A --------------------------------------------------------------------------------------------------------*

   // This dataset contains income information on children
   // Therefore, here we will have "ch_" as a prefix in the variables 
   
   // Attention: here we don't have RINPERSOONPA and RINPERSOONMA. This is why below I do a merge m:1
 

*>> Start the loop
foreach n of numlist 2006/2017 {
   
   *>> Open the dataset
use "$cbs_file11_out\file11amedicinechild`n'anav1.dta", clear

   *>>   Put a "ch_" prefix on each variable of the dataset ("ch" means children)
foreach x of var * { 
   rename `x' ch_`x' 
} 

rename ch_KOPPELPOPULATIEKINDTABVV ch_KOPPELPKINDTABVV
rename ch_koppelpopulatiekindtabvv ch_koppelpkindtabvv

   *>>   Put a "y_n" suffix on each variable of the dataset ("y" year)
foreach x of var ch_KOPPELPKINDTABVV ch_koppelpkindtabvv ch_ZVWKEERSTELIJNSPSYCHO ch_ZVWKGENBASGGZ ch_ZVWKGGZ ch_ZVWKSPECGGZ ch_ZVWKTOTAAL ch_zvwkeerstelijnspsycho ch_zvwkgenbasggz ch_zvwkggz ch_zvwkspecggz ch_zvwktotaal   { 
   rename `x' `x'_a_`n' 
} 



*>> Since we have many records for each individual, we collapse them 
collapse                                                 /// 
(sum)                                                    /// 
ch_koppelpkindtabvv                                    /// 
ch_zvwkeerstelijnspsycho                                    /// 
ch_zvwkgenbasggz                                         /// 
ch_zvwkggz                                               /// 
ch_zvwkspecggz                                           /// 
ch_zvwktotaal                                            /// 
///                                                   /// 
(count)                                               /// 
ch_count_koppelpkindtabvv        = ch_koppelpkindtabvv    /// 
ch_count_zvwkeerstelijnspsycho   = ch_zvwkeerstelijnspsycho       /// 
ch_count_zvwkgenbasggz           = ch_zvwkgenbasggz               /// 
ch_count_zvwkggz                 = ch_zvwkggz                  /// 
ch_count_zvwkspecggz             = ch_zvwkspecggz              /// 
ch_count_zvwktotaal              = ch_zvwktotaal                  /// 
, by(ch_pid)


   *>> Save the newdataset that contains the IDs of both fathers and mothers
save "$cbs_file11_out\file11amedicinechild`n'anav1_new.dta", replace  

}

*>> File 11 - B --------------------------------------------------------------------------------------------------------*

   // This dataset contains income information on children
   // Therefore, here we will have "ch_" as a prefix in the variables 
   
   // Attention: here we don't have RINPERSOONPA and RINPERSOONMA. This is why below I do a merge m:1
 

*>> Start the loop
foreach n of numlist 2009/2017 {
   
   *>> Open the dataset
use "$cbs_file11_out\file11bcarecostschild`n'anav1.dta", clear

   *>>   Put a "ch_" prefix on each variable of the dataset ("ch" means children)
foreach x of var * { 
   rename `x' ch_`x' 
} 

rename ch_KOPPELPOPULATIEKINDTABVV ch_KOPPELPKINDTABVV
rename ch_koppelpopulatiekindtabvv ch_koppelpkindtabvv

   *>>   Put a "y_n" suffix on each variable of the dataset ("y" year)
foreach x of var ch_ZVWKEERSTELIJNSPSYCHO ch_ZVWKGENBASGGZ ch_ZVWKGGZ ch_ZVWKSPECGGZ ch_ZVWKTOTAAL ch_KOPPELPKINDTABVV ch_koppelpkindtabvv ch_zvwkeerstelijnspsycho ch_zvwkgenbasggz ch_zvwkggz ch_zvwkspecggz ch_zvwktotaal    { 
   rename `x' `x'_b_`n' 
} 


*>> Since we have many records for each individual, we collapse them 
collapse                                                 /// 
(sum)                                                    /// 
ch_koppelpkindtabvv                                    /// 
ch_zvwkeerstelijnspsycho                                    /// 
ch_zvwkgenbasggz                                         /// 
ch_zvwkggz                                               /// 
ch_zvwkspecggz                                           /// 
ch_zvwktotaal                                            /// 
///                                                   /// 
(count)                                               /// 
ch_count_koppelpkindtabvv         = ch_koppelpkindtabvv    /// 
ch_count_zvwkeerstelijnspsycho      = ch_zvwkeerstelijnspsycho       /// 
ch_count_zvwkgenbasggz           = ch_zvwkgenbasggz               /// 
ch_count_zvwkggz              = ch_zvwkggz                  /// 
ch_count_zvwkspecggz          = ch_zvwkspecggz              /// 
ch_count_zvwktotaal              = ch_zvwktotaal                  /// 
, by(ch_pid)


   *>> Save the newdataset that contains the IDs of both fathers and mothers
save "$cbs_file11_out\file11bcarecostschild`n'anav1_new.dta", replace  

}

*>> File 12 - A --------------------------------------------------------------------------------------------------------*

   // This dataset contains income information on children
   // Therefore, here we will have "ch_" as a prefix in the variables 
   
   // Attention: here we don't have RINPERSOONPA and RINPERSOONMA. This is why below I do a merge m:1
 

*>> Start the loop
foreach n of numlist 2006/2017 {
   
   *>> Open the dataset
use "$cbs_file12_out\file12amedicineparent`n'anav1.dta", clear


rename KOPPELPOPULATIETABVV KOPPELPTABVV
rename koppelpopulatietabvv koppelptabvv


   *>>   Put a "y_n" suffix on each variable of the dataset ("y" year)
foreach x of var ZVWKEERSTELIJNSPSYCHO ZVWKGENBASGGZ ZVWKGGZ ZVWKSPECGGZ ZVWKTOTAAL KOPPELPTABVV koppelptabvv zvwkeerstelijnspsycho zvwkgenbasggz zvwkggz zvwkspecggz zvwktotaal     { 
   rename `x' `x'_a_`n' 
} 


*>> Since we have many records for each individual, we collapse them 
collapse                                                 /// 
(sum)                                                    /// 
koppelptabvv                                     /// 
zvwkeerstelijnspsycho                                       /// 
zvwkgenbasggz                                            /// 
zvwkggz                                                  /// 
zvwkspecggz                                              /// 
zvwktotaal                                               /// 
///                                                   /// 
(count)                                               /// 
count_koppelptabvv    = koppelptabvv              /// 
count_zvwkeerstelijnspsycho      = zvwkeerstelijnspsycho             /// 
count_zvwkgenbasggz           = zvwkgenbasggz                  /// 
count_zvwkggz              = zvwkggz                        /// 
count_zvwkspecggz          = zvwkspecggz                    /// 
count_zvwktotaal           = zvwktotaal                     /// 
, by(pid)


   *>> Save the newdataset that contains the IDs of both fathers and mothers
save "$cbs_file12_out\file12amedicineparent`n'anav1_new.dta", replace  

}

*>> File 12 - B --------------------------------------------------------------------------------------------------------*

   // This dataset contains income information on children
   // Therefore, here we will have "ch_" as a prefix in the variables 
   
   // Attention: here we don't have RINPERSOONPA and RINPERSOONMA. This is why below I do a merge m:1
 

*>> Start the loop
foreach n of numlist 2009/2017 {
   
   *>> Open the dataset
use "$cbs_file12_out\file12bcarecostsparent`n'anav1.dta", clear

rename KOPPELPOPULATIETABVV KOPPELPTABVV
rename koppelpopulatietabvv koppelptabvv

   *>>   Put a "y_n" suffix on each variable of the dataset ("y" year)
foreach x of var ZVWKEERSTELIJNSPSYCHO ZVWKGENBASGGZ ZVWKGGZ ZVWKSPECGGZ ZVWKTOTAAL KOPPELPTABVV koppelptabvv zvwkeerstelijnspsycho zvwkgenbasggz zvwkggz zvwkspecggz zvwktotaal     { 
   rename `x' `x'_b_`n' 
} 


*>> Since we have many records for each individual, we collapse them 
collapse                                                 /// 
(sum)                                                    /// 
koppelptabvv                                     /// 
zvwkeerstelijnspsycho                                       /// 
zvwkgenbasggz                                            /// 
zvwkggz                                                  /// 
zvwkspecggz                                              /// 
zvwktotaal                                               /// 
///                                                   /// 
(count)                                               /// 
count_koppelptabvv    = koppelptabvv              /// 
count_zvwkeerstelijnspsycho      = zvwkeerstelijnspsycho             /// 
count_zvwkgenbasggz           = zvwkgenbasggz                  /// 
count_zvwkggz              = zvwkggz                        /// 
count_zvwkspecggz          = zvwkspecggz                    /// 
count_zvwktotaal           = zvwktotaal                     /// 
, by(pid)


   *>> Save the newdataset that contains the IDs of both fathers and mothers
save "$cbs_file12_out\file12bcarecostsparent`n'anav1_new.dta", replace  

}



*----   [15.    (SHARE) Merge with KOPPELCBS_SHARENL ]----------------------------------------------------------------------*


use "$cbs_filePop_out\populatietabv1.dta", clear 
append using "$cbs_filePop_out\populatiekindtabv1.dta"

*>> We want RINPERSOON to be the unique identifier. Check for it, delete its duplicates
*  Check how many duplicates are there
duplicates report pid     // There are 5 duplicate observations (10)

*  Let's tag them
duplicates tag pid, gen(duplicates)

*  Let's drop them
drop if duplicates>0

*  Compress dataset
compress

*  Remove any notes
notes drop *

*>> Check if pid is unique identifier
isid pid 

save "$cbs_filePop_out\populatie.dta", replace 


*>> Open the KOPPELCBS_SHARENL.dta 
use "$share_in\KOPPELCBS_SHARENL_temp_inclZeros.dta", clear 

*  Rename the CBS personal IDs (they were lowercase)
rename RINPERSOON    RINPERSOON_KOPPELCBS_SHARENL
rename rins       RINPERSOON

*>> generate a personal id
gen pid             = RINPERSOONS + RINPERSOON 

*>> Save this version of the KOPPELCBS_SHARENL with the new updated variables 
save "$share_all_out\KOPPELCBS_SHARENL_temp_new.dta", replace 



*>> Let's do the merge
*  First open the population dataset
use "$cbs_filePop_out\populatie.dta", clear 


merge 1:1 pid using "$share_all_out\KOPPELCBS_SHARENL_temp_new.dta", update
isid pid
drop _merge 

list in 10/100

*>> Merge file 1

merge 1:1 pid using "$cbs_file1_out\file1backgroundparents20190101anav1.dta", update
isid pid
drop _merge 

*>> Merge file 9
foreach n of numlist 2003/2010 {
merge 1:1 pid using "$cbs_file9_out\file9incomeparent`n'0101anav1_new.dta"    , nogen update
}

*>> Merge file 12 - A
foreach n of numlist 2006/2017 {
merge 1:1 pid using "$cbs_file12_out\file12amedicineparent`n'anav1_new.dta", nogen update
}

*>> Merge file 12 - B
foreach n of numlist 2009/2017 {
merge 1:1 pid using "$cbs_file12_out\file12bcarecostsparent`n'anav1_new.dta", nogen update
}


*>> Merge file 2

merge 1:m pid using "$cbs_file2_out\file2backgroundchildren20190101anav1_pama.dta", update 


*  Generate the number of kids 
bys pid: gen nkids=(_N)
// list RINPERSOON ch_RINPERSOONMA ch_RINPERSOONPA ch_RINPERSOON vrlgbageboortejaar ch_vrlgbageboortejaar vrlgbageslacht ch_vrlgbageslacht nkid _merge  if RINPERSOON=="005023775", sepby(RINPERSOON)
// list RINPERSOON ch_RINPERSOONMA ch_RINPERSOONPA ch_RINPERSOON vrlgbageboortejaar ch_vrlgbageboortejaar vrlgbageslacht ch_vrlgbageslacht nkid _merge  if RINPERSOON=="793880022", sepby(RINPERSOON)
// list RINPERSOON ch_RINPERSOONMA ch_RINPERSOONPA ch_RINPERSOON vrlgbageboortejaar ch_vrlgbageboortejaar vrlgbageslacht ch_vrlgbageslacht nkid _merge, sepby(RINPERSOON)

*  Generate the birth order of the kids 
bys pid (ch_vrlgbageboortejaar ch_vrlgbageboortemaand): gen order_kids=_n if _merge==3

// list RINPERSOON ch_RINPERSOONMA ch_RINPERSOONPA ch_RINPERSOON vrlgbageboortejaar ch_vrlgbageboortejaar ch_vrlgbageboortemaand vrlgbageslacht ch_vrlgbageslacht nkid _merge, sepby(RINPERSOON)

*  Let's check if respondents had kids in the same year (ch_vrlgbageboortejaar[t]==ch_vrlgbageboortejaar[t+1])
egen sdyear = sd(ch_vrlgbageboortejaar), by(pid)

*  Check here if the birth month (ch_vrlgbageboortemaand) is correctly sorted
// list RINPERSOON ch_RINPERSOONMA ch_RINPERSOONPA ch_RINPERSOON vrlgbageboortejaar ch_vrlgbageboortejaar ch_vrlgbageboortemaand vrlgbageslacht ch_vrlgbageslacht nkid _merge if sdyear==0, sepby(RINPERSOON)


*  Replace nkids = 0 if the respondent doesn't have any kid 
replace nkids = 0 if order_kids >= .

*  similarly, replace order_kids if nkids==0
replace order_kids = 0 if nkids==0

*>> Check matching cases
fre _merge

*>> drop the _merge variable 
drop _merge

*>> Merge file 7

foreach n of numlist 2004/2018 {
merge 1:m pid ch_pid using "$cbs_file7_out\file7yearlyinfochild`n'1299anav1_pama.dta" , update
drop _merge
}


*>> Merge file 10
foreach n of numlist 2003/2018 {
merge m:1 ch_pid using "$cbs_file10_out\file10incomechild`n'0101anav1_new.dta"   , nogen update
}

*>> Merge file 11 - A
foreach n of numlist 2006/2017 {
merge m:1 ch_pid using "$cbs_file11_out\file11amedicinechild`n'anav1_new.dta"    , nogen update 
}

*>> Merge file 11 - B
foreach n of numlist 2009/2017 {
merge m:1 ch_pid using "$cbs_file11_out\file11bcarecostschild`n'anav1_new.dta"    , nogen update 
}



*>> Merge file 3
merge m:1 ch_pid using "$cbs_file3_out\file3livingtogetherchild2018anav1_wide.dta", update 
*>> Check matching cases
fre _merge

*>> drop the _merge variable 
drop _merge

*>> Merge file 4
merge m:1 ch_pid using "$cbs_file4_out\file4marriagechild2018anav1_wide.dta", update 

// browse RINPERSOON ch_RINPERSOON vrlgbageboortejaar ch_vrlgbageboortejaar  tot* ch_typeverbin* ch_aanvangverbintenis* ch_eindeverbintenis* ch_redenbeeindigingverbintenis* 


*>> drop the _merge variable 
drop _merge

*>> Merge file 5
merge m:1 pid using "$cbs_file5_out\file5livingtogetherparent2018anav1_wide.dta", update 

// browse RINPERSOON ch_RINPERSOON vrlgbageboortejaar ch_vrlgbageboortejaar  tot* ch_typeverbin* ch_aanvangverbintenis* ch_eindeverbintenis* ch_redenbeeindigingverbintenis* 

*>> drop the _merge variable 
drop _merge


*>> Merge file 6

merge m:1 pid using "$cbs_file6_out\file6marriageparent2018anav1_wide.dta", update 

drop _merge

*>> Merge file 8 

merge m:1 ch_pid using "$cbs_file8_out\file8grandchildrenanav1_new.dta", update 

drop _merge  


*>> Merge with SHARE wide data 
*  First change the storage type of the SHARE ID variable (from strL to str32), otherwise we cannot do the merge later on 
recast str32 Nl_mergeid_crypt

*  Actual merge 
merge m:1 Nl_mergeid_crypt using "$share_all_out\SHARE_WIDE_6.1.0.dta", update 

*  Keep only merged variables 
// keep if _merge==3



*>> Drop cases 
*  When we don't have any information on kids
// drop if ch_pid==""

*  When the cases are not matched 
// drop if _merge!=3

*  When children have the same age of their parents (or when they are younger)
gen diffyear_parent_children = ch_vrlgbageboortejaar-vrlgbageboortejaar 
fre diffyear_parent_children                                      			// Only two cases 
drop if diffyear_parent_children<=0
drop diffyear_parent_children 

* Sort the dataset 
sort pid Nl_mergeid_crypt ch_pid ch_vrlgbageboortejaar 

* Drop the Nl_mergeid_crypt of the partner because we don't need it
drop Nl_mergeidp1_crypt_w1 Nl_mergeidp2_crypt_w1 Nl_mergeidp4_crypt_w1 Nl_mergeidp5_crypt_w1 	/// 
Nl_mergeidp1_crypt_w2 Nl_mergeidp2_crypt_w2 Nl_mergeidp4_crypt_w2 Nl_mergeidp5_crypt_w2 		/// 
Nl_mergeidp1_crypt_w3 Nl_mergeidp2_crypt_w3 Nl_mergeidp4_crypt_w3 Nl_mergeidp5_crypt_w3 		/// 
Nl_mergeidp1_crypt_w4 Nl_mergeidp2_crypt_w4 Nl_mergeidp4_crypt_w4 Nl_mergeidp5_crypt_w4


*>> Generate number of dyads
bys Nl_mergeid_crypt: gen n_dyad=_n

*>> Check for uniqueness of the IDs  (combined)
// isid Nl_mergeid_crypt n_dyad 	// Okay
// isid pid n_dyad                  // Okay

*>> Create dyad IDs 
drop if Nl_mergeid_crypt==""
isid Nl_mergeid_crypt n_dyad
egen pid_dyad = group(Nl_mergeid_crypt n_dyad)

*  Check uniqueness
isid pid_dyad


*>> Save this dataset 
save "$merged_cbs_share_out\CBS-SHARE_LONG_dyads.dta", replace 




************************************************************************************************* 
* Reshape                                                                                       * 
************************************************************************************************* 

*>> Now reshape (long again) the dataset, so that for each dyad we will have - for example - the health condition at time t, t+1, t+2, t+3 
reshape long /// 
country_w@ ///
fi_excl_mh_w@ /// 
gender_w@ ///
mobirth_w@ ///
yrbirth_w@ ///
age_int_w@ ///
mobirthp_w@ ///
yrbirthp_w@ ///
partnerinhh_w@ ///
hhsize_w@ ///
fam_resp_w@ ///
hou_resp_w@ ///
interview_w@ ///
int_year_w@ ///
int_month_w@ ///
mh002__w@ ///
mh003__w@ ///
mh004__w@ ///
mh005__w@ ///
mh006__w@ ///
mh007__w@ ///
mh008__w@ ///
mh009__w@ ///
mh010__w@ ///
mh011__w@ ///
mh012__w@ ///
mh013__w@ ///
mh014__w@ ///
mh015__w@ ///
mh016__w@ ///
mh017__w@ ///
casp_w@ ///
cusmoke_w@ ///
drinkin2_w@ ///
eurod_w@ ///
ph004__w@ ///
ph005__w@ ///
FI_heartattack_w@ ///
FI_hypertension_w@ ///
FI_stroke_w@ ///
FI_diabetes_w@ ///
FI_lungdisease_w@ ///
FI_arthritis_w@ ///
FI_osteoporosis_w@ ///
FI_cancer_w@ ///
FI_parkinson_w@ ///
FI_fracture_w@ ///
ph010d3_w@ ///
ph010d7_w@ ///
ph010d8_w@ ///
ph010d9_w@ ///
ph013__w@ ///
ph043__w@ ///
ph044__w@ ///
ph046__w@ ///
FI_walk100_w@ ///
FI_chair_w@ ///
FI_stairs_w@ ///
FI_arms_w@ ///
FI_lift5kg_w@ ///
FI_dressing_w@ ///
FI_walkRoom_w@ ///
FI_bathing_w@ ///
FI_eating_w@ ///
FI_bed_w@ ///
FI_toilet_w@ ///
ph049d7_w@ ///
FI_hotmeal_w@ ///
FI_shopping_w@ ///
FI_phone_w@ ///
FI_medications_w@ ///
FI_garden_w@ ///
FI_money_w@ ///
srh_w@ ///
ph012_w@ ///
implicat_w@ ///
exrate_w@ ///
home_w@ ///
mort_w@ ///
ores_w@ ///
fahc_w@ ///
fohc_w@ ///
bacc_w@ ///
bsmf_w@ ///
slti_w@ ///
vbus_w@ ///
sbus_w@ ///
car_w@ ///
liab_w@ ///
thinc_w@ ///
hnetw_w@ ///
hrass_w@ ///
hgfass_w@ ///
hnfass_w@ ///
yedu_w@ ///
yedu_p_w@ ///
mstat_w@ ///
nchild_w@ ///
ngrchild_w@ ///
eyesightr_w@ ///
hearing_w@ ///
bmi_w@ ///
weight_w@ ///
height_w@ ///
esmoked_w@ ///
phinact_w@ ///
orienti_w@ ///
maxgrip_w@ ///
doctor_w@ ///
hospital_w@ ///
thospital_w@ ///
nhospital_w@ ///
cjs_w@ ///
pwork_w@ ///
empstat1_w@ ///
empstat2_w@ ///
ghto_w@ ///
ghih_w@ ///
otrf_w@ ///
fdistress_w@ ///
nalm_w@ ///
home_f_w@ ///
mort_f_w@ ///
ores_f_w@ ///
fahc_f_w@ ///
fohc_f_w@ ///
bacc_f_w@ ///
bsmf_f_w@ ///
slti_f_w@ ///
vbus_f_w@ ///
sbus_f_w@ ///
car_f_w@ ///
liab_f_w@ ///
thinc_f_w@ ///
hrass_f_w@ ///
hgfass_f_w@ ///
hnfass_f_w@ ///
hnetw_f_w@ ///
gender_f_w@ ///
yedu_f_w@ ///
yedu_p_f_w@ ///
isced_f_w@ ///
sphus_f_w@ ///
mstat_f_w@ ///
nchild_f_w@ ///
ngrchild_f_w@ ///
eyesightr_f_w@ ///
hearing_f_w@ ///
bmi_f_w@ ///
weight_f_w@ ///
height_f_w@ ///
esmoked_f_w@ ///
phinact_f_w@ ///
orienti_f_w@ ///
maxgrip_f_w@ ///
doctor_f_w@ ///
hospital_f_w@ ///
thospital_f_w@ ///
nhospital_f_w@ ///
cjs_f_w@ ///
pwork_f_w@ ///
empstat1_f_w@ ///
empstat2_f_w@ ///
otrf_f_w@ ///
fdistress_f_w@ ///
nalm_f_w@ ///
income_implicatmean_w@ ///
wealth_implicatmean_w@ ///
dn014__w@ ///
br001__w@ ///
br002__w@ ///
br003__w@ ///
br010__w@ ///
br015__w@ ///
br016__w@ ///
sp008__w@ ///
sp009_1_w@ ///
sp009_2_w@ ///
sp009_3_w@ ///
sp010d1_1_w@ ///
sp010d1_2_w@ ///
sp010d1_3_w@ ///
sp010d2_1_w@ ///
sp010d2_2_w@ ///
sp010d2_3_w@ ///
sp010d3_1_w@ ///
sp010d3_2_w@ ///
sp010d3_3_w@ ///
sp011_1_w@ ///
sp011_2_w@ ///
sp011_3_w@ ///
sp012_1_w@ ///
sp012_2_w@ ///
sp012_3_w@ ///
sp013_1_w@ ///
sp013_2_w@ ///
sp014__w@ ///
sp015d1_w@ ///
sp015d2_w@ ///
sp015d3_w@ ///
sp015d4_w@ ///
sp015d5_w@ ///
sp015d6_w@ ///
sp015d7_w@ ///
sp015d8_w@ ///
sp015d9_w@ ///
sp015d10_w@ ///
sp015d11_w@ ///
sp015d12_w@ ///
sp015d13_w@ ///
sp015d14_w@ ///
sp015d15_w@ ///
sp015d16_w@ ///
sp015d17_w@ ///
sp015d18_w@ ///
sp015d19_w@ ///
sp015d20_w@ ///
sp015d21_w@ ///
sp016_1_w@ ///
sp016_2_w@ ///
sp016_3_w@ ///
sp016_4_w@ ///
sp016_5_w@ ///
sp016_6_w@ ///
sp016_7_w@ ///
sp016_8_w@ ///
sp016_11_w@ ///
sp016_12_w@ ///
sp016_14_w@ ///
sp016_17_w@ ///
sp017_1_w@ ///
sp017_2_w@ ///
sp017_3_w@ ///
sp017_4_w@ ///
sp017_5_w@ ///
sp017_6_w@ ///
sp017_7_w@ ///
sp017_8_w@ ///
sp017_11_w@ ///
sp017_12_w@ ///
sp017_14_w@ ///
sp017_17_w@ ///
sp018__w@ ///
sp019d1_w@ ///
sp019d2_w@ ///
sp019d3_w@ ///
sp019d4_w@ ///
sp019d5_w@ ///
sp019d6_w@ ///
sp019d7_w@ ///
sp019d8_w@ ///
sp019d9_w@ ///
sp019d10_w@ ///
sp019d11_w@ ///
sp019d12_w@ ///
sp019d13_w@ ///
sp019d14_w@ ///
sp019d15_w@ ///
sp019d16_w@ ///
sp019d17_w@ ///
sp019d18_w@ ///
sp019d19_w@ ///
sp019d20_w@ ///
sp019d21_w@ ///
sp019d22_w@ ///
sp019d23_w@ ///
sp019d24_w@ ///
sp019d25_w@ ///
sp019d26_w@ ///
sp019d27_w@ ///
sp019d28_w@ ///
sp019d29_w@ ///
sp019d30_w@ ///
sp019d31_w@ ///
sp019d32_w@ ///
sp019d33_w@ ///
sp020__w@ ///
fin_resp_w@ ///
mn005__w@ ///
language_w@ ///
ch001__w@ ///
ch002__w@ ///
ch005_1_w@ ///
ch005_2_w@ ///
ch005_3_w@ ///
ch005_4_w@ ///
ch005_5_w@ ///
ch005_6_w@ ///
ch005_7_w@ ///
ch005_8_w@ ///
ch005_9_w@ ///
ch005_10_w@ ///
ch005_11_w@ ///
ch005_12_w@ ///
ch005_13_w@ ///
ch005_14_w@ ///
ch005_15_w@ ///
ch005_16_w@ ///
ch005_17_w@ ///
ch006_1_w@ ///
ch006_2_w@ ///
ch006_3_w@ ///
ch006_4_w@ ///
ch006_5_w@ ///
ch006_6_w@ ///
ch006_7_w@ ///
ch006_8_w@ ///
ch006_9_w@ ///
ch006_10_w@ ///
ch006_11_w@ ///
ch006_12_w@ ///
ch006_13_w@ ///
ch006_14_w@ ///
ch006_15_w@ ///
ch006_16_w@ ///
ch006_17_w@ ///
ch007_1_w@ ///
ch007_2_w@ ///
ch007_3_w@ ///
ch007_4_w@ ///
ch007_5_w@ ///
ch007_6_w@ ///
ch007_7_w@ ///
ch007_8_w@ ///
ch007_9_w@ ///
ch007_10_w@ ///
ch007_11_w@ ///
ch007_12_w@ ///
ch007_13_w@ ///
ch007_14_w@ ///
ch007_15_w@ ///
ch007_16_w@ ///
ch007_17_w@ ///
ch008c_1_w@ ///
ch008c_2_w@ ///
ch008c_3_w@ ///
ch008c_4_w@ ///
ch008c_5_w@ ///
ch008c_6_w@ ///
ch008c_7_w@ ///
ch008c_8_w@ ///
ch008c_9_w@ ///
ch008c_10_w@ ///
ch008c_11_w@ ///
ch008c_12_w@ ///
ch008c_14_w@ ///
ch010_1_w@ ///
ch010_2_w@ ///
ch010_3_w@ ///
ch010_4_w@ ///
ch011_1_w@ ///
ch011_2_w@ ///
ch011_3_w@ ///
ch011_4_w@ ///
ch012_1_w@ ///
ch012_2_w@ ///
ch012_3_w@ ///
ch012_4_w@ ///
ch013_1_w@ ///
ch013_2_w@ ///
ch013_3_w@ ///
ch013_4_w@ ///
ch014_1_w@ ///
ch014_2_w@ ///
ch014_3_w@ ///
ch014_4_w@ ///
ch015_1_w@ ///
ch015_2_w@ ///
ch015_3_w@ ///
ch015_4_w@ ///
ch016_1_w@ ///
ch016_2_w@ ///
ch016_3_w@ ///
ch016_4_w@ ///
ch017_1_w@ ///
ch017_2_w@ ///
ch017_3_w@ ///
ch017_4_w@ ///
ch018d1_1_w@ ///
ch018d1_2_w@ ///
ch018d1_3_w@ ///
ch018d1_4_w@ ///
ch018d2_1_w@ ///
ch018d2_2_w@ ///
ch018d2_3_w@ ///
ch018d2_4_w@ ///
ch018d3_1_w@ ///
ch018d3_2_w@ ///
ch018d3_3_w@ ///
ch018d3_4_w@ ///
ch018d4_1_w@ ///
ch018d4_2_w@ ///
ch018d4_3_w@ ///
ch018d4_4_w@ ///
ch018d5_1_w@ ///
ch018d5_2_w@ ///
ch018d5_3_w@ ///
ch018d5_4_w@ ///
ch018d6_1_w@ ///
ch018d6_2_w@ ///
ch018d6_3_w@ ///
ch018d6_4_w@ ///
ch018d7_1_w@ ///
ch018d7_2_w@ ///
ch018d7_3_w@ ///
ch018d7_4_w@ ///
ch018d8_1_w@ ///
ch018d8_2_w@ ///
ch018d8_3_w@ ///
ch018d8_4_w@ ///
ch018d9_1_w@ ///
ch018d9_2_w@ ///
ch018d9_3_w@ ///
ch018d9_4_w@ ///
ch018d10_1_w@ ///
ch018d10_2_w@ ///
ch018d10_3_w@ ///
ch018d10_4_w@ ///
ch018d11_1_w@ ///
ch018d11_2_w@ ///
ch018d11_3_w@ ///
ch018d11_4_w@ ///
ch018d12_1_w@ ///
ch018d12_2_w@ ///
ch018d12_3_w@ ///
ch018d12_4_w@ ///
ch018d13_1_w@ ///
ch018d13_2_w@ ///
ch018d13_3_w@ ///
ch018d13_4_w@ ///
ch018d95_1_w@ ///
ch018d95_2_w@ ///
ch018d95_3_w@ ///
ch018d95_4_w@ ///
ch018dno_1_w@ ///
ch018dno_2_w@ ///
ch018dno_3_w@ ///
ch018dno_4_w@ ///
ch018dot_1_w@ ///
ch018dot_2_w@ ///
ch018dot_3_w@ ///
ch018dot_4_w@ ///
ch019_1_w@ ///
ch019_2_w@ ///
ch019_3_w@ ///
ch019_4_w@ ///
ch020_1_w@ ///
ch020_2_w@ ///
ch020_3_w@ ///
ch020_4_w@ ///
ch021__w@ ///
ch022__w@ ///
ch023__w@ ///
chselch1_w@ ///
chselch2_w@ ///
chselch3_w@ ///
chselch4_w@ ///
thinc2_w@ ///
empstat_w@ ///
thinc2_f_w@ ///
empstat_f_w@ ///
dn044__w@ ///
br022__w@ ///
perho_w@ ///
naly_w@ ///
saly_w@ ///
perho_f_w@ ///
naly_f_w@ ///
saly_f_w@ ///
sp016_16_w@ ///
sp019d1sn_w@ ///
sp019d2sn_w@ ///
sp019d3sn_w@ ///
sp019d4sn_w@ ///
sp019d5sn_w@ ///
sp019d6sn_w@ ///
sp019d7sn_w@ ///
sp019d1sp_w@ ///
sp019d2sp_w@ ///
sp019d3sp_w@ ///
sp019d4sp_w@ ///
sp019d5sp_w@ ///
sp019d6sp_w@ ///
sp019d7sp_w@ ///
sp019d8sp_w@ ///
sp019d9sp_w@ ///
sp019d19sp_w@ ///
sp019d20sp_w@ ///
sp019d21sp_w@ ///
sp019d22sp_w@ ///
sp019d23sp_w@ ///
sp019d24sp_w@ ///
sp019d25sp_w@ ///
sp019d26sp_w@ ///
sp019d27sp_w@ ///
sp019d28sp_w@ ///
sp019d29sp_w@ ///
sp019d30sp_w@ ///
sp019d31sp_w@ ///
sp019d32sp_w@ ///
sp019d34sp_w@ ///
sp019d35sp_w@ ///
sp019d36sp_w@ ///
sp019d37sp_w@ ///
sp019dno_w@ ///
sn005_1_w@ ///
sn005_2_w@ ///
sn005_3_w@ ///
sn005_4_w@ ///
sn005_5_w@ ///
sn005_6_w@ ///
sn005_7_w@ ///
ch002_1_w@ ///
ch002_2_w@ ///
ch002_3_w@ ///
ch002_4_w@ ///
ch002_5_w@ ///
ch002_6_w@ ///
ch002_7_w@ ///
ch002_8_w@ ///
ch002_9_w@ ///
ch002_10_w@ ///
ch002_11_w@ ///
ch002_12_w@ ///
ch002_16_w@ ///
ch010_5_w@ ///
ch010_6_w@ ///
ch010_7_w@ ///
ch011_5_w@ ///
ch011_6_w@ ///
ch011_7_w@ ///
ch011_8_w@ ///
ch012_5_w@ ///
ch012_6_w@ ///
ch012_7_w@ ///
ch012_8_w@ ///
ch012_9_w@ ///
ch012_10_w@ ///
ch012_11_w@ ///
ch012_12_w@ ///
ch012_16_w@ ///
ch013_5_w@ ///
ch013_6_w@ ///
ch013_7_w@ ///
ch013_8_w@ ///
ch013_9_w@ ///
ch013_10_w@ ///
ch013_11_w@ ///
ch013_12_w@ ///
ch014_5_w@ ///
ch014_6_w@ ///
ch014_7_w@ ///
ch014_8_w@ ///
ch014_9_w@ ///
ch014_10_w@ ///
ch014_11_w@ ///
ch014_12_w@ ///
ch014_13_w@ ///
ch014_14_w@ ///
ch014_16_w@ ///
ch015_5_w@ ///
ch015_6_w@ ///
ch015_7_w@ ///
ch015_8_w@ ///
ch015_9_w@ ///
ch015_10_w@ ///
ch015_16_w@ ///
ch016_5_w@ ///
ch016_6_w@ ///
ch016_7_w@ ///
ch016_8_w@ ///
ch016_9_w@ ///
ch016_10_w@ ///
ch016_11_w@ ///
ch016_12_w@ ///
ch016_13_w@ ///
ch016_14_w@ ///
ch016_16_w@ ///
ch017_5_w@ ///
ch017_6_w@ ///
ch017_7_w@ ///
ch017_8_w@ ///
ch017_9_w@ ///
ch017_10_w@ ///
ch017_11_w@ ///
ch017_12_w@ ///
ch017_16_w@ ///
ch018d1_5_w@ ///
ch018d1_6_w@ ///
ch018d1_7_w@ ///
ch018d1_8_w@ ///
ch018d1_9_w@ ///
ch018d1_10_w@ ///
ch018d1_11_w@ ///
ch018d1_12_w@ ///
ch018d1_16_w@ ///
ch018d2_5_w@ ///
ch018d2_6_w@ ///
ch018d2_7_w@ ///
ch018d2_8_w@ ///
ch018d2_9_w@ ///
ch018d2_10_w@ ///
ch018d2_11_w@ ///
ch018d2_12_w@ ///
ch018d2_16_w@ ///
ch018d3_5_w@ ///
ch018d3_6_w@ ///
ch018d3_7_w@ ///
ch018d3_8_w@ ///
ch018d3_9_w@ ///
ch018d3_10_w@ ///
ch018d3_11_w@ ///
ch018d3_12_w@ ///
ch018d3_16_w@ ///
ch018d4_5_w@ ///
ch018d4_6_w@ ///
ch018d4_7_w@ ///
ch018d4_8_w@ ///
ch018d4_9_w@ ///
ch018d4_10_w@ ///
ch018d4_11_w@ ///
ch018d4_12_w@ ///
ch018d4_16_w@ ///
ch018d5_5_w@ ///
ch018d5_6_w@ ///
ch018d5_7_w@ ///
ch018d5_8_w@ ///
ch018d5_9_w@ ///
ch018d5_10_w@ ///
ch018d5_11_w@ ///
ch018d5_12_w@ ///
ch018d5_16_w@ ///
ch018d6_5_w@ ///
ch018d6_6_w@ ///
ch018d6_7_w@ ///
ch018d6_8_w@ ///
ch018d6_9_w@ ///
ch018d6_10_w@ ///
ch018d6_11_w@ ///
ch018d6_12_w@ ///
ch018d6_16_w@ ///
ch018d7_5_w@ ///
ch018d7_6_w@ ///
ch018d7_7_w@ ///
ch018d7_8_w@ ///
ch018d7_9_w@ ///
ch018d7_10_w@ ///
ch018d7_11_w@ ///
ch018d7_12_w@ ///
ch018d7_16_w@ ///
ch018d8_5_w@ ///
ch018d8_6_w@ ///
ch018d8_7_w@ ///
ch018d8_8_w@ ///
ch018d8_9_w@ ///
ch018d8_10_w@ ///
ch018d8_11_w@ ///
ch018d8_12_w@ ///
ch018d8_16_w@ ///
ch018d9_5_w@ ///
ch018d9_6_w@ ///
ch018d9_7_w@ ///
ch018d9_8_w@ ///
ch018d9_9_w@ ///
ch018d9_10_w@ ///
ch018d9_11_w@ ///
ch018d9_12_w@ ///
ch018d9_16_w@ ///
ch018d10_5_w@ ///
ch018d10_6_w@ ///
ch018d10_7_w@ ///
ch018d10_8_w@ ///
ch018d10_9_w@ ///
ch018d10_10_w@ ///
ch018d10_11_w@ ///
ch018d10_12_w@ ///
ch018d10_16_w@ ///
ch018d11_5_w@ ///
ch018d11_6_w@ ///
ch018d11_7_w@ ///
ch018d11_8_w@ ///
ch018d11_9_w@ ///
ch018d11_10_w@ ///
ch018d11_11_w@ ///
ch018d11_12_w@ ///
ch018d11_16_w@ ///
ch018d12_5_w@ ///
ch018d12_6_w@ ///
ch018d12_7_w@ ///
ch018d12_8_w@ ///
ch018d12_9_w@ ///
ch018d12_10_w@ ///
ch018d12_11_w@ ///
ch018d12_12_w@ ///
ch018d12_16_w@ ///
ch018d13_5_w@ ///
ch018d13_6_w@ ///
ch018d13_7_w@ ///
ch018d13_8_w@ ///
ch018d13_9_w@ ///
ch018d13_10_w@ ///
ch018d13_16_w@ ///
ch018d95_5_w@ ///
ch018d95_6_w@ ///
ch018d95_7_w@ ///
ch018d95_8_w@ ///
ch018d95_9_w@ ///
ch018d95_10_w@ ///
ch018d95_11_w@ ///
ch018d95_12_w@ ///
ch018d95_16_w@ ///
ch018dno_5_w@ ///
ch018dno_6_w@ ///
ch018dno_7_w@ ///
ch018dno_8_w@ ///
ch018dno_9_w@ ///
ch018dno_10_w@ ///
ch018dno_16_w@ ///
ch018dot_5_w@ ///
ch018dot_6_w@ ///
ch018dot_7_w@ ///
ch018dot_8_w@ ///
ch018dot_9_w@ ///
ch018dot_10_w@ ///
ch018dot_11_w@ ///
ch018dot_12_w@ ///
ch018dot_16_w@ ///
ch019_5_w@ ///
ch019_6_w@ ///
ch019_7_w@ ///
ch019_8_w@ ///
ch019_9_w@ ///
ch019_10_w@ ///
ch019_11_w@ ///
ch019_12_w@ ///
ch019_16_w@ ///
ch020_5_w@ ///
ch020_6_w@ ///
ch020_7_w@ ///
ch020_8_w@ ///
ch020_9_w@ ///
ch020_10_w@ ///
ch020_16_w@ ///
ch504_1_w@ ///
ch504_2_w@ ///
ch504_3_w@ ///
ch504_4_w@ ///
ch504_5_w@ ///
ch504_6_w@ ///
ch504_7_w@ ///
ch504_8_w@ ///
ch504_9_w@ ///
ch504_10_w@ ///
ch504_11_w@ ///
ch504_12_w@ ///
ch504_13_w@ ///
ch504_14_w@ ///
ch504_15_w@ ///
ch504_17_w@ ///
ch505_1_w@ ///
ch505_2_w@ ///
ch505_3_w@ ///
ch505_4_w@ ///
ch505_5_w@ ///
ch505_6_w@ ///
ch505_7_w@ ///
ch505_8_w@ ///
ch505_9_w@ ///
ch505_10_w@ ///
ch505_11_w@ ///
ch505_12_w@ ///
ch505_13_w@ ///
ch505_14_w@ ///
ch505_17_w@ ///
ch508__w@ ///
ch509d1_w@ ///
ch509d2_w@ ///
ch509d3_w@ ///
ch509d4_w@ ///
ch509d5_w@ ///
ch509d6_w@ ///
ch510_1_w@ ///
ch510_2_w@ ///
ch510_6_w@ ///
ch511__w@ ///
ch512d1_w@ ///
ch512d2_w@ ///
ch512d3_w@ ///
ch512d4_w@ ///
ch512d5_w@ ///
ch512d6_w@ ///
ch514__w@ ///
ch515d1_w@ ///
ch515d2_w@ ///
ch515d3_w@ ///
ch515d4_w@ ///
ch515d5_w@ ///
ch515d6_w@ ///
ch515d7_w@ ///
ch515d8_w@ ///
ch515d9_w@ ///
ch516_1_w@ ///
ch516_2_w@ ///
ch516_3_w@ ///
ch516_4_w@ ///
ch516_5_w@ ///
ch516_6_w@ ///
ch516_7_w@ ///
ch516_8_w@ ///
ch517__w@ ///
ch518d1_w@ ///
ch518d2_w@ ///
ch518d3_w@ ///
ch518d4_w@ ///
ch518d5_w@ ///
ch518d6_w@ ///
ch518d7_w@ ///
ch518d8_w@ ///
ch518d9_w@ ///
ch518d10_w@ ///
ch518d11_w@ ///
ch518d12_w@ ///
ch519_1_w@ ///
ch519_2_w@ ///
ch519_3_w@ ///
ch519_4_w@ ///
ch519_5_w@ ///
ch519_6_w@ ///
ch519_7_w@ ///
ch519_8_w@ ///
ch520_1_w@ ///
ch520_2_w@ ///
ch520_3_w@ ///
ch520_4_w@ ///
ch520_5_w@ ///
ch520_6_w@ ///
ch520_7_w@ ///
ch520_8_w@ ///
ch524__w@ ///
ch525d1_w@ ///
ch525d2_w@ ///
ch525d3_w@ ///
ch525d4_w@ ///
ch525d5_w@ ///
ch525d6_w@ ///
ch525d7_w@ ///
ch525d8_w@ ///
ch525d9_w@ ///
ch525d10_w@ ///
ch525d12_w@ ///
ch525d13_w@ ///
ch525d14_w@ ///
ch525d16_w@ ///
ch526_1_w@ ///
ch526_2_w@ ///
ch526_3_w@ ///
ch526_4_w@ ///
ch526_5_w@ ///
ch526_6_w@ ///
ch526_7_w@ ///
ch526_8_w@ ///
ph013_w@ ///
ph012__w@ ///
lookjob_w@ ///
lookjob_f_w@ ///
ch513d1_1_w@ ///
ch513d1_2_w@ ///
ch513d1_3_w@ ///
ch513d1_4_w@ ///
ch513d1_5_w@ ///
ch513d1_6_w@ ///
ch513d2_1_w@ ///
ch513d2_2_w@ ///
ch513d2_3_w@ ///
ch513d2_4_w@ ///
ch513d2_5_w@ ///
ch513d2_6_w@ ///
ch513d3_1_w@ ///
ch513d3_2_w@ ///
ch513d3_3_w@ ///
ch513d3_4_w@ ///
ch513d3_5_w@ ///
ch513d3_6_w@ ///
ch513d4_1_w@ ///
ch513d4_2_w@ ///
ch513d4_3_w@ ///
ch513d4_4_w@ ///
ch513d4_5_w@ ///
ch513d4_6_w@ ///
ch513d5_1_w@ ///
ch513d5_2_w@ ///
ch513d5_3_w@ ///
ch513d5_4_w@ ///
ch513d5_5_w@ ///
ch513d5_6_w@ ///
ch513d6_1_w@ ///
ch513d6_2_w@ ///
ch513d6_3_w@ ///
ch513d6_4_w@ ///
ch513d6_5_w@ ///
ch513d6_6_w@ ///
ch513d7_1_w@ ///
ch513d7_2_w@ ///
ch513d7_3_w@ ///
ch513d7_4_w@ ///
ch513d7_5_w@ ///
ch513d7_6_w@ ///
ch513d8_1_w@ ///
ch513d8_2_w@ ///
ch513d8_3_w@ ///
ch513d8_4_w@ ///
ch513d8_5_w@ ///
ch513d8_6_w@ ///
ch513d9_1_w@ ///
ch513d9_2_w@ ///
ch513d9_3_w@ ///
ch513d9_4_w@ ///
ch513d9_5_w@ ///
ch513d9_6_w@ ///
ch513d10_1_w@ ///
ch513d10_2_w@ ///
ch513d10_3_w@ ///
ch513d10_4_w@ ///
ch513d10_5_w@ ///
ch513d10_6_w@ ///
ch513d11_1_w@ ///
ch513d11_2_w@ ///
ch513d11_3_w@ ///
ch513d11_4_w@ ///
ch513d11_5_w@ ///
ch513d11_6_w@ ///
ch513d12_1_w@ ///
ch513d12_2_w@ ///
ch513d12_3_w@ ///
ch513d12_4_w@ ///
ch513d12_5_w@ ///
ch513d12_6_w@ ///
ch513d95_1_w@ ///
ch513d95_2_w@ ///
ch513d95_3_w@ ///
ch513d95_4_w@ ///
ch513d95_5_w@ ///
ch513d95_6_w@ ///
ch513dot_1_w@ ///
ch513dot_2_w@ ///
ch513dot_3_w@ ///
ch513dot_4_w@ ///
ch513dot_5_w@ ///
ch513dot_6_w@ ///
FI_srh_w@ ///
FI_phactiv_w@ ///
FI_appetite_w@ ///
FI_longtermill_w@ ///
FI_fatigue_w@ ///
FI_sad_w@ ///
FI_enjoyment_w@ ///
FI_hopelessness_w@ ///
FI_orienti_w@ ///
bmi_cat_w@ ///
FI_bmi_w@ ///
FI_falling_w@ ///
FI_fearfall_w@ ///
FI_dizziness_w@ ///
FI_maxgrip_w@ ///
fi_w@ ///
isced_w@ ///
marital_w@ ///
nchild_cat_w@ ///
, i(pid_dyad) j(wave)



************************************************************************************************* 
* Case checks and corrections                                                                   * 
************************************************************************************************* 

*>> In this CBS file 1 we have some variables already imported form KOPPELCBS_SHARENL.dta (with different names)
*  Let's compare them
compare Geboortejaar vrlgbageboortejaar 

*>> Missing values in SHARE are replaced with CBS data 
*  Year of birth 
compare yrbirth_w vrlgbageboortejaar // we have only 1 case where: yrbirth>vrlgbageboortejaar
list Nl_mergeid_crypt rinpersoon pid pid_dyad yrbirth_w vrlgbageboortejaar gender_w if yrbirth_w>vrlgbageboortejaar , sepby(pid_dyad)

   *  Correct where: yrbirth>vrlgbageboortejaar (we trust more CBS data)
bys Nl_mergeid_crypt: replace yrbirth_w=vrlgbageboortejaar if yrbirth_w>vrlgbageboortejaar & yrbirth_w<. & vrlgbageboortejaar<.

   *  Correct where: yrbirth!=vrlgbageboortejaar & yrbirth>=.
bys Nl_mergeid_crypt: replace yrbirth_w=vrlgbageboortejaar if yrbirth_w!=vrlgbageboortejaar & yrbirth_w>=. & vrlgbageboortejaar<.

   *  Compare again 
compare yrbirth_w vrlgbageboortejaar
list Nl_mergeid_crypt rinpersoon pid pid_dyad yrbirth_w vrlgbageboortejaar gender_w if yrbirth_w>vrlgbageboortejaar , sepby(pid_dyad)


*>> Month of birth 
compare mobirth_w vrlgbageboortemaand

   *  Correct where: mobirth<vrlgbag~d (we trust more CBS data)
bys Nl_mergeid_crypt: replace mobirth_w=vrlgbageboortemaand if mobirth_w<vrlgbageboortemaand & mobirth_w<. & vrlgbageboortemaand<.

   *  Correct where: mobirth>vrlgbag~d (we trust more CBS data)
bys Nl_mergeid_crypt: replace mobirth_w=vrlgbageboortemaand if mobirth_w>vrlgbageboortemaand & mobirth_w<. & vrlgbageboortemaand<.

   *  Correct where: mobirth!=vrlgbageboortemaand & mobirth>=.
bys Nl_mergeid_crypt: replace mobirth_w=vrlgbageboortemaand if mobirth_w!=vrlgbageboortemaand & mobirth_w>=. & vrlgbageboortemaand<.

   *  Compare again 
compare mobirth_w vrlgbageboortemaand

*>> Gender 
*  Compare the variables 
tab   gender_w vrlgbageslacht 
tab   gender_w vrlgbageslacht, nola 
compare gender_w vrlgbageslacht 

*  Correct where: gender!=vrlgbageslacht & gender>=.
bys Nl_mergeid_crypt: replace gender_w=vrlgbageslacht if gender_w!=vrlgbageslacht & gender_w>=. & vrlgbageslacht<.   // No changes 



*>> Sort the dataset 
sort pid Nl_mergeid_crypt ch_pid ch_vrlgbageboortejaar wave

*>> Compress dataset
compress

*>> Remove any notes
notes drop *



*>> Save this dataset 
save "$merged_cbs_share_out\CBS-SHARE_LONG_panel.dta", replace 

*>> Close the log 
capture log close
