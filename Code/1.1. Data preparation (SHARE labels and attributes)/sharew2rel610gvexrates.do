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
cap la de euro 0 `"No"', modify
cap la de euro 1 `"Yes, since 2002"', modify
cap la de euro 2 `"Yes, since 2007"', modify
cap la de euro 3 `"Yes, since 2011"', modify
cap la de n_app -9 `"Not applicable"', modify
cap recast str14 country_str
cap recast byte country
cap recast byte euro
cap recast str16 currency
cap recast float exrate_w1
cap recast float exrate_w2
cap recast float exrate_w3
cap recast float exrate_w4
cap recast float exrate_w5
cap recast float exrate_w6
cap recast float nomx2003
cap recast float nomx2004
cap recast float nomx2005
cap recast float nomx2006
cap recast float nomx2007
cap recast float nomx2008
cap recast float nomx2009
cap recast float nomx2010
cap recast float nomx2011
cap recast float nomx2012
cap recast float nomx2013
cap recast float nomx2014
cap recast float nomx2015
cap recast float pppx2003
cap recast float pppx2004
cap recast float pppx2005
cap recast float pppx2006
cap recast float pppx2007
cap recast float pppx2008
cap recast float pppx2009
cap recast float pppx2010
cap recast float pppx2011
cap recast float pppx2012
cap recast float pppx2013
cap recast float pppx2014
cap recast float pppx2015
cap recast str33 currency_pre
cap recast float exrate_pre
cap form country_str %14s
cap form country %14.0g
cap form euro %15.0g
cap form currency %16s
cap form exrate_w1 %14.0g
cap form exrate_w2 %14.0g
cap form exrate_w3 %14.0g
cap form exrate_w4 %14.0g
cap form exrate_w5 %14.0g
cap form exrate_w6 %14.0g
cap form nomx2003 %9.0g
cap form nomx2004 %9.0g
cap form nomx2005 %9.0g
cap form nomx2006 %9.0g
cap form nomx2007 %9.0g
cap form nomx2008 %9.0g
cap form nomx2009 %9.0g
cap form nomx2010 %9.0g
cap form nomx2011 %9.0g
cap form nomx2012 %9.0g
cap form nomx2013 %9.0g
cap form nomx2014 %9.0g
cap form nomx2015 %9.0g
cap form pppx2003 %9.0g
cap form pppx2004 %9.0g
cap form pppx2005 %9.0g
cap form pppx2006 %9.0g
cap form pppx2007 %9.0g
cap form pppx2008 %9.0g
cap form pppx2009 %9.0g
cap form pppx2010 %9.0g
cap form pppx2011 %9.0g
cap form pppx2012 %9.0g
cap form pppx2013 %9.0g
cap form pppx2014 %9.0g
cap form pppx2015 %9.0g
cap form currency_pre %33s
cap form exrate_pre %14.0g
cap la val country country
cap la val euro euro
cap la val exrate_w1 n_app
cap la val exrate_w2 n_app
cap la val exrate_w3 n_app
cap la val exrate_w4 n_app
cap la val exrate_w5 n_app
cap la val exrate_w6 n_app
cap la val exrate_pre n_app
cap la var country_str `"Country string"'
cap la var country `"Country identifier"'
cap la var euro `"Euro country"'
cap la var currency `"Currency"'
cap la var exrate_w1 `"Exchange rate used for wave 1 data"'
cap la var exrate_w2 `"Exchange rate used for wave 2 data"'
cap la var exrate_w3 `"Exchange rate used for wave 3 data"'
cap la var exrate_w4 `"Exchange rate used for wave 4 data"'
cap la var exrate_w5 `"Exchange rate used for wave 5 data"'
cap la var exrate_w6 `"Exchange rate used for wave 6 data"'
cap la var nomx2003 `"Nominal exchange rate 2003"'
cap la var nomx2004 `"Nominal exchange rate 2004"'
cap la var nomx2005 `"Nominal exchange rate 2005"'
cap la var nomx2006 `"Nominal exchange rate 2006"'
cap la var nomx2007 `"Nominal exchange rate 2007"'
cap la var nomx2008 `"Nominal exchange rate 2008"'
cap la var nomx2009 `"Nominal exchange rate 2009"'
cap la var nomx2010 `"Nominal exchange rate 2010"'
cap la var nomx2011 `"Nominal exchange rate 2011"'
cap la var nomx2012 `"Nominal exchange rate 2012"'
cap la var nomx2013 `"Nominal exchange rate 2013"'
cap la var nomx2014 `"Nominal exchange rate 2014"'
cap la var nomx2015 `"Nominal exchange rate 2015"'
cap la var pppx2003 `"PPP-adjusted exchange rate 2003"'
cap la var pppx2004 `"PPP-adjusted exchange rate 2004"'
cap la var pppx2005 `"PPP-adjusted exchange rate 2005"'
cap la var pppx2006 `"PPP-adjusted exchange rate 2006"'
cap la var pppx2007 `"PPP-adjusted exchange rate 2007"'
cap la var pppx2008 `"PPP-adjusted exchange rate 2008"'
cap la var pppx2009 `"PPP-adjusted exchange rate 2009"'
cap la var pppx2010 `"PPP-adjusted exchange rate 2010"'
cap la var pppx2011 `"PPP-adjusted exchange rate 2011"'
cap la var pppx2012 `"PPP-adjusted exchange rate 2012"'
cap la var pppx2013 `"PPP-adjusted exchange rate 2013"'
cap la var pppx2014 `"PPP-adjusted exchange rate 2014"'
cap la var pppx2015 `"PPP-adjusted exchange rate 2015"'
cap la var currency_pre `"Currency pre-euro"'
cap la var exrate_pre `"Nominal exchange rate for pre-euro currencies"'
