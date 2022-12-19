*>> Preliminary operations 

cls 

*>> Log file
capture log close 
log using "$logfolder\1.0. Data preparation (SHARE labels and attributes).log", replace 


*>> Labels - Stage 1 (Save descriptive attributes of SHARE variables to a do-file)

use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_gv_imputations.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610gvimputations.do", replace)


use "share_w5_in\sharew5_rel6-1-0_gv_imputations.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew5rel610gvimputations.do", replace)


use "share_w4_in\sharew4_rel6-1-0_gv_imputations.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew4rel610gvimputations.do", replace)


use "share_w2_in\sharew2_rel6-1-0_gv_imputations.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew2rel610gvimputations.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_ch.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610ch.do", replace)


use "share_w5_in\sharew5_rel6-1-0_ch.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew5rel610ch.do", replace)


use "share_w1_in\sharew1_rel6-1-0_gv_imputations.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew1rel610gvimputations.do", replace)


use "share_w5_in\sharew5_rel6-1-0_ep.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew5rel610ep.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_gv_children.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610gvchildren.do", replace)


use "share_wX_gv_cv_r_in\sharewX_rel6-1-0_gv_allwaves_cv_r.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharewXrel610gvallwavescvr.do", replace)


use "share_w4_in\sharew4_rel6-1-0_dropoff.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew4rel610dropoff.do", replace)


use "share_w4_in\sharew4_rel6-1-0_ep.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew4rel610ep.do", replace)


use "share_w4_in\sharew4_rel6-1-0_ch.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew4rel610ch.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_ep.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610ep.do", replace)


use "share_w2_in\sharew2_rel6-1-0_ep.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew2rel610ep.do", replace)


use "share_w3_in\sharew3_rel6-1-0_ac.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew3rel610ac.do", replace)


use "share_w3_in\sharew3_rel6-1-0_re.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew3rel610re.do", replace)


use "share_w1_in\sharew1_rel6-1-0_gv_isco.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew1rel610gvisco.do", replace)


use "share_w5_in\sharew5_rel6-1-0_as.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew5rel610as.do", replace)


use "share_w1_in\sharew1_rel6-1-0_ep.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew1rel610ep.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_as.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610as.do", replace)


use "share_w4_in\sharew4_rel6-1-0_as.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew4rel610as.do", replace)


use "share_w5_in\sharew5_rel6-1-0_ho.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew5rel610ho.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_ho.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610ho.do", replace)


use "share_w2_in\sharew2_rel6-1-0_as.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew2rel610as.do", replace)


use "share_w4_in\sharew4_rel6-1-0_ho.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew4rel610ho.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_gv_networks.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610gvnetworks.do", replace)


use "share_w1_in\sharew1_rel6-1-0_as.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew1rel610as.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_ph.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610ph.do", replace)


use "share_w5_in\sharew5_rel6-1-0_ph.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew5rel610ph.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_sp.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610sp.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_dn.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610dn.do", replace)


use "share_w3_in\sharew3_rel6-1-0_rc.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew3rel610rc.do", replace)


use "share_w4_in\sharew4_rel6-1-0_ph.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew4rel610ph.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_dropoff.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610dropoff.do", replace)


use "share_w4_in\sharew4_rel6-1-0_gv_networks.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew4rel610gvnetworks.do", replace)


use "share_w5_in\sharew5_rel6-1-0_dn.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew5rel610dn.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_gv_housing.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610gvhousing.do", replace)


use "share_w5_in\sharew5_rel6-1-0_gv_housing.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew5rel610gvhousing.do", replace)


use "share_w5_in\sharew5_rel6-1-0_sp.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew5rel610sp.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_hc.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610hc.do", replace)


use "share_w4_in\sharew4_rel6-1-0_gv_housing.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew4rel610gvhousing.do", replace)


use "share_w4_in\sharew4_rel6-1-0_sp.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew4rel610sp.do", replace)


use "share_w2_in\sharew2_rel6-1-0_ho.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew2rel610ho.do", replace)


use "share_w2_in\sharew2_rel6-1-0_ch.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew2rel610ch.do", replace)


use "share_w5_in\sharew5_rel6-1-0_hc.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew5rel610hc.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_sn.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610sn.do", replace)


use "share_w1_in\sharew1_rel6-1-0_hc.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew1rel610hc.do", replace)


use "share_w5_in\sharew5_rel6-1-0_hh.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew5rel610hh.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_ft.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610ft.do", replace)


use "share_w2_in\sharew2_rel6-1-0_ft.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew2rel610ft.do", replace)


use "share_w4_in\sharew4_rel6-1-0_hh.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew4rel610hh.do", replace)


use "share_w5_in\sharew5_rel6-1-0_co.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew5rel610co.do", replace)


use "share_w1_in\sharew1_rel6-1-0_ch.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew1rel610ch.do", replace)


use "share_w2_in\sharew2_rel6-1-0_hc.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew2rel610hc.do", replace)


use "share_w3_in\sharew3_rel6-1-0_wq.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew3rel610wq.do", replace)


use "share_w1_in\sharew1_rel6-1-0_ho.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew1rel610ho.do", replace)


use "share_w2_in\sharew2_rel6-1-0_ph.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew2rel610ph.do", replace)


use "share_w2_in\sharew2_rel6-1-0_sp.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew2rel610sp.do", replace)


use "share_w4_in\sharew4_rel6-1-0_co.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew4rel610co.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_cv_r.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610cvr.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_co.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610co.do", replace)


use "share_w4_in\sharew4_rel6-1-0_dn.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew4rel610dn.do", replace)


use "share_w5_in\sharew5_rel6-1-0_cv_r.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew5rel610cvr.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_gv_weights.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610gvweights.do", replace)


use "share_w1_in\sharew1_rel6-1-0_ft.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew1rel610ft.do", replace)


use "share_w1_in\sharew1_rel6-1-0_sp.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew1rel610sp.do", replace)


use "share_w5_in\sharew5_rel6-1-0_gv_weights.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew5rel610gvweights.do", replace)


use "share_w4_in\sharew4_rel6-1-0_ft.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew4rel610ft.do", replace)


use "share_w5_in\sharew5_rel6-1-0_ft.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew5rel610ft.do", replace)


use "share_w2_in\sharew2_rel6-1-0_gv_housing.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew2rel610gvhousing.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_cf.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610cf.do", replace)


use "share_w4_in\sharew4_rel6-1-0_cv_r.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew4rel610cvr.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_hh.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610hh.do", replace)


use "share_w3_in\sharew3_rel6-1-0_rp.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew3rel610rp.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_gv_isced.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610gvisced.do", replace)


use "share_w3_in\sharew3_rel6-1-0_dq.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew3rel610dq.do", replace)


use "share_w5_in\sharew5_rel6-1-0_gv_isced.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew5rel610gvisced.do", replace)


use "share_w3_in\sharew3_rel6-1-0_hc.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew3rel610hc.do", replace)


use "share_w3_in\sharew3_rel6-1-0_hs.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew3rel610hs.do", replace)


use "share_w4_in\sharew4_rel6-1-0_gv_weights.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew4rel610gvweights.do", replace)


use "share_w5_in\sharew5_rel6-1-0_cf.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew5rel610cf.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_gv_health.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610gvhealth.do", replace)


use "share_w5_in\sharew5_rel6-1-0_gv_health.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew5rel610gvhealth.do", replace)


use "share_w1_in\sharew1_rel6-1-0_ph.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew1rel610ph.do", replace)


use "share_w4_in\sharew4_rel6-1-0_sn.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew4rel610sn.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_ac.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610ac.do", replace)


use "share_w1_in\sharew1_rel6-1-0_gv_housing.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew1rel610gvhousing.do", replace)


use "share_w4_in\sharew4_rel6-1-0_cf.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew4rel610cf.do", replace)


use "share_w5_in\sharew5_rel6-1-0_mc.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew5rel610mc.do", replace)


use "share_w5_in\sharew5_rel6-1-0_ac.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew5rel610ac.do", replace)


use "share_w4_in\sharew4_rel6-1-0_gv_health.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew4rel610gvhealth.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_iv.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610iv.do", replace)


use "share_w5_in\sharew5_rel6-1-0_iv.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew5rel610iv.do", replace)


use "share_w1_in\sharew1_rel6-1-0_dropoff.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew1rel610dropoff.do", replace)


use "share_w2_in\sharew2_rel6-1-0_dn.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew2rel610dn.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_ex.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610ex.do", replace)


use "share_w5_in\sharew5_rel6-1-0_mh.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew5rel610mh.do", replace)


use "share_w2_in\sharew2_rel6-1-0_ac.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew2rel610ac.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_br.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610br.do", replace)


use "share_w5_in\sharew5_rel6-1-0_br.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew5rel610br.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_mh.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610mh.do", replace)


use "share_w4_in\sharew4_rel6-1-0_ac.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew4rel610ac.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_gs.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610gs.do", replace)


use "share_w4_in\sharew4_rel6-1-0_mh.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew4rel610mh.do", replace)


use "share_w4_in\sharew4_rel6-1-0_iv.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew4rel610iv.do", replace)


use "share_w5_in\sharew5_rel6-1-0_cs.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew5rel610cs.do", replace)


use "share_w2_in\sharew2_rel6-1-0_hh.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew2rel610hh.do", replace)


use "share_w5_in\sharew5_rel6-1-0_ex.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew5rel610ex.do", replace)


use "share_w5_in\sharew5_rel6-1-0_gs.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew5rel610gs.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_pf.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610pf.do", replace)


use "share_w2_in\sharew2_rel6-1-0_cv_r.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew2rel610cvr.do", replace)


use "share_w4_in\sharew4_rel6-1-0_hc.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew4rel610hc.do", replace)


use "share_w4_in\sharew4_rel6-1-0_br.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew4rel610br.do", replace)


use "share_w4_in\sharew4_rel6-1-0_gv_isced.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew4rel610gvisced.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_technical_variables.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610technicalvariables.do", replace)


use "share_w3_in\sharew3_rel6-1-0_gl.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew3rel610gl.do", replace)


use "share_w1_in\sharew1_rel6-1-0_ex.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew1rel610ex.do", replace)


use "share_w4_in\sharew4_rel6-1-0_ex.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew4rel610ex.do", replace)


use "share_w1_in\sharew1_rel6-1-0_ac.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew1rel610ac.do", replace)


use "share_w1_in\sharew1_rel6-1-0_dn.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew1rel610dn.do", replace)


use "share_w1_in\sharew1_rel6-1-0_gv_grossnet.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew1rel610gvgrossnet.do", replace)


use "share_w2_in\sharew2_rel6-1-0_gv_weights.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew2rel610gvweights.do", replace)


use "share_w5_in\sharew5_rel6-1-0_gv_deprivation.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew5rel610gvdeprivation.do", replace)


use "share_w5_in\sharew5_rel6-1-0_technical_variables.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew5rel610technicalvariables.do", replace)


use "share_w4_in\sharew4_rel6-1-0_gs.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew4rel610gs.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_bs.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610bs.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_it.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610it.do", replace)


use "share_w4_in\sharew4_rel6-1-0_pf.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew4rel610pf.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_gv_dbs.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610gvdbs.do", replace)


use "share_w5_in\sharew5_rel6-1-0_it.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew5rel610it.do", replace)


use "share_w1_in\sharew1_rel6-1-0_hh.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew1rel610hh.do", replace)


use "share_w4_in\sharew4_rel6-1-0_technical_variables.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew4rel610technicalvariables.do", replace)


use "share_wX_gv_weights_in\sharewX_rel6-1-0_gv_longitudinal_weights_w5w6.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\longiweightsw5w6.do", replace)


use "share_w2_in\sharew2_rel6-1-0_gv_health.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew2rel610gvhealth.do", replace)


use "share_w1_in\sharew1_rel6-1-0_cv_r.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew1rel610cvr.do", replace)


use "share_w4_in\sharew4_rel6-1-0_gv_ssw.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew4rel610gvssw.do", replace)


use "share_w2_in\sharew2_rel6-1-0_co.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew2rel610co.do", replace)


use "share_w1_in\sharew1_rel6-1-0_gv_weights.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew1rel610gvweights.do", replace)


use "share_w3_in\sharew3_rel6-1-0_cv_r.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew3rel610cvr.do", replace)


use "share_w3_in\sharew3_rel6-1-0_gv_weights.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew3rel610gvweights.do", replace)


use "share_w1_in\sharew1_rel6-1-0_gv_health.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew1rel610gvhealth.do", replace)


use "share_w2_in\sharew2_rel6-1-0_iv.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew2rel610iv.do", replace)


use "share_w5_in\sharew5_rel6-1-0_dropoff.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew5rel610dropoff.do", replace)


use "share_wX_gv_weights_in\sharewX_rel6-1-0_gv_longitudinal_weights_w4w5.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\longiweightsw4w5.do", replace)


use "share_w2_in\sharew2_rel6-1-0_ws.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew2rel610ws.do", replace)


use "share_w1_in\sharew1_rel6-1-0_iv.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew1rel610iv.do", replace)


use "share_w2_in\sharew2_rel6-1-0_cs.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew2rel610cs.do", replace)


use "share_w1_in\sharew1_rel6-1-0_co.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew1rel610co.do", replace)


use "share_w2_in\sharew2_rel6-1-0_ex.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew2rel610ex.do", replace)


use "share_w2_in\sharew2_rel6-1-0_mh.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew2rel610mh.do", replace)


use "share_w1_in\sharew1_rel6-1-0_gv_isced.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew1rel610gvisced.do", replace)


use "share_w2_in\sharew2_rel6-1-0_cf.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew2rel610cf.do", replace)


use "share_w2_in\sharew2_rel6-1-0_br.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew2rel610br.do", replace)


use "share_w2_in\sharew2_rel6-1-0_gs.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew2rel610gs.do", replace)


use "share_w2_in\sharew2_rel6-1-0_pf.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew2rel610pf.do", replace)


use "share_w1_in\sharew1_rel6-1-0_ws.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew1rel610ws.do", replace)


use "share_w2_in\sharew2_rel6-1-0_technical_variables.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew2rel610technicalvariables.do", replace)


use "share_w3_in\sharew3_rel6-1-0_fs.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew3rel610fs.do", replace)


use "share_w1_in\sharew1_rel6-1-0_mh.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew1rel610mh.do", replace)


use "share_w2_in\sharew2_rel6-1-0_gv_isced.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew2rel610gvisced.do", replace)


use "share_w3_in\sharew3_rel6-1-0_iv.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew3rel610iv.do", replace)


use "share_w1_in\sharew1_rel6-1-0_cf.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew1rel610cf.do", replace)


use "share_w1_in\sharew1_rel6-1-0_br.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew1rel610br.do", replace)


use "share_w3_in\sharew3_rel6-1-0_cs.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew3rel610cs.do", replace)


use "share_w3_in\sharew3_rel6-1-0_gs.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew3rel610gs.do", replace)


use "share_wX_gv_weights_in\sharewX_rel6-1-0_gv_longitudinal_weights_w2w3.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\longiweightsw2w3.do", replace)


use "share_w1_in\sharew1_rel6-1-0_technical_variables.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew1rel610technicalvariables.do", replace)


use "share_w2_in\sharew2_rel6-1-0_dropoff.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew2rel610dropoff.do", replace)


use "share_w1_in\sharew1_rel6-1-0_gs.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew1rel610gs.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_xt.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610xt.do", replace)


use "share_w3_in\sharew3_rel6-1-0_st.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew3rel610st.do", replace)


use "share_wX_gv_weights_in\sharewX_rel6-1-0_gv_longitudinal_weights_w1w2.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\longiweightsw1w2.do", replace)


use "share_wX_gv_weights_in\sharewX_rel6-1-0_gv_longitudinal_weights_w3w4.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\longiweightsw3w4.do", replace)


use "share_w5_in\sharew5_rel6-1-0_xt.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew5rel610xt.do", replace)


use "share_w2_in\sharew2_rel6-1-0_vignettes.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew2rel610vignettes.do", replace)


use "share_w3_in\sharew3_rel6-1-0_xt.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew3rel610xt.do", replace)


use "share_w4_in\sharew4_rel6-1-0_xt.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew4rel610xt.do", replace)


use "share_wX_gv_weights_in\sharewX_rel6-1-0_gv_longitudinal_weights_w1-w6.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\longiweightsw1w6.do", replace)


use "share_w1_in\sharew1_rel6-1-0_vignettes.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew1rel610vignettes.do", replace)


use "share_w2_in\sharew2_rel6-1-0_xt.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew2rel610xt.do", replace)


use "share_wX_gv_linkage_in\sharewX_rel6-1-0_gv_linkage.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharewXrel610gvlinkage.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_interviewer_survey.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610interviewersurvey.do", replace)


use "share_w5_in\sharew5_rel6-1-0_interviewer_survey.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew5rel610interviewersurvey.do", replace)


use "share_w1_in\sharew1_rel6-1-0_ep_ilextra.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew1rel610epilextra.do", replace)


use "share_w1_in\sharew1_rel6-1-0_gv_exrates.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew1rel610gvexrates.do", replace)


use "share_w2_in\sharew2_rel6-1-0_gv_exrates.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew2rel610gvexrates.do", replace)


use "share_w3_in\sharew3_rel6-1-0_gv_exrates.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew3rel610gvexrates.do", replace)


use "share_w4_in\sharew4_rel6-1-0_gv_exrates.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew4rel610gvexrates.do", replace)


use "share_w5_in\sharew5_rel6-1-0_gv_exrates.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew5rel610gvexrates.do", replace)


use "share_w6_NL_Mixed_Mode_in\sharew6_rel6-1-0_gv_exrates.dta", clear 
descsave, do("C:\Users\Damiano\Dropbox\NIDI\04 - Fourth paper\Data Analysis\Labels\do-files (OUTPUT)\sharew6rel610gvexrates.do", replace)



*>> Close the log file 
capture log close 
