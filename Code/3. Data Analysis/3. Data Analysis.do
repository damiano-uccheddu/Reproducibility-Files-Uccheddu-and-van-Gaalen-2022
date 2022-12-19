*----------------------------------------------------------------------------------------------------*
* 	Preliminary operations 
*----------------------------------------------------------------------------------------------------*

* 	Clear the screen 
cls 

* 	Clear all 
clear all

* 	Debug mode 
pause on 

* 	Set the scheme 
set scheme s2mono

* 	Log file 
capture log close 
log using "$logfolder\3. Data Analysis.log", replace


*----------------------------------------------------------------------------------------------------*
* 	Check the initial number of cases we have in the SHARE long file
*----------------------------------------------------------------------------------------------------*

*	Open SHARE (long) 
use "$share_all_out\SHARE_LONG_6.1.0.dta", clear

*	Create a numeric ID that will substitute Nl_mergeid_crypt
egen temp_pid = group(Nl_mergeid_crypt)

*	Check the uniqueness of pid and wave 
isid temp_pid wave

*	Declare the longitudinal nature of the data 
xtset temp_pid wave

*	Describe the pattern of the panel 
fre gender 			// men = 5676 	(45.02%)	 women = 6932 (54.98%) 
xtdes  				// n   = 6493, 	N = 12608 	(6493 individuals * 4 waves = 12608 observations) 
xtdes if gender==1 	// n   = 2979, 	N = 5676 	(2979 men, 5676 observations)
xtdes if gender==2 	// n   = 3514, 	N = 6932 	(3514 women, 6932 observations)

* 	How many parents in the original dataset (precisely in wave 1)?
count if nchild>0 & wave==1 
recode nchild (1/99 = 1), gen(nchild_01)
tab nchild_01 if wave==1, miss // Of the initial Dutch respondents, 89.99 percent (n=2,761) had at least one child 



*----------------------------------------------------------------------------------------------------*
* 	Open the SHARE dataset merged long with CBS data (dyadic data) 
*----------------------------------------------------------------------------------------------------*

use "$merged_cbs_share_out\CBS-SHARE_LONG_panel.dta", clear

* 	Sort the dataset 
set sortseed 9876
sort 	Nl_mergeid_crypt pid 			///
		pid_dyad n_dyad 				///
		wave 							///
		ch_pid ch_vrlgbageboortejaar 	// children's RINPERSOON(S) and children's birth year

* 	Describe the data 
* 	Summary of the dataset 
desc, short



*----------------------------------------------------------------------------------------------------*
* 	Work with the dates: Create  date of interview, date of cohabitation, and other similar variables  
*----------------------------------------------------------------------------------------------------*

*>> Interview Date: 
* 	Generate interview date by using interview year and month 
gen 	interview_date 	= mdy(int_month_w, 15, int_year_w) 										// as a day, we use the middle of the month (15)
format 	interview_date %d

*>> Age (Generate age by using interview and birth year and month): 
* 	Parent 
gen 	birth_date 		= mdy(vrlgbageboortemaand, 15, vrlgbageboortejaar) 						// as a day, we use the middle of the month (15)
format 	birth_date %d
gen 	age				= round(((interview_date - birth_date)/(365/1)))

replace age = age_int_w if age >= . 

* 	Children 
gen 	ch_birth_date 	= mdy(ch_vrlgbageboortemaand, 15, ch_vrlgbageboortejaar) 				// as a day, we use the middle of the month (15)
format 	ch_birth_date %d
gen 	ch_age			= round(((interview_date - ch_birth_date)/(365/1)))
gen 	ch_age_precise	= 		((interview_date - ch_birth_date)/(365/1))

* 	Grandchildren 
foreach n of numlist 1/10 {
gen 	grch_birth_date`n' 	= mdy(grch_vrlgbageboortemaand`n', 15, grch_vrlgbageboortejaar`n') 	// as a day, we use the middle of the month (15)
format 	grch_birth_date`n' %d
gen 	grch_age`n'			= round(((interview_date - grch_birth_date`n')/(365/1)))
gen 	grch_age_precise`n'	= 		((interview_date - grch_birth_date`n')/(365/1))
}



*----------------------------------------------------------------------------------------------------*
* 	Cohabitation: 
*----------------------------------------------------------------------------------------------------*

*>>	Generate dates of children's start and end of cohabitation 
foreach n of numlist 1/6 {

* 	Start of cohabitation
gen 	ch_start_cohabitation_`n' = .
replace ch_start_cohabitation_`n' 	= dofc(ch_gbaaanvangsamenwoonperiode1_`n')	// -> "Date commencement of cohabitation period" ("datum aanvang van samenwoonperiode")
format 	ch_start_cohabitation_`n' 	%d 

* 	End of cohabitation
gen 	ch_end_cohabitation_`n' = .
replace ch_end_cohabitation_`n' 	= dofc(ch_gbaeindesamenwoonperiode1_`n')  	// -> "Date end of cohabitation period" ("datum einde van samenwoonperiode")
format 	ch_end_cohabitation_`n' 	%d 

* 	Rename reason of the end of the cohabitation
rename ch_gbaredeneindesamenwoonp1_`n' ch_reason_end_cohab_`n' 					// -> "Reason for the end of the cohabitation period" 	("reden voor het einde van de samenwoonperiode")
}


* 	Check 
	// We have so many cases at 01jan1995 in the variable ch_gbaaanvangsamenwoonperiode1_1 
	// because we don't have information before that date (e.g. fre ch_gbaaanvangsamenwoonperiode1_1) 
fre ch_start_cohabitation_1
fre ch_start_cohabitation_1 if ch_start_cohabitation_1==date("1/1/1995", "MDY", 2000)

	// The same is valid for end of cohabitation: 
	// so many cases at 31dec2018 because we don't have information after that date (e.g. ch_gbaeindesamenwoonperiode1_1)
fre ch_end_cohabitation_1
fre ch_end_cohabitation_1 	if ch_end_cohabitation_1==date("12/31/2018", "MDY", 2000) 	


*>> Time since entry into cohabitation
capture drop 	time_since_cohabitation_temp
gen 			time_since_cohabitation_temp	= . 

* 	We consider the first episode if there are more than 1 union dissolutions)
foreach n of numlist 1/6 { 
	bys pid_dyad (wave): replace time_since_cohabitation_temp = ((interview_date - ch_start_cohabitation_`n')/(365/1)) 	/// 
	if time_since_cohabitation_temp == . & ch_start_cohabitation_`n'!=. & ch_start_cohabitation_`n'!=date("1/1/1995", "MDY", 2000)
}
 
fre time_since_cohabitation_temp

recode time_since_cohabitation_temp 									///
									(0/2 	= 1 "0-2 years")   			///
									(2/4 	= 2 "2-4 years")   			///
									(4/6 	= 3 "4-6 years")  			///
									(6/8	= 4 "6-8 years") 			///
									(8/100 	= 5 "8+  years"), gen(time_since_cohabitation)
									
replace time_since_cohabitation = 6 if time_since_cohabitation_temp < 0 						// When child and partner are not cohabiting yet
replace time_since_cohabitation = 5 if ch_start_cohabitation_1==date("1/1/1995", "MDY", 2000) 	// 

*  Defining the label 
label define lab_time_since_cohabitation 	///
	6 "Not cohabiting yet" 					/// 
	1 "0-2 years" 							///
	2 "2-4 years" 							/// 
	3 "4-6 years" 							///
	4 "6-8 years" 							/// 
	5 "8+  years"

*  Label creation
label variable time_since_cohabitation "Time since cohabitation"
label values time_since_cohabitation lab_time_since_cohabitation

* 	Check the variable 
fre time_since_cohabitation 

 
*----------------------------------------------------------------------------------------------------*
* 	Years before/after union dissolution
*----------------------------------------------------------------------------------------------------*

* 	Create the variable 
foreach n of numlist 1/6 {
	bys pid_dyad (wave): gen years_ba_union_dissolution_`n' 	= ((interview_date - ch_end_cohabitation_`n')/(365/1)) 	if ch_end_cohabitation_`n'!= date("12/31/2018", "MDY", 2000) & ch_start_cohabitation_`n'!=date("1/1/1995", "MDY", 2000)
}

* 	Replace years before/after union dissolution == .a when the children die (because bereavement is a different phenomenon)
foreach n of numlist 1/6 {
bys pid_dyad (wave): replace years_ba_union_dissolution_`n' = .a if /// Below the conditions that exclude those children who die:
		ch_reason_end_cohab_`n' == 7 | 								///	-> 7 "Cohabitation period ended by death of person" 
		ch_reason_end_cohab_`n' == 9  								// 	-> 9 "Cohabitation period ended by simultaneous death of person and partner"
}		

* 	Replace years before/after union dissolution == .b when the cohabitation is still going on
foreach n of numlist 1/6 {
bys pid_dyad (wave): replace years_ba_union_dissolution_`n' = .b if /// Below the conditions that exclude those who are still cohabiting: 
		ch_reason_end_cohab_`n' == 0  								// 	-> 0 "Living period existed on yyyy1231"
}		

* Check
count if ch_reason_end_cohab_1 != 0 & ch_end_cohabitation_1 == date("12/31/2018", "MDY", 2000)

 
 

*----------------------------------------------------------------------------------------------------*
* 	Index variable (based on years before/after union dissolution) 
*----------------------------------------------------------------------------------------------------*

*>> Generate an index variable counting the years before and after union dissolution 
capture drop union_dissolution_index 
gen union_dissolution_index = . 

* 	We consider the first episode if there are more than 1 union dissolutions)
foreach n of numlist 1/6 { 
	bys pid_dyad (wave): replace union_dissolution_index = years_ba_union_dissolution_`n' if union_dissolution_index == . & years_ba_union_dissolution_`n' != . 
}

* 	Label the variable 
label variable union_dissolution_index "Years before/after union dissolution"

* 	Tabulate
fre union_dissolution_index


*----------------------------------------------------------------------------------------------------*
* 	Union dissolution variables 
*----------------------------------------------------------------------------------------------------*

*>> union_dissolution dummy 
gen union_dissolution_dummy = 0
replace union_dissolution_dummy = 1 if union_dissolution_index >= 0 & union_dissolution_index < .

fre union_dissolution_dummy

*>> union_dissolution splines - Dummy years before/after union dissolution
capture drop union_dissolution_splines 
gen union_dissolution_splines 	= 3 // this is the reference category
replace union_dissolution_splines = 1 if union_dissolution_index >=	-4 	& union_dissolution_index < -2
replace union_dissolution_splines = 2 if union_dissolution_index >=	-2 	& union_dissolution_index < 0 
replace union_dissolution_splines = 4 if union_dissolution_index >= 0 	& union_dissolution_index < 2	
replace union_dissolution_splines = 5 if union_dissolution_index >= 2 	& union_dissolution_index < 4	
replace union_dissolution_splines = 6 if union_dissolution_index >= 4 	& union_dissolution_index < 6

fre union_dissolution_splines

*  Defining the label 
label define lab_union_dissolution_spline 	///
	1 "-4/-2 years" 						/// 
	2 "-2/0 years"   						///
	3 "0 (Ref.)" 							/// 
	4 "0/2 years"      						///
	5 "2/4 years" 							/// 
	6 "4/6 years" 							//

*  Label creation
label variable union_dissolution_splines "Years before/after child separation"
label values union_dissolution_splines lab_union_dissolution_spline


*----------------------------------------------------------------------------------------------------*
* 	Marriage before separation 
*----------------------------------------------------------------------------------------------------*

*>> Marriage
foreach n of numlist 1/4 {
* 	Start of marriage 
gen ch_start_marriage_`n' = dofc(ch_aanvangverbintenis`n') 			// -> "Commencement date of the commitment" 	("datum aanvang van de verbintenis")
format ch_start_marriage_`n' %d

* 	End of marriage 
gen ch_end_marriage_`n' = dofc(ch_eindeverbintenis`n') 				// -> "Date of termination of the commitment" 	("datum be indiging van de verbintenis")
format ch_end_marriage_`n' %d 

* 	Reason of the end (cohabitation and marriage)
rename ch_redenbeeindigingverbintenis`n' ch_reason_end_marriage_`n' // -> "Reason for termination of the commitment" 	("reden be indiging van de verbintenis")
}

*>> Check 
// ch_start_marriage_1 // this should be different from . (missing)
count if ch_start_marriage_1!=. 									/// we have a "marriage before separation" only if marriage started (i.e. ch_start_marriage_1!=.)
& ch_pid_mar_partner1  ==  ch_pid_cohab_partner_1 					/// and only if the married partner (ch_pid_mar_partner1) 
																	// 	is the same as the cohabiting parnter (ch_pid_cohab_partner_1)

																				
*>> Generate a variable that indicate whether children were married before union dissolution 
capture drop marriage_before_separation 
gen marriage_before_separation = . 

* 	We consider the first episode if there are more than 1 union dissolutions)
foreach n of numlist 1/4 { 
	bys pid_dyad (wave): replace marriage_before_separation = 0 if ch_start_marriage_`n' == . & ch_start_cohabitation_`n' != . & marriage_before_separation == .
	bys pid_dyad (wave): replace marriage_before_separation = 1 if ch_start_marriage_`n' != . & ch_pid_mar_partner`n'  ==  ch_pid_cohab_partner_`n' & marriage_before_separation == .
}

* 	Just label the variable 
label variable marriage_before_separation "Married before union dissolution"

* 	Tabulate
fre marriage_before_separation
  

*----------------------------------------------------------------------------------------------------*
* 	Child's marital situation 
*----------------------------------------------------------------------------------------------------*

*>> Repartnering
*	Create the variable "Years before/after repartnering" considering the second episode of cohabitation 
foreach n of numlist 2/6 {
	bys pid_dyad (wave): gen years_ba_repartnering_`n' 	= ((interview_date - ch_start_cohabitation_`n')/(365/1)) 	
}

* Generate an index variable counting the years before and after repartnering 
gen repartnering_index = . 

* 	We consider the *second* episode if there are more than 1 episodes of repartnering
foreach n of numlist 2/6 {
	bys pid_dyad (wave): replace repartnering_index = years_ba_repartnering_`n' if repartnering_index == . 
}

*>>	Label the variable 
label variable repartnering_index "Years before/after repartnering"

* 	Tabulate
fre repartnering_index

*>> Create a repartnering dummy
capture drop repartnering_dummy
gen 	repartnering_dummy = 0  							// Those who do not experience the transition into repartnering are set to 0
replace repartnering_dummy = 0 if repartnering_index <   0 	// Years before repartnering are set to 0
replace repartnering_dummy = 1 if repartnering_index >=  0 & repartnering_index < . 


* 	Label variable 
label variable repartnering_dummy "Repartnering dummy"

* 	Tabulate 
fre repartnering_dummy

*>> Duration variable for years after repartnering
gen 	repartnering_duration = repartnering_index
replace repartnering_duration = 0 if repartnering_duration < 0 	// years before repartnering are set to 0

* 	Label variable 
label variable repartnering_duration "Years since repartnering"


*>> Repartnering with the same partner 
capture drop ch_repartnering_back_together
gen ch_repartnering_back_together = . 

foreach n of numlist 1/5 {
local i = `n' + 1
replace ch_repartnering_back_together = 0 if ch_pid_cohab_partner_`n' != ch_pid_cohab_partner_`i' & ch_start_cohabitation_`i'>interview_date 	& ch_start_cohabitation_`n'!=.  & ch_repartnering_back_together == . 	
replace ch_repartnering_back_together = 1 if ch_pid_cohab_partner_`n' == ch_pid_cohab_partner_`i' & ch_start_cohabitation_`i'>interview_date 	& ch_start_cohabitation_`n'!=.  & (ch_repartnering_back_together == . | ch_repartnering_back_together == 0)
}

// list pid_dyad ch_start_cohabitation_1 ch_start_cohabitation_2 interview_date ch_end_cohabitation_1 ch_end_cohabitation_2 ch_pid_cohab_partner_1 ch_pid_cohab_partner_2 ch_rep, sepby(pid_dyad)
// list interview_date ch_start_cohabitation_* ch_end_cohabitation_* ch_pid_cohab_partner_* ch_rep if pid_dyad==704, sepby(pid_dyad)



*>> Legal divorce dummy

* 	Create the variable 
foreach n of numlist 1/4 {
	bys pid_dyad (wave): gen years_ba_divorce_`n' 	= ((interview_date - ch_end_marriage_`n')/(365/1))
}

*>> Generate an index variable counting the years before and after divorce 
gen divorce_index = . 

* 	We consider the first episode if there are more than 1 episodes of divorce
foreach n of numlist 1/4 {
	bys pid_dyad (wave): replace divorce_index = years_ba_divorce_`n' if divorce_index == . 
}

*>>	Label the variable 
label variable divorce_index "Years before/after divorce"

* 	Generate the variable 
capture drop divorce_dummy
gen 	divorce_dummy = 0  							// Those who do not experience the transition into divorce are set to 0
replace divorce_dummy = 0 if divorce_index <   0 	// Years before divorce are set to 0
replace divorce_dummy = 1 if divorce_index >=  0 & divorce_index < . 


* 	Label variable 
label variable divorce_dummy "divorce dummy"

* 	Tabulate 
fre divorce_dummy


*>> Generate variable marital situation
gen ch_marital_status = 0
replace ch_marital_status = 1 if divorce_dummy == 0 & repartnering_dummy == 1 
replace ch_marital_status = 2 if divorce_dummy == 1 & repartnering_dummy == 0 


*----------------------------------------------------------------------------------------------------*
* 	Legal divorce variables 
*----------------------------------------------------------------------------------------------------*

*>> union_dissolution dummy 
gen legal_div_dummy = 0
replace legal_div_dummy = 1 if divorce_index >= 0 & divorce_index < .

fre legal_div_dummy

*>> legal_div splines - Dummy years before/after union dissolution
capture drop legal_div_splines 
gen legal_div_splines 	= 3 		// this is the reference category
replace legal_div_splines = 1 if divorce_index >=	-4 	& divorce_index < -2
replace legal_div_splines = 2 if divorce_index >=	-2 	& divorce_index < 0 
replace legal_div_splines = 4 if divorce_index >= 0 	& divorce_index < 2	
replace legal_div_splines = 5 if divorce_index >= 2 	& divorce_index < 4	
replace legal_div_splines = 6 if divorce_index >= 4 	& divorce_index < 6

fre legal_div_splines

*  Defining the label 
label define lab_legal_div_spline 	///
	1 "-4/-2 years" 				/// 
	2 "-2/0 years"   				///
	3 "0 (Ref.)" 					/// 
	4 "0/2 years"      				///
	5 "2/4 years" 					/// 
	6 "4/6 years" 					//

*  Label creation
label variable legal_div_splines "Years before/after child legal divorce"
label values legal_div_splines lab_legal_div_spline


*----------------------------------------------------------------------------------------------------*
* 	Grandchildren involvement in the union_dissolution process 
*----------------------------------------------------------------------------------------------------*

*>> Age of grandchild at the date of parental separation
capture drop age_grch_at_separation_*

	// We consider the youngest grandchild if there are more than 1 grandchild) 
	// (difference between birth date of children and parental separation date)

	foreach i of numlist 10 9 8 7 6 5 4 3 2 1 { 	
	bys pid_dyad (wave): gen age_grch_at_separation_`i' = ((ch_end_cohabitation_1-grch_birth_date`i')/(365/1)) 	
}

fre age_grch_at_separation_*

*>> Create a dummy variable for the presence of at least one young kid in the hh during union_dissolution
* 	We consider the first grandchild born
capture drop kid_involved
gen 	kid_involved = 0 
replace kid_involved = 1 if age_grch_at_separation_10 >=-2 & age_grch_at_separation_10 < 19 & ch_end_cohabitation_1 != date("12/31/2018", "MDY", 2000)
replace kid_involved = 1 if age_grch_at_separation_9  >=-2 & age_grch_at_separation_9  < 19 & ch_end_cohabitation_1 != date("12/31/2018", "MDY", 2000)
replace kid_involved = 1 if age_grch_at_separation_8  >=-2 & age_grch_at_separation_8  < 19 & ch_end_cohabitation_1 != date("12/31/2018", "MDY", 2000)
replace kid_involved = 1 if age_grch_at_separation_7  >=-2 & age_grch_at_separation_7  < 19 & ch_end_cohabitation_1 != date("12/31/2018", "MDY", 2000)
replace kid_involved = 1 if age_grch_at_separation_6  >=-2 & age_grch_at_separation_6  < 19 & ch_end_cohabitation_1 != date("12/31/2018", "MDY", 2000)
replace kid_involved = 1 if age_grch_at_separation_5  >=-2 & age_grch_at_separation_5  < 19 & ch_end_cohabitation_1 != date("12/31/2018", "MDY", 2000)
replace kid_involved = 1 if age_grch_at_separation_4  >=-2 & age_grch_at_separation_4  < 19 & ch_end_cohabitation_1 != date("12/31/2018", "MDY", 2000)
replace kid_involved = 1 if age_grch_at_separation_3  >=-2 & age_grch_at_separation_3  < 19 & ch_end_cohabitation_1 != date("12/31/2018", "MDY", 2000)
replace kid_involved = 1 if age_grch_at_separation_2  >=-2 & age_grch_at_separation_2  < 19 & ch_end_cohabitation_1 != date("12/31/2018", "MDY", 2000)
replace kid_involved = 1 if age_grch_at_separation_1  >=-2 & age_grch_at_separation_1  < 19 & ch_end_cohabitation_1 != date("12/31/2018", "MDY", 2000)


fre kid_involved
// browse ch_end_cohabitation_* kid_involved grch_birth_date* age_grch_at_separation_*


*----------------------------------------------------------------------------------------------------*
* 	Parents' characteristics
*----------------------------------------------------------------------------------------------------*

*>> Gender 
recode gender_w (1 = 0 "Father") (2 = 1 "Mother"), gen(gender)

*>> Age splines
recode age 			/// 
(50/55 = 0 "50-55") ///
(55/60 = 1 "55-60") ///
(60/65 = 2 "60-65") ///
(65/70 = 3 "65-70") ///
(70/75 = 4 "70-75") ///
(75/80 = 5 "75-80") ///
(80/max = 6 "80+")  /// 
, gen(agesplines)

*>> Age centered
center age, generate(cage)
center ch_age, generate(ch_cage)

*>>	Education 
rename isced_w edu

*>>	Income
egen income = xtile(income_implicatmean_w), by(wave) nq(4) 


*>>	Partner in the household
rename partnerinhh_w partnerinhh 

*>> Marital status 
rename marital_w marital

*----------------------------------------------------------------------------------------------------*
* 	Children's characteristics
*----------------------------------------------------------------------------------------------------*

*>> Gender 
recode ch_vrlgbageslacht (1 = 0 "Son") (2 = 1 "Daughter"), gen(ch_gender)

*>> Education of children 
recode ch_oplnivsoi2016agg4hbmetnirwo 	///
			(1111/1222 = 0 "Low") 		/// 
			(2111/2132 = 1 "Medium") 	/// 
			(3111/3213 = 2 "High") 		/// 
			(.a = 3 "Unknown")			/// 
			, gen(ch_edu)


*>> Income 

// Differently from "ch_inhp100hgesty_*", in "ch_bvrpercgestinkhy_*" the 1st quartile is recorded as 0, 2nd quartile is recorded as 1, ..., n quartile is recorded as n-1
// ... basically it is recorded differently in the two income variables (check by using "fre ch_inhp100hgesty_2013 ch_bvrpercgestinkhy_2008")

// Let's correct this: 	
foreach n of numlist 2003/2018 {
replace ch_bvrpercgestinkhy_`n' = ch_bvrpercgestinkhy_`n'+1
}

* 	Generate the children's income variable  
gen 				ch_income = .
foreach n of numlist 2003/2018 {
replace ch_income = ch_bvrpercgestinkhy_`n' if int_year_w == `n' // Percentile groups standardized disposable income private households
replace ch_income = ch_inhp100hgesty_`n' 	if int_year_w == `n' & ch_income == . 
}

* 	Now we generate quartiles of Children's income 
recode ch_income 			/// 
(1/25 	= 1 "1st Quartile")	/// 	 
(26/50 	= 2 "2nd Quartile")	///  
(51/75 	= 3 "3rd Quartile")	///  
(76/100 = 4 "4th Quartile"), gen(ch_income_quartiles)
		

*>> Medicine & Care costs  
*  Children 
*  Generate the sum of the costs for each year 
	* Medicine (A)
foreach a of numlist 2006/2017 {
	egen ch_a_costs_sum_`a' = rowtotal(ch_zvwkeerstelijnspsycho_a_`a' ch_zvwkgenbasggz_a_`a' ch_zvwkggz_a_`a' ch_zvwkspecggz_a_`a') 
}

* Care costs (B)
foreach b of numlist 2009/2017 {
	egen ch_b_costs_sum_`b' = rowtotal(ch_zvwkeerstelijnspsycho_b_`b' ch_zvwkgenbasggz_b_`b' ch_zvwkggz_b_`b' ch_zvwkspecggz_b_`b') 
}

* Care cost variable -> (based on B)
gen 	ch_care_costs = .
foreach n of numlist 2009/2017 {
replace ch_care_costs = ch_b_costs_sum_`n' if int_year_w == `n'
}

* Difference variable (costs at t - costs at t-1) -> (based on B)
		* Step 1 
gen 	ch_diff_care_costs_2013 = . 
replace ch_diff_care_costs_2013 = ch_b_costs_sum_2013-ch_b_costs_sum_2012

gen 	ch_diff_care_costs_2011 = . 
replace ch_diff_care_costs_2011 = ch_b_costs_sum_2011-ch_b_costs_sum_2010

		* Step 2 
gen 	ch_diff_c_costs = .
foreach n of numlist 2011 2013 {
replace ch_diff_c_costs = ch_diff_care_costs_`n' if int_year_w == `n' & ch_diff_c_costs == .
}

		
*>> Distance from parents
gen geo_distance_temp = . 

foreach n of numlist 2004/2018 {
replace geo_distance_temp = ch_afstandpay_`n' if int_year_w == `n' & gender_w == 1 & geo_distance_temp==.
replace geo_distance_temp = ch_afstandmay_`n' if int_year_w == `n' & gender_w == 2 & geo_distance_temp==.
}

recode geo_distance_temp	(0/2000 = 0 "0-2km") 		///
							(2000/5000 = 1 "2-5km") 	///
							(5000/10000 = 2 "5-10km") 	///
							(10000/60000 = 3 "10-60Km") ///
							(60000/max = 4 "60Km+") 	/// 
							(-1 0 = 5 "Co-Residence") 	///
							, gen(geo_distance)

drop geo_distance_temp 

*>> Migration background
rename vrlgbageneratie migration_background
label variable migration_background "Migration background"

*----------------------------------------------------------------------------------------------------*
*>> Dependent variables
*----------------------------------------------------------------------------------------------------*

*>> Dependent variable(s) (Frailty Index, Depression, and Grip Strength) 

* 	First, let's check the variables  
fre fi_w 		 	//  	4.21% missing in the Frailty Index...
fre FI_maxgrip_w 	//  ... but remember that this is because 3.74% of grip strength is missing by design! 
fre maxgrip_w 		// 
fre eurod_w


*>> Standardize the variables 
* 	Frailty Index is standardized by gender
bys gender: egen 	mean_fi	= mean(fi_w)
bys gender: egen 	sd_fi 	= sd(fi_w)
bys gender: gen 	z_fi 	= (fi_w-mean_fi)/sd_fi


* 	Depression is standardized by gender
bys gender: egen 	mean_eurod	= mean(eurod_w)
bys gender: egen 	sd_eurod 	= sd(eurod_w)
bys gender: gen 	z_eurod 	= (eurod_w-mean_eurod)/sd_eurod


* 	Grip strength is standardized by gender
bys gender: egen 	mean_maxgrip	= mean(maxgrip_w)
bys gender: egen 	sd_maxgrip 		= sd(maxgrip_w)
bys gender: gen 	z_maxgrip 		= (maxgrip_w-mean_maxgrip)/sd_maxgrip
 
* 	Reverse code the Grip Strength variable, so that higher values indicate weak grip strength 
revrs 	z_maxgrip // reverse the value order -> this create "revz_maxgrip"
rename 	z_maxgrip z_maxgrip_old
rename 	revz_maxgrip z_maxgrip


*>> Cronbach's alpha for Depression 
recode 	mh002__w mh003__w mh004__w mh005__w mh007__w mh008__w mh010__w mh011__w mh013__w mh014__w mh015__w mh016__w mh017__w (-2 -1 = .) 
fre mh002__w mh003__w mh004__w mh005__w mh007__w mh008__w mh010__w mh011__w mh013__w mh014__w mh015__w mh016__w mh017__w

recode mh002__w (5=0) (1=1)
recode mh003__w (1=0) (2=1)
recode mh004__w (2=0) 
recode mh005__w (2=0) (3=.)
recode mh007__w (2=0)
recode mh008__w (2=0) (3=.)
recode mh010__w (5=0)
recode mh011__w (2=0) (3=.)
recode mh013__w (5=0) 
recode mh014__w (2=0)
recode mh015__w (2=0)
recode mh016__w (2=0)
recode mh017__w (5=0)
alpha 	mh002__w mh003__w mh004__w mh005__w mh007__w mh008__w mh010__w mh011__w mh013__w mh014__w mh015__w mh016__w mh017__w, std



*>> Cronbach's alpha for the Frailty Index
alpha		FI_bathing        /// Difficulties: bathing or showering
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
            FI_sad            /// RECODE of mh002_ Sad or depressed last month)
            FI_hopelessness   /// RECODE of mh003_ Hopes for the future)
            FI_fatigue        /// RECODE of mh013_ Fatigue)
            FI_enjoyment      /// RECODE of mh016_ Enjoyment)
            FI_orienti        /// RECODE of orienti Score of orientation in time test)
            FI_longtermill    /// RECODE of ph004_ Long-term illness)
            FI_falling        /// RECODE of ph010d7 Bothered by: falling down)
            FI_fearfall       /// RECODE of ph010d8 Bothered by: fear of falling down)
            FI_dizziness      /// RECODE of ph010d9 Bothered by: dizziness, faints or blackouts)
            FI_srh            /// RECODE of srh Self-report of health)
            FI_maxgrip        /// Grip strenght
            FI_phone          /// Diffic, nola miss // ulties: telephone calls
            FI_parkinson, std // Doctor told you had: Parkinson disease

			
*>> Factor analysis 
factor FI_*
factor FI_*, altdivisor
factor FI_*, pcf
factor FI_*, ml 
factor FI_*, ipf factor(1)
factor FI_*, ipf factor(2)
factor FI_*, ipf mineigen(1)
 
* 	Screeplot  
screeplot 

cd "$figure_out"
graph save "Screeplot", replace
graph export "Screeplot.png", as(png) width(1252) height(910) replace

rotate, varimax horst // blank(.2)


*----------------------------------------------------------------------------------------------------*
* 	Sample selection (stage 1)
*----------------------------------------------------------------------------------------------------*
 
*>> Check sample reduction
* 	Macro 
global sample_check mixed wave || Nl: || pid_dyad: || wave:, iter(0)

*>> Original raw sample 
* 	Check cases
// $sample_check
 
*>> Respondent (parent) was not in SHARE (Original Sample)
drop if int_year_w 	>=. 
drop if age 		>=. 

* 	Check cases
// $sample_check



*>> Respondent (parent) was not eligible for SHARE 
drop if age<50

* 	Check cases
// $sample_check


*>> Childless 
bys pid_dyad: drop if nchild_cat==0 	// Drop if number of children == 0 (dead child?)

* 	Check cases
// $sample_check



*>> Drop if respondent was not linkable to the SSD
drop if populatie==.

* 	Check cases
// $sample_check



*>> Drop if person is not in the SHARE sample and has not 1 or more children
drop if populatie==0

*>>	Children who are not at risk of union_dissolution (i.e. no cohabitation & child died)
drop if union_dissolution_index == . 
drop if union_dissolution_index == .a 

* 	Check cases
// $sample_check

*----------------------------------------------------------------------------------------------------*
* 	Multiple imputation
*----------------------------------------------------------------------------------------------------*

keep wave Nl pid_dyad z_eurod z_maxgrip z_fi ch002__w gender		/// 
				union_dissolution_index 							/// 
				int_year_w age populatie 							/// 
				union_dissolution_splines 							///
                gender                        						/// 
				divorce_dummy             							/// 
				time_since_cohabitation 							/// 
                kid_involved			 							/// 
				geo_distance 										///
				ch_gender                        		       		/// 
				nchild_cat                      		        	///
				cage                             					///
				marital                          			       	///
                edu													/// 
				income  											/// 
				FI_* fi_excl_mh* fi_w eurod_w maxgrip_w

*>> Describe the missingness 				
mdesc 
 
* Date and Time 
display "$S_TIME  $S_DATE"

*>> Declare "mi" dataset 
mi set mlong 

*>> Describe again the (longitudinal) missingness 
mi misstable summarize
mi misstable patterns 

*>> Reshape 
mi reshape wide 																													///
time_since_cohabitation union_dissolution_index geo_distance FI_* fi_excl_mh* fi_w eurod_w maxgrip_w 								/// 
int_year_w ch002__w edu marital nchild_cat_w age union_dissolution_splines divorce_dummy cage income z_fi z_eurod z_maxgrip gender 	/// 
, i(pid_dyad) j(wave)

* 	Order these two variables 
fre geo_distance1 
fre time_since_cohabitation1

forvalues n = 1/4 {
    replace geo_distance`n' = geo_distance`n'+1
}

recode geo_distance* time_since_cohabitation* (6=0)


*>> Identify which variables in the imputation model have missing information 
mi register imputed 				union_dissolution_splines* 					///
									time_since_cohabitation* 					/// 
									geo_distance* 								///
									nchild_cat*                              	///
									marital*                                 	///
									edu*										///
									income* 									/// 
									gender*                        				/// 
									divorce_dummy*             					/// 				
									kid_involved*			 					/// 
									ch_gender*                               	/// 	
									cage* 										/// 
									z_eurod* 									/// 
									z_fi* 										/// 
									z_maxgrip* 									/// 	

*>> Imputation model and number of imputations to be performed
set sortseed 9876
mi impute chained 	(pmm, knn(10))												/// 
									divorce_dummy* 								///
									time_since_cohabitation*  					/// 
									edu*										///
									geo_distance* 								/// 
									z_eurod* 									/// 
									z_fi* 										/// 
									z_maxgrip* 									/// 	
									nchild_cat*									///
									marital* 									/// 
					(ologit, iter(16000))										/// 
									union_dissolution_splines* 					///
									income*										///
					(logit, iter(16000))										/// 
									kid_involved*								///
									ch_gender* 									///
					(regress) 													/// 
									cage*  										///
, add(30) dots replace rseed(3412) burnin(10) noisily showcommand augment  

display "$S_TIME  $S_DATE"
 

* 	Order the two variables again
recode time_since_cohabitation* geo_distance* (0=6)

forvalues n = 1/4 {
    replace geo_distance`n' = geo_distance`n'-1
}

fre geo_distance1 
fre time_since_cohabitation1

*>> Reshape 
mi reshape long fi_excl_mh 																											///
time_since_cohabitation union_dissolution_index geo_distance  fi_w eurod_w maxgrip_w 												/// 
int_year_w ch002__w edu marital nchild_cat_w age union_dissolution_splines divorce_dummy cage income z_fi z_eurod z_maxgrip gender 	/// 
, i(pid_dyad) j(wave)


*>> Save the dataset 
save "$share_all_out\mi_data.dta", replace  


*----------------------------------------------------------------------------------------------------*
* 	Sample selection (stage 2) - Not imputed data 
*----------------------------------------------------------------------------------------------------*
 
*>> Open the dataset 
use "$share_all_out\mi_data.dta", clear 

*>> Clear 
clear matrix 
clear mata 
capture mi xtset, clear 
capture mi stset, clear 

*>> Declare the longitudinal nature of the data 
mi xtset pid_dyad wave 

*>> Check sample reduction
* 	Macro for sample check after MI
global sample_check_mi mi estimate, dots post: xtreg wave i.marital, fe cluster(Nl)

*>> Drop non imputed values ("Initial" cases)
drop if _mi_miss == 1

* 	Check ("Initial") cases
// $sample_check_mi

*>>	Drop if not cohabitation yet
drop if time_since_cohabitation == 6 

* 	Check cases
// $sample_check_mi

*>>	Participation in at least two waves 
* 	Sort the data 
set sortseed 9876
sort Nl wave pid_dyad _mi_m  

* 	Generate an indicator for wave participation 
bys pid_dyad (wave): egen nyears = total(wave!=wave[_n-1])

set sortseed 9876
sort Nl pid_dyad wave _mi_m nyears

* 	Select only if respondent participated in two waves 
keep if nyears>1

* 	Check cases
$sample_check_mi



*----------------------------------------------------------------------------------------------------*
* 	Multilevel structure of the data  
*----------------------------------------------------------------------------------------------------*

mixed z_fi || Nl: || pid_dyad: || wave:, iter(0)
mixed z_fi || Nl: || pid_dyad: || wave: if gender==0, iter(0)
mixed z_fi || Nl: || pid_dyad: || wave: if gender==1, iter(0)

	
*----------------------------------------------------------------------------------------------------*
* 	Table 1. Description of the SHARE variables used in the analysis.  
*----------------------------------------------------------------------------------------------------*


*>> Whole sample

* Dependent variable 	
sum eurod_w		
sum maxgrip_w
sum fi_w 	
sum age

* Children's characteristics 
tab union_dissolution_splines
tab divorce_dummy
tab time_since_cohabitation
tab ch_gender
tab geo_distance
tab kid_involved

* Parents's characteristics 	
tab gender 		
tab age
tab nchild_cat
tab income 
tab marital 
tab edu 

// Men

* Dependent variable 
sum eurod_w						if gender == 0
sum maxgrip_w					if gender == 0
sum fi_w						if gender == 0
sum age 						if gender == 0

* Children's characteristics 
tab union_dissolution_splines 	if gender == 0
tab divorce_dummy 				if gender == 0
tab time_since_cohabitation 	if gender == 0
tab ch_gender 					if gender == 0
tab geo_distance				if gender == 0
tab kid							if gender == 0

* Parents's characteristics 			
tab age		 					if gender == 0
tab nchild_cat 					if gender == 0
tab income  					if gender == 0
tab marital 					if gender == 0
tab edu		 					if gender == 0

// Women

* Dependent variable 
sum eurod_w						if gender == 1
sum maxgrip_w					if gender == 1
sum fi_w						if gender == 1
sum age 						if gender == 1

* Children's characteristics 
tab union_dissolution_splines 	if gender == 1
tab divorce_dummy 				if gender == 1
tab time_since_cohabitation 	if gender == 1
tab ch_gender 					if gender == 1
tab geo_distance				if gender == 1
tab kid 						if gender == 1

* Parents's characteristics 			
tab age 	 					if gender == 1
tab nchild_cat 					if gender == 1
tab income  					if gender == 1
tab marital 					if gender == 1
tab edu		 					if gender == 1

 
*----------------------------------------------------------------------------------------------------*
* 	Adopted children descriptive 
*----------------------------------------------------------------------------------------------------*

ta ch002__w if wave==1 // [mentioned in the text of the manuscript]

	
*----------------------------------------------------------------------------------------------------*
* 	Regression models (RE/FE) with robust standard errors (for tables)
*----------------------------------------------------------------------------------------------------*


*>> Macro for X variables (Also here FE and RE use the same X variables)
global xvarsRE 												/// 
				ib3.union_dissolution_splines 				///
                i.gender                        			/// 
				i.divorce_dummy             				/// 
				i.time_since_cohabitation 					/// 
                i.kid_involved			 					/// 
				i.geo_distance 								///
				i.ch_gender                               	/// 
				i.nchild_cat                              	///
				c.cage                              		///
				i.marital                                 	///
                i.edu										/// 
				i.income  

*>> Clear estimates 
estimates clear 
                        
*>> Regression models 
mi estimate, dots post: xtreg z_eurod $xvarsRE , re cluster(Nl)
cd "$tables_out" 
outreg2 using MI_Supplem_Table_A,  replace cti(z_eurod (RE)) dec(2) ci alpha(.001, .01, .05, .10) 	/// 
symbol(***, **, *, +) e(all) addnote("(Random and FE models) RE_z_eurod FE_z_eurod RE_z_maxgrip FE_z_maxgrip RE_z_fi FE_z_fi") 	

mi estimate, dots post: xtreg z_maxgrip $xvarsRE , re cluster(Nl)
cd "$tables_out" 
outreg2 using MI_Supplem_Table_A,  cti(z_maxgrip (RE)) dec(2) ci alpha(.001, .01, .05, .10) 		/// 
symbol(***, **, *, +) e(all) addnote("(Random and FE models) RE_z_eurod FE_z_eurod RE_z_maxgrip FE_z_maxgrip RE_z_fi FE_z_fi") 	

mi estimate, dots post: xtreg z_fi $xvarsRE , re cluster(Nl)
cd "$tables_out" 
outreg2 using MI_Supplem_Table_A,  cti(z_fi (RE)) dec(2) ci alpha(.001, .01, .05, .10) 				/// 
symbol(***, **, *, +) e(all) addnote("(Random and FE models) RE_z_eurod FE_z_eurod RE_z_maxgrip FE_z_maxgrip RE_z_fi FE_z_fi") 	

mi estimate, dots post: xtreg z_eurod $xvarsRE , fe cluster(Nl)
cd "$tables_out" 
outreg2 using MI_Supplem_Table_A,  cti(z_eurod (FE)) dec(2) ci alpha(.001, .01, .05, .10) 			/// 
symbol(***, **, *, +) e(all) addnote("(Random and FE models) RE_z_eurod FE_z_eurod RE_z_maxgrip FE_z_maxgrip RE_z_fi FE_z_fi") 

mi estimate, dots post: xtreg z_maxgrip $xvarsRE , fe cluster(Nl)
cd "$tables_out" 
outreg2 using MI_Supplem_Table_A,  cti(z_maxgrip (FE)) dec(2) ci alpha(.001, .01, .05, .10) 		/// 
symbol(***, **, *, +) e(all) addnote("(Random and FE models) RE_z_eurod FE_z_eurod RE_z_maxgrip FE_z_maxgrip RE_z_fi FE_z_fi") 	

mi estimate, dots post: xtreg z_fi $xvarsRE , fe cluster(Nl)
cd "$tables_out" 
outreg2 using MI_Supplem_Table_A,  cti(z_fi (FE)) dec(2) ci alpha(.001, .01, .05, .10) 				/// 
symbol(***, **, *, +) e(all) addnote("(Random and FE models) RE_z_eurod FE_z_eurod RE_z_maxgrip FE_z_maxgrip RE_z_fi FE_z_fi") 	

 
	
*----------------------------------------------------------------------------------------------------*
* 	Regression models (distributed FE) | Model M1
*----------------------------------------------------------------------------------------------------*

*>> RANDOM EFFECTS 
*	Independent variables 
global xvarsFE 												///
				ib3.union_dissolution_splines 				///
                i.gender                        			/// 
				i.divorce_dummy             				/// 
				i.time_since_cohabitation 					/// 
                i.kid_involved			 					/// 
				i.geo_distance 								///
				i.ch_gender                               	/// 
				i.nchild_cat                              	///
				c.cage                              		///
				i.marital                                 	///
                i.edu										/// 
				i.income  
				
*>> Clear estimates 
estimates clear 

*>> Model 1
mi estimate, dots post: xtreg z_eurod $xvarsFE, re cluster(Nl)
	cd "$tables_out"
	outreg2	using MI_Supplem_Table_B, cti(z_eurod (RE)) dec(2) ci	alpha(.001, .01, .05, .10) symbol(***, **, *, +) 		/// 
		e(all) addnote("(Random Effects, model1 (m1)) m1_z_eurod m1_z_maxgrip m1_z_fi") replace 

mi estimate, dots post: xtreg z_maxgrip $xvarsFE, re cluster(Nl)
	cd "$tables_out"
	outreg2	using MI_Supplem_Table_B, cti(z_maxgrip (RE)) dec(2) ci	alpha(.001, .01, .05, .10) symbol(***, **, *, +) 		/// 
		e(all) addnote("(Random Effects, model1 (m1)) m1_z_eurod m1_z_maxgrip m1_z_fi")  
	
mi estimate, dots post: xtreg z_fi $xvarsFE, re cluster(Nl)
	cd "$tables_out"
	outreg2	using MI_Supplem_Table_B, cti(z_fi (RE)) dec(2) ci	alpha(.001, .01, .05, .10) symbol(***, **, *, +) 			/// 
		e(all) addnote("(Random Effects, model1 (m1)) m1_z_eurod m1_z_maxgrip m1_z_fi")  
	

*>> FIXED EFFECTS 
* 	Independent variables 
global xvarsFE 												///
				ib3.union_dissolution_splines 				///
                i.gender                        			/// 
				i.divorce_dummy             				/// 
				i.time_since_cohabitation 					/// 
                i.kid_involved			 					/// 
				i.geo_distance 								///
				i.ch_gender                               	/// 
				i.nchild_cat                              	///
				c.cage                              		///
				i.marital                                 	///
                i.edu										/// 
				i.income  
				
*>> Clear estimates 
estimates clear 

*>> Model 2
* 	This produces Table 2
mi estimate, dots post: xtreg z_eurod $xvarsFE, fe cluster(Nl)
test 1.union_dissolution_splines=2.union_dissolution_splines=3.union_dissolution_splines=4.union_dissolution_splines=5.union_dissolution_splines=6.union_dissolution_splines
	cd "$tables_out"
	outreg2	using MI_Supplem_Table_C, cti(z_eurod (FE)) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 			/// Table 2
		e(all) addnote("(Fixed Effects, model2 (m2)) m2_z_eurod m2_z_maxgrip m2_z_fi") replace 

mi estimate, dots post: xtreg z_maxgrip $xvarsFE, fe cluster(Nl)
test 1.union_dissolution_splines=2.union_dissolution_splines=3.union_dissolution_splines=4.union_dissolution_splines=5.union_dissolution_splines=6.union_dissolution_splines
	cd "$tables_out"
	outreg2	using MI_Supplem_Table_C, cti(z_maxgrip (FE)) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 		/// Table 2
		e(all) addnote("(Fixed Effects, model2 (m2)) m2_z_eurod m2_z_maxgrip m2_z_fi")
		
mi estimate, dots post: xtreg z_fi $xvarsFE, fe cluster(Nl)
test 1.union_dissolution_splines=2.union_dissolution_splines=3.union_dissolution_splines=4.union_dissolution_splines=5.union_dissolution_splines=6.union_dissolution_splines
	cd "$tables_out"
	outreg2	using MI_Supplem_Table_C, cti(z_fi (FE)) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 			/// Table 2
		e(all) addnote("(Fixed Effects, model2 (m2)) m2_z_eurod m2_z_maxgrip m2_z_fi")

 		
*>> Interaction legal divorce 
*>> Clear estimates 
estimates clear 

*>> Model 2
* 	This produces Supplementary Table A4
mi estimate, dots post: xtreg z_eurod $xvarsFE ib3.union_dissolution_splines#i.divorce_dummy, fe cluster(Nl)
test 	(1.union_dissolution_splines#0.divorce_dummy=0) /// 
		(2.union_dissolution_splines#0.divorce_dummy=0) /// 
		(3.union_dissolution_splines#0.divorce_dummy=0) /// 
		(4.union_dissolution_splines#0.divorce_dummy=0) /// 
		(5.union_dissolution_splines#0.divorce_dummy=0) /// 
		(6.union_dissolution_splines#0.divorce_dummy=0) /// 
		(1.union_dissolution_splines#1.divorce_dummy=0) /// 
		(2.union_dissolution_splines#1.divorce_dummy=0) /// 
		(3.union_dissolution_splines#1.divorce_dummy=0) /// 
		(4.union_dissolution_splines#1.divorce_dummy=0) /// 
		(5.union_dissolution_splines#1.divorce_dummy=0) /// 
		(6.union_dissolution_splines#1.divorce_dummy=0)	
	cd "$tables_out"
	outreg2	using MI_Supplem_Table_Cint, cti(z_eurod (FE)) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 		/// 
		e(all) addnote("(Fixed Effects, interaction legal divorce (m2)) m2_z_eurod m2_z_maxgrip m2_z_fi") replace 

mi estimate, dots post: xtreg z_maxgrip $xvarsFE ib3.union_dissolution_splines#i.divorce_dummy, fe cluster(Nl)
test 	(1.union_dissolution_splines#0.divorce_dummy=0) /// 
		(2.union_dissolution_splines#0.divorce_dummy=0) /// 
		(3.union_dissolution_splines#0.divorce_dummy=0) /// 
		(4.union_dissolution_splines#0.divorce_dummy=0) /// 
		(5.union_dissolution_splines#0.divorce_dummy=0) /// 
		(6.union_dissolution_splines#0.divorce_dummy=0) /// 
		(1.union_dissolution_splines#1.divorce_dummy=0) /// 
		(2.union_dissolution_splines#1.divorce_dummy=0) /// 
		(3.union_dissolution_splines#1.divorce_dummy=0) /// 
		(4.union_dissolution_splines#1.divorce_dummy=0) /// 
		(5.union_dissolution_splines#1.divorce_dummy=0) /// 
		(6.union_dissolution_splines#1.divorce_dummy=0)		
	cd "$tables_out"
	outreg2	using MI_Supplem_Table_Cint, cti(z_maxgrip (FE)) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 	/// 
		e(all) addnote("(Fixed Effects, interaction legal divorce (m2)) m2_z_eurod m2_z_maxgrip m2_z_fi")
		
mi estimate, dots post: xtreg z_fi $xvarsFE ib3.union_dissolution_splines#i.divorce_dummy, fe cluster(Nl)
test 	(1.union_dissolution_splines#0.divorce_dummy=0) /// 
		(2.union_dissolution_splines#0.divorce_dummy=0) /// 
		(3.union_dissolution_splines#0.divorce_dummy=0) /// 
		(4.union_dissolution_splines#0.divorce_dummy=0) /// 
		(5.union_dissolution_splines#0.divorce_dummy=0) /// 
		(6.union_dissolution_splines#0.divorce_dummy=0) /// 
		(1.union_dissolution_splines#1.divorce_dummy=0) /// 
		(2.union_dissolution_splines#1.divorce_dummy=0) /// 
		(3.union_dissolution_splines#1.divorce_dummy=0) /// 
		(4.union_dissolution_splines#1.divorce_dummy=0) /// 
		(5.union_dissolution_splines#1.divorce_dummy=0) /// 
		(6.union_dissolution_splines#1.divorce_dummy=0)		
	cd "$tables_out"
	outreg2	using MI_Supplem_Table_Cint, cti(z_fi (FE)) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 			/// 
		e(all) addnote("(Fixed Effects, interaction legal divorce (m2)) m2_z_eurod m2_z_maxgrip m2_z_fi")
		
*----------------------------------------------------------------------------------------------------*
* 	Parents - Regression models separated by parents' gender (distributed FE)
*----------------------------------------------------------------------------------------------------*

*>> Independent variables 
global xvarsFE 												///
				ib3.union_dissolution_splines 				///
                i.gender                        			/// 
				i.divorce_dummy             				/// 
				i.time_since_cohabitation 					/// 
                i.kid_involved			 					/// 
				i.geo_distance 								///
				i.ch_gender                               	/// 
				i.nchild_cat                              	///
				c.cage                              		///
				i.marital                                 	///
                i.edu										/// 
				i.income  
				
*>> Clear estimates 
estimates clear 

*>> Models separated by parent's gender 
* 	This produces Supplementary Table A5
// 	Fathers
  
mi estimate, dots post: xtreg z_eurod 	$xvarsFE if gender==0, fe cluster(Nl)
	cd "$tables_out"
	outreg2 using MI_Supplem_Table_D, cti(z_eurod (Men)) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 				/// 
	e(all) addnote("(distributed FE sepby gender) m_z_eurod m_z_maxgrip m_z_fi w_z_eurod w_z_maxgrip w_z_fi") replace 

mi estimate, dots post: xtreg z_maxgrip $xvarsFE if gender==0, fe cluster(Nl)
	cd "$tables_out"
	outreg2 using MI_Supplem_Table_D, cti(z_maxgrip (Men)) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 				/// 
	e(all) addnote("(distributed FE sepby gender) m_z_eurod m_z_maxgrip m_z_fi w_z_eurod w_z_maxgrip w_z_fi")

mi estimate, dots post: xtreg z_fi 		$xvarsFE if gender==0, fe cluster(Nl)
	cd "$tables_out"
	outreg2 using MI_Supplem_Table_D, cti(z_fi (Men)) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 					/// 
	e(all) addnote("(distributed FE sepby gender) m_z_eurod m_z_maxgrip m_z_fi w_z_eurod w_z_maxgrip w_z_fi")

// 	Mothers
mi estimate, dots post: xtreg z_eurod 	$xvarsFE if gender==1, fe cluster(Nl)
	cd "$tables_out"
	outreg2 using MI_Supplem_Table_D, cti(z_eurod (Women)) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 				/// 
	e(all) addnote("(distributed FE sepby gender) m_z_eurod m_z_maxgrip m_z_fi w_z_eurod w_z_maxgrip w_z_fi")

mi estimate, dots post: xtreg z_maxgrip $xvarsFE if gender==1, fe cluster(Nl)
	cd "$tables_out"
	outreg2 using MI_Supplem_Table_D, cti(z_maxgrip (Women)) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 			/// 
	e(all) addnote("(distributed FE sepby gender) m_z_eurod m_z_maxgrip m_z_fi w_z_eurod w_z_maxgrip w_z_fi")

mi estimate, dots post: xtreg z_fi 		$xvarsFE if gender==1, fe cluster(Nl)
	cd "$tables_out"
	outreg2 using MI_Supplem_Table_D, cti(z_fi (Women)) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 					/// 
	e(all) addnote("(distributed FE sepby gender) m_z_eurod m_z_maxgrip m_z_fi w_z_eurod w_z_maxgrip w_z_fi")




*----------------------------------------------------------------------------------------------------*
* 	Children - Regression models separated by children's gender (distributed FE)
*----------------------------------------------------------------------------------------------------*


*>> Clear estimates 
estimates clear 

*>> Models separated by child's gender 
* 	This produces Supplementary Table A6
// 	Sons
  
mi estimate, dots post: xtreg z_eurod $xvarsFE if ch_gender==0, fe cluster(Nl)
	cd "$tables_out"
	outreg2 using MI_Supplem_Table_E, cti(z_eurod (Sons)) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 			/// 
	e(all) addnote("(Models sepby ch_gender) m_z_eurod m_z_maxgrip m_z_fi w_z_eurod w_z_maxgrip w_z_fi") replace 

mi estimate, dots post: xtreg z_maxgrip $xvarsFE if ch_gender==0, fe cluster(Nl)
	cd "$tables_out"
	outreg2 using MI_Supplem_Table_E, cti(z_maxgrip (Sons)) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 			/// 
	e(all) addnote("(Models sepby ch_gender) m_z_eurod m_z_maxgrip m_z_fi w_z_eurod w_z_maxgrip w_z_fi")
	
mi estimate, dots post: xtreg z_fi $xvarsFE if ch_gender==0, fe cluster(Nl)
	cd "$tables_out"
	outreg2 using MI_Supplem_Table_E, cti(z_fi (Sons)) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 				/// 
	e(all) addnote("(Models sepby ch_gender) m_z_eurod m_z_maxgrip m_z_fi w_z_eurod w_z_maxgrip w_z_fi")
	
// 	Daughters
mi estimate, dots post: xtreg z_eurod $xvarsFE if ch_gender==1, fe cluster(Nl)
	cd "$tables_out"
	outreg2 using MI_Supplem_Table_E, cti(z_eurod (Daughters)) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 		/// 
	e(all) addnote("(Models sepby ch_gender) m_z_eurod m_z_maxgrip m_z_fi w_z_eurod w_z_maxgrip w_z_fi")
	
mi estimate, dots post: xtreg z_maxgrip $xvarsFE if ch_gender==1, fe cluster(Nl)
	cd "$tables_out"
	outreg2 using MI_Supplem_Table_E, cti(z_maxgrip (Daughters)) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 	/// 
	e(all) addnote("(Models sepby ch_gender) m_z_eurod m_z_maxgrip m_z_fi w_z_eurod w_z_maxgrip w_z_fi")
	
mi estimate, dots post: xtreg z_fi $xvarsFE if ch_gender==1, fe cluster(Nl)
	cd "$tables_out"
	outreg2 using MI_Supplem_Table_E, cti(z_fi (Daughters)) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 			/// 
	e(all) addnote("(Models sepby ch_gender) m_z_eurod m_z_maxgrip m_z_fi w_z_eurod w_z_maxgrip w_z_fi")


*----------------------------------------------------------------------------------------------------*
* 	Children - Regression models separated by children's gender (interaction grandchildren)
*----------------------------------------------------------------------------------------------------*


*>> Clear estimates 
estimates clear 

*>> Models separated by gender 
// 	Sons
  
mi estimate, dots post: xtreg z_eurod $xvarsFE ib3.union_dissolution_splines#i.kid_involved  if ch_gender==0, fe cluster(Nl)
	cd "$tables_out"
	outreg2 using MI_Supplem_Table_E_int, cti(z_eurod (Sons)) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 			/// 
	e(all) addnote("(Models sepby ch_gender) m_z_eurod m_z_maxgrip m_z_fi w_z_eurod w_z_maxgrip w_z_fi") replace 

mi estimate, dots post: xtreg z_maxgrip $xvarsFE ib3.union_dissolution_splines#i.kid_involved  if ch_gender==0, fe cluster(Nl)
	cd "$tables_out"
	outreg2 using MI_Supplem_Table_E_int, cti(z_maxgrip (Sons)) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 			/// 
	e(all) addnote("(Models sepby ch_gender) m_z_eurod m_z_maxgrip m_z_fi w_z_eurod w_z_maxgrip w_z_fi")
	
mi estimate, dots post: xtreg z_fi $xvarsFE ib3.union_dissolution_splines#i.kid_involved  if ch_gender==0, fe cluster(Nl)
	cd "$tables_out"
	outreg2 using MI_Supplem_Table_E_int, cti(z_fi (Sons)) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 				/// 
	e(all) addnote("(Models sepby ch_gender) m_z_eurod m_z_maxgrip m_z_fi w_z_eurod w_z_maxgrip w_z_fi")
	
// 	Daughters
mi estimate, dots post: xtreg z_eurod $xvarsFE ib3.union_dissolution_splines#i.kid_involved  if ch_gender==1, fe cluster(Nl)
	cd "$tables_out"
	outreg2 using MI_Supplem_Table_E_int, cti(z_eurod (Daughters)) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 		/// 
	e(all) addnote("(Models sepby ch_gender) m_z_eurod m_z_maxgrip m_z_fi w_z_eurod w_z_maxgrip w_z_fi")
	
mi estimate, dots post: xtreg z_maxgrip $xvarsFE ib3.union_dissolution_splines#i.kid_involved  if ch_gender==1, fe cluster(Nl)
	cd "$tables_out"
	outreg2 using MI_Supplem_Table_E_int, cti(z_maxgrip (Daughters)) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 	/// 
	e(all) addnote("(Models sepby ch_gender) m_z_eurod m_z_maxgrip m_z_fi w_z_eurod w_z_maxgrip w_z_fi")
	
mi estimate, dots post: xtreg z_fi $xvarsFE ib3.union_dissolution_splines#i.kid_involved  if ch_gender==1, fe cluster(Nl)
	cd "$tables_out"
	outreg2 using MI_Supplem_Table_E_int, cti(z_fi (Daughters)) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 			/// 
	e(all) addnote("(Models sepby ch_gender) m_z_eurod m_z_maxgrip m_z_fi w_z_eurod w_z_maxgrip w_z_fi")



*----------------------------------------------------------------------------------------------------*
* 	Fully interacted models (FE)
*----------------------------------------------------------------------------------------------------*

*>> Parents 	

* 	Independent variables 
global xvarsFEinteract 										///
				i.gender##(ib3.union_dissolution_splines 	///
                i.gender                        			/// 
				i.divorce_dummy             				/// 
				i.time_since_cohabitation 					/// 
                i.kid_involved			 					/// 
				i.geo_distance 								///
				i.ch_gender                               	/// 
				i.nchild_cat                              	///
				c.cage                              		///
				i.marital                                 	///
                i.edu										/// 
				i.income)  
				
*>> Clear estimates 
estimates clear 

*>> Model 
* 	This produces Supplementary Table A7  
mi estimate, dots post: xtreg z_eurod $xvarsFEinteract, fe cluster(Nl)
test 	(1.union_dissolution_splines#0.gender=0) /// 
		(2.union_dissolution_splines#0.gender=0) /// 
		(3.union_dissolution_splines#0.gender=0) /// 
		(4.union_dissolution_splines#0.gender=0) /// 
		(5.union_dissolution_splines#0.gender=0) /// 
		(6.union_dissolution_splines#0.gender=0) /// 
		(1.union_dissolution_splines#1.gender=0) /// 
		(2.union_dissolution_splines#1.gender=0) /// 
		(3.union_dissolution_splines#1.gender=0) /// 
		(4.union_dissolution_splines#1.gender=0) /// 
		(5.union_dissolution_splines#1.gender=0) /// 
		(6.union_dissolution_splines#1.gender=0)	
	cd "$tables_out"
	outreg2 using MI_Supplem_Table_F, cti(z_eurod) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 		/// 
	e(all) addnote("(Fully interacted with gender) z_eurod_2 z_maxgrip_2 z_fi_2") replace 

mi estimate, dots post: xtreg z_maxgrip $xvarsFEinteract, fe cluster(Nl)
test 	(1.union_dissolution_splines#0.gender=0) /// 
		(2.union_dissolution_splines#0.gender=0) /// 
		(3.union_dissolution_splines#0.gender=0) /// 
		(4.union_dissolution_splines#0.gender=0) /// 
		(5.union_dissolution_splines#0.gender=0) /// 
		(6.union_dissolution_splines#0.gender=0) /// 
		(1.union_dissolution_splines#1.gender=0) /// 
		(2.union_dissolution_splines#1.gender=0) /// 
		(3.union_dissolution_splines#1.gender=0) /// 
		(4.union_dissolution_splines#1.gender=0) /// 
		(5.union_dissolution_splines#1.gender=0) /// 
		(6.union_dissolution_splines#1.gender=0)
	cd "$tables_out"
	outreg2 using MI_Supplem_Table_F, cti(z_maxgrip) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 	/// 
	e(all) addnote("(Fully interacted with gender) z_eurod_2 z_maxgrip_2 z_fi_2")

mi estimate, dots post: xtreg z_fi $xvarsFEinteract, fe cluster(Nl)
test 	(1.union_dissolution_splines#0.gender=0) /// 
		(2.union_dissolution_splines#0.gender=0) /// 
		(3.union_dissolution_splines#0.gender=0) /// 
		(4.union_dissolution_splines#0.gender=0) /// 
		(5.union_dissolution_splines#0.gender=0) /// 
		(6.union_dissolution_splines#0.gender=0) /// 
		(1.union_dissolution_splines#1.gender=0) /// 
		(2.union_dissolution_splines#1.gender=0) /// 
		(3.union_dissolution_splines#1.gender=0) /// 
		(4.union_dissolution_splines#1.gender=0) /// 
		(5.union_dissolution_splines#1.gender=0) /// 
		(6.union_dissolution_splines#1.gender=0)
	cd "$tables_out"
	outreg2 using MI_Supplem_Table_F, cti(z_fi) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 		/// 
	e(all) addnote("(Fully interacted with gender) z_eurod_2 z_maxgrip_2 z_fi_2")


*>> Children  				

* 	Independent variables 
global xvarsFEinteract 										///
				i.ch_gender##(ib3.union_dissolution_splines ///
                i.gender                        			/// 
				i.divorce_dummy             				/// 
				i.time_since_cohabitation 					/// 
                i.kid_involved			 					/// 
				i.geo_distance 								///
				i.ch_gender                               	/// 
				i.nchild_cat                              	///
				c.cage                              		///
				i.marital                                 	///
                i.edu										/// 
				i.income)  
				
*>> Clear estimates 
estimates clear 

*>> Model 2
* 	This produces Supplementary Table A8
mi estimate, dots post: xtreg z_eurod $xvarsFEinteract, fe cluster(Nl)
test 	(1.union_dissolution_splines#0.ch_gender=0) /// 
		(2.union_dissolution_splines#0.ch_gender=0) /// 
		(3.union_dissolution_splines#0.ch_gender=0) /// 
		(4.union_dissolution_splines#0.ch_gender=0) /// 
		(5.union_dissolution_splines#0.ch_gender=0) /// 
		(6.union_dissolution_splines#0.ch_gender=0) /// 
		(1.union_dissolution_splines#1.ch_gender=0) /// 
		(2.union_dissolution_splines#1.ch_gender=0) /// 
		(3.union_dissolution_splines#1.ch_gender=0) /// 
		(4.union_dissolution_splines#1.ch_gender=0) /// 
		(5.union_dissolution_splines#1.ch_gender=0) /// 
		(6.union_dissolution_splines#1.ch_gender=0)
	cd "$tables_out"
	outreg2 using MI_Supplem_Table_G, cti(z_eurod) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 		/// 
	e(all) addnote("(Fully interacted with ch_gender) z_eurod_2 z_maxgrip_2 z_fi_2") replace 

mi estimate, dots post: xtreg z_maxgrip $xvarsFEinteract, fe cluster(Nl)
test 	(1.union_dissolution_splines#0.ch_gender=0) /// 
		(2.union_dissolution_splines#0.ch_gender=0) /// 
		(3.union_dissolution_splines#0.ch_gender=0) /// 
		(4.union_dissolution_splines#0.ch_gender=0) /// 
		(5.union_dissolution_splines#0.ch_gender=0) /// 
		(6.union_dissolution_splines#0.ch_gender=0) /// 
		(1.union_dissolution_splines#1.ch_gender=0) /// 
		(2.union_dissolution_splines#1.ch_gender=0) /// 
		(3.union_dissolution_splines#1.ch_gender=0) /// 
		(4.union_dissolution_splines#1.ch_gender=0) /// 
		(5.union_dissolution_splines#1.ch_gender=0) /// 
		(6.union_dissolution_splines#1.ch_gender=0)
	cd "$tables_out"
	outreg2 using MI_Supplem_Table_G, cti(z_maxgrip) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 	/// 
	e(all) addnote("(Fully interacted with ch_gender) z_eurod_2 z_maxgrip_2 z_fi_2")
	
mi estimate, dots post: xtreg z_fi $xvarsFEinteract, fe cluster(Nl)
test 	(1.union_dissolution_splines#0.ch_gender=0) /// 
		(2.union_dissolution_splines#0.ch_gender=0) /// 
		(3.union_dissolution_splines#0.ch_gender=0) /// 
		(4.union_dissolution_splines#0.ch_gender=0) /// 
		(5.union_dissolution_splines#0.ch_gender=0) /// 
		(6.union_dissolution_splines#0.ch_gender=0) /// 
		(1.union_dissolution_splines#1.ch_gender=0) /// 
		(2.union_dissolution_splines#1.ch_gender=0) /// 
		(3.union_dissolution_splines#1.ch_gender=0) /// 
		(4.union_dissolution_splines#1.ch_gender=0) /// 
		(5.union_dissolution_splines#1.ch_gender=0) /// 
		(6.union_dissolution_splines#1.ch_gender=0)
	cd "$tables_out"
	outreg2 using MI_Supplem_Table_G, cti(z_fi) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 		/// 
	e(all) addnote("(Fully interacted with ch_gender) z_eurod_2 z_maxgrip_2 z_fi_2")
	
	
*>> PA_gender*CH_Children  				

* 	Independent variables 
global xvarsFEinteract 													///
				i.gender##i.ch_gender##ib3.union_dissolution_splines 	///
                i.gender                        						/// 
				i.divorce_dummy             							/// 
				i.time_since_cohabitation 								/// 
                i.kid_involved			 								/// 
				i.geo_distance 											///
				i.ch_gender                        			       		/// 
				i.nchild_cat                      			        	///
				c.cage                              					///
				i.marital                          				       	///
                i.edu													/// 
				i.income  
				
*>> Clear estimates 
estimates clear 

*>> Model 2
* 	This produces Supplementary Table A9
mi estimate, dots post: xtreg z_eurod $xvarsFEinteract, fe cluster(Nl)
test 	(1.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(2.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(3.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(4.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(5.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(6.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(1.union_dissolution_splines#1.ch_gender#1.gender=0) /// 
		(2.union_dissolution_splines#1.ch_gender#1.gender=0) /// 
		(3.union_dissolution_splines#1.ch_gender#1.gender=0) /// 
		(4.union_dissolution_splines#1.ch_gender#1.gender=0) /// 
		(5.union_dissolution_splines#1.ch_gender#1.gender=0) /// 
		(6.union_dissolution_splines#1.ch_gender#1.gender=0) ///
		(1.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(2.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(3.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(4.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(5.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(6.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(1.union_dissolution_splines#1.ch_gender#1.gender=0) /// 
		(2.union_dissolution_splines#1.ch_gender#1.gender=0) /// 
		(3.union_dissolution_splines#1.ch_gender#1.gender=0) /// 
		(4.union_dissolution_splines#1.ch_gender#1.gender=0) /// 
		(5.union_dissolution_splines#1.ch_gender#1.gender=0) /// 
		(6.union_dissolution_splines#1.ch_gender#1.gender=0)
	cd "$tables_out"
	outreg2 using MI_Supplem_Table_H, cti(z_eurod) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 		/// 
	e(all) addnote("(Fully interacted gender*ch_gender) z_eurod_2 z_maxgrip_2 z_fi_2") replace 

mi estimate, dots post: xtreg z_maxgrip $xvarsFEinteract, fe cluster(Nl)
test 	(1.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(2.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(3.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(4.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(5.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(6.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(1.union_dissolution_splines#1.ch_gender#1.gender=0) /// 
		(2.union_dissolution_splines#1.ch_gender#1.gender=0) /// 
		(3.union_dissolution_splines#1.ch_gender#1.gender=0) /// 
		(4.union_dissolution_splines#1.ch_gender#1.gender=0) /// 
		(5.union_dissolution_splines#1.ch_gender#1.gender=0) /// 
		(6.union_dissolution_splines#1.ch_gender#1.gender=0) ///
		(1.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(2.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(3.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(4.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(5.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(6.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(1.union_dissolution_splines#1.ch_gender#1.gender=0) /// 
		(2.union_dissolution_splines#1.ch_gender#1.gender=0) /// 
		(3.union_dissolution_splines#1.ch_gender#1.gender=0) /// 
		(4.union_dissolution_splines#1.ch_gender#1.gender=0) /// 
		(5.union_dissolution_splines#1.ch_gender#1.gender=0) /// 
		(6.union_dissolution_splines#1.ch_gender#1.gender=0)
	cd "$tables_out"
	outreg2 using MI_Supplem_Table_H, cti(z_maxgrip) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 	/// 
	e(all) addnote("(Fully interacted gender*ch_gender) z_eurod_2 z_maxgrip_2 z_fi_2")

mi estimate, dots post: xtreg z_fi $xvarsFEinteract, fe cluster(Nl)
test 	(1.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(2.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(3.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(4.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(5.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(6.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(1.union_dissolution_splines#1.ch_gender#1.gender=0) /// 
		(2.union_dissolution_splines#1.ch_gender#1.gender=0) /// 
		(3.union_dissolution_splines#1.ch_gender#1.gender=0) /// 
		(4.union_dissolution_splines#1.ch_gender#1.gender=0) /// 
		(5.union_dissolution_splines#1.ch_gender#1.gender=0) /// 
		(6.union_dissolution_splines#1.ch_gender#1.gender=0) ///
		(1.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(2.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(3.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(4.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(5.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(6.union_dissolution_splines#0.ch_gender#0.gender=0) /// 
		(1.union_dissolution_splines#1.ch_gender#1.gender=0) /// 
		(2.union_dissolution_splines#1.ch_gender#1.gender=0) /// 
		(3.union_dissolution_splines#1.ch_gender#1.gender=0) /// 
		(4.union_dissolution_splines#1.ch_gender#1.gender=0) /// 
		(5.union_dissolution_splines#1.ch_gender#1.gender=0) /// 
		(6.union_dissolution_splines#1.ch_gender#1.gender=0)
	cd "$tables_out"
	outreg2 using MI_Supplem_Table_H, cti(z_fi) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 		/// 
	e(all) addnote("(Fully interacted gender*ch_gender) z_eurod_2 z_maxgrip_2 z_fi_2")

*----------------------------------------------------------------------------------------------------*
* 	Figures for Parents - Regression models separated by parents' gender (distributed FE)
*----------------------------------------------------------------------------------------------------*

*>> Independent variables 
global xvarsFE 												///
				ib3.union_dissolution_splines 				///
                i.gender                        			/// 
				i.divorce_dummy             				/// 
				i.time_since_cohabitation 					/// 
                i.kid_involved			 					/// 
				i.geo_distance 								///
				i.ch_gender                               	/// 
				i.nchild_cat                              	///
				c.cage                              		///
				i.marital                                 	///
                i.edu										/// 
				i.income  
				
*>> Clear estimates 
set sortseed 9876
sort pid_dyad wave 
estimates clear 

*>> Models separated by parent's gender 
// 	Fathers
foreach var of varlist z_eurod z_maxgrip z_fi {
	mi estimate, dots post: xtreg	`var' $xvarsFE if gender==0, fe cluster(Nl)
	est store m_`var'

	* 	mimrgns 
	mimrgns, dydx(union_dissolution_splines) post noestimcheck 
	est store m_marg_`var'
}
 

// 	Mothers
foreach var of varlist z_eurod z_maxgrip z_fi {
	mi estimate, dots post: xtreg	`var' $xvarsFE if gender==1, fe cluster(Nl)
	est store w_`var'

	* 	mimrgns 
	mimrgns, dydx(union_dissolution_splines) post noestimcheck
	est store w_marg_`var'
}

	
	 
*>> Figures (Depression)
coefplot 																										///
	/// Men 																									/// 
	(m_marg_z_eurod, label(Fathers) msymbol(S) msize(small) mcolor(gray) lpattern(dash_dot) lcolor(gray) 		///
		ciopts(recast(rcap) lwidth(thin))) 																		///
	/// Women 																									/// 
	(w_marg_z_eurod, label(Mothers) msymbol(T) mcolor(black) msize(small) lpattern(dot) 						///
		ciopts(recast(rcap) lcolor(black) lwidth(thin))) 														///
	/// Options 																								/// 
	, recast(connected) vertical  keep(*union_dissolution_splines*) 											///
	title ("Regression Coefficients with 95% CIs", size(med) margin(2 2 2 2)) 									///
		ytitle("Effect on Depression (EURO-D)",  orientation(vertical) margin(2 2 2 2)) 						///
		ylab(-0.40(0.2)0.60, labsize(vsmall) angle(0) format(%3.2f)) 											///
		xlab(, labsize(vsmall) angle(45)) 																		///
		xtitle("Years before/after children's union dissolution", size(small) margin(2 2 2 2))	 				///
		xscale(titlegap(2)) xlab(, labsize(vsmall)) 															///
		legend(on size(small))  yline(0) aspect(.5) xline(2.5, lpattern(dash) lcolor(gs12)) 

		
* 	Save the graph 
cd "$figure_out"
graph save "Depression_FE", replace
graph export "Depression_FE.png", as(png) width(1252) height(910) replace

coefplot 																										///
	/// Men 																									/// 
	(m_marg_z_eurod, label(Fathers) msymbol(S) msize(small) mcolor(gray) lpattern(dash_dot) lcolor(gray) 		///
		ciopts(recast(rcap) lwidth(thin))) 																		///
	/// Women 																									/// 
	(w_marg_z_eurod, label(Mothers) msymbol(T) mcolor(black) msize(small) lpattern(dot) 						///
		ciopts(recast(rcap) lcolor(black) lwidth(thin))) 														///
	/// Options 																								/// 
	, recast(connected) vertical  keep(*union_dissolution_splines*) 											///
	title ("Depression (EURO-D)", size(med) margin(2 2 2 2)) 													///
		ytitle(,  orientation(vertical) margin(2 2 2 2)) 														///
		ylab(-0.40(0.2)0.60, labsize(vsmall) angle(0) format(%3.2f)) 											///
		xlab(, labsize(vsmall) angle(45)) 																		///
		xtitle(, size(small) margin(2 2 2 2))	 																///
		xscale(titlegap(2)) xlab(, labsize(vsmall)) 															///
		legend(on size(small))  yline(0) aspect(.5) xline(2.5, lpattern(dash) lcolor(gs12)) 

		
* 	Save the graph 
cd "$figure_out"
graph save "Depression_FE_combine", replace

*>> Figures (Grip Strength)
coefplot 																										///
	/// Men 																									/// 
	(m_marg_z_maxgrip, label(Fathers) msymbol(S) msize(small) mcolor(gray) lpattern(dash_dot) lcolor(gray) 		///
		ciopts(recast(rcap) lwidth(thin))) 																		///
	/// Women 																									/// 
	(w_marg_z_maxgrip, label(Mothers) msymbol(T) mcolor(black) msize(small) lpattern(dot) 						///
		ciopts(recast(rcap) lcolor(black) lwidth(thin))) 														///
	/// Options 																								/// 
	, recast(connected) vertical  keep(*union_dissolution_splines*) 											///
	title ("Regression Coefficients with 95% CIs", size(med) margin(2 2 2 2)) 									///
		ytitle("Effect on Grip Strength (GS)",  orientation(vertical) margin(2 2 2 2)) 							///
		ylab(-0.40(0.2)0.60, labsize(vsmall) angle(0) format(%3.2f)) 											///
		xlab(, labsize(vsmall) angle(45)) 																		///
		xtitle("Years before/after children's union dissolution", size(small) margin(2 2 2 2))	 				///
		xscale(titlegap(2)) xlab(, labsize(vsmall)) 															///
		legend(on size(small))  yline(0) aspect(.5) xline(2.5, lpattern(dash) lcolor(gs12))  														

* 	Save the graph 
cd "$figure_out"
graph save "Grip Strength_FE", replace
graph export "Grip Strength_FE.png", as(png) width(1252) height(910) replace

coefplot 																										///
	/// Men 																									/// 
	(m_marg_z_maxgrip, label(Fathers) msymbol(S) msize(small) mcolor(gray) lpattern(dash_dot) lcolor(gray) 		///
		ciopts(recast(rcap) lwidth(thin))) 																		///
	/// Women 																									/// 
	(w_marg_z_maxgrip, label(Mothers) msymbol(T) mcolor(black) msize(small) lpattern(dot) 						///
		ciopts(recast(rcap) lcolor(black) lwidth(thin))) 														///
	/// Options 																								/// 
	, recast(connected) vertical  keep(*union_dissolution_splines*) 											///
	title ("Grip Strength (GS)", size(med) margin(2 2 2 2)) 													///
		ytitle(,  orientation(vertical) margin(2 2 2 2)) 														///
		ylab(-0.40(0.2)0.60, labsize(vsmall) angle(0) format(%3.2f)) 											///
		xlab(, labsize(vsmall) angle(45)) 																		///
		xtitle(, size(small) margin(2 2 2 2))	 																///
		xscale(titlegap(2)) xlab(, labsize(vsmall)) 															///
		legend(on size(small))  yline(0) aspect(.5) xline(2.5, lpattern(dash) lcolor(gs12))  														

* 	Save the graph 
cd "$figure_out"
graph save "Grip Strength_FE_combine", replace

*>> Figures (Frailty Index)
coefplot 																										///
	/// Men 																									/// 
	(m_marg_z_fi, label(Fathers) msymbol(S) msize(small) mcolor(gray) lpattern(dash_dot) lcolor(gray) 			///
		ciopts(recast(rcap) lwidth(thin))) 																		///
	/// Women 																									/// 
	(w_marg_z_fi, label(Mothers) msymbol(T) mcolor(black) msize(small) lpattern(dot) 							///
		ciopts(recast(rcap) lcolor(black) lwidth(thin))) 														///
	/// Options 																								/// 
	, recast(connected) vertical  keep(*union_dissolution_splines*) 											///
	title ("Regression Coefficients with 95% CIs", size(med) margin(2 2 2 2)) 									///
		ytitle("Effect on Frailty Index (FI)",  orientation(vertical) margin(2 2 2 2)) 							///
		ylab(-0.40(0.2)0.60, labsize(vsmall) angle(0) format(%3.2f)) 											///
		xlab(, labsize(vsmall) angle(45)) 																		///
		xtitle("Years before/after children's union dissolution", size(small) margin(2 2 2 2))	 				///
		xscale(titlegap(2)) xlab(, labsize(vsmall)) 															///
		legend(on size(small))  yline(0) aspect(.5) xline(2.5, lpattern(dash) lcolor(gs12)) 													

* 	Save the graph 
cd "$figure_out"
graph save "Frailty Index_FE", replace
graph export "Frailty Index_FE.png", as(png) width(1252) height(910) replace

coefplot 																										///
	/// Men 																									/// 
	(m_marg_z_fi, label(Fathers) msymbol(S) msize(small) mcolor(gray) lpattern(dash_dot) lcolor(gray) 			///
		ciopts(recast(rcap) lwidth(thin))) 																		///
	/// Women 																									/// 
	(w_marg_z_fi, label(Mothers) msymbol(T) mcolor(black) msize(small) lpattern(dot) 							///
		ciopts(recast(rcap) lcolor(black) lwidth(thin))) 														///
	/// Options 																								/// 
	, recast(connected) vertical  keep(*union_dissolution_splines*) 											///
	title ("Frailty Index (FI)", size(med) margin(2 2 2 2)) 													///
		ytitle(,  orientation(vertical) margin(2 2 2 2)) 														///
		ylab(-0.40(0.2)0.60, labsize(vsmall) angle(0) format(%3.2f)) 											///
		xlab(, labsize(vsmall) angle(45)) 																		///
		xtitle(, size(small) margin(2 2 2 2))	 																///
		xscale(titlegap(2)) xlab(, labsize(vsmall)) 															///
		legend(on size(small))  yline(0) aspect(.5) xline(2.5, lpattern(dash) lcolor(gs12)) 													

* 	Save the graph 
cd "$figure_out"
graph save "Frailty Index_FE_combine", replace





*----------------------------------------------------------------------------------------------------*
* 	Figures for Children - Regression models separated by children's gender (distributed FE)
*----------------------------------------------------------------------------------------------------*


*>> Clear estimates 
set sortseed 9876
sort pid_dyad wave 
estimates clear 

*>> Models separated by gender 
// 	Sons
foreach var of varlist z_eurod z_maxgrip z_fi {
	mi estimate, dots post: xtreg	`var' $xvarsFE if ch_gender==0, fe cluster(Nl)
	est store m_`var'

	* 	mimrgns 
	mimrgns, dydx(union_dissolution_splines) post noestimcheck
	est store m_marg_`var'
}


// 	Daughters
foreach var of varlist z_eurod z_maxgrip z_fi {
	mi estimate, dots post: xtreg	`var' $xvarsFE if ch_gender==1, fe cluster(Nl)
	est store w_`var'

	* 	mimrgns 
	mimrgns, dydx(union_dissolution_splines) post noestimcheck
	est store w_marg_`var'
}

	


*>> Figures (Depression)
coefplot 																										///
	/// Men 																									/// 
	(m_marg_z_eurod, label(Sons) msymbol(S) msize(small) mcolor(gray) lpattern(dash_dot) lcolor(gray) 			///
		ciopts(recast(rcap) lwidth(thin))) 																		///
	/// Women 																									/// 
	(w_marg_z_eurod, label(Daughters) msymbol(T) mcolor(black) msize(small) lpattern(dot) 						///
		ciopts(recast(rcap) lcolor(black) lwidth(thin))) 														///
	/// Options 																								/// 
	, recast(connected) vertical  keep(*union_dissolution_splines*) 											///
	title ("Regression Coefficients with 95% CIs", size(med) margin(2 2 2 2)) 									///
		ytitle("Effect on Depression (EURO-D)",  orientation(vertical) margin(2 2 2 2)) 						///
		ylab(-0.40(0.2)0.60, labsize(vsmall) angle(0) format(%3.2f)) 											///
		xlab(, labsize(vsmall) angle(45)) 																		///
		xtitle("Years before/after children's union dissolution", size(small) margin(2 2 2 2))	 				///
		xscale(titlegap(2)) xlab(, labsize(vsmall)) 															///
		legend(on size(small))  yline(0) aspect(.5) xline(2.5, lpattern(dash) lcolor(gs12)) 

* 	Save the graph 
cd "$figure_out"
graph save "Depression_FE_CH", replace
graph export "Depression_FE_CH.png", as(png) width(1252) height(910) replace


coefplot 																										///
	/// Men 																									/// 
	(m_marg_z_eurod, label(Sons) msymbol(S) msize(small) mcolor(gray) lpattern(dash_dot) lcolor(gray) 			///
		ciopts(recast(rcap) lwidth(thin))) 																		///
	/// Women 																									/// 
	(w_marg_z_eurod, label(Daughters) msymbol(T) mcolor(black) msize(small) lpattern(dot) 						///
		ciopts(recast(rcap) lcolor(black) lwidth(thin))) 														///
	/// Options 																								/// 
	, recast(connected) vertical  keep(*union_dissolution_splines*) 											///
	title ("Depression (EURO-D)", size(med) margin(2 2 2 2)) 													///
		ytitle(,  orientation(vertical) margin(2 2 2 2)) 														///
		ylab(-0.40(0.2)0.60, labsize(vsmall) angle(0) format(%3.2f)) 											///
		xlab(, labsize(vsmall) angle(45)) 																		///
		xtitle(, size(small) margin(2 2 2 2))	 																///
		xscale(titlegap(2)) xlab(, labsize(vsmall)) 															///
		legend(on size(small))  yline(0) aspect(.5) xline(2.5, lpattern(dash) lcolor(gs12)) 

* 	Save the graph 
cd "$figure_out"
graph save "Depression_FE_CH_combine", replace

*>> Figures (Grip Strength)
coefplot 																										///
	/// Men 																									/// 
	(m_marg_z_maxgrip, label(Sons) msymbol(S) msize(small) mcolor(gray) lpattern(dash_dot) lcolor(gray) 		///
		ciopts(recast(rcap) lwidth(thin))) 																		///
	/// Women 																									/// 
	(w_marg_z_maxgrip, label(Daughters) msymbol(T) mcolor(black) msize(small) lpattern(dot) 					///
		ciopts(recast(rcap) lcolor(black) lwidth(thin))) 														///
	/// Options 																								/// 
	, recast(connected) vertical  keep(*union_dissolution_splines*) 											///
	title ("Regression Coefficients with 95% CIs", size(med) margin(2 2 2 2)) 									///
		ytitle("Effect on Grip Strength (GS)",  orientation(vertical) margin(2 2 2 2)) 							///
		ylab(-0.40(0.2)0.60, labsize(vsmall) angle(0) format(%3.2f)) 											///
		xlab(, labsize(vsmall) angle(45)) 																		///
		xtitle("Years before/after children's union dissolution", size(small) margin(2 2 2 2))	 				///
		xscale(titlegap(2)) xlab(, labsize(vsmall)) 															///
		legend(on size(small))  yline(0) aspect(.5) xline(2.5, lpattern(dash) lcolor(gs12)) 												

* 	Save the graph 
cd "$figure_out"
graph save "Grip Strength_FE_CH", replace
graph export "Grip Strength_FE_CH.png", as(png) width(1252) height(910) replace


coefplot 																										///
	/// Men 																									/// 
	(m_marg_z_maxgrip, label(Sons) msymbol(S) msize(small) mcolor(gray) lpattern(dash_dot) lcolor(gray) 		///
		ciopts(recast(rcap) lwidth(thin))) 																		///
	/// Women 																									/// 
	(w_marg_z_maxgrip, label(Daughters) msymbol(T) mcolor(black) msize(small) lpattern(dot) 					///
		ciopts(recast(rcap) lcolor(black) lwidth(thin))) 														///
	/// Options 																								/// 
	, recast(connected) vertical  keep(*union_dissolution_splines*) 											///
	title ("Grip Strength (GS)", size(med) margin(2 2 2 2)) 													///
		ytitle(,  orientation(vertical) margin(2 2 2 2)) 														///
		ylab(-0.40(0.2)0.60, labsize(vsmall) angle(0) format(%3.2f)) 											///
		xlab(, labsize(vsmall) angle(45)) 																		///
		xtitle(, size(small) margin(2 2 2 2))	 																///
		xscale(titlegap(2)) xlab(, labsize(vsmall)) 															///
		legend(on size(small))  yline(0) aspect(.5) xline(2.5, lpattern(dash) lcolor(gs12)) 												

* 	Save the graph 
cd "$figure_out"
graph save "Grip Strength_FE_CH_combine", replace



*>> Figures (Frailty Index)
coefplot 																										///
	/// Men 																									/// 
	(m_marg_z_fi, label(Sons) msymbol(S) msize(small) mcolor(gray) lpattern(dash_dot) lcolor(gray) 				///
		ciopts(recast(rcap) lwidth(thin))) 																		///
	/// Women 																									/// 
	(w_marg_z_fi, label(Daughters) msymbol(T) mcolor(black) msize(small) lpattern(dot) 							///
		ciopts(recast(rcap) lcolor(black) lwidth(thin))) 														///
	/// Options 																								/// 
	, recast(connected) vertical  keep(*union_dissolution_splines*) 											///
	title ("Regression Coefficients with 95% CIs", size(med) margin(2 2 2 2)) 									///
		ytitle("Effect on Frailty Index (FI)",  orientation(vertical) margin(2 2 2 2)) 							///
		ylab(-0.40(0.2)0.60, labsize(vsmall) angle(0) format(%3.2f)) 											///
		xlab(, labsize(vsmall) angle(45)) 																		///
		xtitle("Years before/after children's union dissolution", size(small) margin(2 2 2 2))	 				///
		xscale(titlegap(2)) xlab(, labsize(vsmall)) 															///
		legend(on size(small))  yline(0) aspect(.5) xline(2.5, lpattern(dash) lcolor(gs12)) 													

* 	Save the graph 
cd "$figure_out"
graph save "Frailty Index_FE_CH", replace
graph export "Frailty Index_FE_CH.png", as(png) width(1252) height(910) replace



coefplot 																										///
	/// Men 																									/// 
	(m_marg_z_fi, label(Sons) msymbol(S) msize(small) mcolor(gray) lpattern(dash_dot) lcolor(gray) 				///
		ciopts(recast(rcap) lwidth(thin))) 																		///
	/// Women 																									/// 
	(w_marg_z_fi, label(Daughters) msymbol(T) mcolor(black) msize(small) lpattern(dot) 							///
		ciopts(recast(rcap) lcolor(black) lwidth(thin))) 														///
	/// Options 																								/// 
	, recast(connected) vertical  keep(*union_dissolution_splines*) 											///
	title ("Frailty Index (FI)", size(med) margin(2 2 2 2)) 													///
		ytitle(,  orientation(vertical) margin(2 2 2 2)) 														///
		ylab(-0.40(0.2)0.60, labsize(vsmall) angle(0) format(%3.2f)) 											///
		xlab(, labsize(vsmall) angle(45)) 																		///
		xtitle(, size(small) margin(2 2 2 2))	 																///
		xscale(titlegap(2)) xlab(, labsize(vsmall)) 															///
		legend(on size(small))  yline(0) aspect(.5) xline(2.5, lpattern(dash) lcolor(gs12)) 													

* 	Save the graph 
cd "$figure_out"
graph save "Frailty Index_FE_CH_combine", replace



*----------------------------------------------------------------------------------------------------*
* 	Combine the graphs 
*----------------------------------------------------------------------------------------------------*

cd "$figure_out"

*>> Figure 1. Fixed effects linear regression models on parents’ health (z-scores), by parents’ gender
grc1leg2    					///
"Depression_FE_combine.gph"   			///
"Grip Strength_FE_combine.gph"  		///
"Frailty Index_FE_combine.gph", ycommon l1(z-scores) b1(Years prior/after child's union dissolution, size(vsmall)) row(1) 
// position(6) ring(6) 			// this CHANGES POSITION OF LEGEND
gr_edit legend.DragBy 20 0
gr_edit b1title.DragBy 33 0
gr_edit style.editstyle boxstyle(shadestyle(color(white))) editcopy
gr_edit style.editstyle boxstyle(linestyle(color(white))) editcopy
gr_edit plotregion1.graph1.style.editstyle boxstyle(shadestyle(color(white))) editcopy
gr_edit plotregion1.graph1.style.editstyle boxstyle(linestyle(color(white))) editcopy
gr_edit plotregion1.graph2.style.editstyle boxstyle(shadestyle(color(white))) editcopy
gr_edit plotregion1.graph2.style.editstyle boxstyle(linestyle(color(white))) editcopy
gr_edit plotregion1.graph3.style.editstyle boxstyle(shadestyle(color(white))) editcopy
gr_edit plotregion1.graph3.style.editstyle boxstyle(linestyle(color(white))) editcopy

graph save "FE_by_PA_gender", replace		

*>> Figure 2. Fixed effects linear regression models on parents’ health (z-scores), by child’s gender.
grc1leg2    							///
"Depression_FE_CH_combine.gph"   		///
"Grip Strength_FE_CH_combine.gph"  		///
"Frailty Index_FE_CH_combine.gph", ycommon l1(z-scores) b1(Years prior/after child's union dissolution, size(vsmall)) row(1)
// position(6) ring(6) 			// this CHANGES POSITION OF LEGEND
gr_edit legend.DragBy 20 0
gr_edit b1title.DragBy 33 0
gr_edit style.editstyle boxstyle(shadestyle(color(white))) editcopy
gr_edit style.editstyle boxstyle(linestyle(color(white))) editcopy
gr_edit plotregion1.graph1.style.editstyle boxstyle(shadestyle(color(white))) editcopy
gr_edit plotregion1.graph1.style.editstyle boxstyle(linestyle(color(white))) editcopy
gr_edit plotregion1.graph2.style.editstyle boxstyle(shadestyle(color(white))) editcopy
gr_edit plotregion1.graph2.style.editstyle boxstyle(linestyle(color(white))) editcopy
gr_edit plotregion1.graph3.style.editstyle boxstyle(shadestyle(color(white))) editcopy
gr_edit plotregion1.graph3.style.editstyle boxstyle(linestyle(color(white))) editcopy

graph save "FE_by_CH_gender", replace	


*>> Combined graphs
graph combine "FE_by_PA_gender" "FE_by_CH_gender", row(2) altshrink iscale(2) ycommon b1(Years prior/after child's union dissolution, size(small))

graph save "COMBINED_FE_by_gender", replace	

	
*----------------------------------------------------------------------------------------------------*
*     Additional analyses
*----------------------------------------------------------------------------------------------------*

*>> Models with Frailty Index excluding mental well-being items 

* 	Standardize the variable by gender
capture drop fi_excl_mh
gen fi_excl_mh = . 
replace fi_excl_mh = fi_excl_mh_w1 if wave==1
replace fi_excl_mh = fi_excl_mh_w2 if wave==2
replace fi_excl_mh = fi_excl_mh_w3 if wave==3
replace fi_excl_mh = fi_excl_mh_w4 if wave==4


bys gender: egen 	mean_fi_excl_mh	= mean(fi_excl_mh)
bys gender: egen 	sd_fi_excl_mh 	= sd(fi_excl_mh)
bys gender: gen 	z_fi_excl_mh 	= (fi_excl_mh-mean_fi_excl_mh)/sd_fi_excl_mh



* 	Independent variables 
global xvarsFE 												///
				ib3.union_dissolution_splines 				///
                i.gender                        			/// 
				i.divorce_dummy             				/// 
				i.time_since_cohabitation 					/// 
                i.kid_involved			 					/// 
				i.geo_distance 								///
				i.ch_gender                               	/// 
				i.nchild_cat                              	///
				c.cage                              		///
				i.marital                                 	///
                i.edu										/// 
				i.income  
				
*>> Clear estimates 
estimates clear 

*>> Full sample
* 	This produces Supplementary Table A3
mi estimate, dots post: xtreg z_fi $xvarsFE, fe cluster(Nl)
test 1.union_dissolution_splines=2.union_dissolution_splines=3.union_dissolution_splines=4.union_dissolution_splines=5.union_dissolution_splines=6.union_dissolution_splines
	cd "$tables_out"
	outreg2	using MI_Supplem_Table_FI_excl_mh, cti("Full Index (Full sample)" (FE)) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 			/// 
		e(all) addnote() replace

		mi estimate, dots post: xtreg z_fi_excl_mh $xvarsFE, fe cluster(Nl)
test 1.union_dissolution_splines=2.union_dissolution_splines=3.union_dissolution_splines=4.union_dissolution_splines=5.union_dissolution_splines=6.union_dissolution_splines
	cd "$tables_out"
	outreg2	using MI_Supplem_Table_FI_excl_mh, cti("Excluding MH (Full sample)" (FE)) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 			/// 
		e(all) addnote()  

*>> Men

mi estimate, dots post: xtreg z_fi $xvarsFE if gender==0, fe cluster(Nl)
test 1.union_dissolution_splines=2.union_dissolution_splines=3.union_dissolution_splines=4.union_dissolution_splines=5.union_dissolution_splines=6.union_dissolution_splines
	cd "$tables_out"
	outreg2	using MI_Supplem_Table_FI_excl_mh, cti("Full Index (Men)" (FE)) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 			/// 
		e(all) addnote() 

mi estimate, dots post: xtreg z_fi_excl_mh $xvarsFE if gender==0, fe cluster(Nl)
test 1.union_dissolution_splines=2.union_dissolution_splines=3.union_dissolution_splines=4.union_dissolution_splines=5.union_dissolution_splines=6.union_dissolution_splines
	cd "$tables_out"
	outreg2	using MI_Supplem_Table_FI_excl_mh, cti("Excluding MH (Men)" (FE)) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 			/// 
		e(all) addnote()  

*>> Women
mi estimate, dots post: xtreg z_fi $xvarsFE if gender==1, fe cluster(Nl)
test 1.union_dissolution_splines=2.union_dissolution_splines=3.union_dissolution_splines=4.union_dissolution_splines=5.union_dissolution_splines=6.union_dissolution_splines
	cd "$tables_out"
	outreg2	using MI_Supplem_Table_FI_excl_mh, cti("Full Index (Women)" (FE)) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 			/// 
		e(all) addnote()  
		
mi estimate, dots post: xtreg z_fi_excl_mh $xvarsFE if gender==1, fe cluster(Nl)
test 1.union_dissolution_splines=2.union_dissolution_splines=3.union_dissolution_splines=4.union_dissolution_splines=5.union_dissolution_splines=6.union_dissolution_splines
	cd "$tables_out"
	outreg2	using MI_Supplem_Table_FI_excl_mh, cti("Excluding MH (Women)" (FE)) dec(2) ci alpha(.001, .01, .05, .10) symbol(***, **, *, +) 			/// 
		e(all) addnote()  

	
*----------------------------------------------------------------------------------------------------*
*     Close the log
*----------------------------------------------------------------------------------------------------*

display "$S_TIME  $S_DATE"
capture log close

