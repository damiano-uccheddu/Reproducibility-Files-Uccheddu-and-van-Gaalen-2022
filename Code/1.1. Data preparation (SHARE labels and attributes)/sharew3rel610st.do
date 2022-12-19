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
cap la de proxy -2 `"Refusal"', modify
cap la de proxy -1 `"Don't know"', modify
cap la de proxy 1 `"Respondent only"', modify
cap la de proxy 2 `"Respondent and proxy"', modify
cap la de proxy 3 `"Proxy only"', modify
cap la de yesno -2 `"Refusal"', modify
cap la de yesno -1 `"Don't know"', modify
cap la de yesno 1 `"Yes"', modify
cap la de yesno 5 `"No"', modify
cap la de month -2 `"Refusal"', modify
cap la de month -1 `"Don't know"', modify
cap la de month 1 `"January"', modify
cap la de month 2 `"February"', modify
cap la de month 3 `"March"', modify
cap la de month 4 `"April"', modify
cap la de month 5 `"May"', modify
cap la de month 6 `"June"', modify
cap la de month 7 `"July"', modify
cap la de month 8 `"August"', modify
cap la de month 9 `"September"', modify
cap la de month 10 `"October"', modify
cap la de month 11 `"November"', modify
cap la de month 12 `"December"', modify
cap la de month 13 `"Today"', modify
cap la de dkrf -2 `"Refusal"', modify
cap la de dkrf -1 `"Don't know"', modify
cap la de gender -2 `"Refusal"', modify
cap la de gender -1 `"Don't know"', modify
cap la de gender 1 `"Male"', modify
cap la de gender 2 `"Female"', modify
cap recast str12 mergeid
cap recast str11 hhid3
cap recast str12 mergeidp3
cap recast str15 coupleid3
cap recast byte country
cap recast byte language
cap recast byte sl_st001a_
cap recast byte sl_st001b_
cap recast byte sl_st006_
cap recast int sl_st007_
cap recast byte sl_st011_
cap recast byte sl_st016_
cap form mergeid %12s
cap form hhid3 %11s
cap form mergeidp3 %12s
cap form coupleid3 %15s
cap form country %14.0g
cap form language %44.0g
cap form sl_st001a_ %20.0g
cap form sl_st001b_ %10.0g
cap form sl_st006_ %10.0g
cap form sl_st007_ %10.0g
cap form sl_st011_ %10.0g
cap form sl_st016_ %20.0g
cap la val country country
cap la val language language
cap la val sl_st001a_ proxy
cap la val sl_st001b_ yesno
cap la val sl_st006_ month
cap la val sl_st007_ dkrf
cap la val sl_st011_ gender
cap la val sl_st016_ proxy
cap la var mergeid `"Person identifier (fix across modules and waves)"'
cap la var hhid3 `"Household identifier (wave 3)"'
cap la var mergeidp3 `"Partner identifier (wave 3)"'
cap la var coupleid3 `"Couple identifier (wave 3)"'
cap la var country `"Country identifier"'
cap la var language `"Language of questionnaire"'
cap la var sl_st001a_ `"Check if proxy"'
cap la var sl_st001b_ `"Validate proxy"'
cap la var sl_st006_ `"Month of birth of respondent"'
cap la var sl_st007_ `"Year of birth of respondent"'
cap la var sl_st011_ `"Gender of respondent"'
cap la var sl_st016_ `"Proxy check"'
