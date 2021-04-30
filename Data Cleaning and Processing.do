import excel "/Users/qichenhuang/Desktop/Shanghai 0510.xlsx", sheet("sheet") firstrow clear
save "/Users/qichenhuang/Desktop/Shanghai 0510.dta"

drop if FI_T5-F050201B == .
rename FI_T5Accper Date_1
drop if Date_1 == "2006-03-31" | Date_1 == "2006-06-30" | Date_1 == "2006-09-30" | Date_1 == "2007-03-31" | ///
Date_1 == "2007-06-30" | Date_1 == "2007-09-30" |  Date_1 == "2008-03-31" | Date_1 == "2008-06-30" | Date_1 == "2008-09-30" ///
|  Date_1 == "2009-03-31" | Date_1 == "2009-06-30" | Date_1 == "2009-09-30" | Date_1 =="2010-03-31" | Date_1 == "2010-06-30" ///
| Date_1 == "2010-09-30" |  Date_1 == "2012-03-31" | Date_1 == "2012-06-30" | Date_1 == "2012-09-30" | Date_1 == "2013-03-31" | ///
Date_1 == "2013-06-30" | Date_1 == "2013-09-30" | Date_1 == "2014-03-31" | Date_1 == "2014-06-30" | Date_1 == "2014-09-30" | ///
Date_1 == "2015-03-31" | Date_1 == "2015-06-30" | Date_1 == "2015-09-30" | Date_1 == "2016-03-31" | Date_1 == "2016-06-30" | ///
Date_1 == "2016-09-30" | Date_1 == "2017-03-31" | Date_1 == "2017-06-30" | Date_1 == "2017-09-30" | Date_1 == "2018-03-31" | ///
Date_1 == "2018-06-30" | Date_1 == "2018-09-30" |Date_1 == "2019-03-31" | Date_1 == "2019-06-30" | Date_1 == "2019-09-30" |///
Date_1 == "2020-03-31" | Date_1 == "2020-06-30" | Date_1 == "2020-09-30" 

gen Date_2 = substr(Date,1,4)
order Date_2, before(Date)
drop Date
rename Date_1 Date
rename Date_2 Year

gen CSR_1 == 1 
replace CSR_1 == 0 if CSR == 0 

destring code, generate(Code_num)
destring Shareholder_Protection, generate(Sharehold_Protection_num)
destring CSR_Creditor_Protection, generate(CSR_Creditor_Protection_num)

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

drop STK_FIN_CashFlowTTMEndDate STK_FIN_CashFlowTTMTyprep STK_FIN_CashFlowIndrectTTMEndDa STK_FIN_CashFlowIndrectTTMTypre ///
STK_FIN_CashFlowIndrectTTMD0001

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
gen Mandatory_CSR = 0

replace Mandatory_CSR = 1 if Code_num == 600000
replace Mandatory_CSR = 1 if Code_num ==600001
replace Mandatory_CSR = 1 if Code_num ==600004
replace Mandatory_CSR = 1 if Code_num ==600006
replace Mandatory_CSR = 1 if Code_num ==600011
replace Mandatory_CSR = 1 if Code_num ==600012
replace Mandatory_CSR = 1 if Code_num ==600016
replace Mandatory_CSR = 1 if Code_num ==600017
replace Mandatory_CSR = 1 if Code_num ==600018
replace Mandatory_CSR = 1 if Code_num ==600019
replace Mandatory_CSR = 1 if Code_num ==600020
replace Mandatory_CSR = 1 if Code_num ==600022
replace Mandatory_CSR = 1 if Code_num ==600026
replace Mandatory_CSR = 1 if Code_num ==600027
replace Mandatory_CSR = 1 if Code_num ==600030
replace Mandatory_CSR = 1 if Code_num ==600031
replace Mandatory_CSR = 1 if Code_num ==600033
replace Mandatory_CSR = 1 if Code_num ==600036
replace Mandatory_CSR = 1 if Code_num ==600037
replace Mandatory_CSR = 1 if Code_num ==600048
replace Mandatory_CSR = 1 if Code_num ==600050
replace Mandatory_CSR = 1 if Code_num ==600051
replace Mandatory_CSR = 1 if Code_num ==600056
replace Mandatory_CSR = 1 if Code_num ==600058
replace Mandatory_CSR = 1 if Code_num ==600060
replace Mandatory_CSR = 1 if Code_num ==600062
replace Mandatory_CSR = 1 if Code_num ==600063
replace Mandatory_CSR = 1 if Code_num ==600066
replace Mandatory_CSR = 1 if Code_num ==600067
replace Mandatory_CSR = 1 if Code_num ==600068
replace Mandatory_CSR = 1 if Code_num ==600071
replace Mandatory_CSR = 1 if Code_num ==600085
replace Mandatory_CSR = 1 if Code_num ==600087
replace Mandatory_CSR = 1 if Code_num ==600089
replace Mandatory_CSR = 1 if Code_num ==600096
replace Mandatory_CSR = 1 if Code_num ==600098
replace Mandatory_CSR = 1 if Code_num ==600100
replace Mandatory_CSR = 1 if Code_num ==600102
replace Mandatory_CSR = 1 if Code_num ==600104
replace Mandatory_CSR = 1 if Code_num ==600106
replace Mandatory_CSR = 1 if Code_num ==600110
replace Mandatory_CSR = 1 if Code_num ==600113
replace Mandatory_CSR = 1 if Code_num ==600116
replace Mandatory_CSR = 1 if Code_num ==600117
replace Mandatory_CSR = 1 if Code_num ==600118
replace Mandatory_CSR = 1 if Code_num ==600125
replace Mandatory_CSR = 1 if Code_num ==600138
replace Mandatory_CSR = 1 if Code_num ==600151
replace Mandatory_CSR = 1 if Code_num ==600158
replace Mandatory_CSR = 1 if Code_num ==600161
replace Mandatory_CSR = 1 if Code_num ==600163
replace Mandatory_CSR = 1 if Code_num ==600166
replace Mandatory_CSR = 1 if Code_num ==600170
replace Mandatory_CSR = 1 if Code_num ==600171
replace Mandatory_CSR = 1 if Code_num ==600177
replace Mandatory_CSR = 1 if Code_num ==600183
replace Mandatory_CSR = 1 if Code_num ==600188
replace Mandatory_CSR = 1 if Code_num ==600195
replace Mandatory_CSR = 1 if Code_num ==600206
replace Mandatory_CSR = 1 if Code_num ==600210
replace Mandatory_CSR = 1 if Code_num ==600219
replace Mandatory_CSR = 1 if Code_num ==600243
replace Mandatory_CSR = 1 if Code_num ==600246
replace Mandatory_CSR = 1 if Code_num ==600252
replace Mandatory_CSR = 1 if Code_num ==600255
replace Mandatory_CSR = 1 if Code_num ==600260
replace Mandatory_CSR = 1 if Code_num ==600261
replace Mandatory_CSR = 1 if Code_num ==600266
replace Mandatory_CSR = 1 if Code_num ==600267
replace Mandatory_CSR = 1 if Code_num ==600269
replace Mandatory_CSR = 1 if Code_num ==600270
replace Mandatory_CSR = 1 if Code_num ==600271
replace Mandatory_CSR = 1 if Code_num ==600284
replace Mandatory_CSR = 1 if Code_num ==600308
replace Mandatory_CSR = 1 if Code_num ==600309
replace Mandatory_CSR = 1 if Code_num ==600310
replace Mandatory_CSR = 1 if Code_num ==600317
replace Mandatory_CSR = 1 if Code_num ==600322
replace Mandatory_CSR = 1 if Code_num ==600323
replace Mandatory_CSR = 1 if Code_num ==600325
replace Mandatory_CSR = 1 if Code_num ==600330
replace Mandatory_CSR = 1 if Code_num ==600332
replace Mandatory_CSR = 1 if Code_num ==600337
replace Mandatory_CSR = 1 if Code_num ==600350
replace Mandatory_CSR = 1 if Code_num ==600351
replace Mandatory_CSR = 1 if Code_num ==600352
replace Mandatory_CSR = 1 if Code_num ==600357
replace Mandatory_CSR = 1 if Code_num ==600362
replace Mandatory_CSR = 1 if Code_num ==600367
replace Mandatory_CSR = 1 if Code_num ==600383
replace Mandatory_CSR = 1 if Code_num ==600389
replace Mandatory_CSR = 1 if Code_num ==600392
replace Mandatory_CSR = 1 if Code_num ==600396
replace Mandatory_CSR = 1 if Code_num ==600409
replace Mandatory_CSR = 1 if Code_num ==600418
replace Mandatory_CSR = 1 if Code_num ==600423
replace Mandatory_CSR = 1 if Code_num ==600428
replace Mandatory_CSR = 1 if Code_num ==600439
replace Mandatory_CSR = 1 if Code_num ==600452
replace Mandatory_CSR = 1 if Code_num ==600456
replace Mandatory_CSR = 1 if Code_num ==600458
replace Mandatory_CSR = 1 if Code_num ==600460
replace Mandatory_CSR = 1 if Code_num ==600463
replace Mandatory_CSR = 1 if Code_num ==600467
replace Mandatory_CSR = 1 if Code_num ==600483
replace Mandatory_CSR = 1 if Code_num ==600486
replace Mandatory_CSR = 1 if Code_num ==600487
replace Mandatory_CSR = 1 if Code_num ==600495
replace Mandatory_CSR = 1 if Code_num ==600496
replace Mandatory_CSR = 1 if Code_num ==600497
replace Mandatory_CSR = 1 if Code_num ==600498
replace Mandatory_CSR = 1 if Code_num ==600499
replace Mandatory_CSR = 1 if Code_num ==600500
replace Mandatory_CSR = 1 if Code_num ==600501
replace Mandatory_CSR = 1 if Code_num ==600507
replace Mandatory_CSR = 1 if Code_num ==600508
replace Mandatory_CSR = 1 if Code_num ==600510
replace Mandatory_CSR = 1 if Code_num ==600511
replace Mandatory_CSR = 1 if Code_num ==600517
replace Mandatory_CSR = 1 if Code_num ==600525
replace Mandatory_CSR = 1 if Code_num ==600526
replace Mandatory_CSR = 1 if Code_num ==600527
replace Mandatory_CSR = 1 if Code_num ==600528
replace Mandatory_CSR = 1 if Code_num ==600533
replace Mandatory_CSR = 1 if Code_num ==600535
replace Mandatory_CSR = 1 if Code_num ==600548
replace Mandatory_CSR = 1 if Code_num ==600549
replace Mandatory_CSR = 1 if Code_num ==600557
replace Mandatory_CSR = 1 if Code_num ==600560
replace Mandatory_CSR = 1 if Code_num ==600561
replace Mandatory_CSR = 1 if Code_num ==600569
replace Mandatory_CSR = 1 if Code_num ==600582
replace Mandatory_CSR = 1 if Code_num ==600583
replace Mandatory_CSR = 1 if Code_num ==600585
replace Mandatory_CSR = 1 if Code_num ==600588
replace Mandatory_CSR = 1 if Code_num ==600591
replace Mandatory_CSR = 1 if Code_num ==600592
replace Mandatory_CSR = 1 if Code_num ==600595
replace Mandatory_CSR = 1 if Code_num ==600596
replace Mandatory_CSR = 1 if Code_num ==600597
replace Mandatory_CSR = 1 if Code_num ==600600
replace Mandatory_CSR = 1 if Code_num ==600601
replace Mandatory_CSR = 1 if Code_num ==600616
replace Mandatory_CSR = 1 if Code_num ==600619
replace Mandatory_CSR = 1 if Code_num ==600620
replace Mandatory_CSR = 1 if Code_num ==600642
replace Mandatory_CSR = 1 if Code_num ==600649
replace Mandatory_CSR = 1 if Code_num ==600658
replace Mandatory_CSR = 1 if Code_num ==600674
replace Mandatory_CSR = 1 if Code_num ==600685
replace Mandatory_CSR = 1 if Code_num ==600690
replace Mandatory_CSR = 1 if Code_num ==600702
replace Mandatory_CSR = 1 if Code_num ==600717
replace Mandatory_CSR = 1 if Code_num ==600718
replace Mandatory_CSR = 1 if Code_num ==600736
replace Mandatory_CSR = 1 if Code_num ==600748
replace Mandatory_CSR = 1 if Code_num ==600750
replace Mandatory_CSR = 1 if Code_num ==600755
replace Mandatory_CSR = 1 if Code_num ==600761
replace Mandatory_CSR = 1 if Code_num ==600780
replace Mandatory_CSR = 1 if Code_num ==600787
replace Mandatory_CSR = 1 if Code_num ==600795
replace Mandatory_CSR = 1 if Code_num ==600798
replace Mandatory_CSR = 1 if Code_num ==600808
replace Mandatory_CSR = 1 if Code_num ==600829
replace Mandatory_CSR = 1 if Code_num ==600836
replace Mandatory_CSR = 1 if Code_num ==600845
replace Mandatory_CSR = 1 if Code_num ==600858
replace Mandatory_CSR = 1 if Code_num ==600860
replace Mandatory_CSR = 1 if Code_num ==600879
replace Mandatory_CSR = 1 if Code_num ==600881
replace Mandatory_CSR = 1 if Code_num ==600886
replace Mandatory_CSR = 1 if Code_num ==600889
replace Mandatory_CSR = 1 if Code_num ==600896
replace Mandatory_CSR = 1 if Code_num ==600900
replace Mandatory_CSR = 1 if Code_num ==600962
replace Mandatory_CSR = 1 if Code_num ==600966
replace Mandatory_CSR = 1 if Code_num ==600970
replace Mandatory_CSR = 1 if Code_num ==600979
replace Mandatory_CSR = 1 if Code_num ==600980
replace Mandatory_CSR = 1 if Code_num ==600983
replace Mandatory_CSR = 1 if Code_num ==600987
replace Mandatory_CSR = 1 if Code_num ==600992
replace Mandatory_CSR = 1 if Code_num ==600993
replace Mandatory_CSR = 1 if Code_num ==600997
replace Mandatory_CSR = 1 if Code_num ==601006
replace Mandatory_CSR = 1 if Code_num ==601088
replace Mandatory_CSR = 1 if Code_num ==601111
replace Mandatory_CSR = 1 if Code_num ==601318
replace Mandatory_CSR = 1 if Code_num ==601328
replace Mandatory_CSR = 1 if Code_num ==601398
replace Mandatory_CSR = 1 if Code_num ==601588
replace Mandatory_CSR = 1 if Code_num ==601600
replace Mandatory_CSR = 1 if Code_num ==601628
replace Mandatory_CSR = 1 if Code_num ==601699
replace Mandatory_CSR = 1 if Code_num ==601919
replace Mandatory_CSR = 1 if Code_num ==601939
replace Mandatory_CSR = 1 if Code_num ==601988
replace Mandatory_CSR = 1 if Code_num ==601991
replace Mandatory_CSR = 1 if Code_num ==600029
replace Mandatory_CSR = 1 if Code_num ==600055
replace Mandatory_CSR = 1 if Code_num ==600059
replace Mandatory_CSR = 1 if Code_num ==600111
replace Mandatory_CSR = 1 if Code_num ==600123
replace Mandatory_CSR = 1 if Code_num ==600153
replace Mandatory_CSR = 1 if Code_num ==600196
replace Mandatory_CSR = 1 if Code_num ==600218
replace Mandatory_CSR = 1 if Code_num ==600263
replace Mandatory_CSR = 1 if Code_num ==600303
replace Mandatory_CSR = 1 if Code_num ==600360
replace Mandatory_CSR = 1 if Code_num ==600371
replace Mandatory_CSR = 1 if Code_num ==600432
replace Mandatory_CSR = 1 if Code_num ==600438
replace Mandatory_CSR = 1 if Code_num ==600468
replace Mandatory_CSR = 1 if Code_num ==600531
replace Mandatory_CSR = 1 if Code_num ==600550
replace Mandatory_CSR = 1 if Code_num ==600578
replace Mandatory_CSR = 1 if Code_num ==600580
replace Mandatory_CSR = 1 if Code_num ==600611
replace Mandatory_CSR = 1 if Code_num ==600797
replace Mandatory_CSR = 1 if Code_num ==600835
replace Mandatory_CSR = 1 if Code_num ==600837
replace Mandatory_CSR = 1 if Code_num ==600839
replace Mandatory_CSR = 1 if Code_num ==600973
replace Mandatory_CSR = 1 if Code_num ==600995
replace Mandatory_CSR = 1 if Code_num ==601007
replace Mandatory_CSR = 1 if Code_num ==601008
replace Mandatory_CSR = 1 if Code_num ==601166
replace Mandatory_CSR = 1 if Code_num ==601857
replace Mandatory_CSR = 1 if Code_num ==601899
replace Mandatory_CSR = 1 if Code_num ==601998

replace Mandatory_CSR = 1 if Year == 2009 & Code_num ==600251
replace Mandatory_CSR = 1 if Year == 2009 & Code_num ==600635
replace Mandatory_CSR = 1 if Year == 2009 & Code_num ==600005
replace Mandatory_CSR = 1 if Year == 2009 & Code_num ==601333
replace Mandatory_CSR = 1 if Year == 2009 & Code_num ==601390
replace Mandatory_CSR = 1 if Year == 2009 & Code_num ==601601
replace Mandatory_CSR = 1 if Year == 2009 & Code_num ==601727
replace Mandatory_CSR = 1 if Year == 2009 & Code_num ==601898
replace Mandatory_CSR = 1 if Year == 2009 & Code_num ==601958
replace Mandatory_CSR = 1 if Year == 2009 & Code_num ==600743
replace Mandatory_CSR = 1 if Year == 2009 & Code_num ==600895
replace Mandatory_CSR = 1 if Year == 2009 & Code_num ==601168
replace Mandatory_CSR = 1 if Year == 2009 & Code_num ==601186
replace Mandatory_CSR = 1 if Year == 2009 & Code_num ==600841
replace Mandatory_CSR = 1 if Year == 2009 & Code_num ==600469

replace Mandatory_CSR = 1 if Year == 2010 & Code_num ==601766
replace Mandatory_CSR = 1 if Year == 2010 & Code_num ==600176
replace Mandatory_CSR = 1 if Year == 2010 & Code_num ==600227
replace Mandatory_CSR = 1 if Year == 2010 & Code_num ==600435
replace Mandatory_CSR = 1 if Year == 2010 & Code_num ==600488
replace Mandatory_CSR = 1 if Year == 2010 & Code_num ==600765
replace Mandatory_CSR = 1 if Year == 2010 & Code_num ==600888
replace Mandatory_CSR = 1 if Year == 2010 & Code_num ==601009
replace Mandatory_CSR = 1 if Year == 2010 & Code_num ==601866

replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==600027
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==600064
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==600141
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==600173
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==600190
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==600223
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==600262
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==600282
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==600376
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==600422
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==600502
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==600518
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==600551
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==600657
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==600737
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==600739
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==600875
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==600999
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==601101
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==601168
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==601299
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==601607
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==601618
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==601668
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==601688
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==601788
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==601898
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==601989
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==600256

replace Mandatory_CSR = 1 if Year == 2012 & Code_num ==600109
replace Mandatory_CSR = 1 if Year == 2012 & Code_num ==600111
replace Mandatory_CSR = 1 if Year == 2012 & Code_num ==600115
replace Mandatory_CSR = 1 if Year == 2012 & Code_num ==600377
replace Mandatory_CSR = 1 if Year == 2012 & Code_num ==600546
replace Mandatory_CSR = 1 if Year == 2012 & Code_num ==600704
replace Mandatory_CSR = 1 if Year == 2012 & Code_num ==600873
replace Mandatory_CSR = 1 if Year == 2012 & Code_num ==601000
replace Mandatory_CSR = 1 if Year == 2012 & Code_num ==601018
replace Mandatory_CSR = 1 if Year == 2012 & Code_num ==601098
replace Mandatory_CSR = 1 if Year == 2012 & Code_num ==601139
replace Mandatory_CSR = 1 if Year == 2012 & Code_num ==601169
replace Mandatory_CSR = 1 if Year == 2012 & Code_num ==601199
replace Mandatory_CSR = 1 if Year == 2012 & Code_num ==601369
replace Mandatory_CSR = 1 if Year == 2012 & Code_num ==601377
replace Mandatory_CSR = 1 if Year == 2012 & Code_num ==601800
replace Mandatory_CSR = 1 if Year == 2012 & Code_num ==601808
replace Mandatory_CSR = 1 if Year == 2012 & Code_num ==601818
replace Mandatory_CSR = 1 if Year == 2012 & Code_num ==601877

replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==600028
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==600078
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==600259
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==600335
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==600352
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==600386
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==600406
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==600420
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==600543
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==600633
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==600660
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==600741
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==600763
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==600815
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==601038
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==601058
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==601118
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==601222
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==601231
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==601238
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==601555
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==601636
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==601928
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==603000
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==603993

replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==600021
replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==600198
replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==600459
replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==600547
replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==600705
replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==600783
replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==600880
replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==600894
replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==601117
replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==601126
replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==601336
replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==601515
replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==601608
replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==601777
replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==601886

replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==600094
replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==600135
replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==600200
replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==600273
replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==600277
replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==600282
replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==600287
replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==600373
replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==600405
replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==600433
replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==600489
replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==600562
replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==600645
replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==600663
replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==600684
replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==600850
replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==600980
replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==600990
replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==601099
replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==601669
replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==603555

replace Mandatory_CSR = 1 if Year == 2016 & Code_num ==600917
replace Mandatory_CSR = 1 if Year == 2016 & Code_num ==601211
replace Mandatory_CSR = 1 if Year == 2016 & Code_num ==601226
replace Mandatory_CSR = 1 if Year == 2016 & Code_num ==601318
replace Mandatory_CSR = 1 if Year == 2016 & Code_num ==601985

replace Mandatory_CSR = 1 if Year == 2017 & Code_num ==600008
replace Mandatory_CSR = 1 if Year == 2017 & Code_num ==600035
replace Mandatory_CSR = 1 if Year == 2017 & Code_num ==600297
replace Mandatory_CSR = 1 if Year == 2017 & Code_num ==600528
replace Mandatory_CSR = 1 if Year == 2017 & Code_num ==600566
replace Mandatory_CSR = 1 if Year == 2017 & Code_num ==600976
replace Mandatory_CSR = 1 if Year == 2017 & Code_num ==601788
replace Mandatory_CSR = 1 if Year == 2017 & Code_num ==601857
replace Mandatory_CSR = 1 if Year == 2017 & Code_num ==601919
replace Mandatory_CSR = 1 if Year == 2017 & Code_num ==603018
replace Mandatory_CSR = 1 if Year == 2017 & Code_num ==603508
replace Mandatory_CSR = 1 if Year == 2017 & Code_num ==603568
replace Mandatory_CSR = 1 if Year == 2017 & Code_num ==603883

replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==600061
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==600170
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==600233
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==600282
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==600436
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==600522
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==600557
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==600708
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==600909
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==600919
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==600958
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==600977
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==601000
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==601128
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==601163
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==601211
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==601229
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==601611
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==601618
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==601899
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==603323
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==603337
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==603588
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==603668

replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==601598
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==600029
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==600150
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==600839
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==600887
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==601068
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==601619
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==601838
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==601869
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==601966
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==603060
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==603181
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==603365
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==603444
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==603515
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==603538
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==603558
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==603708
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==603817

replace Mandatory_CSR = 0 if Year == 2009 & Code_num ==600106
replace Mandatory_CSR = 0 if Year == 2009 & Code_num ==600591
replace Mandatory_CSR = 0 if Year == 2009 & Code_num ==600501
replace Mandatory_CSR = 0 if Year == 2009 & Code_num ==600585
replace Mandatory_CSR = 0 if Year == 2009 & Code_num ==600001
replace Mandatory_CSR = 0 if Year == 2009 & Code_num ==600357

replace Mandatory_CSR = 0 if Year == 2010 & Code_num ==600027
replace Mandatory_CSR = 0 if Year == 2010 & Code_num ==600438
replace Mandatory_CSR = 0 if Year == 2010 & Code_num ==600487
replace Mandatory_CSR = 0 if Year == 2010 & Code_num ==600860
replace Mandatory_CSR = 0 if Year == 2010 & Code_num ==601168
replace Mandatory_CSR = 0 if Year == 2010 & Code_num ==600527
replace Mandatory_CSR = 0 if Year == 2010 & Code_num ==601898
replace Mandatory_CSR = 0 if Year == 2010 & Code_num ==601899

replace Mandatory_CSR = 0 if Year == 2011 & Code_num ==600111
replace Mandatory_CSR = 0 if Year == 2011 & Code_num ==600219
replace Mandatory_CSR = 0 if Year == 2011 & Code_num ==600330
replace Mandatory_CSR = 0 if Year == 2011 & Code_num ==600352
replace Mandatory_CSR = 0 if Year == 2011 & Code_num ==600765

replace Mandatory_CSR = 0 if Year == 2012 & Code_num ==600102
replace Mandatory_CSR = 0 if Year == 2012 & Code_num ==600263
replace Mandatory_CSR = 0 if Year == 2012 & Code_num ==600087
replace Mandatory_CSR = 0 if Year == 2012 & Code_num ==600163
replace Mandatory_CSR = 0 if Year == 2012 & Code_num ==600252
replace Mandatory_CSR = 0 if Year == 2012 & Code_num ==600392
replace Mandatory_CSR = 0 if Year == 2012 & Code_num ==600557
replace Mandatory_CSR = 0 if Year == 2012 & Code_num ==600980

replace Mandatory_CSR = 0 if Year == 2013 & Code_num ==601919
replace Mandatory_CSR = 0 if Year == 2013 & Code_num ==601788

replace Mandatory_CSR = 0 if Year == 2014 & Code_num ==600051
replace Mandatory_CSR = 0 if Year == 2014 & Code_num ==600110
replace Mandatory_CSR = 0 if Year == 2014 & Code_num ==600282
replace Mandatory_CSR = 0 if Year == 2014 & Code_num ==600432
replace Mandatory_CSR = 0 if Year == 2014 & Code_num ==600550
replace Mandatory_CSR = 0 if Year == 2014 & Code_num ==600966
replace Mandatory_CSR = 0 if Year == 2014 & Code_num ==601857

replace Mandatory_CSR = 0 if Year == 2015 & Code_num ==601299
replace Mandatory_CSR = 0 if Year == 2015 & Code_num ==600029
replace Mandatory_CSR = 0 if Year == 2015 & Code_num ==600071
replace Mandatory_CSR = 0 if Year == 2015 & Code_num ==600096
replace Mandatory_CSR = 0 if Year == 2015 & Code_num ==600317
replace Mandatory_CSR = 0 if Year == 2015 & Code_num ==600423
replace Mandatory_CSR = 0 if Year == 2015 & Code_num ==600469
replace Mandatory_CSR = 0 if Year == 2015 & Code_num ==600829
replace Mandatory_CSR = 0 if Year == 2015 & Code_num ==600962
replace Mandatory_CSR = 0 if Year == 2015 & Code_num ==601169
replace Mandatory_CSR = 0 if Year == 2015 & Code_num ==601318

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

//Shenzhen//
replace Mandatory_CSR = 1 if Code_num == 000541
replace Mandatory_CSR = 1 if Code_num == 000550
replace Mandatory_CSR = 1 if Code_num == 000581
replace Mandatory_CSR = 1 if Code_num == 000625
replace Mandatory_CSR = 1 if Code_num == 000629
replace Mandatory_CSR = 1 if Code_num == 000636
replace Mandatory_CSR = 1 if Code_num == 000659
replace Mandatory_CSR = 1 if Code_num == 000680
replace Mandatory_CSR = 1 if Code_num == 000701
replace Mandatory_CSR = 1 if Code_num == 000707
replace Mandatory_CSR = 1 if Code_num == 000729
replace Mandatory_CSR = 1 if Code_num == 000758
replace Mandatory_CSR = 1 if Code_num == 000767
replace Mandatory_CSR = 1 if Code_num == 000778
replace Mandatory_CSR = 1 if Code_num == 000787
replace Mandatory_CSR = 1 if Code_num == 000822
replace Mandatory_CSR = 1 if Code_num == 000839
replace Mandatory_CSR = 1 if Code_num == 000858
replace Mandatory_CSR = 1 if Code_num == 000866
replace Mandatory_CSR = 1 if Code_num == 000878
replace Mandatory_CSR = 1 if Code_num == 000895
replace Mandatory_CSR = 1 if Code_num == 000898
replace Mandatory_CSR = 1 if Code_num == 000916
replace Mandatory_CSR = 1 if Code_num == 000917
replace Mandatory_CSR = 1 if Code_num == 000930
replace Mandatory_CSR = 1 if Code_num == 000932
replace Mandatory_CSR = 1 if Code_num == 000956
replace Mandatory_CSR = 1 if Code_num == 000962
replace Mandatory_CSR = 1 if Code_num == 000983
replace Mandatory_CSR = 1 if Code_num == 000001
replace Mandatory_CSR = 1 if Code_num == 000002
replace Mandatory_CSR = 1 if Code_num == 000009
replace Mandatory_CSR = 1 if Code_num == 000016
replace Mandatory_CSR = 1 if Code_num == 000021
replace Mandatory_CSR = 1 if Code_num == 000024
replace Mandatory_CSR = 1 if Code_num == 000027
replace Mandatory_CSR = 1 if Code_num == 000031
replace Mandatory_CSR = 1 if Code_num == 000060
replace Mandatory_CSR = 1 if Code_num == 000061
replace Mandatory_CSR = 1 if Code_num == 000063
replace Mandatory_CSR = 1 if Code_num == 000066
replace Mandatory_CSR = 1 if Code_num == 000068
replace Mandatory_CSR = 1 if Code_num == 000069
replace Mandatory_CSR = 1 if Code_num == 000088
replace Mandatory_CSR = 1 if Code_num == 000089
replace Mandatory_CSR = 1 if Code_num == 000400
replace Mandatory_CSR = 1 if Code_num == 000401
replace Mandatory_CSR = 1 if Code_num == 000406
replace Mandatory_CSR = 1 if Code_num == 000423
replace Mandatory_CSR = 1 if Code_num == 000429
replace Mandatory_CSR = 1 if Code_num == 000503
replace Mandatory_CSR = 1 if Code_num == 000520
replace Mandatory_CSR = 1 if Code_num == 000527
replace Mandatory_CSR = 1 if Code_num == 000539
replace Mandatory_CSR = 1 if Code_num == 000959
replace Mandatory_CSR = 1 if Code_num == 000900
replace Mandatory_CSR = 1 if Code_num == 000828
replace Mandatory_CSR = 1 if Code_num == 000800
replace Mandatory_CSR = 1 if Code_num == 000733
replace Mandatory_CSR = 1 if Code_num == 000709
replace Mandatory_CSR = 1 if Code_num == 000651
replace Mandatory_CSR = 1 if Code_num == 000402
replace Mandatory_CSR = 1 if Code_num == 000488
replace Mandatory_CSR = 1 if Code_num == 000666
replace Mandatory_CSR = 1 if Code_num == 000717
replace Mandatory_CSR = 1 if Code_num == 000875
replace Mandatory_CSR = 1 if Code_num == 000036
replace Mandatory_CSR = 1 if Code_num == 000410
replace Mandatory_CSR = 1 if Code_num == 000528
replace Mandatory_CSR = 1 if Code_num == 000568
replace Mandatory_CSR = 1 if Code_num == 000792
replace Mandatory_CSR = 1 if Code_num == 000601
replace Mandatory_CSR = 1 if Code_num == 000100
replace Mandatory_CSR = 1 if Code_num == 000039
replace Mandatory_CSR = 1 if Code_num == 000157
replace Mandatory_CSR = 1 if Code_num == 000806
replace Mandatory_CSR = 1 if Code_num == 000825
replace Mandatory_CSR = 1 if Code_num == 000920
replace Mandatory_CSR = 1 if Code_num == 000630
replace Mandatory_CSR = 1 if Code_num == 000726
replace Mandatory_CSR = 1 if Code_num == 000927
replace Mandatory_CSR = 1 if Code_num == 000933
replace Mandatory_CSR = 1 if Code_num == 000960
replace Mandatory_CSR = 1 if Code_num == 000970
replace Mandatory_CSR = 1 if Code_num == 000538
replace Mandatory_CSR = 1 if Code_num == 000912
replace Mandatory_CSR = 1 if Code_num == 000968
replace Mandatory_CSR = 1 if Code_num == 002024
replace Mandatory_CSR = 1 if Code_num == 000422
replace Mandatory_CSR = 1 if Code_num == 000022
replace Mandatory_CSR = 1 if Code_num == 002008
replace Mandatory_CSR = 1 if Code_num == 002012
replace Mandatory_CSR = 1 if Code_num == 002023
replace Mandatory_CSR = 1 if Code_num == 002025
replace Mandatory_CSR = 1 if Code_num == 002027
replace Mandatory_CSR = 1 if Code_num == 002031
replace Mandatory_CSR = 1 if Code_num == 002040
replace Mandatory_CSR = 1 if Code_num == 002041
replace Mandatory_CSR = 1 if Code_num == 002028
replace Mandatory_CSR = 1 if Code_num == 000937

replace Mandatory_CSR = 1 if Year == 2006 & Code_num ==000623
replace Mandatory_CSR = 1 if Year == 2006 & Code_num ==000939
replace Mandatory_CSR = 1 if Year == 2006 & Code_num ==000969
replace Mandatory_CSR = 1 if Year == 2006 & Code_num ==000006
replace Mandatory_CSR = 1 if Year == 2006 & Code_num ==000619
replace Mandatory_CSR = 1 if Year == 2006 & Code_num ==000869
replace Mandatory_CSR = 1 if Year == 2006 & Code_num ==002001
replace Mandatory_CSR = 1 if Year == 2006 & Code_num ==002007
replace Mandatory_CSR = 1 if Year == 2006 & Code_num ==002022
replace Mandatory_CSR = 1 if Year == 2006 & Code_num ==002046
replace Mandatory_CSR = 1 if Year == 2006 & Code_num ==000012
replace Mandatory_CSR = 1 if Year == 2006 & Code_num ==000562
replace Mandatory_CSR = 1 if Year == 2006 & Code_num ==000768
replace Mandatory_CSR = 1 if Year == 2006 & Code_num ==000807
replace Mandatory_CSR = 1 if Year == 2006 & Code_num ==000911

replace Mandatory_CSR = 1 if Year == 2007 & Code_num ==000652
replace Mandatory_CSR = 1 if Year == 2007 & Code_num ==000751
replace Mandatory_CSR = 1 if Year == 2007 & Code_num ==000793
replace Mandatory_CSR = 1 if Year == 2007 & Code_num ==002048
replace Mandatory_CSR = 1 if Year == 2007 & Code_num ==002051
replace Mandatory_CSR = 1 if Year == 2007 & Code_num ==002056
replace Mandatory_CSR = 1 if Year == 2007 & Code_num ==002069
replace Mandatory_CSR = 1 if Year == 2007 & Code_num ==000301
replace Mandatory_CSR = 1 if Year == 2007 & Code_num ==000338
replace Mandatory_CSR = 1 if Year == 2007 & Code_num ==000612
replace Mandatory_CSR = 1 if Year == 2007 & Code_num ==000686
replace Mandatory_CSR = 1 if Year == 2007 & Code_num ==000897
replace Mandatory_CSR = 1 if Year == 2007 & Code_num ==002019
replace Mandatory_CSR = 1 if Year == 2007 & Code_num ==002122
replace Mandatory_CSR = 1 if Year == 2007 & Code_num ==002128

replace Mandatory_CSR = 1 if Year == 2008 & Code_num ==000046
replace Mandatory_CSR = 1 if Year == 2008 & Code_num ==000100
replace Mandatory_CSR = 1 if Year == 2008 & Code_num ==000511
replace Mandatory_CSR = 1 if Year == 2008 & Code_num ==000532
replace Mandatory_CSR = 1 if Year == 2008 & Code_num ==000667
replace Mandatory_CSR = 1 if Year == 2008 & Code_num ==000690
replace Mandatory_CSR = 1 if Year == 2008 & Code_num ==000831
replace Mandatory_CSR = 1 if Year == 2008 & Code_num ==002092
replace Mandatory_CSR = 1 if Year == 2008 & Code_num ==002097
replace Mandatory_CSR = 1 if Year == 2008 & Code_num ==002142
replace Mandatory_CSR = 1 if Year == 2008 & Code_num ==000425
replace Mandatory_CSR = 1 if Year == 2008 & Code_num ==000655
replace Mandatory_CSR = 1 if Year == 2008 & Code_num ==000728
replace Mandatory_CSR = 1 if Year == 2008 & Code_num ==000783
replace Mandatory_CSR = 1 if Year == 2008 & Code_num ==000876
replace Mandatory_CSR = 1 if Year == 2008 & Code_num ==000952
replace Mandatory_CSR = 1 if Year == 2008 & Code_num ==000968
replace Mandatory_CSR = 1 if Year == 2008 & Code_num ==002001
replace Mandatory_CSR = 1 if Year == 2008 & Code_num ==002202

replace Mandatory_CSR = 1 if Year == 2009 & Code_num ==000059
replace Mandatory_CSR = 1 if Year == 2009 & Code_num ==000996
replace Mandatory_CSR = 1 if Year == 2009 & Code_num ==000999
replace Mandatory_CSR = 1 if Year == 2009 & Code_num ==002028

replace Mandatory_CSR = 1 if Year == 2010 & Code_num ==000021
replace Mandatory_CSR = 1 if Year == 2010 & Code_num ==000550
replace Mandatory_CSR = 1 if Year == 2010 & Code_num ==000597
replace Mandatory_CSR = 1 if Year == 2010 & Code_num ==000718
replace Mandatory_CSR = 1 if Year == 2010 & Code_num ==002128
replace Mandatory_CSR = 1 if Year == 2010 & Code_num ==002155
replace Mandatory_CSR = 1 if Year == 2010 & Code_num ==000066
replace Mandatory_CSR = 1 if Year == 2010 & Code_num ==000522
replace Mandatory_CSR = 1 if Year == 2010 & Code_num ==000786
replace Mandatory_CSR = 1 if Year == 2010 & Code_num ==000829
replace Mandatory_CSR = 1 if Year == 2010 & Code_num ==000927
replace Mandatory_CSR = 1 if Year == 2010 & Code_num ==002069
replace Mandatory_CSR = 1 if Year == 2010 & Code_num ==002078

replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==000559
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==000762
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==002056
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==002106
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==002122
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==000540
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==000581
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==000629
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==000776
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==000780
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==002081
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==002146
replace Mandatory_CSR = 1 if Year == 2011 & Code_num ==002304

replace Mandatory_CSR = 1 if Year == 2012 & Code_num ==000046
replace Mandatory_CSR = 1 if Year == 2012 & Code_num ==000877
replace Mandatory_CSR = 1 if Year == 2012 & Code_num ==000970
replace Mandatory_CSR = 1 if Year == 2012 & Code_num ==002006
replace Mandatory_CSR = 1 if Year == 2012 & Code_num ==002073
replace Mandatory_CSR = 1 if Year == 2012 & Code_num ==002233
replace Mandatory_CSR = 1 if Year == 2012 & Code_num ==000596
replace Mandatory_CSR = 1 if Year == 2012 & Code_num ==000826
replace Mandatory_CSR = 1 if Year == 2012 & Code_num ==002041
replace Mandatory_CSR = 1 if Year == 2012 & Code_num ==002241
replace Mandatory_CSR = 1 if Year == 2012 & Code_num ==002269
replace Mandatory_CSR = 1 if Year == 2012 & Code_num ==002292
replace Mandatory_CSR = 1 if Year == 2012 & Code_num ==002500

replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==000725
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==002038
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==002051
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==002230
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==002236
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==002415
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==002422
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==300070
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==000400
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==000750
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==000961
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==000999
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==002244
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==002353
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==002450
replace Mandatory_CSR = 1 if Year == 2013 & Code_num ==000333

replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==300027
replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==300104
replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==000598
replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==000831
replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==002594
replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==002344
replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==002456
replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==002570
replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==002405
replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==300024
replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==002065
replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==002292
replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==002385
replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==002465
replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==300002
replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==300017
replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==300058
replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==300124
replace Mandatory_CSR = 1 if Year == 2014 & Code_num ==300315

replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==002475
replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==002030
replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==000977
replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==000963
replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==000166
replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==000413
replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==000712
replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==002673
replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==002736
replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==300059
replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==300168
replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==300498
replace Mandatory_CSR = 1 if Year == 2015 & Code_num ==001979

replace Mandatory_CSR = 1 if Year == 2016 & Code_num ==000883
replace Mandatory_CSR = 1 if Year == 2016 & Code_num ==000738
replace Mandatory_CSR = 1 if Year == 2016 & Code_num ==000540
replace Mandatory_CSR = 1 if Year == 2016 & Code_num ==000503
replace Mandatory_CSR = 1 if Year == 2016 & Code_num ==000031
replace Mandatory_CSR = 1 if Year == 2016 & Code_num ==300253
replace Mandatory_CSR = 1 if Year == 2016 & Code_num ==300251
replace Mandatory_CSR = 1 if Year == 2016 & Code_num ==002739
replace Mandatory_CSR = 1 if Year == 2016 & Code_num ==002276
replace Mandatory_CSR = 1 if Year == 2016 & Code_num ==002129
replace Mandatory_CSR = 1 if Year == 2016 & Code_num ==000988
replace Mandatory_CSR = 1 if Year == 2016 & Code_num ==002027
replace Mandatory_CSR = 1 if Year == 2016 & Code_num ==002176
replace Mandatory_CSR = 1 if Year == 2016 & Code_num ==002183
replace Mandatory_CSR = 1 if Year == 2016 & Code_num ==002252
replace Mandatory_CSR = 1 if Year == 2016 & Code_num ==002460
replace Mandatory_CSR = 1 if Year == 2016 & Code_num ==002466
replace Mandatory_CSR = 1 if Year == 2016 & Code_num ==300085
replace Mandatory_CSR = 1 if Year == 2016 & Code_num ==300418
replace Mandatory_CSR = 1 if Year == 2016 & Code_num ==300431

replace Mandatory_CSR = 1 if Year == 2017 & Code_num ==000938
replace Mandatory_CSR = 1 if Year == 2017 & Code_num ==000983
replace Mandatory_CSR = 1 if Year == 2017 & Code_num ==002007
replace Mandatory_CSR = 1 if Year == 2017 & Code_num ==002310
replace Mandatory_CSR = 1 if Year == 2017 & Code_num ==002340
replace Mandatory_CSR = 1 if Year == 2017 & Code_num ==002407
replace Mandatory_CSR = 1 if Year == 2017 & Code_num ==002610
replace Mandatory_CSR = 1 if Year == 2017 & Code_num ==002709
replace Mandatory_CSR = 1 if Year == 2017 & Code_num ==002797
replace Mandatory_CSR = 1 if Year == 2017 & Code_num ==300072
replace Mandatory_CSR = 1 if Year == 2017 & Code_num ==000415
replace Mandatory_CSR = 1 if Year == 2017 & Code_num ==000425
replace Mandatory_CSR = 1 if Year == 2017 & Code_num ==000617
replace Mandatory_CSR = 1 if Year == 2017 & Code_num ==000961
replace Mandatory_CSR = 1 if Year == 2017 & Code_num ==000963
replace Mandatory_CSR = 1 if Year == 2017 & Code_num ==002092
replace Mandatory_CSR = 1 if Year == 2017 & Code_num ==002352
replace Mandatory_CSR = 1 if Year == 2017 & Code_num ==002558
replace Mandatory_CSR = 1 if Year == 2017 & Code_num ==300136
replace Mandatory_CSR = 1 if Year == 2017 & Code_num ==300408

replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==002074
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==002271
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==002508
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==002146
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==300433
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==002572
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==000778
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==300003
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==000050
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==000786
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==000661
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==000830
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==000977
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==002001
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==002044
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==002049
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==002422
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==002714
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==300015
replace Mandatory_CSR = 1 if Year == 2018 & Code_num ==300676

replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==000703
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==000860
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==002110
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==002493
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==300122
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==300142
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==300253
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==300601
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==300750
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==300760
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==002120
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==001965
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==002032
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==002311
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==002602
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==002607
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==002841
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==002938
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==002939
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==300413
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==300454
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==003816
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==000596
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==000723
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==002153
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==002157
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==002179
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==002410
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==002916
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==002958
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==300033
replace Mandatory_CSR = 1 if Year == 2019 & Code_num ==300347

replace Mandatory_CSR = 1 if Year == 2020 & Code_num ==000708
replace Mandatory_CSR = 1 if Year == 2020 & Code_num ==002050
replace Mandatory_CSR = 1 if Year == 2020 & Code_num ==002371
replace Mandatory_CSR = 1 if Year == 2020 & Code_num ==002555
replace Mandatory_CSR = 1 if Year == 2020 & Code_num ==002624
replace Mandatory_CSR = 1 if Year == 2020 & Code_num ==300014
replace Mandatory_CSR = 1 if Year == 2020 & Code_num ==002049
replace Mandatory_CSR = 1 if Year == 2020 & Code_num ==002414
replace Mandatory_CSR = 1 if Year == 2020 & Code_num ==002460
replace Mandatory_CSR = 1 if Year == 2020 & Code_num ==002600
replace Mandatory_CSR = 1 if Year == 2020 & Code_num ==002812
replace Mandatory_CSR = 1 if Year == 2020 & Code_num ==300676
replace Mandatory_CSR = 1 if Year == 2020 & Code_num ==300759
replace Mandatory_CSR = 1 if Year == 2020 & Code_num ==300782
replace Mandatory_CSR = 1 if Year == 2020 & Code_num ==300999

replace Mandatory_CSR = 0 if Year == 2006 & Code_num ==000406
replace Mandatory_CSR = 0 if Year == 2006 & Code_num ==000866
replace Mandatory_CSR = 0 if Year == 2006 & Code_num ==000956
replace Mandatory_CSR = 0 if Year == 2006 & Code_num ==000666
replace Mandatory_CSR = 0 if Year == 2006 & Code_num ==000701
replace Mandatory_CSR = 0 if Year == 2006 & Code_num ==000787
replace Mandatory_CSR = 0 if Year == 2006 & Code_num ==002012
replace Mandatory_CSR = 0 if Year == 2006 & Code_num ==002023
replace Mandatory_CSR = 0 if Year == 2006 & Code_num ==002031
replace Mandatory_CSR = 0 if Year == 2006 & Code_num ==002040
replace Mandatory_CSR = 0 if Year == 2006 & Code_num ==000100
replace Mandatory_CSR = 0 if Year == 2006 & Code_num ==000806
replace Mandatory_CSR = 0 if Year == 2006 & Code_num ==000828
replace Mandatory_CSR = 0 if Year == 2006 & Code_num ==000920
replace Mandatory_CSR = 0 if Year == 2006 & Code_num ==000968

replace Mandatory_CSR = 0 if Year == 2007 & Code_num ==000016
replace Mandatory_CSR = 0 if Year == 2007 & Code_num ==000068
replace Mandatory_CSR = 0 if Year == 2007 & Code_num ==000733
replace Mandatory_CSR = 0 if Year == 2007 & Code_num ==002001
replace Mandatory_CSR = 0 if Year == 2007 & Code_num ==002027
replace Mandatory_CSR = 0 if Year == 2007 & Code_num ==002041
replace Mandatory_CSR = 0 if Year == 2007 & Code_num ==002046
replace Mandatory_CSR = 0 if Year == 2007 & Code_num ==000022
replace Mandatory_CSR = 0 if Year == 2007 & Code_num ==000066
replace Mandatory_CSR = 0 if Year == 2007 & Code_num ==000619
replace Mandatory_CSR = 0 if Year == 2007 & Code_num ==000911
replace Mandatory_CSR = 0 if Year == 2007 & Code_num ==000916
replace Mandatory_CSR = 0 if Year == 2007 & Code_num ==002025
replace Mandatory_CSR = 0 if Year == 2007 & Code_num ==002051
replace Mandatory_CSR = 0 if Year == 2007 & Code_num ==002069

replace Mandatory_CSR = 0 if Year == 2008 & Code_num ==000550
replace Mandatory_CSR = 0 if Year == 2008 & Code_num ==000601
replace Mandatory_CSR = 0 if Year == 2008 & Code_num ==000659
replace Mandatory_CSR = 0 if Year == 2008 & Code_num ==000726
replace Mandatory_CSR = 0 if Year == 2008 & Code_num ==000927
replace Mandatory_CSR = 0 if Year == 2008 & Code_num ==000939
replace Mandatory_CSR = 0 if Year == 2008 & Code_num ==000970
replace Mandatory_CSR = 0 if Year == 2008 & Code_num ==002028
replace Mandatory_CSR = 0 if Year == 2008 & Code_num ==002056
replace Mandatory_CSR = 0 if Year == 2008 & Code_num ==002122
replace Mandatory_CSR = 0 if Year == 2008 & Code_num ==000021
replace Mandatory_CSR = 0 if Year == 2008 & Code_num ==000036
replace Mandatory_CSR = 0 if Year == 2008 & Code_num ==000410
replace Mandatory_CSR = 0 if Year == 2008 & Code_num ==000429
replace Mandatory_CSR = 0 if Year == 2008 & Code_num ==000636
replace Mandatory_CSR = 0 if Year == 2008 & Code_num ==000751
replace Mandatory_CSR = 0 if Year == 2008 & Code_num ==000767
replace Mandatory_CSR = 0 if Year == 2008 & Code_num ==000875
replace Mandatory_CSR = 0 if Year == 2008 & Code_num ==002019

replace Mandatory_CSR = 0 if Year == 2009 & Code_num ==000088
replace Mandatory_CSR = 0 if Year == 2009 & Code_num ==000520
replace Mandatory_CSR = 0 if Year == 2009 & Code_num ==000962
replace Mandatory_CSR = 0 if Year == 2009 & Code_num ==002128

replace Mandatory_CSR = 0 if Year == 2010 & Code_num ==000629
replace Mandatory_CSR = 0 if Year == 2010 & Code_num ==000707
replace Mandatory_CSR = 0 if Year == 2010 & Code_num ==000831
replace Mandatory_CSR = 0 if Year == 2010 & Code_num ==000912
replace Mandatory_CSR = 0 if Year == 2010 & Code_num ==002048
replace Mandatory_CSR = 0 if Year == 2010 & Code_num ==002097
replace Mandatory_CSR = 0 if Year == 2010 & Code_num ==000006
replace Mandatory_CSR = 0 if Year == 2010 & Code_num ==000046
replace Mandatory_CSR = 0 if Year == 2010 & Code_num ==000089
replace Mandatory_CSR = 0 if Year == 2010 & Code_num ==000532
replace Mandatory_CSR = 0 if Year == 2010 & Code_num ==000581
replace Mandatory_CSR = 0 if Year == 2010 & Code_num ==000952
replace Mandatory_CSR = 0 if Year == 2010 & Code_num ==000959

replace Mandatory_CSR = 0 if Year == 2011 & Code_num ==000511
replace Mandatory_CSR = 0 if Year == 2011 & Code_num ==000717
replace Mandatory_CSR = 0 if Year == 2011 & Code_num ==000807
replace Mandatory_CSR = 0 if Year == 2011 & Code_num ==000822
replace Mandatory_CSR = 0 if Year == 2011 & Code_num ==000932
replace Mandatory_CSR = 0 if Year == 2011 & Code_num ==000066
replace Mandatory_CSR = 0 if Year == 2011 & Code_num ==000301
replace Mandatory_CSR = 0 if Year == 2011 & Code_num ==000488
replace Mandatory_CSR = 0 if Year == 2011 & Code_num ==000597
replace Mandatory_CSR = 0 if Year == 2011 & Code_num ==000667
replace Mandatory_CSR = 0 if Year == 2011 & Code_num ==000900
replace Mandatory_CSR = 0 if Year == 2011 & Code_num ==000996
replace Mandatory_CSR = 0 if Year == 2011 & Code_num ==002078

replace Mandatory_CSR = 0 if Year == 2012 & Code_num ==000655
replace Mandatory_CSR = 0 if Year == 2012 & Code_num ==000690
replace Mandatory_CSR = 0 if Year == 2012 & Code_num ==000897
replace Mandatory_CSR = 0 if Year == 2012 & Code_num ==000999
replace Mandatory_CSR = 0 if Year == 2012 & Code_num ==002022
replace Mandatory_CSR = 0 if Year == 2012 & Code_num ==002028
replace Mandatory_CSR = 0 if Year == 2012 & Code_num ==000400
replace Mandatory_CSR = 0 if Year == 2012 & Code_num ==000503
replace Mandatory_CSR = 0 if Year == 2012 & Code_num ==000522
replace Mandatory_CSR = 0 if Year == 2012 & Code_num ==000541
replace Mandatory_CSR = 0 if Year == 2012 & Code_num ==000786
replace Mandatory_CSR = 0 if Year == 2012 & Code_num ==000829
replace Mandatory_CSR = 0 if Year == 2012 & Code_num ==000930

replace Mandatory_CSR = 0 if Year == 2013 & Code_num ==000031
replace Mandatory_CSR = 0 if Year == 2013 & Code_num ==000612
replace Mandatory_CSR = 0 if Year == 2013 & Code_num ==000652
replace Mandatory_CSR = 0 if Year == 2013 & Code_num ==000680
replace Mandatory_CSR = 0 if Year == 2013 & Code_num ==000898
replace Mandatory_CSR = 0 if Year == 2013 & Code_num ==002006
replace Mandatory_CSR = 0 if Year == 2013 & Code_num ==002233
replace Mandatory_CSR = 0 if Year == 2013 & Code_num ==002292
replace Mandatory_CSR = 0 if Year == 2013 & Code_num ==000021
replace Mandatory_CSR = 0 if Year == 2013 & Code_num ==000762
replace Mandatory_CSR = 0 if Year == 2013 & Code_num ==000927
replace Mandatory_CSR = 0 if Year == 2013 & Code_num ==000968
replace Mandatory_CSR = 0 if Year == 2013 & Code_num ==002056
replace Mandatory_CSR = 0 if Year == 2013 & Code_num ==002092
replace Mandatory_CSR = 0 if Year == 2013 & Code_num ==002122
replace Mandatory_CSR = 0 if Year == 2013 & Code_num ==000527

replace Mandatory_CSR = 0 if Year == 2014 & Code_num ==000718
replace Mandatory_CSR = 0 if Year == 2014 & Code_num ==000596
replace Mandatory_CSR = 0 if Year == 2014 & Code_num ==000550
replace Mandatory_CSR = 0 if Year == 2014 & Code_num ==000528
replace Mandatory_CSR = 0 if Year == 2014 & Code_num ==000969
replace Mandatory_CSR = 0 if Year == 2014 & Code_num ==000422
replace Mandatory_CSR = 0 if Year == 2014 & Code_num ==000877
replace Mandatory_CSR = 0 if Year == 2014 & Code_num ==000059
replace Mandatory_CSR = 0 if Year == 2014 & Code_num ==000780
replace Mandatory_CSR = 0 if Year == 2014 & Code_num ==000027
replace Mandatory_CSR = 0 if Year == 2014 & Code_num ==000540
replace Mandatory_CSR = 0 if Year == 2014 & Code_num ==000869
replace Mandatory_CSR = 0 if Year == 2014 & Code_num ==000933
replace Mandatory_CSR = 0 if Year == 2014 & Code_num ==000961
replace Mandatory_CSR = 0 if Year == 2014 & Code_num ==002041
replace Mandatory_CSR = 0 if Year == 2014 & Code_num ==002051
replace Mandatory_CSR = 0 if Year == 2014 & Code_num ==002128
replace Mandatory_CSR = 0 if Year == 2014 & Code_num ==002244
replace Mandatory_CSR = 0 if Year == 2014 & Code_num ==002269

replace Mandatory_CSR = 0 if Year == 2015 & Code_num ==002155
replace Mandatory_CSR = 0 if Year == 2015 & Code_num ==000758
replace Mandatory_CSR = 0 if Year == 2015 & Code_num ==000539
replace Mandatory_CSR = 0 if Year == 2015 & Code_num ==000401
replace Mandatory_CSR = 0 if Year == 2015 & Code_num ==000562
replace Mandatory_CSR = 0 if Year == 2015 & Code_num ==000729
replace Mandatory_CSR = 0 if Year == 2015 & Code_num ==000937
replace Mandatory_CSR = 0 if Year == 2015 & Code_num ==002001
replace Mandatory_CSR = 0 if Year == 2015 & Code_num ==002069
replace Mandatory_CSR = 0 if Year == 2015 & Code_num ==002106
replace Mandatory_CSR = 0 if Year == 2015 & Code_num ==002344
replace Mandatory_CSR = 0 if Year == 2015 & Code_num ==002073
replace Mandatory_CSR = 0 if Year == 2015 & Code_num ==000024

replace Mandatory_CSR = 0 if Year == 2016 & Code_num ==000012
replace Mandatory_CSR = 0 if Year == 2016 & Code_num ==002570
replace Mandatory_CSR = 0 if Year == 2016 & Code_num ==002422
replace Mandatory_CSR = 0 if Year == 2016 & Code_num ==002038
replace Mandatory_CSR = 0 if Year == 2016 & Code_num ==002007
replace Mandatory_CSR = 0 if Year == 2016 & Code_num ==000999
replace Mandatory_CSR = 0 if Year == 2016 & Code_num ==000983
replace Mandatory_CSR = 0 if Year == 2016 & Code_num ==000963
replace Mandatory_CSR = 0 if Year == 2016 & Code_num ==000960
replace Mandatory_CSR = 0 if Year == 2016 & Code_num ==000400
replace Mandatory_CSR = 0 if Year == 2016 & Code_num ==000581
replace Mandatory_CSR = 0 if Year == 2016 & Code_num ==000598
replace Mandatory_CSR = 0 if Year == 2016 & Code_num ==000629
replace Mandatory_CSR = 0 if Year == 2016 & Code_num ==000800
replace Mandatory_CSR = 0 if Year == 2016 & Code_num ==000825
replace Mandatory_CSR = 0 if Year == 2016 & Code_num ==000831
replace Mandatory_CSR = 0 if Year == 2016 & Code_num ==000878
replace Mandatory_CSR = 0 if Year == 2016 & Code_num ==000970
replace Mandatory_CSR = 0 if Year == 2016 & Code_num ==002353
replace Mandatory_CSR = 0 if Year == 2016 & Code_num ==300002

replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==000031
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==000039
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==000061
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==000425
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==000712
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==000778
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==000883
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==002146
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==002276
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==300058
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==000977
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==000988
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==002030
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==002176
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==002610
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==300085
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==300251
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==300253
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==300418
replace Mandatory_CSR = 0 if Year == 2017 & Code_num ==300431

replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==002183
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==000917
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==000793
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==300168
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==002709
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==300027
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==000738
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==300104
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==002292
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==002385
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==000009
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==000046
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==000415
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==000559
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==000686
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==000750
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==000961
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==002407
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==002465
replace Mandatory_CSR = 0 if Year == 2018 & Code_num ==300315

replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==000060
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==000402
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==000623
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==000630
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==000778
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==000792
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==000826
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==000839
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==002074
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==002500
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==002450
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==000503
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==000830
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==000983
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==002049
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==002092
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==002310
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==002340
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==002572
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==002797
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==300253
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==300072
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==000423
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==002065
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==002110
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==002456
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==002460
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==002508
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==300017
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==300024
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==300070
replace Mandatory_CSR = 0 if Year == 2019 & Code_num ==300676

replace Mandatory_CSR = 0 if Year == 2020 & Code_num ==000413
replace Mandatory_CSR = 0 if Year == 2020 & Code_num ==000540
replace Mandatory_CSR = 0 if Year == 2020 & Code_num ==000709
replace Mandatory_CSR = 0 if Year == 2020 & Code_num ==000728
replace Mandatory_CSR = 0 if Year == 2020 & Code_num ==002081
replace Mandatory_CSR = 0 if Year == 2020 & Code_num ==002958
replace Mandatory_CSR = 0 if Year == 2020 & Code_num ==000723
replace Mandatory_CSR = 0 if Year == 2020 & Code_num ==001965
replace Mandatory_CSR = 0 if Year == 2020 & Code_num ==002146
replace Mandatory_CSR = 0 if Year == 2020 & Code_num ==002405
replace Mandatory_CSR = 0 if Year == 2020 & Code_num ==002422
replace Mandatory_CSR = 0 if Year == 2020 & Code_num ==002466
replace Mandatory_CSR = 0 if Year == 2020 & Code_num ==002673
replace Mandatory_CSR = 0 if Year == 2020 & Code_num ==002739
replace Mandatory_CSR = 0 if Year == 2020 & Code_num ==000050

replace Mandatory_CSR = 0 if Year == 2005
replace Mandatory_CSR = 0 if Year == 20006
replace Mandatory_CSR = 0 if Year == 2020
replace Mandatory_CSR = 0 if Year == 2020

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

gen Post = 1
replace Post = 0 if Year == 2005
replace Post = 0 if Year == 2006
replace Post = 0 if Year == 2007
replace Post = 0 if Year == 2008

// After _5

drop if CSR_Disclosure == 1 & Mandatory_CSR == 0
drop if Mandatory_CSR == 1 & Always_Mandated == 0
drop if ROA_A > 5
drop if ROA_A <- 5
drop if ROA_B > 5
drop if ROA_B <- 5
drop if ROE_A > 5
drop if ROE_A <- 5
drop if ROE_B > 5
drop if ROE_B <- 5

drop if TobinQ_A >20
drop if Stock_Return_w_Div > 25

merge m:1 Code using "/Users/qichenhuang/Desktop/State.dta"
drop if Code_num == .
drop _merge
gen State_Owned_1 = 0
replace State_Owned_1 = 1 if State_Owned == "1"
drop State_Owned
rename State_Owned_1 State_Owned

destring Short_Industry_Code, generate(Industry)

global t Year
global xlist Mandatory_1Y Mandatory_2Y Mandatory_3Y Mandatory_4Y Mandatory_5Y Mandatory_6Y Mandatory_7Y Mandatory_8Y Mandatory_9Y Mandatory_10Y Mandatory_11Y
global xlist Mandatory_1Y Mandatory_2Y Mandatory_3Y Mandatory_4Y Mandatory_5Y Mandatory_6Y Mandatory_7Y Mandatory_8Y Mandatory_9Y Mandatory_10Y Mandatory_11Y Free_float_Marketcap 
global xlist Mandatory_1Y Mandatory_2Y Mandatory_3Y Mandatory_4Y Mandatory_5Y Mandatory_6Y Mandatory_7Y Mandatory_8Y Mandatory_9Y Mandatory_10Y Mandatory_11Y Free_float_Marketcap Total_Asset 
global xlist Mandatory_1Y Mandatory_2Y Mandatory_3Y Mandatory_4Y Mandatory_5Y Mandatory_6Y Mandatory_7Y Mandatory_8Y Mandatory_9Y Mandatory_10Y Mandatory_11Y Free_float_Marketcap Total_Asset State_Owned 
global xlist Mandatory_1Y Mandatory_2Y Mandatory_3Y Mandatory_4Y Mandatory_5Y Mandatory_6Y Mandatory_7Y Mandatory_8Y Mandatory_9Y Mandatory_10Y Mandatory_11Y Free_float_Marketcap Total_Asset State_Owned Leverage 
global xlist Mandatory_1Y Mandatory_2Y Mandatory_3Y Mandatory_4Y Mandatory_5Y Mandatory_6Y Mandatory_7Y Mandatory_8Y Mandatory_9Y Mandatory_10Y Mandatory_11Y Free_float_Marketcap Total_Asset State_Owned Leverage Completeness

Free_float_Marketcap Total_Asset

global ylist ROA_A
global ylist ROA_B
global ylist ROA_C

gen logROE_B = log(ROE_B)
gen logTobinQ_A = log(TobinQ_A)
gen logTobinQ_C = log(TobinQ_C)
gen logStock_Return_w_Div = log(Stock_Return_w_Div)

global ylist ROE_A
global ylist ROE_B
global ylist ROE_C
global ylist TobinQ_A
global ylist TobinQ_B
global ylist TobinQ_C
global ylist TobinQ_D
global ylist Stock_Return_w_Div 
global ylist Stock_Return_n_Div


xtset $t
reghdfe, compile
reghdfe $ylist $xlist, absorb (i.Industry i.Year)
reghdfe $ylist $xlist, absorb (i.Industry i.Year i.Industry#i.Year)
reghdfe $ylist $xlist, absorb (i.Industry i.Year)

gen Completeness = CSR_Shareholder_Protection + CSR_Creditor_Protection + CSR_Staff_Protection + CSR_Supplier_Protection + CSR_Customer_Protection + CSR_Environment_Protection + CSR_Public_Relations + CSR_Construction_Plan+ Work_Safety+ CSR_Deficiency
gen Completeness = CSR_Shareholder_Protection + CSR_Creditor_Protection + CSR_Staff_Protection + CSR_Supplier_Protection + CSR_Customer_Protection + CSR_Environment_Protection + CSR_Public_Relations + CSR_Construction_Plan+ Work_Safety+ CSR_Deficiency

