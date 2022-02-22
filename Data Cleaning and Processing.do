import excel "/Users/qichenhuang/Desktop/Shanghai 0510.xlsx", sheet("sheet") firstrow clear
save "/Users/qichenhuang/Desktop/Shanghai 0510.dta"

// drop variables 
drop if FI_T5-F050201B == .
drop if Date_1 == "2006-03-31" | Date_1 == "2006-06-30" | Date_1 == "2006-09-30" | Date_1 == "2007-03-31" | ///
Date_1 == "2007-06-30" | Date_1 == "2007-09-30" |  Date_1 == "2008-03-31" | Date_1 == "2008-06-30" | Date_1 == "2008-09-30" ///
|  Date_1 == "2009-03-31" | Date_1 == "2009-06-30" | Date_1 == "2009-09-30" | Date_1 =="2010-03-31" | Date_1 == "2010-06-30" ///
| Date_1 == "2010-09-30" |  Date_1 == "2012-03-31" | Date_1 == "2012-06-30" | Date_1 == "2012-09-30" | Date_1 == "2013-03-31" | ///
Date_1 == "2013-06-30" | Date_1 == "2013-09-30" | Date_1 == "2014-03-31" | Date_1 == "2014-06-30" | Date_1 == "2014-09-30" | ///
Date_1 == "2015-03-31" | Date_1 == "2015-06-30" | Date_1 == "2015-09-30" | Date_1 == "2016-03-31" | Date_1 == "2016-06-30" | ///
Date_1 == "2016-09-30" | Date_1 == "2017-03-31" | Date_1 == "2017-06-30" | Date_1 == "2017-09-30" | Date_1 == "2018-03-31" | ///
Date_1 == "2018-06-30" | Date_1 == "2018-09-30" |Date_1 == "2019-03-31" | Date_1 == "2019-06-30" | Date_1 == "2019-09-30" |///
Date_1 == "2020-03-31" | Date_1 == "2020-06-30" | Date_1 == "2020-09-30" 
drop STK_FIN_CashFlowTTMEndDate STK_FIN_CashFlowTTMTyprep STK_FIN_CashFlowIndrectTTMEndDa STK_FIN_CashFlowIndrectTTMTypre ///
STK_FIN_CashFlowIndrectTTMD0001

// rename variables
rename FI_T5Accper Date_1
gen Date_2 = substr(Date,1,4)
order Date_2, before(Date)
drop Date
rename Date_1 Date
rename Date_2 Year
rename code Code
rename short_name Name
rename Date_2 Year
rename CSRR_BasicInfoDeliveryProtectio CSR_Supplier_Protection
rename CSRR_BasicInfoCustomerProtectio CSR_Customer_Protection
rename CSRR_BasicInfoEnvironmentProtec CSR_Environment_Protection
rename CSRR_BasicInfoPublicRelations CSR_Public_Relations
rename CSRR_BasicInfoSystemConstructio CSR_Construction_Plan
rename CSRR_BasicInfoWorkSafety CSR_Work_Safety
rename CSRR_BasicInfoDeficiency CSR_Deficiency
rename FI_T1F010101A Current_Ratio
rename FI_T1F010201A Quick_Ratio
rename FI_T1F010401A Cash_Ratio
rename FI_T1F011201A Leverage
rename PT_LCMAINFINTotalAssets Total_Asset
rename TRD_CoIndcd Short_Industry_Code
rename TRD_CoIndnme Short_Industry_Name

destring code, generate(Code_num)
destring Shareholder_Protection, generate(Sharehold_Protection_num)
destring CSR_Creditor_Protection, generate(CSR_Creditor_Protection_num)

rename STK_FIN_CashFlowTTMC001000000 Cash_Flow
destring Year, generate(Year_1)
destring Trade_Year, generate(Trade_Year_1)
order Year_1, after(Name)
order Trade_Year_1, after(Year_1)
drop Year Trade_Year
rename Year_1 Year
rename Trade_Year_1 Trade_Year

replace CSR_Audit = 0 if CSR_Audit == 2
replace CSR_Follow_GRI = 0 if CSR_Follow_GRI == 2
replace CSR_Shareholder_Protection  = 0 if CSR_Shareholder_Protection  == 2
replace CSR_Creditor_Protection =  0 if CSR_Creditor_Protection == 2
replace CSR_Staff_Protection  =  0 if CSR_Staff_Protection == 2
replace CSR_Supplier_Protection  =  0 if CSR_Supplier_Protection == 2
replace CSR_Customer_Protection  =  0 if CSR_Customer_Protection == 2
replace CSR_Environment_Protection  =  0 if CSR_Environment_Protection  == 2
replace CSR_Public_Relations = 0 if CSR_Public_Relations == 2
replace CSR_Construction_Plan = 0 if CSR_Construction_Plan == 2
replace Work_Safety = 0 if Work_Safety == 2
replace CSR_Deficiency = 0 if CSR_Deficiency == 2

// generate dummy variables 
gen Mandatory_CSR = 0

replace Mandatory_CSR = 1 if Code_num == 600000 | Code_num ==600001 | Code_num ==600004 | Code_num ==600006 | ///
Code_num ==600011 | Code_num ==600012 | Code_num ==600016 | Code_num ==600017 | Code_num ==600018 | Code_num ==600019 | ///
Code_num ==600020 | Code_num ==600022 | Code_num ==600026 | Code_num ==600027 | Code_num ==600030 | Code_num ==600031 | ///
Code_num ==600033 | Code_num ==600036 | Code_num ==600037 | Code_num ==600048 | Code_num ==600050 | Code_num ==600051 | ///
Code_num ==600056 | Code_num ==600058 | Code_num ==600060 | Code_num ==600062 | Code_num ==600063 | Code_num ==600066 | ///
Code_num ==600067 | Code_num ==600068 | Code_num ==600071 | Code_num ==600085 | Code_num ==600087 | Code_num ==600089 | ///
Code_num ==600096 | Code_num ==600098 | Code_num ==600100 | Code_num ==600102 | Code_num ==600104 | Code_num ==600106 | ///
Code_num ==600110 | Code_num ==600113 | Code_num ==600116 | Code_num ==600117 | Code_num ==600118 | Code_num ==600125 | ///
Code_num ==600138 | Code_num ==600151 | Code_num ==600158 | Code_num ==600161 | Code_num ==600163 | Code_num ==600166 | ///
Code_num ==600170 | Code_num ==600171 | Code_num ==600177 | Code_num ==600183 | Code_num ==600188 | Code_num ==600195 | ///
Code_num ==600206 | Code_num ==600210 | Code_num ==600219 | Code_num ==600243 | Code_num ==600246 | Code_num ==600252 | ///
Code_num ==600255 | Code_num ==600260 | Code_num ==600261 | Code_num ==600266 | Code_num ==600308 | Code_num ==600309 | ///
Code_num ==600267 | Code_num ==600269 | Code_num ==600270 | Code_num ==600271 | Code_num ==600284 | Code_num ==600308 | ///
Code_num ==600310 | Code_num ==600317 | Code_num ==600322 | Code_num ==600323 | Code_num ==600325 | Code_num ==600330 | ///
Code_num ==600332 | Code_num ==600337 | Code_num ==600350 | Code_num ==600351 | Code_num ==600352 | Code_num ==600357 | ///
Code_num ==600362 | Code_num ==600367 | Code_num ==600383 | Code_num ==600389 | Code_num ==600392 | Code_num ==600396 | ///
Code_num ==600409 | Code_num ==600418 | Code_num ==600423 | Code_num ==600428 | Code_num ==600439 | Code_num ==600452 | ///
Code_num ==600456 | Code_num ==600458 | Code_num ==600460 | Code_num ==600463 | Code_num ==600467 | Code_num ==600483 | ///
Code_num ==600486 | Code_num ==600487 | Code_num ==600495 | Code_num ==600496 | Code_num ==600497 | Code_num ==600498 | ///
Code_num ==600499 | Code_num ==600500 | Code_num ==600501 | Code_num ==600507 | Code_num ==600508 | Code_num ==600510 | ///
Code_num ==600511 | Code_num ==600517 | Code_num ==600525 | Code_num ==600526 | Code_num ==600527 | Code_num ==600528 | ///
Code_num ==600533 | Code_num ==600535 | Code_num ==600548 | Code_num ==600549 | Code_num ==600557 | Code_num ==600560 | ///
Code_num ==600561 | Code_num ==600569 | Code_num ==600582 | Code_num ==600583 | Code_num ==600585 | Code_num ==600588 | ///
Code_num ==600591 | Code_num ==600592 | Code_num ==600595 | Code_num ==600596 | Code_num ==600597 | Code_num ==600600 | ///
Code_num ==600601 | Code_num ==600616 | Code_num ==600619 | Code_num ==600620 | Code_num ==600642 | Code_num ==600649 | ///
Code_num ==600658 | Code_num ==600674 | Code_num ==600685 | Code_num ==600690 | Code_num ==600702 | Code_num ==600717 | ///
Code_num ==600718 | Code_num ==600736 | Code_num ==600748 | Code_num ==600750 | Code_num ==600755 | Code_num ==600761 | ///
Code_num ==600780 | Code_num ==600787 | Code_num ==600795 | Code_num ==600798 | Code_num ==600808 | Code_num ==600829 | ///
Code_num ==600836 | Code_num ==600845 | Code_num ==600858 | Code_num ==600860 | Code_num ==600879 | Code_num ==600881 | ///
Code_num ==600886 | Code_num ==600889 | Code_num ==600896 | Code_num ==600900 | Code_num ==600962 | Code_num ==600966 | ///
Code_num ==600970 | Code_num ==600979 | Code_num ==600980 | Code_num ==600983 | Code_num ==600987 | Code_num ==600992 | ///
Code_num ==600993 | Code_num ==600997 | Code_num ==601006 | Code_num ==601088 | Code_num ==601111 | Code_num ==601318 | ///
Code_num ==601328 | Code_num ==601398 | Code_num ==601588 | Code_num ==601600 | Code_num ==601628 | Code_num ==601699 | ///
Code_num ==601919 | Code_num ==601939 | Code_num ==601988 | Code_num ==601991 | Code_num ==600029 | Code_num ==600055 | ///
Code_num ==600059 | Code_num ==600111 | Code_num ==600123 | Code_num ==600153 | Code_num ==600196 | Code_num ==600218 | ///
Code_num ==600263 | Code_num ==600303 | Code_num ==600360 | Code_num ==600371 | Code_num ==600432 | Code_num ==600438 | ///
Code_num ==600468 | Code_num ==600531 | Code_num ==600550 | Code_num ==600578 | Code_num ==600580 | Code_num ==600611 | ///
Code_num ==600797 | Code_num ==600835 | Code_num ==600837 | Code_num ==600839 | Code_num ==600973 | Code_num ==600995 | ///
Code_num ==601007 | Code_num ==601008 | Code_num ==601166 | Code_num ==601857 | Code_num ==601899 | Code_num ==601998 | ///

replace Mandatory_CSR = 1 if Year == 2009 & Code_num ==600251 | Year == 2009 & Code_num ==600635 | Year == 2009 & Code_num ==600005 | ///
Year == 2009 & Code_num ==601333 | Year == 2009 & Code_num ==601390 | Year == 2009 & Code_num ==601601 | ///
Year == 2009 & Code_num ==601727 | Year == 2009 & Code_num ==601898 | Year == 2009 & Code_num ==601958 | ///
Year == 2009 & Code_num ==600743 | Year == 2009 & Code_num ==600895 | Year == 2009 & Code_num ==601168 | ///
Year == 2009 & Code_num ==601186 | Year == 2009 & Code_num ==600841 | Year == 2009 & Code_num ==600469 | ///

replace Mandatory_CSR = 1 if Year == 2010 & Code_num ==601766  | Year == 2010 & Code_num ==600176 | Year == 2010 & Code_num ==600227 | ///
Year == 2010 & Code_num ==600435 | Year == 2010 & Code_num ==600488 | Year == 2010 & Code_num ==600765 | ///
Year == 2010 & Code_num ==600888 | Year == 2010 & Code_num ==601009 | Year == 2010 & Code_num ==601866 | ///

replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==600027 | Year == 2011 & Code_num ==600064  | Year == 2011 & Code_num ==600141 | ///
Year == 2011 & Code_num ==600173 | Year == 2011 & Code_num ==600190 | Year == 2011 & Code_num ==600223 | ///
Year == 2011 & Code_num ==600262 | Year == 2011 & Code_num ==600282 | Year == 2011 & Code_num ==600376 | ///
Year == 2011 & Code_num ==600422 | Year == 2011 & Code_num ==600502 | Year == 2011 & Code_num ==600518 | ///
Year == 2011 & Code_num ==600551 | Year == 2011 & Code_num ==600657 | Year == 2011 & Code_num ==600737 | ///
Year == 2011 & Code_num ==600739 | Year == 2011 & Code_num ==600875 | Year == 2011 & Code_num ==600999 | ///
Year == 2011 & Code_num ==601101 | Year == 2011 & Code_num ==601168 | Year == 2011 & Code_num ==601299 | ///
Year == 2011 & Code_num ==601607 | Year == 2011 & Code_num ==601618 | Year == 2011 & Code_num ==601668 | ///
Year == 2011 & Code_num ==601688 | Year == 2011 & Code_num ==601788 | Year == 2011 & Code_num ==601898 | ///
Year == 2011 & Code_num ==601989 | Year == 2011 & Code_num ==600256 | ///

replace Mandatory_CSR = 1 if Year == 2012 & Code_num ==600109 | Year == 2012 & Code_num ==600111 | Year == 2012 & Code_num ==600115 | ///
Year == 2012 & Code_num ==600377 | Year == 2012 & Code_num ==600546 | Year == 2012 & Code_num ==600704 | ///
Year == 2012 & Code_num ==600873 | Year == 2012 & Code_num ==601000 | Year == 2012 & Code_num ==601018 | /// 
Year == 2012 & Code_num ==601098 | Year == 2012 & Code_num ==601139 | Year == 2012 & Code_num ==601169 | /// 
Year == 2012 & Code_num ==601199 | Year == 2012 & Code_num ==601369 | Year == 2012 & Code_num ==601377 | /// 
Year == 2012 & Code_num ==601800 | Year == 2012 & Code_num ==601808 | Year == 2012 & Code_num ==601818 | Year == 2012 & Code_num ==601877 /// 

replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==600028 | Year == 2013 & Code_num ==600078 | Year == 2013 & Code_num ==600259 | ///
Year == 2013 & Code_num ==600335 | Year == 2013 & Code_num ==600352 | Year == 2013 & Code_num ==600386 | ///
Year == 2013 & Code_num ==600406 | Year == 2013 & Code_num ==600420 | Year == 2013 & Code_num ==600543 | ///
Year == 2013 & Code_num ==600633 | Year == 2013 & Code_num ==600660 | Year == 2013 & Code_num ==600741 | ///
Year == 2013 & Code_num ==600763 | Year == 2013 & Code_num ==600815 | Year == 2013 & Code_num ==601038 | ///
Year == 2013 & Code_num ==601058 | Year == 2013 & Code_num ==601118 | Year == 2013 & Code_num ==601222 | ///
Year == 2013 & Code_num ==601231 | Year == 2013 & Code_num ==601238 | Year == 2013 & Code_num ==601555 | ///
Year == 2013 & Code_num ==601636 | Year == 2013 & Code_num ==601928 | Year == 2013 & Code_num ==603000 | Year == 2013 & Code_num ==603993 | ///

replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==600021 | Year == 2014 & Code_num ==600198 | Year == 2014 & Code_num ==600459 | ///
Year == 2014 & Code_num ==600547 | Year == 2014 & Code_num ==600705 | Year == 2014 & Code_num ==600783 | /// 
Year == 2014 & Code_num ==600880 | Year == 2014 & Code_num ==600894 | Year == 2014 & Code_num ==601117 | ///
Year == 2014 & Code_num ==601126 | Year == 2014 & Code_num ==601336 | Year == 2014 & Code_num ==601515 | ///
Year == 2014 & Code_num ==601608 | Year == 2014 & Code_num ==601777 | Year == 2014 & Code_num ==601886 | ///

replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==600094  | Year == 2015 & Code_num ==600135 | Year == 2015 & Code_num ==600200 | ///
Year == 2015 & Code_num ==600273 | Year == 2015 & Code_num ==600277 | Year == 2015 & Code_num ==600282 | ///
Year == 2015 & Code_num ==600287 | Year == 2015 & Code_num ==600373 | Year == 2015 & Code_num ==600405 | ///
Year == 2015 & Code_num ==600433 | Year == 2015 & Code_num ==600489 | Year == 2015 & Code_num ==600562 | ///
Year == 2015 & Code_num ==600645 | Year == 2015 & Code_num ==600663 | Year == 2015 & Code_num ==600684 | ///
Year == 2015 & Code_num ==600850 | Year == 2015 & Code_num ==600980 | Year == 2015 & Code_num ==600990 | ///
Year == 2015 & Code_num ==601099 | Year == 2015 & Code_num ==601669 | Year == 2015 & Code_num ==603555 | ///

replace Mandatory_CSR = 1 if Year == 2016 & Code_num ==600917 | Year == 2016 & Code_num ==601211 | Year == 2016 & Code_num ==601226 | ///
Year == 2016 & Code_num ==601318 | Year == 2016 & Code_num ==601985 | ///

replace Mandatory_CSR = 1 if Year == 2017 & Code_num ==600008 | Year == 2017 & Code_num ==600035 | Year == 2017 & Code_num ==600297 | ///
Year == 2017 & Code_num ==600528 | Year == 2017 & Code_num ==600566 | Year == 2017 & Code_num ==600976 | ///
Year == 2017 & Code_num ==601788 | Year == 2017 & Code_num ==601857 | Year == 2017 & Code_num ==601919 | ///
Year == 2017 & Code_num ==603018 | Year == 2017 & Code_num ==603508 | Year == 2017 & Code_num ==603568 | Year == 2017 & Code_num ==603883 | ///

replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==600061 | Year == 2018 & Code_num ==600170 | Year == 2018 & Code_num ==600233 | ///
Year == 2018 & Code_num ==600282 | Year == 2018 & Code_num ==600436 | Year == 2018 & Code_num ==600522 | ///
Year == 2018 & Code_num ==600557 | Year == 2018 & Code_num ==600708 | Year == 2018 & Code_num ==600909 | ///
Year == 2018 & Code_num ==600919 | Year == 2018 & Code_num ==600958 | Year == 2018 & Code_num ==600977 | ///
Year == 2018 & Code_num ==601000 | Year == 2018 & Code_num ==601128 | Year == 2018 & Code_num ==601163 | ///
Year == 2018 & Code_num ==601211 | Year == 2018 & Code_num ==601229 | Year == 2018 & Code_num ==601611 | ///
Year == 2018 & Code_num ==601618 | Year == 2018 & Code_num ==601899 | Year == 2018 & Code_num ==603323 | ///
Year == 2018 & Code_num ==603337 | Year == 2018 & Code_num ==603588 | Year == 2018 & Code_num ==603668 | ///

replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==601598 | Year == 2019 & Code_num ==600029 | Year == 2019 & Code_num ==600150 | ///
Year == 2019 & Code_num ==600839 | Year == 2019 & Code_num ==600887 | Year == 2019 & Code_num ==601068 | ///
Year == 2019 & Code_num ==601619 | Year == 2019 & Code_num ==601838 | Year == 2019 & Code_num ==601869 | ///
Year == 2019 & Code_num ==601966 | Year == 2019 & Code_num ==603060 | Year == 2019 & Code_num ==603181 | ///
Year == 2019 & Code_num ==603365 | Year == 2019 & Code_num ==603444 | Year == 2019 & Code_num ==603515 | ///
Year == 2019 & Code_num ==603538 | Year == 2019 & Code_num ==603558 | Year == 2019 & Code_num ==603708 | Year == 2019 & Code_num ==603817 | ///

replace Mandatory_CSR = 0 if Year == 2009 & Code_num ==600106 | Year == 2009 & Code_num ==600591 | Year == 2009 & Code_num ==600501 | ///
Year == 2009 & Code_num ==600585 | Year == 2009 & Code_num ==600001 | Year == 2009 & Code_num ==600357 | ///

replace Mandatory_CSR = 0 if Year == 2010 & Code_num ==600027 | Year == 2010 & Code_num ==600438 | Year == 2010 & Code_num ==600487 | ///
Year == 2010 & Code_num ==600860 | Year == 2010 & Code_num ==601168 | Year == 2010 & Code_num ==600527 | ///
Year == 2010 & Code_num ==601898 | Year == 2010 & Code_num ==601899 | ///

replace Mandatory_CSR = 0 if Year == 2011 & Code_num ==600111 | Year == 2011 & Code_num ==600219 | Year == 2011 & Code_num ==600330 | ///
Year == 2011 & Code_num ==600352 | Year == 2011 & Code_num ==600765

replace Mandatory_CSR = 0 if Year == 2012 & Code_num ==600102 | Year == 2012 & Code_num ==600263 | Year == 2012 & Code_num ==600087 | ///
Year == 2012 & Code_num ==600163 | Year == 2012 & Code_num ==600252 | Year == 2012 & Code_num ==600392 | ///
Year == 2012 & Code_num ==600557 | Year == 2012 & Code_num ==600980 | ///

replace Mandatory_CSR = 0 if Year == 2013 & Code_num ==601919 | Year == 2013 & Code_num ==601788 | ///

replace Mandatory_CSR = 0 if Year == 2014 & Code_num ==600051 | Year == 2014 & Code_num ==600110 | Year == 2014 & Code_num ==600282 | ///
Year == 2014 & Code_num ==600432 | Year == 2014 & Code_num ==600550 | Year == 2014 & Code_num ==600966 | Year == 2014 & Code_num ==601857 | ///

replace Mandatory_CSR = 0 if Year == 2015 & Code_num ==601299 | Year == 2015 & Code_num ==600029 | Year == 2015 & Code_num ==600071 | ///
Year == 2015 & Code_num ==600096 | Year == 2015 & Code_num ==600317 | Year == 2015 & Code_num ==600423 | Year == 2015 & Code_num ==600469 | ///
Year == 2015 & Code_num ==600829 | Year == 2015 & Code_num ==600962 | Year == 2015 & Code_num ==601169 | Year == 2015 & Code_num ==601318 | ///

replace Mandatory_CSR = 0 if Year == 2016 & Code_num ==600030
replace Mandatory_CSR = 0 if Year == 2016 & Code_num ==600078
replace Mandatory_CSR = 0 if Year == 2016 & Code_num ==600528
replace Mandatory_CSR = 0 if Year == 2016 & Code_num ==600546
replace Mandatory_CSR = 0 if Year == 2016 & Code_num ==600601
replace Mandatory_CSR = 0 if Year == 2016 & Code_num ==600705
replace Mandatory_CSR = 0 if Year == 2016 & Code_num ==600837
replace Mandatory_CSR = 0 if Year == 2016 & Code_num ==601688
replace Mandatory_CSR = 0 if Year == 2016 & Code_num ==603555
replace Mandatory_CSR = 0 if Year == 2016 & Code_num ==601377

replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==600005
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==600170
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==600218
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==600227
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==600259
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==600277
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==600282
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==600287
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==600420
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==600526
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==600543
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==600562
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==600592
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==600763
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==600815
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==600839
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==600873
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==600970
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==600983
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==601000
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==601126
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==601211
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==601600
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==601618
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==601636
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==601699
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==601886

replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==600016
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==600055
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==600111
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==600158
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==600198
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==600200
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==600255
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==600267
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==600322
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==600418
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==600433
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==600467
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==600525
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==600561
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==600569
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==600578
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==600595
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==600596
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==600616
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==600645
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==600736
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==600836
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==600881
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==600896
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==600979
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==601118
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==601777
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==600270

replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==600037
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==600058
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==600100
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==600117
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==600151
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==600166
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==600243
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==600246
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==600260
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==600273
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==600297
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==600308
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==600351
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==600352
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==600396
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==600496
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==600507
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==600518
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==600531
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==600619
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==600717
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==600761
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==600783
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==600845
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==600858
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==600889
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==600894
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==600909
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==600973
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==600976
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==601038
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==601099
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==601168
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==601226
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==601515
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==601788

gen Always_Mandated = 0
replace Always_Mandated = 1 if Code_num ==000625
replace Always_Mandated = 1 if Code_num ==000629
replace Always_Mandated = 1 if Code_num ==000858
replace Always_Mandated = 1 if Code_num ==000895
replace Always_Mandated = 1 if Code_num ==000898
replace Always_Mandated = 1 if Code_num ==000930
replace Always_Mandated = 1 if Code_num ==000932
replace Always_Mandated = 1 if Code_num ==000001
replace Always_Mandated = 1 if Code_num ==000002
replace Always_Mandated = 1 if Code_num ==000009
replace Always_Mandated = 1 if Code_num ==000021
replace Always_Mandated = 1 if Code_num ==000027
replace Always_Mandated = 1 if Code_num ==000031
replace Always_Mandated = 1 if Code_num ==000063
replace Always_Mandated = 1 if Code_num ==000068
replace Always_Mandated = 1 if Code_num ==000069
replace Always_Mandated = 1 if Code_num ==000088
replace Always_Mandated = 1 if Code_num ==000520
replace Always_Mandated = 1 if Code_num ==000709
replace Always_Mandated = 1 if Code_num ==000651
replace Always_Mandated = 1 if Code_num ==000528
replace Always_Mandated = 1 if Code_num ==000568
replace Always_Mandated = 1 if Code_num ==000792
replace Always_Mandated = 1 if Code_num ==000157
replace Always_Mandated = 1 if Code_num ==000630
replace Always_Mandated = 1 if Code_num ==000538
replace Always_Mandated = 1 if Code_num ==002024
replace Always_Mandated = 1 if Code_num ==002008
replace Always_Mandated = 1 if Code_num ==002027
replace Always_Mandated = 1 if Code_num ==000937
replace Always_Mandated = 1 if Code_num ==000768
replace Always_Mandated = 1 if Code_num ==000301
replace Always_Mandated = 1 if Code_num ==000338
replace Always_Mandated = 1 if Code_num ==000100
replace Always_Mandated = 1 if Code_num ==002142
replace Always_Mandated = 1 if Code_num ==000425
replace Always_Mandated = 1 if Code_num ==000783
replace Always_Mandated = 1 if Code_num ==000876
replace Always_Mandated = 1 if Code_num ==002202

replace Always_Mandated = 1 if Code_num ==600000
replace Always_Mandated = 1 if Code_num ==600004
replace Always_Mandated = 1 if Code_num ==600006
replace Always_Mandated = 1 if Code_num ==600011
replace Always_Mandated = 1 if Code_num ==600012
replace Always_Mandated = 1 if Code_num ==600017
replace Always_Mandated = 1 if Code_num ==600018
replace Always_Mandated = 1 if Code_num ==600019
replace Always_Mandated = 1 if Code_num ==600020
replace Always_Mandated = 1 if Code_num ==600022
replace Always_Mandated = 1 if Code_num ==600026
replace Always_Mandated = 1 if Code_num ==600031
replace Always_Mandated = 1 if Code_num ==600033
replace Always_Mandated = 1 if Code_num ==600036
replace Always_Mandated = 1 if Code_num ==600048
replace Always_Mandated = 1 if Code_num ==600050
replace Always_Mandated = 1 if Code_num ==600056
replace Always_Mandated = 1 if Code_num ==600060
replace Always_Mandated = 1 if Code_num ==600062
replace Always_Mandated = 1 if Code_num ==600063
replace Always_Mandated = 1 if Code_num ==600066
replace Always_Mandated = 1 if Code_num ==600067
replace Always_Mandated = 1 if Code_num ==600068
replace Always_Mandated = 1 if Code_num ==600071
replace Always_Mandated = 1 if Code_num ==600085
replace Always_Mandated = 1 if Code_num ==600087
replace Always_Mandated = 1 if Code_num ==600089
replace Always_Mandated = 1 if Code_num ==600098
replace Always_Mandated = 1 if Code_num ==600104
replace Always_Mandated = 1 if Code_num ==600113
replace Always_Mandated = 1 if Code_num ==600116
replace Always_Mandated = 1 if Code_num ==600118
replace Always_Mandated = 1 if Code_num ==600125
replace Always_Mandated = 1 if Code_num ==600138
replace Always_Mandated = 1 if Code_num ==600161
replace Always_Mandated = 1 if Code_num ==600171
replace Always_Mandated = 1 if Code_num ==600177
replace Always_Mandated = 1 if Code_num ==600183
replace Always_Mandated = 1 if Code_num ==600188
replace Always_Mandated = 1 if Code_num ==600195
replace Always_Mandated = 1 if Code_num ==600206
replace Always_Mandated = 1 if Code_num ==600210
replace Always_Mandated = 1 if Code_num ==600255
replace Always_Mandated = 1 if Code_num ==600261
replace Always_Mandated = 1 if Code_num ==600266
replace Always_Mandated = 1 if Code_num ==600269
replace Always_Mandated = 1 if Code_num ==600271
replace Always_Mandated = 1 if Code_num ==600284
replace Always_Mandated = 1 if Code_num ==600309
replace Always_Mandated = 1 if Code_num ==600310
replace Always_Mandated = 1 if Code_num ==600323
replace Always_Mandated = 1 if Code_num ==600325
replace Always_Mandated = 1 if Code_num ==600332
replace Always_Mandated = 1 if Code_num ==600337
replace Always_Mandated = 1 if Code_num ==600350
replace Always_Mandated = 1 if Code_num ==600362
replace Always_Mandated = 1 if Code_num ==600367
replace Always_Mandated = 1 if Code_num ==600383
replace Always_Mandated = 1 if Code_num ==600389
replace Always_Mandated = 1 if Code_num ==600392
replace Always_Mandated = 1 if Code_num ==600396
replace Always_Mandated = 1 if Code_num ==600409
replace Always_Mandated = 1 if Code_num ==600428
replace Always_Mandated = 1 if Code_num ==600439
replace Always_Mandated = 1 if Code_num ==600452
replace Always_Mandated = 1 if Code_num ==600456
replace Always_Mandated = 1 if Code_num ==600458
replace Always_Mandated = 1 if Code_num ==600460
replace Always_Mandated = 1 if Code_num ==600463
replace Always_Mandated = 1 if Code_num ==600483
replace Always_Mandated = 1 if Code_num ==600486
replace Always_Mandated = 1 if Code_num ==600495
replace Always_Mandated = 1 if Code_num ==600496
replace Always_Mandated = 1 if Code_num ==600497
replace Always_Mandated = 1 if Code_num ==600498
replace Always_Mandated = 1 if Code_num ==600499
replace Always_Mandated = 1 if Code_num ==600500
replace Always_Mandated = 1 if Code_num ==600507
replace Always_Mandated = 1 if Code_num ==600508
replace Always_Mandated = 1 if Code_num ==600510
replace Always_Mandated = 1 if Code_num ==600511
replace Always_Mandated = 1 if Code_num ==600517
replace Always_Mandated = 1 if Code_num ==600525
replace Always_Mandated = 1 if Code_num ==600533
replace Always_Mandated = 1 if Code_num ==600535
replace Always_Mandated = 1 if Code_num ==600548
replace Always_Mandated = 1 if Code_num ==600549
replace Always_Mandated = 1 if Code_num ==600560
replace Always_Mandated = 1 if Code_num ==600582
replace Always_Mandated = 1 if Code_num ==600583
replace Always_Mandated = 1 if Code_num ==600588
replace Always_Mandated = 1 if Code_num ==600591
replace Always_Mandated = 1 if Code_num ==600597
replace Always_Mandated = 1 if Code_num ==600600
replace Always_Mandated = 1 if Code_num ==600616
replace Always_Mandated = 1 if Code_num ==600620
replace Always_Mandated = 1 if Code_num ==600642
replace Always_Mandated = 1 if Code_num ==600649
replace Always_Mandated = 1 if Code_num ==600658
replace Always_Mandated = 1 if Code_num ==600674
replace Always_Mandated = 1 if Code_num ==600685
replace Always_Mandated = 1 if Code_num ==600690
replace Always_Mandated = 1 if Code_num ==600702
replace Always_Mandated = 1 if Code_num ==600718
replace Always_Mandated = 1 if Code_num ==600748
replace Always_Mandated = 1 if Code_num ==600750
replace Always_Mandated = 1 if Code_num ==600755
replace Always_Mandated = 1 if Code_num ==600780
replace Always_Mandated = 1 if Code_num ==600787
replace Always_Mandated = 1 if Code_num ==600795
replace Always_Mandated = 1 if Code_num ==600798
replace Always_Mandated = 1 if Code_num ==600808
replace Always_Mandated = 1 if Code_num ==600829
replace Always_Mandated = 1 if Code_num ==600860
replace Always_Mandated = 1 if Code_num ==600879
replace Always_Mandated = 1 if Code_num ==600886
replace Always_Mandated = 1 if Code_num ==600896
replace Always_Mandated = 1 if Code_num ==600900
replace Always_Mandated = 1 if Code_num ==600962
replace Always_Mandated = 1 if Code_num ==600983
replace Always_Mandated = 1 if Code_num ==600987
replace Always_Mandated = 1 if Code_num ==600992
replace Always_Mandated = 1 if Code_num ==600993
replace Always_Mandated = 1 if Code_num ==600997
replace Always_Mandated = 1 if Code_num ==601006
replace Always_Mandated = 1 if Code_num ==601088
replace Always_Mandated = 1 if Code_num ==601111
replace Always_Mandated = 1 if Code_num ==601328
replace Always_Mandated = 1 if Code_num ==601398
replace Always_Mandated = 1 if Code_num ==601588
replace Always_Mandated = 1 if Code_num ==601628
replace Always_Mandated = 1 if Code_num ==601919
replace Always_Mandated = 1 if Code_num ==601939
replace Always_Mandated = 1 if Code_num ==601988
replace Always_Mandated = 1 if Code_num ==601991
replace Always_Mandated = 1 if Code_num ==600059
replace Always_Mandated = 1 if Code_num ==600123
replace Always_Mandated = 1 if Code_num ==600153
replace Always_Mandated = 1 if Code_num ==600196
replace Always_Mandated = 1 if Code_num ==600303
replace Always_Mandated = 1 if Code_num ==600360
replace Always_Mandated = 1 if Code_num ==600371
replace Always_Mandated = 1 if Code_num ==600468
replace Always_Mandated = 1 if Code_num ==600550
replace Always_Mandated = 1 if Code_num ==600578
replace Always_Mandated = 1 if Code_num ==600580
replace Always_Mandated = 1 if Code_num ==600611
replace Always_Mandated = 1 if Code_num ==600797
replace Always_Mandated = 1 if Code_num ==600835
replace Always_Mandated = 1 if Code_num ==600995
replace Always_Mandated = 1 if Code_num ==601007
replace Always_Mandated = 1 if Code_num ==601008
replace Always_Mandated = 1 if Code_num ==601166
replace Always_Mandated = 1 if Code_num ==601998

gen Mandatory_2Y = 0
gen Mandatory_3Y = 0
gen Mandatory_4Y = 0
gen Mandatory_5Y = 0
gen Mandatory_6Y = 0
gen Mandatory_7Y = 0
gen Mandatory_8Y = 0
gen Mandatory_9Y = 0
gen Mandatory_10Y = 0
gen Mandatory_11Y = 0
gen Mandatory_12Y = 0

replace Mandatory_1Y = 1 if Year == 2009 & Always_Mandated == 1
replace Mandatory_2Y = 1 if Year == 2010 & Always_Mandated == 1
replace Mandatory_3Y = 1 if Year == 2011 & Always_Mandated == 1
replace Mandatory_4Y = 1 if Year == 2012 & Always_Mandated == 1
replace Mandatory_5Y = 1 if Year == 2013 & Always_Mandated == 1
replace Mandatory_6Y = 1 if Year == 2014 & Always_Mandated == 1
replace Mandatory_7Y = 1 if Year == 2015 & Always_Mandated == 1
replace Mandatory_8Y = 1 if Year == 2016 & Always_Mandated == 1
replace Mandatory_9Y = 1 if Year == 2017 & Always_Mandated == 1
replace Mandatory_10Y = 1 if Year == 2018 & Always_Mandated == 1
replace Mandatory_11Y = 1 if Year == 2019 & Always_Mandated == 1
replace Mandatory_12Y = 1 if Year == 2020 & Always_Mandated == 1

drop Mandatory_1P Mandatory_2P Mandatory_3P

gen Mandatory_1P = 0
gen Mandatory_2P = 0
gen Mandatory_3P = 0

replace Mandatory_1P = 1 if Year == 2005 & Always_Mandated == 1
replace Mandatory_2P = 1 if Year == 2006 & Always_Mandated == 1
replace Mandatory_3P = 1 if Year == 2007 & Always_Mandated == 1

gen Post = 1
replace Post = 0 if Year == 2005
replace Post = 0 if Year == 2006
replace Post = 0 if Year == 2007
replace Post = 0 if Year == 2008

drop if CSR_Disclosure == 1 & Mandatory_CSR == 0
drop if Mandatory_CSR == 1 & Always_Mandated == 0

merge m:1 Code using "/Users/qichenhuang/Desktop/State.dta"
drop if Code_num == .
drop _merge
gen State_Owned_1 = 0
replace State_Owned_1 = 1 if State_Owned == "1"
drop State_Owned
rename State_Owned_1 State_Owned

destring Short_Industry_Code, generate(Industry)

drop if ROA_A > 33
drop if ROA_A < -29
drop if TobinQ_C > 700
drop if TobinQ_A > 30
drop if Stock_Return_w_Div > 5

gen Mandatory_05 = 0
gen Mandatory_06 = 0
gen Mandatory_07 = 0
gen Mandatory_08 = 0

replace Mandatory_05 = 1 if Year == 2005 & Always_Mandated == 1
replace Mandatory_06 = 1 if Year == 2006 & Always_Mandated == 1
replace Mandatory_07 = 1 if Year == 2007 & Always_Mandated == 1
replace Mandatory_08 = 1 if Year == 2008 & Always_Mandated == 1

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

