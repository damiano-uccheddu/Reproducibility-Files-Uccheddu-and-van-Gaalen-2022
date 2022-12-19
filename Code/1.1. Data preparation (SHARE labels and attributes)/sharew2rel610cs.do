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
cap la de cs004_ -2 `"Refusal"', modify
cap la de cs004_ -1 `"Don't know"', modify
cap la de cs004_ 1 `"Respondent stood up without using arms"', modify
cap la de cs004_ 2 `"Respondent used arms to stand up"', modify
cap la de cs004_ 3 `"Test not completed"', modify
cap la de dummi -2 `"Refusal"', modify
cap la de dummi -1 `"Don't know"', modify
cap la de dummi 0 `"Not selected"', modify
cap la de dummi 1 `"Selected"', modify
cap la de cs008_ -2 `"Refusal"', modify
cap la de cs008_ -1 `"Don't know"', modify
cap la de cs008_ 99 `"Unable to complete task"', modify
cap la de cs011_ -2 `"Refusal"', modify
cap la de cs011_ -1 `"Don't know"', modify
cap la de cs011_ 1 `"R gave full effort"', modify
cap la de cs011_ 2 `"R was prevented from giving full effort"', modify
cap la de cs011_ 3 `"R did not appear to give full effort"', modify
cap recast str12 mergeid
cap recast str11 hhid2
cap recast str12 mergeidp2
cap recast str15 coupleid2
cap recast byte country
cap recast byte language
cap recast byte cs002_
cap recast byte cs004_
cap recast byte cs005d1
cap recast byte cs005d2
cap recast byte cs005d3
cap recast byte cs005d4
cap recast byte cs005d5
cap recast byte cs005d6
cap recast byte cs005dot
cap recast byte cs007_
cap recast double cs008_
cap recast byte cs009d1
cap recast byte cs009d2
cap recast byte cs009d3
cap recast byte cs009d4
cap recast byte cs009d5
cap recast byte cs009d6
cap recast byte cs009dot
cap recast byte cs011_
cap form mergeid %12s
cap form hhid2 %11s
cap form mergeidp2 %12s
cap form coupleid2 %15s
cap form country %14.0g
cap form language %44.0g
cap form cs002_ %10.0g
cap form cs004_ %38.0g
cap form cs005d1 %12.0g
cap form cs005d2 %12.0g
cap form cs005d3 %12.0g
cap form cs005d4 %12.0g
cap form cs005d5 %12.0g
cap form cs005d6 %12.0g
cap form cs005dot %12.0g
cap form cs007_ %10.0g
cap form cs008_ %23.0g
cap form cs009d1 %12.0g
cap form cs009d2 %12.0g
cap form cs009d3 %12.0g
cap form cs009d4 %12.0g
cap form cs009d5 %12.0g
cap form cs009d6 %12.0g
cap form cs009dot %12.0g
cap form cs011_ %60.0g
cap la val country country
cap la val language language
cap la val cs002_ yesno
cap la val cs004_ cs004_
cap la val cs005d1 dummi
cap la val cs005d2 dummi
cap la val cs005d3 dummi
cap la val cs005d4 dummi
cap la val cs005d5 dummi
cap la val cs005d6 dummi
cap la val cs005dot dummi
cap la val cs007_ yesno
cap la val cs008_ cs008_
cap la val cs009d1 dummi
cap la val cs009d2 dummi
cap la val cs009d3 dummi
cap la val cs009d4 dummi
cap la val cs009d5 dummi
cap la val cs009d6 dummi
cap la val cs009dot dummi
cap la val cs011_ cs011_
cap la var mergeid `"Person identifier (fix across modules and waves)"'
cap la var hhid2 `"Household identifier (wave 2)"'
cap la var mergeidp2 `"Partner identifier (wave 2)"'
cap la var coupleid2 `"Couple identifier (wave 2)"'
cap la var country `"Country identifier"'
cap la var language `"Language of questionnaire"'
cap la var cs002_ `"Safe to do cs"'
cap la var cs004_ `"Single cs test results"'
cap la var cs005d1 `"Why not completed sing cs t: tried but unable"'
cap la var cs005d2 `"Why not completed sing cs t: r could not stand unassisted"'
cap la var cs005d3 `"Why not completed sing cs t: r felt it would not be safe"'
cap la var cs005d4 `"Why not completed sing cs t: iwer felt it would not be safe"'
cap la var cs005d5 `"Why not completed sing cs t: r refused or was not willing to complete the test"'
cap la var cs005d6 `"Why not completed sing cs t: r did not understand the instructions"'
cap la var cs005dot `"Why not completed sing cs t: other"'
cap la var cs007_ `"Safe to do five times cs"'
cap la var cs008_ `"Time in seconds used for five stands"'
cap la var cs009d1 `"Why not completed five cs t: tried but unable"'
cap la var cs009d2 `"Why not completed five cs t: r could not stand unassisted"'
cap la var cs009d3 `"Why not completed five cs t: r felt it would not be safe"'
cap la var cs009d4 `"Why not completed five cs t: iwer felt it would not be safe"'
cap la var cs009d5 `"Why not completed five cs t: r refused or was not willing to complete the test"'
cap la var cs009d6 `"Why not completed five cs t: r did not understand the instructions"'
cap la var cs009dot `"Why not completed five cs t: other"'
cap la var cs011_ `"Effort that r gave to cs"'
