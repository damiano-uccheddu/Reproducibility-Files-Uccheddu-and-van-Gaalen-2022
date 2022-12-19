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
cap la de dkrf -2 `"Refusal"', modify
cap la de dkrf -1 `"Don't know"', modify
cap la de yesno -2 `"Refusal"', modify
cap la de yesno -1 `"Don't know"', modify
cap la de yesno 1 `"Yes"', modify
cap la de yesno 5 `"No"', modify
cap la de rfdkfin -9999992 `"Refusal"', modify
cap la de rfdkfin -9999991 `"Don't know"', modify
cap recast str12 mergeid
cap recast str11 hhid1
cap recast str12 mergeidp1
cap recast str15 coupleid1
cap recast byte country
cap recast byte language
cap recast float exrate
cap recast byte ex001_
cap recast byte ex002_
cap recast byte ex003_
cap recast byte ex004_
cap recast byte ex005_
cap recast byte ex006_
cap recast byte ex007_
cap recast byte ex008_
cap recast byte ex009_
cap recast int ex009age
cap recast byte ex010_
cap recast byte ex011_
cap recast byte ex013_
cap recast long ex014_
cap recast double ex014e
cap recast byte ex015_
cap recast long ex016_
cap recast double ex016e
cap recast byte ex017_
cap recast double ex018_
cap recast double ex018e
cap recast byte ex019_
cap recast long ex020_
cap recast double ex020e
cap recast byte ex021_
cap recast long ex022_
cap recast double ex022e
cap form mergeid %12s
cap form hhid1 %11s
cap form mergeidp1 %12s
cap form coupleid1 %15s
cap form country %14.0g
cap form language %44.0g
cap form exrate %9.0g
cap form ex001_ %10.0f
cap form ex002_ %10.0f
cap form ex003_ %10.0f
cap form ex004_ %10.0f
cap form ex005_ %10.0f
cap form ex006_ %10.0f
cap form ex007_ %10.0f
cap form ex008_ %10.0f
cap form ex009_ %10.0f
cap form ex009age %10.0g
cap form ex010_ %10.0f
cap form ex011_ %10.0f
cap form ex013_ %10.0f
cap form ex014_ %222.0g
cap form ex014e %18.2f
cap form ex015_ %10.0f
cap form ex016_ %222.0g
cap form ex016e %18.2f
cap form ex017_ %10.0f
cap form ex018_ %222.0g
cap form ex018e %18.2f
cap form ex019_ %10.0f
cap form ex020_ %222.0g
cap form ex020e %18.2f
cap form ex021_ %10.0f
cap form ex022_ %222.0g
cap form ex022e %18.2f
cap la val country country
cap la val language language
cap la val ex001_ dkrf
cap la val ex002_ dkrf
cap la val ex003_ dkrf
cap la val ex004_ dkrf
cap la val ex005_ dkrf
cap la val ex006_ dkrf
cap la val ex007_ dkrf
cap la val ex008_ dkrf
cap la val ex009_ dkrf
cap la val ex010_ dkrf
cap la val ex011_ dkrf
cap la val ex013_ yesno
cap la val ex014_ rfdkfin
cap la val ex014e rfdkfin
cap la val ex015_ yesno
cap la val ex016_ rfdkfin
cap la val ex016e rfdkfin
cap la val ex017_ yesno
cap la val ex018_ rfdkfin
cap la val ex018e rfdkfin
cap la val ex019_ yesno
cap la val ex020_ rfdkfin
cap la val ex020e rfdkfin
cap la val ex021_ yesno
cap la val ex022_ rfdkfin
cap la val ex022e rfdkfin
cap la var mergeid `"Person identifier (fix across modules and waves)"'
cap la var hhid1 `"Household identifier (wave 1)"'
cap la var mergeidp1 `"Partner identifier (wave 1)"'
cap la var coupleid1 `"Couple identifier (wave 1)"'
cap la var country `"Country identifier"'
cap la var language `"Language of questionnaire"'
cap la var exrate `"Exchange rate 1 euro"'
cap la var ex001_ `"Introduction and example"'
cap la var ex002_ `"Chance of receiving inheritance"'
cap la var ex003_ `"Chance inheritance more than 50000"'
cap la var ex004_ `"Chance of leaving inheritance more than 50000"'
cap la var ex005_ `"Chance of leaving any inheritance"'
cap la var ex006_ `"Chance of leaving inheritance more than 150000"'
cap la var ex007_ `"Chance government reduces pension"'
cap la var ex008_ `"Chance government raises retirement age"'
cap la var ex009_ `"Life expectancy"'
cap la var ex009age `"Life expectancy target age"'
cap la var ex010_ `"Chance standard of living will be better"'
cap la var ex011_ `"Chance standard of living will be worse"'
cap la var ex013_ `"Save or invest any of the gift"'
cap la var ex014_ `"Amount save or invest of the gift (local currency)"'
cap la var ex014e `"Amount save or invest of the gift (euros)"'
cap la var ex015_ `"Use any of the gift to pay off debts"'
cap la var ex016_ `"Amount using to pay off debts (local currency)"'
cap la var ex016e `"Amount using to pay debts (euros)"'
cap la var ex017_ `"Give any to relatives or donation"'
cap la var ex018_ `"Amount giving to relatives or donation (local currency)"'
cap la var ex018e `"Amount giving to relatives or donation (euros)"'
cap la var ex019_ `"Use to buy durables"'
cap la var ex020_ `"Amount using to buy durables (local currency)"'
cap la var ex020e `"Amount using to buy durables (euros)"'
cap la var ex021_ `"Use for holiday or journey"'
cap la var ex022_ `"Amount holiday or journey (local currency)"'
cap la var ex022e `"Amount holiday or journey (euros)"'
