*>> Preliminary operations 

cls 
capture log close 
log using "$logfolder\1.2. Data preparation (SHARE labels and attributes).log", replace 

*>> SHARE labels and attributes 1.2.

	// This do-file run a series of other do-files (e.g. sharew5rel610gvimputations.do) which import, 
	// in the *.csv files provided by CBS, all the original SHARE labels and other attributes (e.g. variables' storage type, display format, etc.). 
	// 
	// Also, this do-file saves (i.e., converts) the old *.csv files as *.dta files. 


*>> Timestamp
timestamp_start 

*>> Run the do-file to label all the SHARE variables 
import delimited "$share_w5_in\sharew5_rel6-1-0_nl_gv_imputations.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew5rel610gvimputations.do" 
save "$share_w5_out\sharew5_rel6-1-0_nl_gv_imputations", replace

import delimited "$share_w4_in\sharew4_rel6-1-0_nl_gv_imputations.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew4rel610gvimputations.do" 
save "$share_w4_out\sharew4_rel6-1-0_nl_gv_imputations", replace

import delimited "$share_w2_in\sharew2_rel6-1-0_nl_gv_imputations.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew2rel610gvimputations.do" 
save "$share_w2_out\sharew2_rel6-1-0_nl_gv_imputations", replace

import delimited "$share_w5_in\sharew5_rel6-1-0_nl_ch.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew5rel610ch.do" 
save "$share_w5_out\sharew5_rel6-1-0_nl_ch", replace

import delimited "$share_w1_in\sharew1_rel6-1-0_nl_gv_imputations.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew1rel610gvimputations.do" 
save "$share_w1_out\sharew1_rel6-1-0_nl_gv_imputations", replace

import delimited "$share_w5_in\sharew5_rel6-1-0_nl_ep.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew5rel610ep.do" 
save "$share_w5_out\sharew5_rel6-1-0_nl_ep", replace

import delimited "$share_w4_in\sharew4_rel6-1-0_nl_dropoff.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew4rel610dropoff.do" 
save "$share_w4_out\sharew4_rel6-1-0_nl_dropoff", replace

import delimited "$share_w4_in\sharew4_rel6-1-0_nl_ep.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew4rel610ep.do" 
save "$share_w4_out\sharew4_rel6-1-0_nl_ep", replace

import delimited "$share_w4_in\sharew4_rel6-1-0_nl_ch.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew4rel610ch.do" 
save "$share_w4_out\sharew4_rel6-1-0_nl_ch", replace

import delimited "$share_w2_in\sharew2_rel6-1-0_nl_ep.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew2rel610ep.do" 
save "$share_w2_out\sharew2_rel6-1-0_nl_ep", replace

import delimited "$share_w3_in\sharew3_rel6-1-0_nl_ac.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew3rel610ac.do" 
save "$share_w3_out\sharew3_rel6-1-0_nl_ac", replace

import delimited "$share_w3_in\sharew3_rel6-1-0_nl_re.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew3rel610re.do" 
save "$share_w3_out\sharew3_rel6-1-0_nl_re", replace

import delimited "$share_w1_in\sharew1_rel6-1-0_nl_gv_isco.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew1rel610gvisco.do" 
save "$share_w1_out\sharew1_rel6-1-0_nl_gv_isco", replace

import delimited "$share_w5_in\sharew5_rel6-1-0_nl_as.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew5rel610as.do" 
save "$share_w5_out\sharew5_rel6-1-0_nl_as", replace

import delimited "$share_w1_in\sharew1_rel6-1-0_nl_ep.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew1rel610ep.do" 
save "$share_w1_out\sharew1_rel6-1-0_nl_ep", replace

import delimited "$share_w4_in\sharew4_rel6-1-0_nl_as.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew4rel610as.do" 
save "$share_w4_out\sharew4_rel6-1-0_nl_as", replace

import delimited "$share_w5_in\sharew5_rel6-1-0_nl_ho.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew5rel610ho.do" 
save "$share_w5_out\sharew5_rel6-1-0_nl_ho", replace

import delimited "$share_w2_in\sharew2_rel6-1-0_nl_as.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew2rel610as.do" 
save "$share_w2_out\sharew2_rel6-1-0_nl_as", replace

import delimited "$share_w4_in\sharew4_rel6-1-0_nl_ho.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew4rel610ho.do" 
save "$share_w4_out\sharew4_rel6-1-0_nl_ho", replace

import delimited "$share_w1_in\sharew1_rel6-1-0_nl_as.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew1rel610as.do" 
save "$share_w1_out\sharew1_rel6-1-0_nl_as", replace

import delimited "$share_w5_in\sharew5_rel6-1-0_nl_ph.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew5rel610ph.do" 
save "$share_w5_out\sharew5_rel6-1-0_nl_ph", replace

import delimited "$share_w3_in\sharew3_rel6-1-0_nl_rc.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew3rel610rc.do" 
save "$share_w3_out\sharew3_rel6-1-0_nl_rc", replace

import delimited "$share_w4_in\sharew4_rel6-1-0_nl_ph.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew4rel610ph.do" 
save "$share_w4_out\sharew4_rel6-1-0_nl_ph", replace

import delimited "$share_w4_in\sharew4_rel6-1-0_nl_gv_networks.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew4rel610gvnetworks.do" 
save "$share_w4_out\sharew4_rel6-1-0_nl_gv_networks", replace

import delimited "$share_w5_in\sharew5_rel6-1-0_nl_dn.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew5rel610dn.do" 
save "$share_w5_out\sharew5_rel6-1-0_nl_dn", replace

import delimited "$share_w5_in\sharew5_rel6-1-0_nl_gv_housing.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew5rel610gvhousing.do" 
save "$share_w5_out\sharew5_rel6-1-0_nl_gv_housing", replace

import delimited "$share_w5_in\sharew5_rel6-1-0_nl_sp.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew5rel610sp.do" 
save "$share_w5_out\sharew5_rel6-1-0_nl_sp", replace

import delimited "$share_w4_in\sharew4_rel6-1-0_nl_gv_housing.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew4rel610gvhousing.do" 
save "$share_w4_out\sharew4_rel6-1-0_nl_gv_housing", replace

import delimited "$share_w4_in\sharew4_rel6-1-0_nl_sp.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew4rel610sp.do" 
save "$share_w4_out\sharew4_rel6-1-0_nl_sp", replace

import delimited "$share_w2_in\sharew2_rel6-1-0_nl_ho.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew2rel610ho.do" 
save "$share_w2_out\sharew2_rel6-1-0_nl_ho", replace

import delimited "$share_w2_in\sharew2_rel6-1-0_nl_ch.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew2rel610ch.do" 
save "$share_w2_out\sharew2_rel6-1-0_nl_ch", replace

import delimited "$share_w5_in\sharew5_rel6-1-0_nl_hc.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew5rel610hc.do" 
save "$share_w5_out\sharew5_rel6-1-0_nl_hc", replace

import delimited "$share_w1_in\sharew1_rel6-1-0_nl_hc.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew1rel610hc.do" 
save "$share_w1_out\sharew1_rel6-1-0_nl_hc", replace

import delimited "$share_w5_in\sharew5_rel6-1-0_nl_hh.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew5rel610hh.do" 
save "$share_w5_out\sharew5_rel6-1-0_nl_hh", replace

import delimited "$share_w2_in\sharew2_rel6-1-0_nl_ft.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew2rel610ft.do" 
save "$share_w2_out\sharew2_rel6-1-0_nl_ft", replace

import delimited "$share_w4_in\sharew4_rel6-1-0_nl_hh.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew4rel610hh.do" 
save "$share_w4_out\sharew4_rel6-1-0_nl_hh", replace

import delimited "$share_w5_in\sharew5_rel6-1-0_nl_co.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew5rel610co.do" 
save "$share_w5_out\sharew5_rel6-1-0_nl_co", replace

import delimited "$share_w1_in\sharew1_rel6-1-0_nl_ch.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew1rel610ch.do" 
save "$share_w1_out\sharew1_rel6-1-0_nl_ch", replace

import delimited "$share_w2_in\sharew2_rel6-1-0_nl_hc.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew2rel610hc.do" 
save "$share_w2_out\sharew2_rel6-1-0_nl_hc", replace

import delimited "$share_w3_in\sharew3_rel6-1-0_nl_wq.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew3rel610wq.do" 
save "$share_w3_out\sharew3_rel6-1-0_nl_wq", replace

import delimited "$share_w1_in\sharew1_rel6-1-0_nl_ho.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew1rel610ho.do" 
save "$share_w1_out\sharew1_rel6-1-0_nl_ho", replace

import delimited "$share_w2_in\sharew2_rel6-1-0_nl_ph.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew2rel610ph.do" 
save "$share_w2_out\sharew2_rel6-1-0_nl_ph", replace

import delimited "$share_w2_in\sharew2_rel6-1-0_nl_sp.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew2rel610sp.do" 
save "$share_w2_out\sharew2_rel6-1-0_nl_sp", replace

import delimited "$share_w4_in\sharew4_rel6-1-0_nl_co.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew4rel610co.do" 
save "$share_w4_out\sharew4_rel6-1-0_nl_co", replace

import delimited "$share_w4_in\sharew4_rel6-1-0_nl_dn.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew4rel610dn.do" 
save "$share_w4_out\sharew4_rel6-1-0_nl_dn", replace

import delimited "$share_w5_in\sharew5_rel6-1-0_nl_cv_r.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew5rel610cvr.do" 
save "$share_w5_out\sharew5_rel6-1-0_nl_cv_r", replace

import delimited "$share_w1_in\sharew1_rel6-1-0_nl_ft.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew1rel610ft.do" 
save "$share_w1_out\sharew1_rel6-1-0_nl_ft", replace

import delimited "$share_w1_in\sharew1_rel6-1-0_nl_sp.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew1rel610sp.do" 
save "$share_w1_out\sharew1_rel6-1-0_nl_sp", replace

import delimited "$share_w5_in\sharew5_rel6-1-0_nl_gv_weights.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew5rel610gvweights.do" 
save "$share_w5_out\sharew5_rel6-1-0_nl_gv_weights", replace

import delimited "$share_w4_in\sharew4_rel6-1-0_nl_ft.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew4rel610ft.do" 
save "$share_w4_out\sharew4_rel6-1-0_nl_ft", replace

import delimited "$share_w5_in\sharew5_rel6-1-0_nl_ft.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew5rel610ft.do" 
save "$share_w5_out\sharew5_rel6-1-0_nl_ft", replace

import delimited "$share_w2_in\sharew2_rel6-1-0_nl_gv_housing.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew2rel610gvhousing.do" 
save "$share_w2_out\sharew2_rel6-1-0_nl_gv_housing", replace

import delimited "$share_w4_in\sharew4_rel6-1-0_nl_cv_r.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew4rel610cvr.do" 
save "$share_w4_out\sharew4_rel6-1-0_nl_cv_r", replace

import delimited "$share_w3_in\sharew3_rel6-1-0_nl_rp.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew3rel610rp.do" 
save "$share_w3_out\sharew3_rel6-1-0_nl_rp", replace

import delimited "$share_w3_in\sharew3_rel6-1-0_nl_dq.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew3rel610dq.do" 
save "$share_w3_out\sharew3_rel6-1-0_nl_dq", replace

import delimited "$share_w5_in\sharew5_rel6-1-0_nl_gv_isced.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew5rel610gvisced.do" 
save "$share_w5_out\sharew5_rel6-1-0_nl_gv_isced", replace

import delimited "$share_w3_in\sharew3_rel6-1-0_nl_hc.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew3rel610hc.do" 
save "$share_w3_out\sharew3_rel6-1-0_nl_hc", replace

import delimited "$share_w3_in\sharew3_rel6-1-0_nl_hs.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew3rel610hs.do" 
save "$share_w3_out\sharew3_rel6-1-0_nl_hs", replace

import delimited "$share_w4_in\sharew4_rel6-1-0_nl_gv_weights.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew4rel610gvweights.do" 
save "$share_w4_out\sharew4_rel6-1-0_nl_gv_weights", replace

import delimited "$share_w5_in\sharew5_rel6-1-0_nl_cf.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew5rel610cf.do" 
save "$share_w5_out\sharew5_rel6-1-0_nl_cf", replace

import delimited "$share_w5_in\sharew5_rel6-1-0_nl_gv_health.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew5rel610gvhealth.do" 
save "$share_w5_out\sharew5_rel6-1-0_nl_gv_health", replace

import delimited "$share_w1_in\sharew1_rel6-1-0_nl_ph.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew1rel610ph.do" 
save "$share_w1_out\sharew1_rel6-1-0_nl_ph", replace

import delimited "$share_w4_in\sharew4_rel6-1-0_nl_sn.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew4rel610sn.do" 
save "$share_w4_out\sharew4_rel6-1-0_nl_sn", replace

import delimited "$share_w1_in\sharew1_rel6-1-0_nl_gv_housing.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew1rel610gvhousing.do" 
save "$share_w1_out\sharew1_rel6-1-0_nl_gv_housing", replace

import delimited "$share_w4_in\sharew4_rel6-1-0_nl_cf.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew4rel610cf.do" 
save "$share_w4_out\sharew4_rel6-1-0_nl_cf", replace

import delimited "$share_w5_in\sharew5_rel6-1-0_nl_mc.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew5rel610mc.do" 
save "$share_w5_out\sharew5_rel6-1-0_nl_mc", replace

import delimited "$share_w5_in\sharew5_rel6-1-0_nl_ac.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew5rel610ac.do" 
save "$share_w5_out\sharew5_rel6-1-0_nl_ac", replace

import delimited "$share_w4_in\sharew4_rel6-1-0_nl_gv_health.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew4rel610gvhealth.do" 
save "$share_w4_out\sharew4_rel6-1-0_nl_gv_health", replace

import delimited "$share_w5_in\sharew5_rel6-1-0_nl_iv.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew5rel610iv.do" 
save "$share_w5_out\sharew5_rel6-1-0_nl_iv", replace

import delimited "$share_w1_in\sharew1_rel6-1-0_nl_dropoff.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew1rel610dropoff.do" 
save "$share_w1_out\sharew1_rel6-1-0_nl_dropoff", replace

import delimited "$share_w2_in\sharew2_rel6-1-0_nl_dn.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew2rel610dn.do" 
save "$share_w2_out\sharew2_rel6-1-0_nl_dn", replace

import delimited "$share_w5_in\sharew5_rel6-1-0_nl_mh.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew5rel610mh.do" 
save "$share_w5_out\sharew5_rel6-1-0_nl_mh", replace

import delimited "$share_w2_in\sharew2_re16-1-0_nl_ac.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew2rel610ac.do" 
save "$share_w2_out\sharew2_rel6-1-0_nl_ac", replace

import delimited "$share_w5_in\sharew5_rel6-1-0_nl_br.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew5rel610br.do" 
save "$share_w5_out\sharew5_rel6-1-0_nl_br", replace

import delimited "$share_w4_in\sharew4_rel6-1-0_nl_ac.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew4rel610ac.do" 
save "$share_w4_out\sharew4_rel6-1-0_nl_ac", replace

import delimited "$share_w4_in\sharew4_rel6-1-0_nl_mh.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew4rel610mh.do" 
save "$share_w4_out\sharew4_rel6-1-0_nl_mh", replace

import delimited "$share_w4_in\sharew4_rel6-1-0_nl_iv.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew4rel610iv.do" 
save "$share_w4_out\sharew4_rel6-1-0_nl_iv", replace

import delimited "$share_w5_in\sharew5_rel6-1-0_nl_cs.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew5rel610cs.do" 
save "$share_w5_out\sharew5_rel6-1-0_nl_cs", replace

import delimited "$share_w2_in\sharew2_rel6-1-0_nl_hh.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew2rel610hh.do" 
save "$share_w2_out\sharew2_rel6-1-0_nl_hh", replace

import delimited "$share_w5_in\sharew5_rel6-1-0_nl_ex.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew5rel610ex.do" 
save "$share_w5_out\sharew5_rel6-1-0_nl_ex", replace

import delimited "$share_w5_in\sharew5_rel6-1-0_nl_gs.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew5rel610gs.do" 
save "$share_w5_out\sharew5_rel6-1-0_nl_gs", replace

import delimited "$share_w2_in\sharew2_rel6-1-0_nl_cv_r.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew2rel610cvr.do" 
save "$share_w2_out\sharew2_rel6-1-0_nl_cv_r", replace

import delimited "$share_w4_in\sharew4_rel6-1-0_nl_hc.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew4rel610hc.do" 
save "$share_w4_out\sharew4_rel6-1-0_nl_hc", replace

import delimited "$share_w4_in\sharew4_rel6-1-0_nl_br.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew4rel610br.do" 
save "$share_w4_out\sharew4_rel6-1-0_nl_br", replace

import delimited "$share_w4_in\sharew4_rel6-1-0_nl_gv_isced.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew4rel610gvisced.do" 
save "$share_w4_out\sharew4_rel6-1-0_nl_gv_isced", replace

import delimited "$share_w3_in\sharew3_rel6-1-0_nl_gl.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew3rel610gl.do" 
save "$share_w3_out\sharew3_rel6-1-0_nl_gl", replace

import delimited "$share_w1_in\sharew1_rel6-1-0_nl_ex.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew1rel610ex.do" 
save "$share_w1_out\sharew1_rel6-1-0_nl_ex", replace

import delimited "$share_w4_in\sharew4_rel6-1-0_nl_ex.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew4rel610ex.do" 
save "$share_w4_out\sharew4_rel6-1-0_nl_ex", replace

import delimited "$share_w1_in\sharew1_rel6-1-0_nl_ac.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew1rel610ac.do" 
save "$share_w1_out\sharew1_rel6-1-0_nl_ac", replace

import delimited "$share_w1_in\sharew1_rel6-1-0_nl_dn.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew1rel610dn.do" 
save "$share_w1_out\sharew1_rel6-1-0_nl_dn", replace

import delimited "$share_w1_in\sharew1_rel6-1-0_nl_gv_grossnet.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew1rel610gvgrossnet.do" 
save "$share_w1_out\sharew1_rel6-1-0_nl_gv_grossnet", replace

import delimited "$share_w2_in\sharew2_rel6-1-0_nl_gv_weights.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew2rel610gvweights.do" 
save "$share_w2_out\sharew2_rel6-1-0_nl_gv_weights", replace

import delimited "$share_w5_in\sharew5_rel6-1-0_nl_gv_deprivation.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew5rel610gvdeprivation.do" 
save "$share_w5_out\sharew5_rel6-1-0_nl_gv_deprivation", replace

import delimited "$share_w5_in\sharew5_rel6-1-0_nl_technical_variables.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew5rel610technicalvariables.do" 
save "$share_w5_out\sharew5_rel6-1-0_nl_technical_variables", replace

import delimited "$share_w4_in\sharew4_rel6-1-0_nl_gs.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew4rel610gs.do" 
save "$share_w4_out\sharew4_rel6-1-0_nl_gs", replace

import delimited "$share_w4_in\sharew4_rel6-1-0_nl_pf.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew4rel610pf.do" 
save "$share_w4_out\sharew4_rel6-1-0_nl_pf", replace

import delimited "$share_w5_in\sharew5_rel6-1-0_nl_it.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew5rel610it.do" 
save "$share_w5_out\sharew5_rel6-1-0_nl_it", replace

import delimited "$share_w1_in\sharew1_rel6-1-0_nl_hh.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew1rel610hh.do" 
save "$share_w1_out\sharew1_rel6-1-0_nl_hh", replace

import delimited "$share_w4_in\sharew4_rel6-1-0_nl_technical_variables.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew4rel610technicalvariables.do" 
save "$share_w4_out\sharew4_rel6-1-0_nl_technical_variables", replace

import delimited "$share_w2_in\sharew2_rel6-1-0_nl_gv_health.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew2rel610gvhealth.do" 
save "$share_w2_out\sharew2_rel6-1-0_nl_gv_health", replace

import delimited "$share_w1_in\sharew1_rel6-1-0_nl_cv_r.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew1rel610cvr.do" 
save "$share_w1_out\sharew1_rel6-1-0_nl_cv_r", replace

import delimited "$share_w4_in\sharew4_rel6-1-0_nl_gv_ssw.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew4rel610gvssw.do" 
save "$share_w4_out\sharew4_rel6-1-0_nl_gv_ssw", replace

import delimited "$share_w2_in\sharew2_rel6-1-0_nl_co.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew2rel610co.do" 
save "$share_w2_out\sharew2_rel6-1-0_nl_co", replace

import delimited "$share_w1_in\sharew1_rel6-1-0_nl_gv_weights.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew1rel610gvweights.do" 
save "$share_w1_out\sharew1_rel6-1-0_nl_gv_weights", replace

import delimited "$share_w3_in\sharew3_rel6-1-0_nl_cv_r.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew3rel610cvr.do" 
save "$share_w3_out\sharew3_rel6-1-0_nl_cv_r", replace

import delimited "$share_w3_in\sharew3_rel6-1-0_nl_gv_weights.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew3rel610gvweights.do" 
save "$share_w3_out\sharew3_rel6-1-0_nl_gv_weights", replace

import delimited "$share_w1_in\sharew1_rel6-1-0_nl_gv_health.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew1rel610gvhealth.do" 
save "$share_w1_out\sharew1_rel6-1-0_nl_gv_health", replace

import delimited "$share_w2_in\sharew2_rel6-1-0_nl_iv.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew2rel610iv.do" 
save "$share_w2_out\sharew2_rel6-1-0_nl_iv", replace

import delimited "$share_w2_in\sharew2_rel6-1-0_nl_ws.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew2rel610ws.do" 
save "$share_w2_out\sharew2_rel6-1-0_nl_ws", replace

import delimited "$share_w1_in\sharew1_rel6-1-0_nl_iv.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew1rel610iv.do" 
save "$share_w1_out\sharew1_rel6-1-0_nl_iv", replace

import delimited "$share_w2_in\sharew2_rel6-1-0_nl_cs.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew2rel610cs.do" 
save "$share_w2_out\sharew2_rel6-1-0_nl_cs", replace

import delimited "$share_w1_in\sharew1_rel6-1-0_nl_co.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew1rel610co.do" 
save "$share_w1_out\sharew1_rel6-1-0_nl_co", replace

import delimited "$share_w2_in\sharew2_rel6-1-0_nl_ex.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew2rel610ex.do" 
save "$share_w2_out\sharew2_rel6-1-0_nl_ex", replace

import delimited "$share_w2_in\sharew2_rel6-1-0_nl_mh.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew2rel610mh.do" 
save "$share_w2_out\sharew2_rel6-1-0_nl_mh", replace

import delimited "$share_w1_in\sharew1_rel6-1-0_nl_gv_isced.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew1rel610gvisced.do" 
save "$share_w1_out\sharew1_rel6-1-0_nl_gv_isced", replace

import delimited "$share_w2_in\sharew2_rel6-1-0_nl_cf.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew2rel610cf.do" 
save "$share_w2_out\sharew2_rel6-1-0_nl_cf", replace

import delimited "$share_w2_in\sharew2_rel6-1-0_nl_br.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew2rel610br.do" 
save "$share_w2_out\sharew2_rel6-1-0_nl_br", replace

import delimited "$share_w2_in\sharew2_rel6-1-0_nl_gs.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew2rel610gs.do" 
save "$share_w2_out\sharew2_rel6-1-0_nl_gs", replace

import delimited "$share_w2_in\sharew2_rel6-1-0_nl_pf.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew2rel610pf.do" 
save "$share_w2_out\sharew2_rel6-1-0_nl_pf", replace

import delimited "$share_w1_in\sharew1_rel6-1-0_nl_ws.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew1rel610ws.do" 
save "$share_w1_out\sharew1_rel6-1-0_nl_ws", replace

import delimited "$share_w2_in\sharew2_rel6-1-0_nl_technical_variables.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew2rel610technicalvariables.do" 
save "$share_w2_out\sharew2_rel6-1-0_nl_technical_variables", replace

import delimited "$share_w3_in\sharew3_rel6-1-0_nl_fs.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew3rel610fs.do" 
save "$share_w3_out\sharew3_rel6-1-0_nl_fs", replace

import delimited "$share_w1_in\sharew1_rel6-1-0_nl_mh.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew1rel610mh.do" 
save "$share_w1_out\sharew1_rel6-1-0_nl_mh", replace

import delimited "$share_w2_in\sharew2_rel6-1-0_nl_gv_isced.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew2rel610gvisced.do" 
save "$share_w2_out\sharew2_rel6-1-0_nl_gv_isced", replace 

import delimited "$share_w3_in\sharew3_rel6-1-0_nl_iv.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew3rel610iv.do" 
save "$share_w3_out\sharew3_rel6-1-0_nl_iv", replace 

import delimited "$share_w1_in\sharew1_rel6-1-0_nl_cf.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew1rel610cf.do" 
save "$share_w1_out\sharew1_rel6-1-0_nl_cf", replace 

import delimited "$share_w1_in\sharew1_rel6-1-0_nl_br.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew1rel610br.do" 
save "$share_w1_out\sharew1_rel6-1-0_nl_br", replace 

import delimited "$share_w3_in\sharew3_rel6-1-0_nl_cs.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew3rel610cs.do" 
save "$share_w3_out\sharew3_rel6-1-0_nl_cs", replace 

import delimited "$share_w3_in\sharew3_rel6-1-0_nl_gs.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew3rel610gs.do" 
save "$share_w3_out\sharew3_rel6-1-0_nl_gs", replace 

import delimited "$share_w1_in\sharew1_rel6-1-0_nl_technical_variables.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew1rel610technicalvariables.do" 
save "$share_w1_out\sharew1_rel6-1-0_nl_technical_variables", replace 

import delimited "$share_w2_in\sharew2_rel6-1-0_nl_dropoff.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew2rel610dropoff.do" 
save "$share_w2_out\sharew2_rel6-1-0_nl_dropoff", replace 

import delimited "$share_w1_in\sharew1_rel6-1-0_nl_gs.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew1rel610gs.do" 
save "$share_w1_out\sharew1_rel6-1-0_nl_gs", replace 

import delimited "$share_w3_in\sharew3_rel6-1-0_nl_st.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew3rel610st.do" 
save "$share_w3_out\sharew3_rel6-1-0_nl_st", replace 

import delimited "$share_w5_in\sharew5_rel6-1-0_nl_xt.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew5rel610xt.do" 
save "$share_w5_out\sharew5_rel6-1-0_nl_xt", replace

import delimited "$share_w2_in\sharew2_rel6-1-0_nl_vignettes.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew2rel610vignettes.do" 
save "$share_w2_out\sharew2_rel6-1-0_nl_vignettes", replace

import delimited "$share_w3_in\sharew3_rel6-1-0_nl_xt.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew3rel610xt.do" 
save "$share_w3_out\sharew3_rel6-1-0_nl_xt", replace

import delimited "$share_w4_in\sharew4_rel6-1-0_nl_xt.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew4rel610xt.do" 
save "$share_w4_out\sharew4_rel6-1-0_nl_xt", replace

import delimited "$share_w1_in\sharew1_rel6-1-0_nl_vignettes.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew1rel610vignettes.do" 
save "$share_w1_out\sharew1_rel6-1-0_nl_vignettes", replace

import delimited "$share_w2_in\sharew2_rel6-1-0_nl_xt.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew2rel610xt.do" 
save "$share_w2_out\sharew2_rel6-1-0_nl_xt", replace

import delimited "$share_w1_in\sharew1_rel6-1-0_nl_gv_exrates.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew1rel610gvexrates.do" 
save "$share_w1_out\sharew1_rel6-1-0_nl_gv_exrates", replace

import delimited "$share_w2_in\sharew2_rel6-1-0_nl_gv_exrates.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew2rel610gvexrates.do" 
save "$share_w2_out\sharew2_rel6-1-0_nl_gv_exrates", replace

import delimited "$share_w3_in\sharew3_rel6-1-0_nl_gv_exrates.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew3rel610gvexrates.do" 
save "$share_w3_out\sharew3_rel6-1-0_nl_gv_exrates", replace

import delimited "$share_w4_in\sharew4_rel6-1-0_nl_gv_exrates.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew4rel610gvexrates.do" 
save "$share_w4_out\sharew4_rel6-1-0_nl_gv_exrates", replace

import delimited "$share_w5_in\sharew5_rel6-1-0_nl_gv_exrates.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharew5rel610gvexrates.do" 
save "$share_w5_out\sharew5_rel6-1-0_nl_gv_exrates", replace

import delimited "$share_wX_in\sharewX_rel6-1-0_nl_gv_allwaves_cv_r.csv", varnames(1) case(preserve) clear decimalseparator(,) 
destring, replace
do "$dataset_preparation11\sharewXrel610gvallwavescvr.do" 
save "$share_wX_out\sharewX_rel6-1-0_nl_gv_allwaves_cv_r", replace


*>> Timestamp
timestamp_stop

*>> Log close
capture log close 
