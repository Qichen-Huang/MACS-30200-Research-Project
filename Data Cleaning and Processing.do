clear all 
set more off, perm
set type double, perm
 
global path "\Users\qichenhuang\Desktop"
global data "$path\raw data"
global output "$path\output"
global temp "`c(tmpdir)'"

import excel using "$data\Shanghai 0510.xlsx", firstrow case(lower) clear
save "$data\Shanghai_1.dta", replace
import excel using "$data\Shanghai 1116.xlsx", firstrow case(lower) clear
save "$data\Shanghai_2.dta", replace
import excel using "$data\Shanghai 1720.xlsx", firstrow case(lower) clear
save "$data\Shanghai_3.dta", replace
import excel using "$data\Shenzhen 0510.xlsx", firstrow case(lower) clear
save "$data\Shenzhen_1.dta", replace
import excel using "$data\Shenzhen 1116.xlsx", firstrow case(lower) clear
save "$data\Shenzhen_2.dta", replace
import excel using "$data\Shenzhen 1720.xlsx", firstrow case(lower) clear
save "$data\Shenzhen_3.dta", replace
append using "$data\Shanghai_1.dta" "$data\Shanghai_2.dta" "$data\Shanghai_3.dta" "$data\Shenzhen_1.dta" "$data\Shenzhen_2.dta" 
save "$data\CSR 2005_2020.dta", replace

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
gen always_mandated = 0 if mi(always_mandated)
gen Mandatory_05 = 1 if Year == 2005 & Always_Mandated == 1
gen Mandatory_06 = 1 if Year == 2006 & Always_Mandated == 1
gen Mandatory_07 = 1 if Year == 2007 & Always_Mandated == 1
gen Mandatory_08 = 1 if Year == 2008 & Always_Mandated == 1
gen Mandatory_1Y = 1 if year == 2009 & always_mandated == 1
gen Mandatory_2Y = 1 if year == 2010 & always_mandated == 1
gen Mandatory_3Y = 1 if year == 2011 & always_mandated == 1
gen Mandatory_4Y = 1 if year == 2012 & always_mandated == 1
gen Mandatory_5Y = 1 if year == 2013 & always_mandated == 1
gen Mandatory_6Y = 1 if year == 2014 & always_mandated == 1
gen Mandatory_7Y = 1 if year == 2015 & always_mandated == 1
gen Mandatory_8Y = 1 if year == 2016 & always_mandated == 1
gen Mandatory_9Y = 1 if year == 2017 & always_mandated == 1
gen Mandatory_10Y = 1 if year == 2018 & always_mandated == 1
gen Mandatory_11Y = 1 if year == 2019 & always_mandated == 1
gen Mandatory_12Y = 1 if year == 2020 & always_mandated == 1

drop if CSR_Disclosure == 1 & Mandatory_CSR == 0
drop if Mandatory_CSR == 1 & Always_Mandated == 0

merge m:1 Code using "/Users/qichenhuang/Desktop/State.dta"
drop if Code_num == .
drop _merge
gen State_Owned_1 = 0
replace State_Owned_1 = 1 if State_Owned == "1"
drop State_Owned
rename State_Owned_1 State_Owned

drop if roe > 33 | roe < -29
drop if tobin_1 > 30
drop if stock_return > 5

gen Mandatory_05 = 0
gen Mandatory_06 = 0
gen Mandatory_07 = 0
gen Mandatory_08 = 0

Final:
global t Year
global ylist ROE
global xlist Always_Mandated_1 Mandatory_05 Mandatory_06 Mandatory_07 Mandatory_1Y Mandatory_2Y Mandatory_3Y Mandatory_4Y Mandatory_5Y Mandatory_6Y Mandatory_7Y Mandatory_8Y Mandatory_9Y Mandatory_10Y Mandatory_11Y Free_Float_Marketcap Total_Asset State_Owned Leverage
xtset $t
reghdfe, compile
reghdfe $ylist $xlist, absorb (i.Industry i.Year)

global t Year
global ylist TobinQ
global xlist Always_Mandated_1 Mandatory_05 Mandatory_06 Mandatory_07 Mandatory_1Y Mandatory_2Y Mandatory_3Y Mandatory_4Y Mandatory_5Y Mandatory_6Y Mandatory_7Y Mandatory_8Y Mandatory_9Y Mandatory_10Y Mandatory_11Y Free_Float_Marketcap Total_Asset State_Owned Leverage
xtset $t
reghdfe, compile
reghdfe $ylist $xlist, absorb (i.Industry i.Year)

global t Year
global ylist Stock_Return
global xlist Always_Mandated_1 Mandatory_05 Mandatory_06 Mandatory_07 Mandatory_1Y Mandatory_2Y Mandatory_3Y Mandatory_4Y Mandatory_5Y Mandatory_6Y Mandatory_7Y Mandatory_8Y Mandatory_9Y Mandatory_10Y Mandatory_11Y Free_Float_Marketcap Total_Asset State_Owned Leverage
xtset $t
reghdfe, compile
reghdfe $ylist $xlist, absorb (i.Industry i.Year)

coefplot, keep(Free_Float_Marketcap Total_Asset State_Owned Leverage) xline(0)

