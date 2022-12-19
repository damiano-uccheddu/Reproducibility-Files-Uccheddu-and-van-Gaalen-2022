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
cap la de areabldgi -2 `"Refusal"', modify
cap la de areabldgi -1 `"Don't know"', modify
cap la de areabldgi 1 `"A big city"', modify
cap la de areabldgi 2 `"The suburbs or outskirts of a big city"', modify
cap la de areabldgi 3 `"A large town"', modify
cap la de areabldgi 4 `"A small town"', modify
cap la de areabldgi 5 `"A rural area or village"', modify
cap la de typebldgi -2 `"Refusal"', modify
cap la de typebldgi -1 `"Don't know"', modify
cap la de typebldgi 1 `"A farm house"', modify
cap la de typebldgi 2 `"A free standing one or two family house"', modify
cap la de typebldgi 3 `"A one or two family house as row or double house"', modify
cap la de typebldgi 4 `"A building with 3 to 8 flats"', modify
cap la de typebldgi 5 `"A building with 9 or more flats but no more than 8 floors"', modify
cap la de typebldgi 6 `"A high-rise with 9 or more floors"', modify
cap la de typebldgi 7 `"A housing complex with services for elderly"', modify
cap la de typebldgi 8 `"Special housing for elderly (24 hours attention)"', modify
cap la de dkrf -2 `"Refusal"', modify
cap la de dkrf -1 `"Don't know"', modify
cap la de nstepsi -2 `"Refusal"', modify
cap la de nstepsi -1 `"Don't know"', modify
cap la de nstepsi 1 `"Up to 5"', modify
cap la de nstepsi 2 `"6 to 15"', modify
cap la de nstepsi 3 `"16 to 25"', modify
cap la de nstepsi 4 `"More than 25"', modify
cap recast str12 mergeid
cap recast str11 hhid5
cap recast str12 mergeidp5
cap recast str15 coupleid5
cap recast byte country
cap recast byte language
cap recast byte areabldgi
cap recast byte typebldgi
cap recast byte floorsbli
cap recast byte nstepsi
cap recast str26 nuts1_2010
cap recast str66 nuts2_2010
cap recast str46 nuts3_2010
cap form mergeid %12s
cap form hhid5 %11s
cap form mergeidp5 %12s
cap form coupleid5 %15s
cap form country %14.0g
cap form language %44.0g
cap form areabldgi %38.0g
cap form typebldgi %57.0g
cap form floorsbli %10.0g
cap form nstepsi %12.0g
cap form nuts1_2010 %26s
cap form nuts2_2010 %66s
cap form nuts3_2010 %46s
cap la val country country
cap la val language language
cap la val areabldgi areabldgi
cap la val typebldgi typebldgi
cap la val floorsbli dkrf
cap la val nstepsi nstepsi
cap la var mergeid `"Person identifier (fix across modules and waves)"'
cap la var hhid5 `"Household identifier (wave 5)"'
cap la var mergeidp5 `"Partner identifier (wave 5)"'
cap la var coupleid5 `"Couple identifier (wave 5)"'
cap la var country `"Country identifier"'
cap la var language `"Language of questionnaire"'
cap la var areabldgi `"Area of building"'
cap la var typebldgi `"Type of building"'
cap la var floorsbli `"Number of floors of building"'
cap la var nstepsi `"Number of steps to entrance"'
cap la var nuts1_2010 `"NUTS 2010 level 1: nomenclature of territorial units for statistics"'
cap la var nuts2_2010 `"NUTS 2010 level 2: nomenclature of territorial units for statistics"'
cap la var nuts3_2010 `"NUTS 2010 level 3: nomenclature of territorial units for statistics"'
