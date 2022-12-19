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
cap la de country 55 `"Finnland"', modify
cap la de country 57 `"Latvia"', modify
cap la de country 59 `"Malta"', modify
cap la de country 61 `"Romania"', modify
cap la de country 63 `"Slovakia"', modify
cap la de language 11 `"German (at)"', modify
cap la de language 12 `"German (de)"', modify
cap la de language 13 `"Swedish"', modify
cap la de language 14 `"Dutch (nl)"', modify
cap la de language 15 `"Spanish"', modify
cap la de language 16 `"Italian (it)"', modify
cap la de language 17 `"French (fr)"', modify
cap la de language 18 `"Danish"', modify
cap la de language 19 `"Greek"', modify
cap la de language 20 `"German (ch)"', modify
cap la de language 21 `"French (ch)"', modify
cap la de language 22 `"Italian (ch)"', modify
cap la de language 23 `"French (be)"', modify
cap la de language 24 `"Flemish (be)"', modify
cap la de language 25 `"Hebrew (il)"', modify
cap la de language 26 `"Arabic (il)"', modify
cap la de language 27 `"Russian (il)"', modify
cap la de language 28 `"Czech"', modify
cap la de language 29 `"Polish"', modify
cap la de language 30 `"English (ie)"', modify
cap la de language 31 `"Luxembourgian, French, German or Portuguese "', modify
cap la de language 32 `"Hungarian"', modify
cap la de language 33 `"Portuguese"', modify
cap la de language 34 `"Slovenian"', modify
cap la de language 35 `"Estonian or Russian (ee)"', modify
cap la de language 36 `"Estonian (ee)"', modify
cap la de language 37 `"Russian (ee)"', modify
cap la de language 38 `"Spanish or Catalan (eg)"', modify
cap la de language 39 `"Catalan (eg)"', modify
cap la de language 40 `"Spanish (eg)"', modify
cap la de language 41 `"French (lu)"', modify
cap la de language 42 `"German (lu)"', modify
cap la de language 43 `"Portuguese (lu)"', modify
cap la de language 44 `"French or German (lu)"', modify
cap la de language 45 `"French or German or Portuguese (lu)"', modify
cap la de language 47 `"Croatian"', modify
cap la de language 48 `"Lithuanian"', modify
cap la de language 51 `"Bulgarian"', modify
cap la de language 53 `"Greek (cy)"', modify
cap la de language 55 `"Finnish"', modify
cap la de language 56 `"Swedish (fi)"', modify
cap la de language 57 `"Latvian"', modify
cap la de language 58 `"Russian (lv)"', modify
cap la de language 59 `"Maltese"', modify
cap la de language 60 `"English (mt)"', modify
cap la de language 61 `"Romanian"', modify
cap la de language 63 `"Slovakian"', modify
cap la de language 65 `"Catalan (es)"', modify
cap la de Hrespt 1 `"1 S"', modify
cap la de Hrespt 2 `"1 CNRP"', modify
cap la de Hrespt 3 `"1 C2R"', modify
cap la de Hrespt 4 `"1 CNRP + 1 S"', modify
cap la de Hrespt 5 `"Multi S"', modify
cap la de Hrespt 6 `"1 C2R  + 1 S"', modify
cap la de Hrespt 7 `"1 C2R + 1 CNRP"', modify
cap la de Hrespt 8 `"Multi C2R"', modify
cap la de Hrespt 9 `"Multi CNRP"', modify
cap la de Hrespt 10 `"Multi S + 1 C2R"', modify
cap la de Hrespt 11 `"Multi S + 1 CNRP"', modify
cap la de Hrespt 12 `"1 S + Multi C2R"', modify
cap la de hhyotg_f -5 `"N/A"', modify
cap la de hhyotg_f 1 `"Gross income of other HH members"', modify
cap la de hhyotg_f 2 `"HH benefits"', modify
cap la de hhyotg_f 3 `"Gross income of other HH members + HH benefits"', modify
cap la de hhyotn_f -5 `"N/A"', modify
cap la de hhyotn_f 1 `"Net income of other HH members"', modify
cap la de hhyotn_f 2 `"HH benefits"', modify
cap la de hhyotn_f 3 `"Net income of other HH members + HH benefits"', modify
cap recast str12 mergeid
cap recast str11 hhid1
cap recast str12 mergeidp1
cap recast str15 coupleid1
cap recast byte country
cap recast byte language
cap recast byte hhsize
cap recast byte htype
cap recast double sic
cap recast double tax
cap recast double ytotg
cap recast double ytotn
cap recast double ynrpg
cap recast double ynrpn
cap recast double hhyotg
cap recast double hhyotn
cap recast double hhytotg
cap recast double hhytotn
cap recast byte hhyotg_f
cap recast byte hhyotn_f
cap form mergeid %12s
cap form hhid1 %11s
cap form mergeidp1 %12s
cap form coupleid1 %15s
cap form country %14.0g
cap form language %44.0g
cap form hhsize %9.0g
cap form htype %16.0g
cap form sic %9.0g
cap form tax %9.0g
cap form ytotg %9.0g
cap form ytotn %9.0g
cap form ynrpg %9.0g
cap form ynrpn %9.0g
cap form hhyotg %9.0g
cap form hhyotn %9.0g
cap form hhytotg %9.0g
cap form hhytotn %9.0g
cap form hhyotg_f %46.0g
cap form hhyotn_f %44.0g
cap la val country country
cap la val language language
cap la val htype Hrespt
cap la val hhyotg_f hhyotg_f
cap la val hhyotn_f hhyotn_f
cap la var mergeid `"Person identifier (fix across modules and waves)"'
cap la var hhid1 `"Household identifier (wave 1)"'
cap la var mergeidp1 `"Partner identifier (wave 1)"'
cap la var coupleid1 `"Couple identifier (wave 1)"'
cap la var country `"Country identifier"'
cap la var language `"Language of questionnaire"'
cap la var hhsize `"Household size"'
cap la var htype `"Household type"'
cap la var sic `"Social insurance contributions"'
cap la var tax `"Personal income tax"'
cap la var ytotg `"Total individual income, gross"'
cap la var ytotn `"Total individual income, net"'
cap la var ynrpg `"NRP income, gross"'
cap la var ynrpn `"NRP income, net"'
cap la var hhyotg `"Other household members gross income and household benefits"'
cap la var hhyotn `"Other household members net income and household benefits"'
cap la var hhytotg `"Total household income, gross"'
cap la var hhytotn `"Total household income, net"'
cap la var hhyotg_f `"Other household members gross income and household benefits - Flag"'
cap la var hhyotn_f `"Other household members net income and household benefits - Flag"'
