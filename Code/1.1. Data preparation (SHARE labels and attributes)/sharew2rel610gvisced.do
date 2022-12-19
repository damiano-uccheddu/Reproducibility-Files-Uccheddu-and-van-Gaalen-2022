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
cap la de isced -2 `"Refusal"', modify
cap la de isced -1 `"Don't know"', modify
cap la de isced 0 `"None"', modify
cap la de isced 1 `"ISCED-97 code 1"', modify
cap la de isced 2 `"ISCED-97 code 2"', modify
cap la de isced 3 `"ISCED-97 code 3"', modify
cap la de isced 4 `"ISCED-97 code 4"', modify
cap la de isced 5 `"ISCED-97 code 5"', modify
cap la de isced 6 `"ISCED-97 code 6"', modify
cap la de isced 95 `"Still in school"', modify
cap la de isced 97 `"Other"', modify
cap recast str12 mergeid
cap recast str11 hhid2
cap recast str12 mergeidp2
cap recast str15 coupleid2
cap recast byte country
cap recast byte language
cap recast byte isced1997_c1
cap recast byte isced1997_c2
cap recast byte isced1997_c3
cap recast byte isced1997_c4
cap recast byte isced1997_r
cap recast byte isced1997_sp
cap form mergeid %12s
cap form hhid2 %11s
cap form mergeidp2 %12s
cap form coupleid2 %15s
cap form country %14.0g
cap form language %44.0g
cap form isced1997_c1 %15.0g
cap form isced1997_c2 %15.0g
cap form isced1997_c3 %15.0g
cap form isced1997_c4 %15.0g
cap form isced1997_r %15.0g
cap form isced1997_sp %15.0g
cap la val country country
cap la val language language
cap la val isced1997_c1 isced
cap la val isced1997_c2 isced
cap la val isced1997_c3 isced
cap la val isced1997_c4 isced
cap la val isced1997_r isced
cap la val isced1997_sp isced
cap la var mergeid `"Person identifier (fix across modules and waves)"'
cap la var hhid2 `"Household identifier (wave 2)"'
cap la var mergeidp2 `"Partner identifier (wave 2)"'
cap la var coupleid2 `"Couple identifier (wave 2)"'
cap la var country `"Country identifier"'
cap la var language `"Language of questionnaire"'
cap la var isced1997_c1 `"Respondent's child 1: ISCED-97 coding of education"'
cap la var isced1997_c2 `"Respondent's child 2: ISCED-97 coding of education"'
cap la var isced1997_c3 `"Respondent's child 3: ISCED-97 coding of education"'
cap la var isced1997_c4 `"Respondent's child 4: ISCED-97 coding of education"'
cap la var isced1997_r `"Respondent: ISCED-97 coding of education"'
cap la var isced1997_sp `"Former spouse of respondent: ISCED-97 coding of education"'
