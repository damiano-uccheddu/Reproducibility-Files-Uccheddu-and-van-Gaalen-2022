cap la de YN -9 `"Not applicable"', modify
cap la de YN 0 `"No"', modify
cap la de YN 1 `"Yes"', modify
cap la de report -9 `"Not applicable"', modify
cap la de report 2009 `"2009"', modify
cap la de report 2010 `"2010"', modify
cap la de report 2011 `"2011"', modify
cap la de report 2012 `"2012"', modify
cap la de report 2013 `"2013"', modify
cap la de report 2014 `"2014"', modify
cap la de report 2015 `"2015"', modify
cap la de report 2016 `"2016"', modify
cap la de deviation -9 `"Not applicable"', modify
cap la de deviation 0 `"No Deviation"', modify
cap la de deviation 1 `"... yrbirth between SHARE & admin data"', modify
cap la de deviation 2 `"... gender between SHARE & admin data"', modify
cap recast str12 mergeid
cap recast byte share_w1
cap recast byte share_w2
cap recast byte share_w3
cap recast byte share_w4
cap recast byte share_w5
cap recast byte share_w6
cap recast byte consent_rl
cap recast byte admin_data
cap recast byte vskt
cap recast int vskt_year
cap recast byte rtbn
cap recast int rtbn_year
cap recast byte deviation
cap form mergeid %12s
cap form share_w1 %14.0g
cap form share_w2 %14.0g
cap form share_w3 %14.0g
cap form share_w4 %14.0g
cap form share_w5 %14.0g
cap form share_w6 %14.0g
cap form consent_rl %14.0g
cap form admin_data %14.0g
cap form vskt %14.0g
cap form vskt_year %14.0g
cap form rtbn %14.0g
cap form rtbn_year %14.0g
cap form deviation %38.0g
cap la val share_w1 YN
cap la val share_w2 YN
cap la val share_w3 YN
cap la val share_w4 YN
cap la val share_w5 YN
cap la val share_w6 YN
cap la val consent_rl YN
cap la val admin_data YN
cap la val vskt YN
cap la val vskt_year report
cap la val rtbn YN
cap la val rtbn_year report
cap la val deviation deviation
cap la var mergeid `"Person identifier (fix across modules and waves)"'
cap la var share_w1 `"Participation wave 1"'
cap la var share_w2 `"Participation wave 2"'
cap la var share_w3 `"Participation wave 3"'
cap la var share_w4 `"Participation wave 4"'
cap la var share_w5 `"Participation wave 5"'
cap la var share_w6 `"Participation wave 6"'
cap la var consent_rl `"Consent to record linkage"'
cap la var admin_data `"Administrative data available"'
cap la var vskt `"VSKT available"'
cap la var vskt_year `"Reporting year vskt"'
cap la var rtbn `"RTBN available"'
cap la var rtbn_year `"Reporting year rtbn"'
cap la var deviation `"Deviation between SHARE and admin data"'
