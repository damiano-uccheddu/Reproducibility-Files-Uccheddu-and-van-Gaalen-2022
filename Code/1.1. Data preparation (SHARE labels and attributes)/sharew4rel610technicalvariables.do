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
cap la de famresp -9 `"Not applicable"', modify
cap la de famresp -2 `"Refusal"', modify
cap la de famresp -1 `"Don't know"', modify
cap la de famresp 0 `"Not family respondent"', modify
cap la de famresp 1 `"Family respondent"', modify
cap la de finresp -9 `"Not applicable"', modify
cap la de finresp -2 `"Refusal"', modify
cap la de finresp -1 `"Don't know"', modify
cap la de finresp 0 `"Not financial respondent"', modify
cap la de finresp 1 `"Financial respondent"', modify
cap la de houresp -9 `"Not applicable"', modify
cap la de houresp -2 `"Refusal"', modify
cap la de houresp -1 `"Don't know"', modify
cap la de houresp 0 `"Not household respondent"', modify
cap la de houresp 1 `"Household respondent"', modify
cap la de mn005_ 1 `"Single"', modify
cap la de mn005_ 2 `"Couple, first respondent"', modify
cap la de mn005_ 3 `"Couple, second respondent"', modify
cap la de yesno -2 `"Refusal"', modify
cap la de yesno -1 `"Don't know"', modify
cap la de yesno 1 `"Yes"', modify
cap la de yesno 5 `"No"', modify
cap la de mn024_ -2 `"Refusal"', modify
cap la de mn024_ -1 `"Don't know"', modify
cap la de mn024_ 1 `"Private household"', modify
cap la de mn024_ 2 `"Nursing home"', modify
cap la de yesnomn -2 `"Refusal"', modify
cap la de yesnomn -1 `"Don't know"', modify
cap la de yesnomn 0 `"No"', modify
cap la de yesnomn 1 `"Yes"', modify
cap la de mn101_ 0 `"Baseline questionnaire"', modify
cap la de mn101_ 1 `"Longitudinal questionnaire"', modify
cap recast str12 mergeid
cap recast str11 hhid4
cap recast str12 mergeidp4
cap recast str15 coupleid4
cap recast byte country
cap recast byte language
cap recast byte fam_resp
cap recast byte fin_resp
cap recast byte hou_resp
cap recast byte mn005_
cap recast byte mn016_
cap recast byte mn017_
cap recast byte mn018_
cap recast byte mn019_
cap recast byte mn024_
cap recast byte mn026_
cap recast byte mn101_
cap form mergeid %12s
cap form hhid4 %11s
cap form mergeidp4 %12s
cap form coupleid4 %15s
cap form country %14.0g
cap form language %44.0g
cap form fam_resp %21.0g
cap form fin_resp %24.0g
cap form hou_resp %24.0g
cap form mn005_ %37.0g
cap form mn016_ %11.0g
cap form mn017_ %11.0g
cap form mn018_ %11.0g
cap form mn019_ %11.0g
cap form mn024_ %17.0g
cap form mn026_ %11.0g
cap form mn101_ %26.0g
cap la val country country
cap la val language language
cap la val fam_resp famresp
cap la val fin_resp finresp
cap la val hou_resp houresp
cap la val mn005_ mn005_
cap la val mn016_ yesno
cap la val mn017_ yesno
cap la val mn018_ yesno
cap la val mn019_ yesno
cap la val mn024_ mn024_
cap la val mn026_ yesnomn
cap la val mn101_ mn101_
cap la var mergeid `"Person identifier (fix across modules and waves)"'
cap la var hhid4 `"Household identifier (wave 4)"'
cap la var mergeidp4 `"Partner identifier (wave 4)"'
cap la var coupleid4 `"Couple identifier (wave 4)"'
cap la var country `"Country identifier"'
cap la var language `"Language of questionnaire"'
cap la var fam_resp `"Family respondent"'
cap la var fin_resp `"Financial respondent"'
cap la var hou_resp `"Household respondent"'
cap la var mn005_ `"Single or couple interview"'
cap la var mn016_ `"Mother in household"'
cap la var mn017_ `"Father in household"'
cap la var mn018_ `"Mother-in-law in household"'
cap la var mn019_ `"Father-in-law in household"'
cap la var mn024_ `"Nursing home interview"'
cap la var mn026_ `"First respondent from couple or single"'
cap la var mn101_ `"Questionnaire version"'
