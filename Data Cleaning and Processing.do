clear all 
set more off, perm
set type double, perm
 
global path "\Users\qichenhuang\Desktop"
global data "$path\raw data"
global output "$path\output"
global temp "`c(tmpdir)'"

local f: dir "$data" files "*.xlsx"
local n = 0
foreach file of local f{
local n = `n'+1
di "$data\\`file'"
import excel using "$data\\`file'", clear
save "$temp\csr_`n'.dta", replace
}

use "$temp\csr_1", clear
append using "$temp\csr_2" "$temp\csr_3" "$temp\csr_4" "$temp\csr_5" "$temp\csr_6"
save "$data\CSR 2005_2020.dta", replace

* cleaning
use "$data\CSR 2005_2020.dta", clear
keep code short_name fi_t5accper trd_coindcd fi_t1f011201a fi_t5f050501b fi_t10f100901a trd_yearysmvosd trd_yearyretwd ofdi_finindextotalasset
rename (short_name fi_t1f011201a fi_t5f050501b fi_t10f100901a trd_yearysmvosd trd_yearyretwd ofdi_finindextotalasset) (name leverage roe tobin_q free_mkt_cap stock_return total_asset)
keep if substr(fi_t5accper,6,10) == "12-31"
gen year_str = substr(fi_t5accper,1,4)
destring trd_coindcd year_str, generate(industry_code year)
order year industry_code, before(leverage)
drop fi_t5accper trd_coindcd year_str
duplicates drop
save "$data\csr_raw.dta", replace

// generate dummy variables 

import excel using "$data\always mandated.xlsx", firstrow case(lower) sheet(always mandated) clear
save "$data\always_mandated.dta", replace
destring mandated, generate(always_mandated)
merge 1:m code using "$data\csr_raw.dta"
drop mandated _merge
replace always_mandated = 0 if mi(always_mandated)
forvalues i = 2005/2020 {
gen Mandatory_`i' = 1 if year == `i' & always_mandated == 1
}
ren (Mandatory_2009 Mandatory_2010 Mandatory_2011 Mandatory_2012 Mandatory_2013 Mandatory_2014 Mandatory_2015 Mandatory_2016 Mandatory_2017 Mandatory_2018 Mandatory_2019 Mandatory_2020)(Mandatory_1Y Mandatory_2Y Mandatory_3Y Mandatory_4Y Mandatory_5Y Mandatory_6Y Mandatory_7Y Mandatory_8Y Mandatory_9Y Mandatory_10Y Mandatory_11Y Mandatory_12Y)
gen Post = 1
replace Post = 0 if inlist(year, 2005, 2006, 2007, 2008)

drop if CSR_Disclosure == 1 & Mandatory_CSR == 0
drop if Mandatory_CSR == 1 & Always_Mandated == 0

merge m:1 Code using "/Users/qichenhuang/Desktop/State.dta"
drop if Code_num == .
gen State_Owned_1 = 0
replace State_Owned_1 = 1 if State_Owned == "1"
drop _merge State_Owned
rename State_Owned_1 State_Owned
destring Short_Industry_Code, generate(Industry)
drop if ROA_A > 33 | ROA_A < -29 | TobinQ_C > 700 | TobinQ_A > 30 | Stock_Return_w_Div > 5

Final:
global t Year
global ylist ROE
global xlist Always_Mandated_1 Mandatory_2005 Mandatory_2006 Mandatory_2007 Mandatory_1Y Mandatory_2Y Mandatory_3Y Mandatory_4Y Mandatory_5Y Mandatory_6Y Mandatory_7Y Mandatory_8Y Mandatory_9Y Mandatory_10Y Mandatory_11Y Free_Float_Marketcap Total_Asset State_Owned Leverage
xtset $t
reghdfe, compile
reghdfe $ylist $xlist, absorb (i.Industry i.Year)

global t Year
global ylist TobinQ
global xlist Always_Mandated_1 Mandatory_2005 Mandatory_2006 Mandatory_2007 Mandatory_1Y Mandatory_2Y Mandatory_3Y Mandatory_4Y Mandatory_5Y Mandatory_6Y Mandatory_7Y Mandatory_8Y Mandatory_9Y Mandatory_10Y Mandatory_11Y Free_Float_Marketcap Total_Asset State_Owned Leverage
xtset $t
reghdfe, compile
reghdfe $ylist $xlist, absorb (i.Industry i.Year)

global t Year
global ylist Stock_Return
global xlist Always_Mandated_1 Mandatory_2005 Mandatory_2006 Mandatory_2007 Mandatory_1Y Mandatory_2Y Mandatory_3Y Mandatory_4Y Mandatory_5Y Mandatory_6Y Mandatory_7Y Mandatory_8Y Mandatory_9Y Mandatory_10Y Mandatory_11Y Free_Float_Marketcap Total_Asset State_Owned Leverage
xtset $t
reghdfe, compile
reghdfe $ylist $xlist, absorb (i.Industry i.Year)

coefplot, keep(Free_Float_Marketcap Total_Asset State_Owned Leverage) xline(0)
