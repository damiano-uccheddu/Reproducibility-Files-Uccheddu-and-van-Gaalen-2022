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
cap la de rfdkfin -9999992 `"Refusal"', modify
cap la de rfdkfin -9999991 `"Don't know"', modify
cap la de eurocon_entry -2 `"Refusal"', modify
cap la de eurocon_entry -1 `"Don't know"', modify
cap la de eurocon_entry 1 `"Less than low entry point"', modify
cap la de eurocon_entry 2 `"About low entry point"', modify
cap la de eurocon_entry 3 `"Between low and mid entry point"', modify
cap la de eurocon_entry 4 `"About mid entry point"', modify
cap la de eurocon_entry 5 `"Between mid and high entry point"', modify
cap la de eurocon_entry 6 `"About high entry point"', modify
cap la de eurocon_entry 7 `"More than high entry point"', modify
cap la de household -2 `"Refusal"', modify
cap la de household -1 `"Don't know"', modify
cap la de household 1 `"With great difficulty"', modify
cap la de household 2 `"With some difficulty"', modify
cap la de household 3 `"Fairly easily"', modify
cap la de household 4 `"Easily"', modify
cap la de proxy -2 `"Refusal"', modify
cap la de proxy -1 `"Don't know"', modify
cap la de proxy 1 `"Respondent only"', modify
cap la de proxy 2 `"Respondent and proxy"', modify
cap la de proxy 3 `"Proxy only"', modify
cap la de yesno -2 `"Refusal"', modify
cap la de yesno -1 `"Don't know"', modify
cap la de yesno 1 `"Yes"', modify
cap la de yesno 5 `"No"', modify
cap recast str12 mergeid
cap recast str11 hhid4
cap recast str12 mergeidp4
cap recast str15 coupleid4
cap recast byte country
cap recast byte language
cap recast float exrate
cap recast double co002e
cap recast byte co002ub
cap recast double co002v1
cap recast double co002v2
cap recast double co002v3
cap recast double co003e
cap recast byte co003ub
cap recast float co003v1
cap recast double co003v2
cap recast double co003v3
cap recast byte co007_
cap recast byte co009_
cap recast byte co010_
cap recast double co011e
cap recast byte co011ub
cap recast float co011v1
cap recast float co011v2
cap recast double co011v3
cap form mergeid %12s
cap form hhid4 %11s
cap form mergeidp4 %12s
cap form coupleid4 %15s
cap form country %14.0g
cap form language %44.0g
cap form exrate %9.0g
cap form co002e %11.0g
cap form co002ub %32.0g
cap form co002v1 %11.0g
cap form co002v2 %11.0g
cap form co002v3 %11.0g
cap form co003e %11.0g
cap form co003ub %32.0g
cap form co003v1 %11.0g
cap form co003v2 %11.0g
cap form co003v3 %11.0g
cap form co007_ %28.0g
cap form co009_ %44.0g
cap form co010_ %11.0g
cap form co011e %11.0g
cap form co011ub %32.0g
cap form co011v1 %11.0g
cap form co011v2 %11.0g
cap form co011v3 %11.0g
cap la val country country
cap la val language language
cap la val co002e rfdkfin
cap la val co002ub eurocon_entry
cap la val co003e rfdkfin
cap la val co003ub eurocon_entry
cap la val co007_ household
cap la val co009_ proxy
cap la val co010_ yesno
cap la val co011e rfdkfin
cap la val co011ub eurocon_entry
cap la var mergeid `"Person identifier (fix across modules and waves)"'
cap la var hhid4 `"Household identifier (wave 4)"'
cap la var mergeidp4 `"Partner identifier (wave 4)"'
cap la var coupleid4 `"Couple identifier (wave 4)"'
cap la var country `"Country identifier"'
cap la var language `"Language of questionnaire"'
cap la var exrate `"Exchange rate 1 euro"'
cap la var co002e `"Amount spent on food at home"'
cap la var co002ub `"Amount spent on food at home ub"'
cap la var co002v1 `"Bracket value 1"'
cap la var co002v2 `"Bracket value 2"'
cap la var co002v3 `"Bracket value 3"'
cap la var co003e `"Amount spent on food outside the home"'
cap la var co003ub `"Amount spent on food outside the home ub"'
cap la var co003v1 `"Bracket value 1"'
cap la var co003v2 `"Bracket value 2"'
cap la var co003v3 `"Bracket value 3"'
cap la var co007_ `"Is household able to make ends meet"'
cap la var co009_ `"Who answered the questions in co"'
cap la var co010_ `"Consume home produced food"'
cap la var co011e `"Value of home produced food"'
cap la var co011ub `"Value of home produced food ub"'
cap la var co011v1 `"Bracket value 1"'
cap la var co011v2 `"Bracket value 2"'
cap la var co011v3 `"Bracket value 3"'
