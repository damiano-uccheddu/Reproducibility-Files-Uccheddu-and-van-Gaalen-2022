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
cap la de yesno -2 `"Refusal"', modify
cap la de yesno -1 `"Don't know"', modify
cap la de yesno 1 `"Yes"', modify
cap la de yesno 5 `"No"', modify
cap la de dkrf -2 `"Refusal"', modify
cap la de dkrf -1 `"Don't know"', modify
cap la de effort -2 `"Refusal"', modify
cap la de effort -1 `"Don't know"', modify
cap la de effort 1 `"R gave full effort"', modify
cap la de effort 2 `"R was prevented from giving full effort"', modify
cap la de effort 3 `"R did not appear to give full effort, but no obvious reason"', modify
cap la de position -2 `"Refusal"', modify
cap la de position -1 `"Don't know"', modify
cap la de position 1 `"Standing"', modify
cap la de position 2 `"Sitting"', modify
cap la de position 3 `"Lying down"', modify
cap la de dummi -2 `"Refusal"', modify
cap la de dummi -1 `"Don't know"', modify
cap la de dummi 0 `"Not selected"', modify
cap la de dummi 1 `"Selected"', modify
cap recast str12 mergeid
cap recast str11 hhid2
cap recast str12 mergeidp2
cap recast str15 coupleid2
cap recast byte country
cap recast byte language
cap recast byte pf002_
cap recast int pf003_
cap recast int pf004_
cap recast byte pf005_
cap recast byte pf006_
cap recast byte pf007d1
cap recast byte pf007d2
cap recast byte pf007d3
cap recast byte pf007d4
cap recast byte pf007d5
cap recast byte pf007dot
cap form mergeid %12s
cap form hhid2 %11s
cap form mergeidp2 %12s
cap form coupleid2 %15s
cap form country %14.0g
cap form language %44.0g
cap form pf002_ %10.0g
cap form pf003_ %10.0g
cap form pf004_ %10.0g
cap form pf005_ %60.0g
cap form pf006_ %10.0g
cap form pf007d1 %12.0g
cap form pf007d2 %12.0g
cap form pf007d3 %12.0g
cap form pf007d4 %12.0g
cap form pf007d5 %12.0g
cap form pf007dot %12.0g
cap la val country country
cap la val language language
cap la val pf002_ yesno
cap la val pf003_ dkrf
cap la val pf004_ dkrf
cap la val pf005_ effort
cap la val pf006_ position
cap la val pf007d1 dummi
cap la val pf007d2 dummi
cap la val pf007d3 dummi
cap la val pf007d4 dummi
cap la val pf007d5 dummi
cap la val pf007dot dummi
cap la var mergeid `"Person identifier (fix across modules and waves)"'
cap la var hhid2 `"Household identifier (wave 2)"'
cap la var mergeidp2 `"Partner identifier (wave 2)"'
cap la var coupleid2 `"Couple identifier (wave 2)"'
cap la var country `"Country identifier"'
cap la var language `"Language of questionnaire"'
cap la var pf002_ `"Feels safe to do the test"'
cap la var pf003_ `"Value first measurement"'
cap la var pf004_ `"Value second measurement"'
cap la var pf005_ `"Effort R gave to this measurement"'
cap la var pf006_ `"Position of R for this test"'
cap la var pf007d1 `"Why pf not completed: R felt it would not be safe"'
cap la var pf007d2 `"Why pf not completed: IWER felt it would not be safe"'
cap la var pf007d3 `"Why pf not completed: R refused or was not willing to complete"'
cap la var pf007d4 `"Why pf not completed: R tried but was unable to complete"'
cap la var pf007d5 `"Why pf not completed: R did not understand the instructions"'
cap la var pf007dot `"Why pf not completed: Other"'
