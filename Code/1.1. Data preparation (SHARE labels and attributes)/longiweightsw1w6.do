cap la de country 11 `"Austria"', modify
cap la de country 12 `"Germany"', modify
cap la de country 13 `"Sweden"', modify
cap la de country 14 `"Netherlands"', modify
cap la de country 15 `"Spain"', modify
cap la de country 16 `"Italy"', modify
cap la de country 17 `"France"', modify
cap la de country 18 `"Denmark"', modify
cap la de country 19 `"Greece"', modify
cap la de country 20 `"Switzerland"', modify
cap la de country 23 `"Belgium"', modify
cap la de country 25 `"Israel"', modify
cap la de country 28 `"Czech Republic"', modify
cap la de country 29 `"Poland"', modify
cap la de country 30 `"Ireland"', modify
cap la de country 31 `"Luxembourg"', modify
cap la de country 32 `"Hungary"', modify
cap la de country 33 `"Portugal"', modify
cap la de country 34 `"Slovenia"', modify
cap la de country 35 `"Estonia"', modify
cap la de country 47 `"Croatia"', modify
cap la de country 48 `"Lithuania"', modify
cap la de country 51 `"Bulgaria"', modify
cap la de country 53 `"Cyprus"', modify
cap la de country 55 `"Finland"', modify
cap la de country 57 `"Latvia"', modify
cap la de country 59 `"Malta"', modify
cap la de country 61 `"Romania"', modify
cap la de country 63 `"Slovakia"', modify
cap la de pstat 0 `"not interviewed in all waves"', modify
cap la de pstat 1 `"interviewed in all waves"', modify
cap recast str12 mergeid
cap recast byte country
cap recast byte panel_resp
cap recast double dw_w1
cap recast double clhw_a
cap recast double cliw_a
cap recast str6 subsample
cap recast str9 stratum1
cap recast str4 stratum2
cap recast str9 psu
cap recast str5 ssu
cap form mergeid %12s
cap form country %14.0g
cap form panel_resp %28.0g
cap form dw_w1 %10.0g
cap form clhw_a %10.0g
cap form cliw_a %10.0g
cap form subsample %9s
cap form stratum1 %9s
cap form stratum2 %9s
cap form psu %9s
cap form ssu %9s
cap la val country country
cap la val panel_resp pstat
cap la var mergeid `"Person identifier (fix across modules and waves)"'
cap la var country `"Country identifier"'
cap la var panel_resp `"Respondent participation in panel: 1_2_3_4_5_6"'
cap la var dw_w1 `"Design weight - wave 1"'
cap la var clhw_a `"Calibrated longitudinal household weight - panel: 1_2_3_4_5_6"'
cap la var cliw_a `"Calibrated longitudinal individual weight - panel: 1_2_3_4_5_6"'
cap la var subsample `"Indicator for country-specific subsample"'
cap la var stratum1 `"Indicator for primary stratum (if any)"'
cap la var stratum2 `"Indicator for secondary stratum (if any)"'
cap la var psu `"Primary sampling unit"'
cap la var ssu `"Secondary sampling unit (if any)"'
