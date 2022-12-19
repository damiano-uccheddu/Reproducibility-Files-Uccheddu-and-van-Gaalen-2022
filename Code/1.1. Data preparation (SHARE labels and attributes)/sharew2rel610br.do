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
cap la de dummi -2 `"Refusal"', modify
cap la de dummi -1 `"Don't know"', modify
cap la de dummi 0 `"Not selected"', modify
cap la de dummi 1 `"Selected"', modify
cap la de br010_ -2 `"Refusal"', modify
cap la de br010_ -1 `"Don't know"', modify
cap la de br010_ 1 `"Daily or almost every day"', modify
cap la de br010_ 2 `"Five or six days a week"', modify
cap la de br010_ 3 `"Three or four days a week"', modify
cap la de br010_ 4 `"Once or twice a week"', modify
cap la de br010_ 5 `"Once or twice a month"', modify
cap la de br010_ 6 `"Less than once a month"', modify
cap la de br010_ 7 `"Not at all in the last 3 months"', modify
cap la de br_more -2 `"Refusal"', modify
cap la de br_more -1 `"Don't know"', modify
cap la de br_more 1 `"More than once a week"', modify
cap la de br_more 2 `"Once a week"', modify
cap la de br_more 3 `"One to three times a month"', modify
cap la de br_more 4 `"Hardly ever, or never"', modify
cap la de proxy -2 `"Refusal"', modify
cap la de proxy -1 `"Don't know"', modify
cap la de proxy 1 `"Respondent only"', modify
cap la de proxy 2 `"Respondent and proxy"', modify
cap la de proxy 3 `"Proxy only"', modify
cap la de br022_ -2 `"Refusal"', modify
cap la de br022_ -1 `"Don't know"', modify
cap la de br022_ 1 `"Yes, I stopped after last interview"', modify
cap la de br022_ 2 `"No, I did not smoke by last interview"', modify
cap la de br022_ 3 `"No, I still smoke nowadays"', modify
cap recast str12 mergeid
cap recast str11 hhid2
cap recast str12 mergeidp2
cap recast str15 coupleid2
cap recast byte country
cap recast byte language
cap recast byte br001_
cap recast byte br002_
cap recast byte br003_
cap recast byte br005d1
cap recast byte br005d2
cap recast byte br005d3
cap recast int br006_
cap recast byte br007_
cap recast byte br008_
cap recast byte br010_
cap recast byte br015_
cap recast byte br016_
cap recast byte br017_
cap recast byte br019_
cap recast byte br020_
cap recast byte br021_
cap recast byte br022_
cap form mergeid %12s
cap form hhid2 %11s
cap form mergeidp2 %12s
cap form coupleid2 %15s
cap form country %14.0g
cap form language %44.0g
cap form br001_ %10.0g
cap form br002_ %10.0g
cap form br003_ %10.0g
cap form br005d1 %12.0g
cap form br005d2 %12.0g
cap form br005d3 %12.0g
cap form br006_ %10.0g
cap form br007_ %10.0g
cap form br008_ %10.0g
cap form br010_ %42.0g
cap form br015_ %26.0g
cap form br016_ %26.0g
cap form br017_ %20.0g
cap form br019_ %10.0g
cap form br020_ %10.0g
cap form br021_ %10.0g
cap form br022_ %61.0g
cap la val country country
cap la val language language
cap la val br001_ yesno
cap la val br002_ yesno
cap la val br003_ dkrf
cap la val br005d1 dummi
cap la val br005d2 dummi
cap la val br005d3 dummi
cap la val br006_ dkrf
cap la val br007_ dkrf
cap la val br008_ dkrf
cap la val br010_ br010_
cap la val br015_ br_more
cap la val br016_ br_more
cap la val br017_ proxy
cap la val br019_ dkrf
cap la val br020_ dkrf
cap la val br021_ yesno
cap la val br022_ br022_
cap la var mergeid `"Person identifier (fix across modules and waves)"'
cap la var hhid2 `"Household identifier (wave 2)"'
cap la var mergeidp2 `"Partner identifier (wave 2)"'
cap la var coupleid2 `"Couple identifier (wave 2)"'
cap la var country `"Country identifier"'
cap la var language `"Language of questionnaire"'
cap la var br001_ `"Ever smoked daily"'
cap la var br002_ `"Smoke at the present time"'
cap la var br003_ `"How many years smoked"'
cap la var br005d1 `"Do or did smoke: cigarettes"'
cap la var br005d2 `"Do or did smoke: pipe"'
cap la var br005d3 `"Do or did smoke: cigars or cigarillos"'
cap la var br006_ `"Average amount of cigarettes per day"'
cap la var br007_ `"Average amount of pipes per day"'
cap la var br008_ `"Average amount of cigars per day"'
cap la var br010_ `"Days a week consumed alcohol last 3 months"'
cap la var br015_ `"Sports or activities that are vigorous"'
cap la var br016_ `"Activities requiring a moderate level of energy"'
cap la var br017_ `"Who answered the questions in br"'
cap la var br019_ `"How many drinks in a day"'
cap la var br020_ `"How often four or more drinks last 3 months"'
cap la var br021_ `"Ever drunk alcoholic beverages"'
cap la var br022_ `"Stopped smoking"'
