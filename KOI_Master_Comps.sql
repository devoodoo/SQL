/****** Script for SelectTopNRows command from SSMS  ******/
/*
TRUNCATE TABLE [CFScott].[dbo].[ops_report_test]

DROP TABLE [CFScott].[dbo].[koi_master_ride]
DROP TABLE [CFScott].[dbo].[koi_master_weekend]
DROP TABLE [CFScott].[dbo].[koi_master_underware]
DROP TABLE [CFScott].[dbo].[koi_master_hero]

CREATE TABLE [CFScott].[dbo].[koi_master_ride] (
[Run_Date] NVARCHAR(50)
,[AK RTCC RFI 2015] Smallint
,[AK RTCC RFI 2014] Smallint
,[AK RTCC RFI 2013] Smallint
,[AK RTCC RFI 2012] Smallint
,[AK RTCC RFI 2011] Smallint
,[AK RTCC RFI 2010] Smallint
,[AK RTCC REG 2015] Smallint
,[AK RTCC REG 2014] Smallint
,[AK RTCC REG 2013] Smallint
,[AK RTCC REG 2012] Smallint
,[AK RTCC REG 2011] Smallint
,[AK RTCC REG 2010] Smallint
,[AK RTCC DONOR$ 2015] Float
,[AK RTCC DONOR$ 2014] Float
,[AK RTCC DONOR$ 2013] Float
,[AK RTCC DONOR$ 2012] Float
,[AK RTCC DONOR$ 2011] Float
,[AK RTCC DONOR$ 2010] Float
,[AK RTCC REG$ 2015] Float
,[AK RTCC REG$ 2014] Float
,[AK RTCC REG$ 2013] Float
,[AK RTCC REG$ 2012] Float
,[AK RTCC REG$ 2011] Float
,[AK RTCC REG$ 2010] Float
,[AD RTCC RFI 2015] Smallint
,[AD RTCC RFI 2014] Smallint
,[AD RTCC RFI 2013] Smallint
,[AD RTCC RFI 2012] Smallint
,[AD RTCC RFI 2011] Smallint
,[AD RTCC RFI 2010] Smallint
,[AD RTCC REG 2015] Smallint
,[AD RTCC REG 2014] Smallint
,[AD RTCC REG 2013] Smallint
,[AD RTCC REG 2012] Smallint
,[AD RTCC REG 2011] Smallint
,[AD RTCC REG 2010] Smallint
,[AD RTCC DONOR$ 2015] Float
,[AD RTCC DONOR$ 2014] Float
,[AD RTCC DONOR$ 2013] Float
,[AD RTCC DONOR$ 2012] Float
,[AD RTCC DONOR$ 2011] Float
,[AD RTCC DONOR$ 2010] Float
,[AD RTCC REG$ 2015] Float
,[AD RTCC REG$ 2014] Float
,[AD RTCC REG$ 2013] Float
,[AD RTCC REG$ 2012] Float
,[AD RTCC REG$ 2011] Float
,[AD RTCC REG$ 2010] Float
,[BR RTCC RFI 2015] Smallint
,[BR RTCC RFI 2014] Smallint
,[BR RTCC RFI 2013] Smallint
,[BR RTCC RFI 2012] Smallint
,[BR RTCC RFI 2011] Smallint
,[BR RTCC RFI 2010] Smallint
,[BR RTCC REG 2015] Smallint
,[BR RTCC REG 2014] Smallint
,[BR RTCC REG 2013] Smallint
,[BR RTCC REG 2012] Smallint
,[BR RTCC REG 2011] Smallint
,[BR RTCC REG 2010] Smallint
,[BR RTCC DONOR$ 2015] Float
,[BR RTCC DONOR$ 2014] Float
,[BR RTCC DONOR$ 2013] Float
,[BR RTCC DONOR$ 2012] Float
,[BR RTCC DONOR$ 2011] Float
,[BR RTCC DONOR$ 2010] Float
,[BR RTCC REG$ 2015] Float
,[BR RTCC REG$ 2014] Float
,[BR RTCC REG$ 2013] Float
,[BR RTCC REG$ 2012] Float
,[BR RTCC REG$ 2011] Float
,[BR RTCC REG$ 2010] Float
,[ML RTCC RFI 2015] Smallint
,[ML RTCC RFI 2014] Smallint
,[ML RTCC RFI 2013] Smallint
,[ML RTCC RFI 2012] Smallint
,[ML RTCC RFI 2011] Smallint
,[ML RTCC RFI 2010] Smallint
,[ML RTCC REG 2015] Smallint
,[ML RTCC REG 2014] Smallint
,[ML RTCC REG 2013] Smallint
,[ML RTCC REG 2012] Smallint
,[ML RTCC REG 2011] Smallint
,[ML RTCC REG 2010] Smallint
,[ML RTCC DONOR$ 2015] Float
,[ML RTCC DONOR$ 2014] Float
,[ML RTCC DONOR$ 2013] Float
,[ML RTCC DONOR$ 2012] Float
,[ML RTCC DONOR$ 2011] Float
,[ML RTCC DONOR$ 2010] Float
,[ML RTCC REG$ 2015] Float
,[ML RTCC REG$ 2014] Float
,[ML RTCC REG$ 2013] Float
,[ML RTCC REG$ 2012] Float
,[ML RTCC REG$ 2011] Float
,[ML RTCC REG$ 2010] Float
,[PE RTCC RFI 2015] Smallint
,[PE RTCC RFI 2014] Smallint
,[PE RTCC RFI 2013] Smallint
,[PE RTCC RFI 2012] Smallint
,[PE RTCC RFI 2011] Smallint
,[PE RTCC RFI 2010] Smallint
,[PE RTCC REG 2015] Smallint
,[PE RTCC REG 2014] Smallint
,[PE RTCC REG 2013] Smallint
,[PE RTCC REG 2012] Smallint
,[PE RTCC REG 2011] Smallint
,[PE RTCC REG 2010] Smallint
,[PE RTCC DONOR$ 2015] Float
,[PE RTCC DONOR$ 2014] Float
,[PE RTCC DONOR$ 2013] Float
,[PE RTCC DONOR$ 2012] Float
,[PE RTCC DONOR$ 2011] Float
,[PE RTCC DONOR$ 2010] Float
,[PE RTCC REG$ 2015] Float
,[PE RTCC REG$ 2014] Float
,[PE RTCC REG$ 2013] Float
,[PE RTCC REG$ 2012] Float
,[PE RTCC REG$ 2011] Float
,[PE RTCC REG$ 2010] Float
,[SY RTCC RFI 2015] Smallint
,[SY RTCC RFI 2014] Smallint
,[SY RTCC RFI 2013] Smallint
,[SY RTCC RFI 2012] Smallint
,[SY RTCC RFI 2011] Smallint
,[SY RTCC RFI 2010] Smallint
,[SY RTCC REG 2015] Smallint
,[SY RTCC REG 2014] Smallint
,[SY RTCC REG 2013] Smallint
,[SY RTCC REG 2012] Smallint
,[SY RTCC REG 2011] Smallint
,[SY RTCC REG 2010] Smallint
,[SY RTCC DONOR$ 2015] Float
,[SY RTCC DONOR$ 2014] Float
,[SY RTCC DONOR$ 2013] Float
,[SY RTCC DONOR$ 2012] Float
,[SY RTCC DONOR$ 2011] Float
,[SY RTCC DONOR$ 2010] Float
,[SY RTCC REG$ 2015] Float
,[SY RTCC REG$ 2014] Float
,[SY RTCC REG$ 2013] Float
,[SY RTCC REG$ 2012] Float
,[SY RTCC REG$ 2011] Float
,[SY RTCC REG$ 2010] Float
,[AB RTCC RFI 2015] Smallint
,[AB RTCC RFI 2014] Smallint
,[AB RTCC RFI 2013] Smallint
,[AB RTCC RFI 2012] Smallint
,[AB RTCC RFI 2011] Smallint
,[AB RTCC RFI 2010] Smallint
,[AB RTCC REG 2015] Smallint
,[AB RTCC REG 2014] Smallint
,[AB RTCC REG 2013] Smallint
,[AB RTCC REG 2012] Smallint
,[AB RTCC REG 2011] Smallint
,[AB RTCC REG 2010] Smallint
,[AB RTCC DONOR$ 2015] Float
,[AB RTCC DONOR$ 2014] Float
,[AB RTCC DONOR$ 2013] Float
,[AB RTCC DONOR$ 2012] Float
,[AB RTCC DONOR$ 2011] Float
,[AB RTCC DONOR$ 2010] Float
,[AB RTCC REG$ 2015] Float
,[AB RTCC REG$ 2014] Float
,[AB RTCC REG$ 2013] Float
,[AB RTCC REG$ 2012] Float
,[AB RTCC REG$ 2011] Float
,[AB RTCC REG$ 2010] Float
,[MO RTCC RFI 2015] Smallint
,[MO RTCC RFI 2014] Smallint
,[MO RTCC RFI 2013] Smallint
,[MO RTCC RFI 2012] Smallint
,[MO RTCC RFI 2011] Smallint
,[MO RTCC RFI 2010] Smallint
,[MO RTCC REG 2015] Smallint
,[MO RTCC REG 2014] Smallint
,[MO RTCC REG 2013] Smallint
,[MO RTCC REG 2012] Smallint
,[MO RTCC REG 2011] Smallint
,[MO RTCC REG 2010] Smallint
,[MO RTCC DONOR$ 2015] Float
,[MO RTCC DONOR$ 2014] Float
,[MO RTCC DONOR$ 2013] Float
,[MO RTCC DONOR$ 2012] Float
,[MO RTCC DONOR$ 2011] Float
,[MO RTCC DONOR$ 2010] Float
,[MO RTCC REG$ 2015] Float
,[MO RTCC REG$ 2014] Float
,[MO RTCC REG$ 2013] Float
,[MO RTCC REG$ 2012] Float
,[MO RTCC REG$ 2011] Float
,[MO RTCC REG$ 2010] Float
,[TO RTCC RFI 2015] Smallint
,[TO RTCC RFI 2014] Smallint
,[TO RTCC RFI 2013] Smallint
,[TO RTCC RFI 2012] Smallint
,[TO RTCC RFI 2011] Smallint
,[TO RTCC RFI 2010] Smallint
,[TO RTCC REG 2015] Smallint
,[TO RTCC REG 2014] Smallint
,[TO RTCC REG 2013] Smallint
,[TO RTCC REG 2012] Smallint
,[TO RTCC REG 2011] Smallint
,[TO RTCC REG 2010] Smallint
,[TO RTCC DONOR$ 2015] Float
,[TO RTCC DONOR$ 2014] Float
,[TO RTCC DONOR$ 2013] Float
,[TO RTCC DONOR$ 2012] Float
,[TO RTCC DONOR$ 2011] Float
,[TO RTCC DONOR$ 2010] Float
,[TO RTCC REG$ 2015] Float
,[TO RTCC REG$ 2014] Float
,[TO RTCC REG$ 2013] Float
,[TO RTCC REG$ 2012] Float
,[TO RTCC REG$ 2011] Float
,[TO RTCC REG$ 2010] Float
,[VA RTCC RFI 2015] Smallint
,[VA RTCC RFI 2014] Smallint
,[VA RTCC RFI 2013] Smallint
,[VA RTCC RFI 2012] Smallint
,[VA RTCC RFI 2011] Smallint
,[VA RTCC RFI 2010] Smallint
,[VA RTCC REG 2015] Smallint
,[VA RTCC REG 2014] Smallint
,[VA RTCC REG 2013] Smallint
,[VA RTCC REG 2012] Smallint
,[VA RTCC REG 2011] Smallint
,[VA RTCC REG 2010] Smallint
,[VA RTCC DONOR$ 2015] Float
,[VA RTCC DONOR$ 2014] Float
,[VA RTCC DONOR$ 2013] Float
,[VA RTCC DONOR$ 2012] Float
,[VA RTCC DONOR$ 2011] Float
,[VA RTCC DONOR$ 2010] Float
,[VA RTCC REG$ 2015] Float
,[VA RTCC REG$ 2014] Float
,[VA RTCC REG$ 2013] Float
,[VA RTCC REG$ 2012] Float
,[VA RTCC REG$ 2011] Float
,[VA RTCC REG$ 2010] Float
)


CREATE TABLE [CFScott].[dbo].[koi_master_weekend] (
[Run_Date] NVARCHAR(50)
,[AB WEBC RFI 2015] Smallint
,[AB WEBC RFI 2014] Smallint
,[AB WEBC RFI 2013] Smallint
,[AB WEBC RFI 2012] Smallint
,[AB WEBC RFI 2011] Smallint
,[AB WEBC RFI 2010] Smallint
,[AB WEBC REG 2015] Smallint
,[AB WEBC REG 2014] Smallint
,[AB WEBC REG 2013] Smallint
,[AB WEBC REG 2012] Smallint
,[AB WEBC REG 2011] Smallint
,[AB WEBC REG 2010] Smallint
,[AB WEBC DONOR$ 2015] Float
,[AB WEBC DONOR$ 2014] Float
,[AB WEBC DONOR$ 2013] Float
,[AB WEBC DONOR$ 2012] Float
,[AB WEBC DONOR$ 2011] Float
,[AB WEBC DONOR$ 2010] Float
,[AB WEBC REG$ 2015] Float
,[AB WEBC REG$ 2014] Float
,[AB WEBC REG$ 2013] Float
,[AB WEBC REG$ 2012] Float
,[AB WEBC REG$ 2011] Float
,[AB WEBC REG$ 2010] Float
,[BR WEBC RFI 2015] Smallint
,[BR WEBC RFI 2014] Smallint
,[BR WEBC RFI 2013] Smallint
,[BR WEBC RFI 2012] Smallint
,[BR WEBC RFI 2011] Smallint
,[BR WEBC RFI 2010] Smallint
,[BR WEBC REG 2015] Smallint
,[BR WEBC REG 2014] Smallint
,[BR WEBC REG 2013] Smallint
,[BR WEBC REG 2012] Smallint
,[BR WEBC REG 2011] Smallint
,[BR WEBC REG 2010] Smallint
,[BR WEBC DONOR$ 2015] Float
,[BR WEBC DONOR$ 2014] Float
,[BR WEBC DONOR$ 2013] Float
,[BR WEBC DONOR$ 2012] Float
,[BR WEBC DONOR$ 2011] Float
,[BR WEBC DONOR$ 2010] Float
,[BR WEBC REG$ 2015] Float
,[BR WEBC REG$ 2014] Float
,[BR WEBC REG$ 2013] Float
,[BR WEBC REG$ 2012] Float
,[BR WEBC REG$ 2011] Float
,[BR WEBC REG$ 2010] Float
,[CA WEBC RFI 2015] Smallint
,[CA WEBC RFI 2014] Smallint
,[CA WEBC RFI 2013] Smallint
,[CA WEBC RFI 2012] Smallint
,[CA WEBC RFI 2011] Smallint
,[CA WEBC RFI 2010] Smallint
,[CA WEBC REG 2015] Smallint
,[CA WEBC REG 2014] Smallint
,[CA WEBC REG 2013] Smallint
,[CA WEBC REG 2012] Smallint
,[CA WEBC REG 2011] Smallint
,[CA WEBC REG 2010] Smallint
,[CA WEBC DONOR$ 2015] Float
,[CA WEBC DONOR$ 2014] Float
,[CA WEBC DONOR$ 2013] Float
,[CA WEBC DONOR$ 2012] Float
,[CA WEBC DONOR$ 2011] Float
,[CA WEBC DONOR$ 2010] Float
,[CA WEBC REG$ 2015] Float
,[CA WEBC REG$ 2014] Float
,[CA WEBC REG$ 2013] Float
,[CA WEBC REG$ 2012] Float
,[CA WEBC REG$ 2011] Float
,[CA WEBC REG$ 2010] Float
,[ED WEBC RFI 2015] Smallint
,[ED WEBC RFI 2014] Smallint
,[ED WEBC RFI 2013] Smallint
,[ED WEBC RFI 2012] Smallint
,[ED WEBC RFI 2011] Smallint
,[ED WEBC RFI 2010] Smallint
,[ED WEBC REG 2015] Smallint
,[ED WEBC REG 2014] Smallint
,[ED WEBC REG 2013] Smallint
,[ED WEBC REG 2012] Smallint
,[ED WEBC REG 2011] Smallint
,[ED WEBC REG 2010] Smallint
,[ED WEBC DONOR$ 2015] Float
,[ED WEBC DONOR$ 2014] Float
,[ED WEBC DONOR$ 2013] Float
,[ED WEBC DONOR$ 2012] Float
,[ED WEBC DONOR$ 2011] Float
,[ED WEBC DONOR$ 2010] Float
,[ED WEBC REG$ 2015] Float
,[ED WEBC REG$ 2014] Float
,[ED WEBC REG$ 2013] Float
,[ED WEBC REG$ 2012] Float
,[ED WEBC REG$ 2011] Float
,[ED WEBC REG$ 2010] Float
,[MO WEBC RFI 2015] Smallint
,[MO WEBC RFI 2014] Smallint
,[MO WEBC RFI 2013] Smallint
,[MO WEBC RFI 2012] Smallint
,[MO WEBC RFI 2011] Smallint
,[MO WEBC RFI 2010] Smallint
,[MO WEBC REG 2015] Smallint
,[MO WEBC REG 2014] Smallint
,[MO WEBC REG 2013] Smallint
,[MO WEBC REG 2012] Smallint
,[MO WEBC REG 2011] Smallint
,[MO WEBC REG 2010] Smallint
,[MO WEBC DONOR$ 2015] Float
,[MO WEBC DONOR$ 2014] Float
,[MO WEBC DONOR$ 2013] Float
,[MO WEBC DONOR$ 2012] Float
,[MO WEBC DONOR$ 2011] Float
,[MO WEBC DONOR$ 2010] Float
,[MO WEBC REG$ 2015] Float
,[MO WEBC REG$ 2014] Float
,[MO WEBC REG$ 2013] Float
,[MO WEBC REG$ 2012] Float
,[MO WEBC REG$ 2011] Float
,[MO WEBC REG$ 2010] Float
,[OT WEBC RFI 2015] Smallint
,[OT WEBC RFI 2014] Smallint
,[OT WEBC RFI 2013] Smallint
,[OT WEBC RFI 2012] Smallint
,[OT WEBC RFI 2011] Smallint
,[OT WEBC RFI 2010] Smallint
,[OT WEBC REG 2015] Smallint
,[OT WEBC REG 2014] Smallint
,[OT WEBC REG 2013] Smallint
,[OT WEBC REG 2012] Smallint
,[OT WEBC REG 2011] Smallint
,[OT WEBC REG 2010] Smallint
,[OT WEBC DONOR$ 2015] Float
,[OT WEBC DONOR$ 2014] Float
,[OT WEBC DONOR$ 2013] Float
,[OT WEBC DONOR$ 2012] Float
,[OT WEBC DONOR$ 2011] Float
,[OT WEBC DONOR$ 2010] Float
,[OT WEBC REG$ 2015] Float
,[OT WEBC REG$ 2014] Float
,[OT WEBC REG$ 2013] Float
,[OT WEBC REG$ 2012] Float
,[OT WEBC REG$ 2011] Float
,[OT WEBC REG$ 2010] Float
,[SY WEBC RFI 2015] Smallint
,[SY WEBC RFI 2014] Smallint
,[SY WEBC RFI 2013] Smallint
,[SY WEBC RFI 2012] Smallint
,[SY WEBC RFI 2011] Smallint
,[SY WEBC RFI 2010] Smallint
,[SY WEBC REG 2015] Smallint
,[SY WEBC REG 2014] Smallint
,[SY WEBC REG 2013] Smallint
,[SY WEBC REG 2012] Smallint
,[SY WEBC REG 2011] Smallint
,[SY WEBC REG 2010] Smallint
,[SY WEBC DONOR$ 2015] Float
,[SY WEBC DONOR$ 2014] Float
,[SY WEBC DONOR$ 2013] Float
,[SY WEBC DONOR$ 2012] Float
,[SY WEBC DONOR$ 2011] Float
,[SY WEBC DONOR$ 2010] Float
,[SY WEBC REG$ 2015] Float
,[SY WEBC REG$ 2014] Float
,[SY WEBC REG$ 2013] Float
,[SY WEBC REG$ 2012] Float
,[SY WEBC REG$ 2011] Float
,[SY WEBC REG$ 2010] Float
,[TO WEBC RFI 2015] Smallint
,[TO WEBC RFI 2014] Smallint
,[TO WEBC RFI 2013] Smallint
,[TO WEBC RFI 2012] Smallint
,[TO WEBC RFI 2011] Smallint
,[TO WEBC RFI 2010] Smallint
,[TO WEBC REG 2015] Smallint
,[TO WEBC REG 2014] Smallint
,[TO WEBC REG 2013] Smallint
,[TO WEBC REG 2012] Smallint
,[TO WEBC REG 2011] Smallint
,[TO WEBC REG 2010] Smallint
,[TO WEBC DONOR$ 2015] Float
,[TO WEBC DONOR$ 2014] Float
,[TO WEBC DONOR$ 2013] Float
,[TO WEBC DONOR$ 2012] Float
,[TO WEBC DONOR$ 2011] Float
,[TO WEBC DONOR$ 2010] Float
,[TO WEBC REG$ 2015] Float
,[TO WEBC REG$ 2014] Float
,[TO WEBC REG$ 2013] Float
,[TO WEBC REG$ 2012] Float
,[TO WEBC REG$ 2011] Float
,[TO WEBC REG$ 2010] Float
,[VA WEBC RFI 2015] Smallint
,[VA WEBC RFI 2014] Smallint
,[VA WEBC RFI 2013] Smallint
,[VA WEBC RFI 2012] Smallint
,[VA WEBC RFI 2011] Smallint
,[VA WEBC RFI 2010] Smallint
,[VA WEBC REG 2015] Smallint
,[VA WEBC REG 2014] Smallint
,[VA WEBC REG 2013] Smallint
,[VA WEBC REG 2012] Smallint
,[VA WEBC REG 2011] Smallint
,[VA WEBC REG 2010] Smallint
,[VA WEBC DONOR$ 2015] Float
,[VA WEBC DONOR$ 2014] Float
,[VA WEBC DONOR$ 2013] Float
,[VA WEBC DONOR$ 2012] Float
,[VA WEBC DONOR$ 2011] Float
,[VA WEBC DONOR$ 2010] Float
,[VA WEBC REG$ 2015] Float
,[VA WEBC REG$ 2014] Float
,[VA WEBC REG$ 2013] Float
,[VA WEBC REG$ 2012] Float
,[VA WEBC REG$ 2011] Float
,[VA WEBC REG$ 2010] Float
)


CREATE TABLE [CFScott].[dbo].[koi_master_underware] (
[Run_Date] NVARCHAR(50)
,[CA UA RFI 2015] Smallint
,[CA UA RFI 2014] Smallint
,[CA UA RFI 2013] Smallint
,[CA UA RFI 2012] Smallint
,[CA UA RFI 2011] Smallint
,[CA UA RFI 2010] Smallint
,[CA UA REG 2015] Smallint
,[CA UA REG 2014] Smallint
,[CA UA REG 2013] Smallint
,[CA UA REG 2012] Smallint
,[CA UA REG 2011] Smallint
,[CA UA REG 2010] Smallint
,[CA UA DONOR$ 2015] Float
,[CA UA DONOR$ 2014] Float
,[CA UA DONOR$ 2013] Float
,[CA UA DONOR$ 2012] Float
,[CA UA DONOR$ 2011] Float
,[CA UA DONOR$ 2010] Float
,[CA UA REG$ 2015] Float
,[CA UA REG$ 2014] Float
,[CA UA REG$ 2013] Float
,[CA UA REG$ 2012] Float
,[CA UA REG$ 2011] Float
,[CA UA REG$ 2010] Float
,[ED UA RFI 2015] Smallint
,[ED UA RFI 2014] Smallint
,[ED UA RFI 2013] Smallint
,[ED UA RFI 2012] Smallint
,[ED UA RFI 2011] Smallint
,[ED UA RFI 2010] Smallint
,[ED UA REG 2015] Smallint
,[ED UA REG 2014] Smallint
,[ED UA REG 2013] Smallint
,[ED UA REG 2012] Smallint
,[ED UA REG 2011] Smallint
,[ED UA REG 2010] Smallint
,[ED UA DONOR$ 2015] Float
,[ED UA DONOR$ 2014] Float
,[ED UA DONOR$ 2013] Float
,[ED UA DONOR$ 2012] Float
,[ED UA DONOR$ 2011] Float
,[ED UA DONOR$ 2010] Float
,[ED UA REG$ 2015] Float
,[ED UA REG$ 2014] Float
,[ED UA REG$ 2013] Float
,[ED UA REG$ 2012] Float
,[ED UA REG$ 2011] Float
,[ED UA REG$ 2010] Float
,[OT UA RFI 2015] Smallint
,[OT UA RFI 2014] Smallint
,[OT UA RFI 2013] Smallint
,[OT UA RFI 2012] Smallint
,[OT UA RFI 2011] Smallint
,[OT UA RFI 2010] Smallint
,[OT UA REG 2015] Smallint
,[OT UA REG 2014] Smallint
,[OT UA REG 2013] Smallint
,[OT UA REG 2012] Smallint
,[OT UA REG 2011] Smallint
,[OT UA REG 2010] Smallint
,[OT UA DONOR$ 2015] Float
,[OT UA DONOR$ 2014] Float
,[OT UA DONOR$ 2013] Float
,[OT UA DONOR$ 2012] Float
,[OT UA DONOR$ 2011] Float
,[OT UA DONOR$ 2010] Float
,[OT UA REG$ 2015] Float
,[OT UA REG$ 2014] Float
,[OT UA REG$ 2013] Float
,[OT UA REG$ 2012] Float
,[OT UA REG$ 2011] Float
,[OT UA REG$ 2010] Float
,[TO UA RFI 2015] Smallint
,[TO UA RFI 2014] Smallint
,[TO UA RFI 2013] Smallint
,[TO UA RFI 2012] Smallint
,[TO UA RFI 2011] Smallint
,[TO UA RFI 2010] Smallint
,[TO UA REG 2015] Smallint
,[TO UA REG 2014] Smallint
,[TO UA REG 2013] Smallint
,[TO UA REG 2012] Smallint
,[TO UA REG 2011] Smallint
,[TO UA REG 2010] Smallint
,[TO UA DONOR$ 2015] Float
,[TO UA DONOR$ 2014] Float
,[TO UA DONOR$ 2013] Float
,[TO UA DONOR$ 2012] Float
,[TO UA DONOR$ 2011] Float
,[TO UA DONOR$ 2010] Float
,[TO UA REG$ 2015] Float
,[TO UA REG$ 2014] Float
,[TO UA REG$ 2013] Float
,[TO UA REG$ 2012] Float
,[TO UA REG$ 2011] Float
,[TO UA REG$ 2010] Float
,[VA UA RFI 2015] Smallint
,[VA UA RFI 2014] Smallint
,[VA UA RFI 2013] Smallint
,[VA UA RFI 2012] Smallint
,[VA UA RFI 2011] Smallint
,[VA UA RFI 2010] Smallint
,[VA UA REG 2015] Smallint
,[VA UA REG 2014] Smallint
,[VA UA REG 2013] Smallint
,[VA UA REG 2012] Smallint
,[VA UA REG 2011] Smallint
,[VA UA REG 2010] Smallint
,[VA UA DONOR$ 2015] Float
,[VA UA DONOR$ 2014] Float
,[VA UA DONOR$ 2013] Float
,[VA UA DONOR$ 2012] Float
,[VA UA DONOR$ 2011] Float
,[VA UA DONOR$ 2010] Float
,[VA UA REG$ 2015] Float
,[VA UA REG$ 2014] Float
,[VA UA REG$ 2013] Float
,[VA UA REG$ 2012] Float
,[VA UA REG$ 2011] Float
,[VA UA REG$ 2010] Float
)

CREATE TABLE [CFScott].[dbo].[koi_master_hero] (
[Run_Date] NVARCHAR(50)
,[LA CCH RFI 2015] Smallint
,[LA CCH RFI 2014] Smallint
,[LA CCH RFI 2013] Smallint
,[LA CCH RFI 2012] Smallint
,[LA CCH RFI 2011] Smallint
,[LA CCH RFI 2010] Smallint
,[LA CCH REG 2015] Smallint
,[LA CCH REG 2014] Smallint
,[LA CCH REG 2013] Smallint
,[LA CCH REG 2012] Smallint
,[LA CCH REG 2011] Smallint
,[LA CCH REG 2010] Smallint
,[LA CCH DONOR$ 2015] Float
,[LA CCH DONOR$ 2014] Float
,[LA CCH DONOR$ 2013] Float
,[LA CCH DONOR$ 2012] Float
,[LA CCH DONOR$ 2011] Float
,[LA CCH DONOR$ 2010] Float
,[LA CCH REG$ 2015] Float
,[LA CCH REG$ 2014] Float
,[LA CCH REG$ 2013] Float
,[LA CCH REG$ 2012] Float
,[LA CCH REG$ 2011] Float
,[LA CCH REG$ 2010] Float
,[VA CCH RFI 2015] Smallint
,[VA CCH RFI 2014] Smallint
,[VA CCH RFI 2013] Smallint
,[VA CCH RFI 2012] Smallint
,[VA CCH RFI 2011] Smallint
,[VA CCH RFI 2010] Smallint
,[VA CCH REG 2015] Smallint
,[VA CCH REG 2014] Smallint
,[VA CCH REG 2013] Smallint
,[VA CCH REG 2012] Smallint
,[VA CCH REG 2011] Smallint
,[VA CCH REG 2010] Smallint
,[VA CCH DONOR$ 2015] Float
,[VA CCH DONOR$ 2014] Float
,[VA CCH DONOR$ 2013] Float
,[VA CCH DONOR$ 2012] Float
,[VA CCH DONOR$ 2011] Float
,[VA CCH DONOR$ 2010] Float
,[VA CCH REG$ 2015] Float
,[VA CCH REG$ 2014] Float
,[VA CCH REG$ 2013] Float
,[VA CCH REG$ 2012] Float
,[VA CCH REG$ 2011] Float
,[VA CCH REG$ 2010] Float
)

*/
TRUNCATE TABLE [CFScott].[dbo].[koi_master_ride]
INSERT INTO [CFScott].[dbo].[koi_master_ride] (
[Run_Date]
,[AK RTCC RFI 2015]
,[AK RTCC RFI 2014]
,[AK RTCC RFI 2013]
,[AK RTCC RFI 2012]
,[AK RTCC RFI 2011]
,[AK RTCC RFI 2010]
,[AK RTCC REG 2015]
,[AK RTCC REG 2014]
,[AK RTCC REG 2013]
,[AK RTCC REG 2012]
,[AK RTCC REG 2011]
,[AK RTCC REG 2010]
,[AK RTCC DONOR$ 2015]
,[AK RTCC DONOR$ 2014]
,[AK RTCC DONOR$ 2013]
,[AK RTCC DONOR$ 2012]
,[AK RTCC DONOR$ 2011]
,[AK RTCC DONOR$ 2010]
,[AK RTCC REG$ 2015]
,[AK RTCC REG$ 2014]
,[AK RTCC REG$ 2013]
,[AK RTCC REG$ 2012]
,[AK RTCC REG$ 2011]
,[AK RTCC REG$ 2010]
,[AD RTCC RFI 2015]
,[AD RTCC RFI 2014]
,[AD RTCC RFI 2013]
,[AD RTCC RFI 2012]
,[AD RTCC RFI 2011]
,[AD RTCC RFI 2010]
,[AD RTCC REG 2015]
,[AD RTCC REG 2014]
,[AD RTCC REG 2013]
,[AD RTCC REG 2012]
,[AD RTCC REG 2011]
,[AD RTCC REG 2010]
,[AD RTCC DONOR$ 2015]
,[AD RTCC DONOR$ 2014]
,[AD RTCC DONOR$ 2013]
,[AD RTCC DONOR$ 2012]
,[AD RTCC DONOR$ 2011]
,[AD RTCC DONOR$ 2010]
,[AD RTCC REG$ 2015]
,[AD RTCC REG$ 2014]
,[AD RTCC REG$ 2013]
,[AD RTCC REG$ 2012]
,[AD RTCC REG$ 2011]
,[AD RTCC REG$ 2010]
,[BR RTCC RFI 2015]
,[BR RTCC RFI 2014]
,[BR RTCC RFI 2013]
,[BR RTCC RFI 2012]
,[BR RTCC RFI 2011]
,[BR RTCC RFI 2010]
,[BR RTCC REG 2015]
,[BR RTCC REG 2014]
,[BR RTCC REG 2013]
,[BR RTCC REG 2012]
,[BR RTCC REG 2011]
,[BR RTCC REG 2010]
,[BR RTCC DONOR$ 2015]
,[BR RTCC DONOR$ 2014]
,[BR RTCC DONOR$ 2013]
,[BR RTCC DONOR$ 2012]
,[BR RTCC DONOR$ 2011]
,[BR RTCC DONOR$ 2010]
,[BR RTCC REG$ 2015]
,[BR RTCC REG$ 2014]
,[BR RTCC REG$ 2013]
,[BR RTCC REG$ 2012]
,[BR RTCC REG$ 2011]
,[BR RTCC REG$ 2010]
,[ML RTCC RFI 2015]
,[ML RTCC RFI 2014]
,[ML RTCC RFI 2013]
,[ML RTCC RFI 2012]
,[ML RTCC RFI 2011]
,[ML RTCC RFI 2010]
,[ML RTCC REG 2015]
,[ML RTCC REG 2014]
,[ML RTCC REG 2013]
,[ML RTCC REG 2012]
,[ML RTCC REG 2011]
,[ML RTCC REG 2010]
,[ML RTCC DONOR$ 2015]
,[ML RTCC DONOR$ 2014]
,[ML RTCC DONOR$ 2013]
,[ML RTCC DONOR$ 2012]
,[ML RTCC DONOR$ 2011]
,[ML RTCC DONOR$ 2010]
,[ML RTCC REG$ 2015]
,[ML RTCC REG$ 2014]
,[ML RTCC REG$ 2013]
,[ML RTCC REG$ 2012]
,[ML RTCC REG$ 2011]
,[ML RTCC REG$ 2010]
,[PE RTCC RFI 2015]
,[PE RTCC RFI 2014]
,[PE RTCC RFI 2013]
,[PE RTCC RFI 2012]
,[PE RTCC RFI 2011]
,[PE RTCC RFI 2010]
,[PE RTCC REG 2015]
,[PE RTCC REG 2014]
,[PE RTCC REG 2013]
,[PE RTCC REG 2012]
,[PE RTCC REG 2011]
,[PE RTCC REG 2010]
,[PE RTCC DONOR$ 2015]
,[PE RTCC DONOR$ 2014]
,[PE RTCC DONOR$ 2013]
,[PE RTCC DONOR$ 2012]
,[PE RTCC DONOR$ 2011]
,[PE RTCC DONOR$ 2010]
,[PE RTCC REG$ 2015]
,[PE RTCC REG$ 2014]
,[PE RTCC REG$ 2013]
,[PE RTCC REG$ 2012]
,[PE RTCC REG$ 2011]
,[PE RTCC REG$ 2010]
,[SY RTCC RFI 2015]
,[SY RTCC RFI 2014]
,[SY RTCC RFI 2013]
,[SY RTCC RFI 2012]
,[SY RTCC RFI 2011]
,[SY RTCC RFI 2010]
,[SY RTCC REG 2015]
,[SY RTCC REG 2014]
,[SY RTCC REG 2013]
,[SY RTCC REG 2012]
,[SY RTCC REG 2011]
,[SY RTCC REG 2010]
,[SY RTCC DONOR$ 2015]
,[SY RTCC DONOR$ 2014]
,[SY RTCC DONOR$ 2013]
,[SY RTCC DONOR$ 2012]
,[SY RTCC DONOR$ 2011]
,[SY RTCC DONOR$ 2010]
,[SY RTCC REG$ 2015]
,[SY RTCC REG$ 2014]
,[SY RTCC REG$ 2013]
,[SY RTCC REG$ 2012]
,[SY RTCC REG$ 2011]
,[SY RTCC REG$ 2010]
,[AB RTCC RFI 2015]
,[AB RTCC RFI 2014]
,[AB RTCC RFI 2013]
,[AB RTCC RFI 2012]
,[AB RTCC RFI 2011]
,[AB RTCC RFI 2010]
,[AB RTCC REG 2015]
,[AB RTCC REG 2014]
,[AB RTCC REG 2013]
,[AB RTCC REG 2012]
,[AB RTCC REG 2011]
,[AB RTCC REG 2010]
,[AB RTCC DONOR$ 2015]
,[AB RTCC DONOR$ 2014]
,[AB RTCC DONOR$ 2013]
,[AB RTCC DONOR$ 2012]
,[AB RTCC DONOR$ 2011]
,[AB RTCC DONOR$ 2010]
,[AB RTCC REG$ 2015]
,[AB RTCC REG$ 2014]
,[AB RTCC REG$ 2013]
,[AB RTCC REG$ 2012]
,[AB RTCC REG$ 2011]
,[AB RTCC REG$ 2010]
,[MO RTCC RFI 2015]
,[MO RTCC RFI 2014]
,[MO RTCC RFI 2013]
,[MO RTCC RFI 2012]
,[MO RTCC RFI 2011]
,[MO RTCC RFI 2010]
,[MO RTCC REG 2015]
,[MO RTCC REG 2014]
,[MO RTCC REG 2013]
,[MO RTCC REG 2012]
,[MO RTCC REG 2011]
,[MO RTCC REG 2010]
,[MO RTCC DONOR$ 2015]
,[MO RTCC DONOR$ 2014]
,[MO RTCC DONOR$ 2013]
,[MO RTCC DONOR$ 2012]
,[MO RTCC DONOR$ 2011]
,[MO RTCC DONOR$ 2010]
,[MO RTCC REG$ 2015]
,[MO RTCC REG$ 2014]
,[MO RTCC REG$ 2013]
,[MO RTCC REG$ 2012]
,[MO RTCC REG$ 2011]
,[MO RTCC REG$ 2010]
,[TO RTCC RFI 2015]
,[TO RTCC RFI 2014]
,[TO RTCC RFI 2013]
,[TO RTCC RFI 2012]
,[TO RTCC RFI 2011]
,[TO RTCC RFI 2010]
,[TO RTCC REG 2015]
,[TO RTCC REG 2014]
,[TO RTCC REG 2013]
,[TO RTCC REG 2012]
,[TO RTCC REG 2011]
,[TO RTCC REG 2010]
,[TO RTCC DONOR$ 2015]
,[TO RTCC DONOR$ 2014]
,[TO RTCC DONOR$ 2013]
,[TO RTCC DONOR$ 2012]
,[TO RTCC DONOR$ 2011]
,[TO RTCC DONOR$ 2010]
,[TO RTCC REG$ 2015]
,[TO RTCC REG$ 2014]
,[TO RTCC REG$ 2013]
,[TO RTCC REG$ 2012]
,[TO RTCC REG$ 2011]
,[TO RTCC REG$ 2010]
,[VA RTCC RFI 2015]
,[VA RTCC RFI 2014]
,[VA RTCC RFI 2013]
,[VA RTCC RFI 2012]
,[VA RTCC RFI 2011]
,[VA RTCC RFI 2010]
,[VA RTCC REG 2015]
,[VA RTCC REG 2014]
,[VA RTCC REG 2013]
,[VA RTCC REG 2012]
,[VA RTCC REG 2011]
,[VA RTCC REG 2010]
,[VA RTCC DONOR$ 2015]
,[VA RTCC DONOR$ 2014]
,[VA RTCC DONOR$ 2013]
,[VA RTCC DONOR$ 2012]
,[VA RTCC DONOR$ 2011]
,[VA RTCC DONOR$ 2010]
,[VA RTCC REG$ 2015]
,[VA RTCC REG$ 2014]
,[VA RTCC REG$ 2013]
,[VA RTCC REG$ 2012]
,[VA RTCC REG$ 2011]
,[VA RTCC REG$ 2010]
)
SELECT x.[Run_Date]

      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Auckland RTCC%' then x.[RFI] else 0 end) as 'AK RTCC RFI 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Auckland RTCC%' then x.[RFI] else 0 end) as 'AK RTCC RFI 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Auckland RTCC%' then x.[RFI] else 0 end) as 'AK RTCC RFI 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Auckland RTCC%' then x.[RFI] else 0 end) as 'AK RTCC RFI 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Auckland RTCC%' then x.[RFI] else 0 end) as 'AK RTCC RFI 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Auckland RTCC%' then x.[RFI] else 0 end) as 'AK RTCC RFI 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Auckland RTCC%' then x.[Participant] else 0 end) as 'AK RTCC REG 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Auckland RTCC%' then x.[Participant] else 0 end) as 'AK RTCC REG 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Auckland RTCC%' then x.[Participant] else 0 end) as 'AK RTCC REG 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Auckland RTCC%' then x.[Participant] else 0 end) as 'AK RTCC REG 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Auckland RTCC%' then x.[Participant] else 0 end) as 'AK RTCC REG 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Auckland RTCC%' then x.[Participant] else 0 end) as 'AK RTCC REG 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Auckland RTCC%' then x.[Donations_Amt] else 0 end) as 'AK RTCC DONOR$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Auckland RTCC%' then x.[Donations_Amt] else 0 end) as 'AK RTCC DONOR$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Auckland RTCC%' then x.[Donations_Amt] else 0 end) as 'AK RTCC DONOR$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Auckland RTCC%' then x.[Donations_Amt] else 0 end) as 'AK RTCC DONOR$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Auckland RTCC%' then x.[Donations_Amt] else 0 end) as 'AK RTCC DONOR$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Auckland RTCC%' then x.[Donations_Amt] else 0 end) as 'AK RTCC DONOR$ 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Auckland RTCC%' then x.[Reg_Amt] else 0 end) as 'AK RTCC REG$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Auckland RTCC%' then x.[Reg_Amt] else 0 end) as 'AK RTCC REG$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Auckland RTCC%' then x.[Reg_Amt] else 0 end) as 'AK RTCC REG$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Auckland RTCC%' then x.[Reg_Amt] else 0 end) as 'AK RTCC REG$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Auckland RTCC%' then x.[Reg_Amt] else 0 end) as 'AK RTCC REG$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Auckland RTCC%' then x.[Reg_Amt] else 0 end) as 'AK RTCC REG$ 2010'

      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Adelaide RTCC%' then x.[RFI] else 0 end) as 'AD RTCC RFI 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Adelaide RTCC%' then x.[RFI] else 0 end) as 'AD RTCC RFI 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Adelaide RTCC%' then x.[RFI] else 0 end) as 'AD RTCC RFI 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Adelaide RTCC%' then x.[RFI] else 0 end) as 'AD RTCC RFI 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Adelaide RTCC%' then x.[RFI] else 0 end) as 'AD RTCC RFI 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Adelaide RTCC%' then x.[RFI] else 0 end) as 'AD RTCC RFI 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Adelaide RTCC%' then x.[Participant] else 0 end) as 'AD RTCC REG 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Adelaide RTCC%' then x.[Participant] else 0 end) as 'AD RTCC REG 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Adelaide RTCC%' then x.[Participant] else 0 end) as 'AD RTCC REG 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Adelaide RTCC%' then x.[Participant] else 0 end) as 'AD RTCC REG 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Adelaide RTCC%' then x.[Participant] else 0 end) as 'AD RTCC REG 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Adelaide RTCC%' then x.[Participant] else 0 end) as 'AD RTCC REG 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Adelaide RTCC%' then x.[Donations_Amt] else 0 end) as 'AD RTCC DONOR$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Adelaide RTCC%' then x.[Donations_Amt] else 0 end) as 'AD RTCC DONOR$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Adelaide RTCC%' then x.[Donations_Amt] else 0 end) as 'AD RTCC DONOR$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Adelaide RTCC%' then x.[Donations_Amt] else 0 end) as 'AD RTCC DONOR$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Adelaide RTCC%' then x.[Donations_Amt] else 0 end) as 'AD RTCC DONOR$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Adelaide RTCC%' then x.[Donations_Amt] else 0 end) as 'AD RTCC DONOR$ 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Adelaide RTCC%' then x.[Reg_Amt] else 0 end) as 'AD RTCC REG$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Adelaide RTCC%' then x.[Reg_Amt] else 0 end) as 'AD RTCC REG$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Adelaide RTCC%' then x.[Reg_Amt] else 0 end) as 'AD RTCC REG$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Adelaide RTCC%' then x.[Reg_Amt] else 0 end) as 'AD RTCC REG$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Adelaide RTCC%' then x.[Reg_Amt] else 0 end) as 'AD RTCC REG$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Adelaide RTCC%' then x.[Reg_Amt] else 0 end) as 'AD RTCC REG$ 2010'

      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Brisbane RTCC%' then x.[RFI] else 0 end) as 'BR RTCC RFI 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Brisbane RTCC%' then x.[RFI] else 0 end) as 'BR RTCC RFI 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Brisbane RTCC%' then x.[RFI] else 0 end) as 'BR RTCC RFI 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Brisbane RTCC%' then x.[RFI] else 0 end) as 'BR RTCC RFI 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Brisbane RTCC%' then x.[RFI] else 0 end) as 'BR RTCC RFI 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Brisbane RTCC%' then x.[RFI] else 0 end) as 'BR RTCC RFI 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Brisbane RTCC%' then x.[Participant] else 0 end) as 'BR RTCC REG 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Brisbane RTCC%' then x.[Participant] else 0 end) as 'BR RTCC REG 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Brisbane RTCC%' then x.[Participant] else 0 end) as 'BR RTCC REG 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Brisbane RTCC%' then x.[Participant] else 0 end) as 'BR RTCC REG 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Brisbane RTCC%' then x.[Participant] else 0 end) as 'BR RTCC REG 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Brisbane RTCC%' then x.[Participant] else 0 end) as 'BR RTCC REG 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Brisbane RTCC%' then x.[Donations_Amt] else 0 end) as 'BR RTCC DONOR$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Brisbane RTCC%' then x.[Donations_Amt] else 0 end) as 'BR RTCC DONOR$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Brisbane RTCC%' then x.[Donations_Amt] else 0 end) as 'BR RTCC DONOR$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Brisbane RTCC%' then x.[Donations_Amt] else 0 end) as 'BR RTCC DONOR$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Brisbane RTCC%' then x.[Donations_Amt] else 0 end) as 'BR RTCC DONOR$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Brisbane RTCC%' then x.[Donations_Amt] else 0 end) as 'BR RTCC DONOR$ 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Brisbane RTCC%' then x.[Reg_Amt] else 0 end) as 'BR RTCC REG$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Brisbane RTCC%' then x.[Reg_Amt] else 0 end) as 'BR RTCC REG$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Brisbane RTCC%' then x.[Reg_Amt] else 0 end) as 'BR RTCC REG$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Brisbane RTCC%' then x.[Reg_Amt] else 0 end) as 'BR RTCC REG$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Brisbane RTCC%' then x.[Reg_Amt] else 0 end) as 'BR RTCC REG$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Brisbane RTCC%' then x.[Reg_Amt] else 0 end) as 'BR RTCC REG$ 2010'

      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Melbourne RTCC%' then x.[RFI] else 0 end) as 'ML RTCC RFI 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Melbourne RTCC%' then x.[RFI] else 0 end) as 'ML RTCC RFI 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Melbourne RTCC%' then x.[RFI] else 0 end) as 'ML RTCC RFI 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Melbourne RTCC%' then x.[RFI] else 0 end) as 'ML RTCC RFI 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Melbourne RTCC%' then x.[RFI] else 0 end) as 'ML RTCC RFI 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Melbourne RTCC%' then x.[RFI] else 0 end) as 'ML RTCC RFI 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Melbourne RTCC%' then x.[Participant] else 0 end) as 'ML RTCC REG 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Melbourne RTCC%' then x.[Participant] else 0 end) as 'ML RTCC REG 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Melbourne RTCC%' then x.[Participant] else 0 end) as 'ML RTCC REG 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Melbourne RTCC%' then x.[Participant] else 0 end) as 'ML RTCC REG 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Melbourne RTCC%' then x.[Participant] else 0 end) as 'ML RTCC REG 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Melbourne RTCC%' then x.[Participant] else 0 end) as 'ML RTCC REG 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Melbourne RTCC%' then x.[Donations_Amt] else 0 end) as 'ML RTCC DONOR$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Melbourne RTCC%' then x.[Donations_Amt] else 0 end) as 'ML RTCC DONOR$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Melbourne RTCC%' then x.[Donations_Amt] else 0 end) as 'ML RTCC DONOR$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Melbourne RTCC%' then x.[Donations_Amt] else 0 end) as 'ML RTCC DONOR$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Melbourne RTCC%' then x.[Donations_Amt] else 0 end) as 'ML RTCC DONOR$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Melbourne RTCC%' then x.[Donations_Amt] else 0 end) as 'ML RTCC DONOR$ 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Melbourne RTCC%' then x.[Reg_Amt] else 0 end) as 'ML RTCC REG$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Melbourne RTCC%' then x.[Reg_Amt] else 0 end) as 'ML RTCC REG$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Melbourne RTCC%' then x.[Reg_Amt] else 0 end) as 'ML RTCC REG$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Melbourne RTCC%' then x.[Reg_Amt] else 0 end) as 'ML RTCC REG$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Melbourne RTCC%' then x.[Reg_Amt] else 0 end) as 'ML RTCC REG$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Melbourne RTCC%' then x.[Reg_Amt] else 0 end) as 'ML RTCC REG$ 2010'

      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Perth RTCC%' then x.[RFI] else 0 end) as 'PE RTCC RFI 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Perth RTCC%' then x.[RFI] else 0 end) as 'PE RTCC RFI 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Perth RTCC%' then x.[RFI] else 0 end) as 'PE RTCC RFI 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Perth RTCC%' then x.[RFI] else 0 end) as 'PE RTCC RFI 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Perth RTCC%' then x.[RFI] else 0 end) as 'PE RTCC RFI 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Perth RTCC%' then x.[RFI] else 0 end) as 'PE RTCC RFI 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Perth RTCC%' then x.[Participant] else 0 end) as 'PE RTCC REG 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Perth RTCC%' then x.[Participant] else 0 end) as 'PE RTCC REG 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Perth RTCC%' then x.[Participant] else 0 end) as 'PE RTCC REG 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Perth RTCC%' then x.[Participant] else 0 end) as 'PE RTCC REG 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Perth RTCC%' then x.[Participant] else 0 end) as 'PE RTCC REG 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Perth RTCC%' then x.[Participant] else 0 end) as 'PE RTCC REG 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Perth RTCC%' then x.[Donations_Amt] else 0 end) as 'PE RTCC DONOR$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Perth RTCC%' then x.[Donations_Amt] else 0 end) as 'PE RTCC DONOR$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Perth RTCC%' then x.[Donations_Amt] else 0 end) as 'PE RTCC DONOR$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Perth RTCC%' then x.[Donations_Amt] else 0 end) as 'PE RTCC DONOR$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Perth RTCC%' then x.[Donations_Amt] else 0 end) as 'PE RTCC DONOR$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Perth RTCC%' then x.[Donations_Amt] else 0 end) as 'PE RTCC DONOR$ 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Perth RTCC%' then x.[Reg_Amt] else 0 end) as 'PE RTCC REG$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Perth RTCC%' then x.[Reg_Amt] else 0 end) as 'PE RTCC REG$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Perth RTCC%' then x.[Reg_Amt] else 0 end) as 'PE RTCC REG$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Perth RTCC%' then x.[Reg_Amt] else 0 end) as 'PE RTCC REG$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Perth RTCC%' then x.[Reg_Amt] else 0 end) as 'PE RTCC REG$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Perth RTCC%' then x.[Reg_Amt] else 0 end) as 'PE RTCC REG$ 2010'

      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Sydney RTCC%' then x.[RFI] else 0 end) as 'SY RTCC RFI 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Sydney RTCC%' then x.[RFI] else 0 end) as 'SY RTCC RFI 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Sydney RTCC%' then x.[RFI] else 0 end) as 'SY RTCC RFI 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Sydney RTCC%' then x.[RFI] else 0 end) as 'SY RTCC RFI 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Sydney RTCC%' then x.[RFI] else 0 end) as 'SY RTCC RFI 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Sydney RTCC%' then x.[RFI] else 0 end) as 'SY RTCC RFI 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Sydney RTCC%' then x.[Participant] else 0 end) as 'SY RTCC REG 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Sydney RTCC%' then x.[Participant] else 0 end) as 'SY RTCC REG 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Sydney RTCC%' then x.[Participant] else 0 end) as 'SY RTCC REG 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Sydney RTCC%' then x.[Participant] else 0 end) as 'SY RTCC REG 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Sydney RTCC%' then x.[Participant] else 0 end) as 'SY RTCC REG 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Sydney RTCC%' then x.[Participant] else 0 end) as 'SY RTCC REG 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Sydney RTCC%' then x.[Donations_Amt] else 0 end) as 'SY RTCC DONOR$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Sydney RTCC%' then x.[Donations_Amt] else 0 end) as 'SY RTCC DONOR$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Sydney RTCC%' then x.[Donations_Amt] else 0 end) as 'SY RTCC DONOR$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Sydney RTCC%' then x.[Donations_Amt] else 0 end) as 'SY RTCC DONOR$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Sydney RTCC%' then x.[Donations_Amt] else 0 end) as 'SY RTCC DONOR$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Sydney RTCC%' then x.[Donations_Amt] else 0 end) as 'SY RTCC DONOR$ 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Sydney RTCC%' then x.[Reg_Amt] else 0 end) as 'SY RTCC REG$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Sydney RTCC%' then x.[Reg_Amt] else 0 end) as 'SY RTCC REG$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Sydney RTCC%' then x.[Reg_Amt] else 0 end) as 'SY RTCC REG$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Sydney RTCC%' then x.[Reg_Amt] else 0 end) as 'SY RTCC REG$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Sydney RTCC%' then x.[Reg_Amt] else 0 end) as 'SY RTCC REG$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Sydney RTCC%' then x.[Reg_Amt] else 0 end) as 'SY RTCC REG$ 2010'

      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Alberta RTCC%' then x.[RFI] else 0 end) as 'AB RTCC RFI 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Alberta RTCC%' then x.[RFI] else 0 end) as 'AB RTCC RFI 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Alberta RTCC%' then x.[RFI] else 0 end) as 'AB RTCC RFI 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Alberta RTCC%' then x.[RFI] else 0 end) as 'AB RTCC RFI 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Alberta RTCC%' then x.[RFI] else 0 end) as 'AB RTCC RFI 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Alberta RTCC%' then x.[RFI] else 0 end) as 'AB RTCC RFI 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Alberta RTCC%' then x.[Participant] else 0 end) as 'AB RTCC REG 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Alberta RTCC%' then x.[Participant] else 0 end) as 'AB RTCC REG 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Alberta RTCC%' then x.[Participant] else 0 end) as 'AB RTCC REG 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Alberta RTCC%' then x.[Participant] else 0 end) as 'AB RTCC REG 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Alberta RTCC%' then x.[Participant] else 0 end) as 'AB RTCC REG 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Alberta RTCC%' then x.[Participant] else 0 end) as 'AB RTCC REG 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Alberta RTCC%' then x.[Donations_Amt] else 0 end) as 'AB RTCC DONOR$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Alberta RTCC%' then x.[Donations_Amt] else 0 end) as 'AB RTCC DONOR$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Alberta RTCC%' then x.[Donations_Amt] else 0 end) as 'AB RTCC DONOR$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Alberta RTCC%' then x.[Donations_Amt] else 0 end) as 'AB RTCC DONOR$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Alberta RTCC%' then x.[Donations_Amt] else 0 end) as 'AB RTCC DONOR$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Alberta RTCC%' then x.[Donations_Amt] else 0 end) as 'AB RTCC DONOR$ 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Alberta RTCC%' then x.[Reg_Amt] else 0 end) as 'AB RTCC REG$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Alberta RTCC%' then x.[Reg_Amt] else 0 end) as 'AB RTCC REG$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Alberta RTCC%' then x.[Reg_Amt] else 0 end) as 'AB RTCC REG$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Alberta RTCC%' then x.[Reg_Amt] else 0 end) as 'AB RTCC REG$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Alberta RTCC%' then x.[Reg_Amt] else 0 end) as 'AB RTCC REG$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Alberta RTCC%' then x.[Reg_Amt] else 0 end) as 'AB RTCC REG$ 2010'

      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Montreal RTCC%' then x.[RFI] else 0 end) as 'MO RTCC RFI 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Montreal RTCC%' then x.[RFI] else 0 end) as 'MO RTCC RFI 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Montreal RTCC%' then x.[RFI] else 0 end) as 'MO RTCC RFI 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Montreal RTCC%' then x.[RFI] else 0 end) as 'MO RTCC RFI 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Montreal RTCC%' then x.[RFI] else 0 end) as 'MO RTCC RFI 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Montreal RTCC%' then x.[RFI] else 0 end) as 'MO RTCC RFI 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Montreal RTCC%' then x.[Participant] else 0 end) as 'MO RTCC REG 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Montreal RTCC%' then x.[Participant] else 0 end) as 'MO RTCC REG 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Montreal RTCC%' then x.[Participant] else 0 end) as 'MO RTCC REG 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Montreal RTCC%' then x.[Participant] else 0 end) as 'MO RTCC REG 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Montreal RTCC%' then x.[Participant] else 0 end) as 'MO RTCC REG 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Montreal RTCC%' then x.[Participant] else 0 end) as 'MO RTCC REG 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Montreal RTCC%' then x.[Donations_Amt] else 0 end) as 'MO RTCC DONOR$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Montreal RTCC%' then x.[Donations_Amt] else 0 end) as 'MO RTCC DONOR$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Montreal RTCC%' then x.[Donations_Amt] else 0 end) as 'MO RTCC DONOR$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Montreal RTCC%' then x.[Donations_Amt] else 0 end) as 'MO RTCC DONOR$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Montreal RTCC%' then x.[Donations_Amt] else 0 end) as 'MO RTCC DONOR$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Montreal RTCC%' then x.[Donations_Amt] else 0 end) as 'MO RTCC DONOR$ 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Montreal RTCC%' then x.[Reg_Amt] else 0 end) as 'MO RTCC REG$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Montreal RTCC%' then x.[Reg_Amt] else 0 end) as 'MO RTCC REG$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Montreal RTCC%' then x.[Reg_Amt] else 0 end) as 'MO RTCC REG$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Montreal RTCC%' then x.[Reg_Amt] else 0 end) as 'MO RTCC REG$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Montreal RTCC%' then x.[Reg_Amt] else 0 end) as 'MO RTCC REG$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Montreal RTCC%' then x.[Reg_Amt] else 0 end) as 'MO RTCC REG$ 2010'

      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Toronto RTCC%' then x.[RFI] else 0 end) as 'TO RTCC RFI 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Toronto RTCC%' then x.[RFI] else 0 end) as 'TO RTCC RFI 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Toronto RTCC%' then x.[RFI] else 0 end) as 'TO RTCC RFI 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Toronto RTCC%' then x.[RFI] else 0 end) as 'TO RTCC RFI 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Toronto RTCC%' then x.[RFI] else 0 end) as 'TO RTCC RFI 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Toronto RTCC%' then x.[RFI] else 0 end) as 'TO RTCC RFI 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Toronto RTCC%' then x.[Participant] else 0 end) as 'TO RTCC REG 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Toronto RTCC%' then x.[Participant] else 0 end) as 'TO RTCC REG 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Toronto RTCC%' then x.[Participant] else 0 end) as 'TO RTCC REG 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Toronto RTCC%' then x.[Participant] else 0 end) as 'TO RTCC REG 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Toronto RTCC%' then x.[Participant] else 0 end) as 'TO RTCC REG 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Toronto RTCC%' then x.[Participant] else 0 end) as 'TO RTCC REG 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Toronto RTCC%' then x.[Donations_Amt] else 0 end) as 'TO RTCC DONOR$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Toronto RTCC%' then x.[Donations_Amt] else 0 end) as 'TO RTCC DONOR$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Toronto RTCC%' then x.[Donations_Amt] else 0 end) as 'TO RTCC DONOR$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Toronto RTCC%' then x.[Donations_Amt] else 0 end) as 'TO RTCC DONOR$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Toronto RTCC%' then x.[Donations_Amt] else 0 end) as 'TO RTCC DONOR$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Toronto RTCC%' then x.[Donations_Amt] else 0 end) as 'TO RTCC DONOR$ 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Toronto RTCC%' then x.[Reg_Amt] else 0 end) as 'TO RTCC REG$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Toronto RTCC%' then x.[Reg_Amt] else 0 end) as 'TO RTCC REG$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Toronto RTCC%' then x.[Reg_Amt] else 0 end) as 'TO RTCC REG$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Toronto RTCC%' then x.[Reg_Amt] else 0 end) as 'TO RTCC REG$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Toronto RTCC%' then x.[Reg_Amt] else 0 end) as 'TO RTCC REG$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Toronto RTCC%' then x.[Reg_Amt] else 0 end) as 'TO RTCC REG$ 2010'

      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Vancouver RTCC%' then x.[RFI] else 0 end) as 'VA RTCC RFI 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Vancouver RTCC%' then x.[RFI] else 0 end) as 'VA RTCC RFI 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver RTCC%' then x.[RFI] else 0 end) as 'VA RTCC RFI 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Vancouver RTCC%' then x.[RFI] else 0 end) as 'VA RTCC RFI 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Vancouver RTCC%' then x.[RFI] else 0 end) as 'VA RTCC RFI 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Vancouver RTCC%' then x.[RFI] else 0 end) as 'VA RTCC RFI 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Vancouver RTCC%' then x.[Participant] else 0 end) as 'VA RTCC REG 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Vancouver RTCC%' then x.[Participant] else 0 end) as 'VA RTCC REG 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver RTCC%' then x.[Participant] else 0 end) as 'VA RTCC REG 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Vancouver RTCC%' then x.[Participant] else 0 end) as 'VA RTCC REG 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Vancouver RTCC%' then x.[Participant] else 0 end) as 'VA RTCC REG 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Vancouver RTCC%' then x.[Participant] else 0 end) as 'VA RTCC REG 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Vancouver RTCC%' then x.[Donations_Amt] else 0 end) as 'VA RTCC DONOR$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Vancouver RTCC%' then x.[Donations_Amt] else 0 end) as 'VA RTCC DONOR$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver RTCC%' then x.[Donations_Amt] else 0 end) as 'VA RTCC DONOR$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Vancouver RTCC%' then x.[Donations_Amt] else 0 end) as 'VA RTCC DONOR$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Vancouver RTCC%' then x.[Donations_Amt] else 0 end) as 'VA RTCC DONOR$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Vancouver RTCC%' then x.[Donations_Amt] else 0 end) as 'VA RTCC DONOR$ 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Vancouver RTCC%' then x.[Reg_Amt] else 0 end) as 'VA RTCC REG$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Vancouver RTCC%' then x.[Reg_Amt] else 0 end) as 'VA RTCC REG$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver RTCC%' then x.[Reg_Amt] else 0 end) as 'VA RTCC REG$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Vancouver RTCC%' then x.[Reg_Amt] else 0 end) as 'VA RTCC REG$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Vancouver RTCC%' then x.[Reg_Amt] else 0 end) as 'VA RTCC REG$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Vancouver RTCC%' then x.[Reg_Amt] else 0 end) as 'VA RTCC REG$ 2010'
      
      FROM (
SELECT [Run_Da]
      ,[Run_Date]
      ,[Event_Code]
      ,[Event_Name]
      ,[RFI]
      ,[Walker]
      ,[Rider]
      ,[Participant]
      ,[Crew]
      ,[Reg_Amt]
      ,[Donations_Amt]
  FROM [CFScott].[dbo].[ops_report]
) as x
GROUP BY x.[Run_Date]
ORDER BY x.[Run_Date]


TRUNCATE TABLE [CFScott].[dbo].[koi_master_weekend]
INSERT INTO [CFScott].[dbo].[koi_master_weekend] (
[Run_Date]
,[AB WEBC RFI 2015]
,[AB WEBC RFI 2014]
,[AB WEBC RFI 2013]
,[AB WEBC RFI 2012]
,[AB WEBC RFI 2011]
,[AB WEBC RFI 2010]
,[AB WEBC REG 2015]
,[AB WEBC REG 2014]
,[AB WEBC REG 2013]
,[AB WEBC REG 2012]
,[AB WEBC REG 2011]
,[AB WEBC REG 2010]
,[AB WEBC DONOR$ 2015]
,[AB WEBC DONOR$ 2014]
,[AB WEBC DONOR$ 2013]
,[AB WEBC DONOR$ 2012]
,[AB WEBC DONOR$ 2011]
,[AB WEBC DONOR$ 2010]
,[AB WEBC REG$ 2015]
,[AB WEBC REG$ 2014]
,[AB WEBC REG$ 2013]
,[AB WEBC REG$ 2012]
,[AB WEBC REG$ 2011]
,[AB WEBC REG$ 2010]
,[BR WEBC RFI 2015]
,[BR WEBC RFI 2014]
,[BR WEBC RFI 2013]
,[BR WEBC RFI 2012]
,[BR WEBC RFI 2011]
,[BR WEBC RFI 2010]
,[BR WEBC REG 2015]
,[BR WEBC REG 2014]
,[BR WEBC REG 2013]
,[BR WEBC REG 2012]
,[BR WEBC REG 2011]
,[BR WEBC REG 2010]
,[BR WEBC DONOR$ 2015]
,[BR WEBC DONOR$ 2014]
,[BR WEBC DONOR$ 2013]
,[BR WEBC DONOR$ 2012]
,[BR WEBC DONOR$ 2011]
,[BR WEBC DONOR$ 2010]
,[BR WEBC REG$ 2015]
,[BR WEBC REG$ 2014]
,[BR WEBC REG$ 2013]
,[BR WEBC REG$ 2012]
,[BR WEBC REG$ 2011]
,[BR WEBC REG$ 2010]
,[CA WEBC RFI 2015]
,[CA WEBC RFI 2014]
,[CA WEBC RFI 2013]
,[CA WEBC RFI 2012]
,[CA WEBC RFI 2011]
,[CA WEBC RFI 2010]
,[CA WEBC REG 2015]
,[CA WEBC REG 2014]
,[CA WEBC REG 2013]
,[CA WEBC REG 2012]
,[CA WEBC REG 2011]
,[CA WEBC REG 2010]
,[CA WEBC DONOR$ 2015]
,[CA WEBC DONOR$ 2014]
,[CA WEBC DONOR$ 2013]
,[CA WEBC DONOR$ 2012]
,[CA WEBC DONOR$ 2011]
,[CA WEBC DONOR$ 2010]
,[CA WEBC REG$ 2015]
,[CA WEBC REG$ 2014]
,[CA WEBC REG$ 2013]
,[CA WEBC REG$ 2012]
,[CA WEBC REG$ 2011]
,[CA WEBC REG$ 2010]
,[ED WEBC RFI 2015]
,[ED WEBC RFI 2014]
,[ED WEBC RFI 2013]
,[ED WEBC RFI 2012]
,[ED WEBC RFI 2011]
,[ED WEBC RFI 2010]
,[ED WEBC REG 2015]
,[ED WEBC REG 2014]
,[ED WEBC REG 2013]
,[ED WEBC REG 2012]
,[ED WEBC REG 2011]
,[ED WEBC REG 2010]
,[ED WEBC DONOR$ 2015]
,[ED WEBC DONOR$ 2014]
,[ED WEBC DONOR$ 2013]
,[ED WEBC DONOR$ 2012]
,[ED WEBC DONOR$ 2011]
,[ED WEBC DONOR$ 2010]
,[ED WEBC REG$ 2015]
,[ED WEBC REG$ 2014]
,[ED WEBC REG$ 2013]
,[ED WEBC REG$ 2012]
,[ED WEBC REG$ 2011]
,[ED WEBC REG$ 2010]
,[MO WEBC RFI 2015]
,[MO WEBC RFI 2014]
,[MO WEBC RFI 2013]
,[MO WEBC RFI 2012]
,[MO WEBC RFI 2011]
,[MO WEBC RFI 2010]
,[MO WEBC REG 2015]
,[MO WEBC REG 2014]
,[MO WEBC REG 2013]
,[MO WEBC REG 2012]
,[MO WEBC REG 2011]
,[MO WEBC REG 2010]
,[MO WEBC DONOR$ 2015]
,[MO WEBC DONOR$ 2014]
,[MO WEBC DONOR$ 2013]
,[MO WEBC DONOR$ 2012]
,[MO WEBC DONOR$ 2011]
,[MO WEBC DONOR$ 2010]
,[MO WEBC REG$ 2015]
,[MO WEBC REG$ 2014]
,[MO WEBC REG$ 2013]
,[MO WEBC REG$ 2012]
,[MO WEBC REG$ 2011]
,[MO WEBC REG$ 2010]
,[OT WEBC RFI 2015]
,[OT WEBC RFI 2014]
,[OT WEBC RFI 2013]
,[OT WEBC RFI 2012]
,[OT WEBC RFI 2011]
,[OT WEBC RFI 2010]
,[OT WEBC REG 2015]
,[OT WEBC REG 2014]
,[OT WEBC REG 2013]
,[OT WEBC REG 2012]
,[OT WEBC REG 2011]
,[OT WEBC REG 2010]
,[OT WEBC DONOR$ 2015]
,[OT WEBC DONOR$ 2014]
,[OT WEBC DONOR$ 2013]
,[OT WEBC DONOR$ 2012]
,[OT WEBC DONOR$ 2011]
,[OT WEBC DONOR$ 2010]
,[OT WEBC REG$ 2015]
,[OT WEBC REG$ 2014]
,[OT WEBC REG$ 2013]
,[OT WEBC REG$ 2012]
,[OT WEBC REG$ 2011]
,[OT WEBC REG$ 2010]
,[SY WEBC RFI 2015]
,[SY WEBC RFI 2014]
,[SY WEBC RFI 2013]
,[SY WEBC RFI 2012]
,[SY WEBC RFI 2011]
,[SY WEBC RFI 2010]
,[SY WEBC REG 2015]
,[SY WEBC REG 2014]
,[SY WEBC REG 2013]
,[SY WEBC REG 2012]
,[SY WEBC REG 2011]
,[SY WEBC REG 2010]
,[SY WEBC DONOR$ 2015]
,[SY WEBC DONOR$ 2014]
,[SY WEBC DONOR$ 2013]
,[SY WEBC DONOR$ 2012]
,[SY WEBC DONOR$ 2011]
,[SY WEBC DONOR$ 2010]
,[SY WEBC REG$ 2015]
,[SY WEBC REG$ 2014]
,[SY WEBC REG$ 2013]
,[SY WEBC REG$ 2012]
,[SY WEBC REG$ 2011]
,[SY WEBC REG$ 2010]
,[TO WEBC RFI 2015]
,[TO WEBC RFI 2014]
,[TO WEBC RFI 2013]
,[TO WEBC RFI 2012]
,[TO WEBC RFI 2011]
,[TO WEBC RFI 2010]
,[TO WEBC REG 2015]
,[TO WEBC REG 2014]
,[TO WEBC REG 2013]
,[TO WEBC REG 2012]
,[TO WEBC REG 2011]
,[TO WEBC REG 2010]
,[TO WEBC DONOR$ 2015]
,[TO WEBC DONOR$ 2014]
,[TO WEBC DONOR$ 2013]
,[TO WEBC DONOR$ 2012]
,[TO WEBC DONOR$ 2011]
,[TO WEBC DONOR$ 2010]
,[TO WEBC REG$ 2015]
,[TO WEBC REG$ 2014]
,[TO WEBC REG$ 2013]
,[TO WEBC REG$ 2012]
,[TO WEBC REG$ 2011]
,[TO WEBC REG$ 2010]
,[VA WEBC RFI 2015]
,[VA WEBC RFI 2014]
,[VA WEBC RFI 2013]
,[VA WEBC RFI 2012]
,[VA WEBC RFI 2011]
,[VA WEBC RFI 2010]
,[VA WEBC REG 2015]
,[VA WEBC REG 2014]
,[VA WEBC REG 2013]
,[VA WEBC REG 2012]
,[VA WEBC REG 2011]
,[VA WEBC REG 2010]
,[VA WEBC DONOR$ 2015]
,[VA WEBC DONOR$ 2014]
,[VA WEBC DONOR$ 2013]
,[VA WEBC DONOR$ 2012]
,[VA WEBC DONOR$ 2011]
,[VA WEBC DONOR$ 2010]
,[VA WEBC REG$ 2015]
,[VA WEBC REG$ 2014]
,[VA WEBC REG$ 2013]
,[VA WEBC REG$ 2012]
,[VA WEBC REG$ 2011]
,[VA WEBC REG$ 2010]
)
SELECT x.[Run_Date]

      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Alberta WEBC%' then x.[RFI] else 0 end) as 'AB WEBC RFI 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Alberta WEBC%' then x.[RFI] else 0 end) as 'AB WEBC RFI 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Alberta WEBC%' then x.[RFI] else 0 end) as 'AB WEBC RFI 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Alberta WEBC%' then x.[RFI] else 0 end) as 'AB WEBC RFI 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Alberta WEBC%' then x.[RFI] else 0 end) as 'AB WEBC RFI 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Alberta WEBC%' then x.[RFI] else 0 end) as 'AB WEBC RFI 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Alberta WEBC%' then x.[Participant] else 0 end) as 'AB WEBC REG 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Alberta WEBC%' then x.[Participant] else 0 end) as 'AB WEBC REG 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Alberta WEBC%' then x.[Participant] else 0 end) as 'AB WEBC REG 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Alberta WEBC%' then x.[Participant] else 0 end) as 'AB WEBC REG 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Alberta WEBC%' then x.[Participant] else 0 end) as 'AB WEBC REG 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Alberta WEBC%' then x.[Participant] else 0 end) as 'AB WEBC REG 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Alberta WEBC%' then x.[Donations_Amt] else 0 end) as 'AB WEBC DONOR$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Alberta WEBC%' then x.[Donations_Amt] else 0 end) as 'AB WEBC DONOR$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Alberta WEBC%' then x.[Donations_Amt] else 0 end) as 'AB WEBC DONOR$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Alberta WEBC%' then x.[Donations_Amt] else 0 end) as 'AB WEBC DONOR$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Alberta WEBC%' then x.[Donations_Amt] else 0 end) as 'AB WEBC DONOR$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Alberta WEBC%' then x.[Donations_Amt] else 0 end) as 'AB WEBC DONOR$ 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Alberta WEBC%' then x.[Reg_Amt] else 0 end) as 'AB WEBC REG$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Alberta WEBC%' then x.[Reg_Amt] else 0 end) as 'AB WEBC REG$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Alberta WEBC%' then x.[Reg_Amt] else 0 end) as 'AB WEBC REG$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Alberta WEBC%' then x.[Reg_Amt] else 0 end) as 'AB WEBC REG$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Alberta WEBC%' then x.[Reg_Amt] else 0 end) as 'AB WEBC REG$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Alberta WEBC%' then x.[Reg_Amt] else 0 end) as 'AB WEBC REG$ 2010'

      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Brisbane WEBC%' then x.[RFI] else 0 end) as 'BR WEBC RFI 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Brisbane WEBC%' then x.[RFI] else 0 end) as 'BR WEBC RFI 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Brisbane WEBC%' then x.[RFI] else 0 end) as 'BR WEBC RFI 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Brisbane WEBC%' then x.[RFI] else 0 end) as 'BR WEBC RFI 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Brisbane WEBC%' then x.[RFI] else 0 end) as 'BR WEBC RFI 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Brisbane WEBC%' then x.[RFI] else 0 end) as 'BR WEBC RFI 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Brisbane WEBC%' then x.[Participant] else 0 end) as 'BR WEBC REG 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Brisbane WEBC%' then x.[Participant] else 0 end) as 'BR WEBC REG 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Brisbane WEBC%' then x.[Participant] else 0 end) as 'BR WEBC REG 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Brisbane WEBC%' then x.[Participant] else 0 end) as 'BR WEBC REG 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Brisbane WEBC%' then x.[Participant] else 0 end) as 'BR WEBC REG 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Brisbane WEBC%' then x.[Participant] else 0 end) as 'BR WEBC REG 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Brisbane WEBC%' then x.[Donations_Amt] else 0 end) as 'BR WEBC DONOR$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Brisbane WEBC%' then x.[Donations_Amt] else 0 end) as 'BR WEBC DONOR$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Brisbane WEBC%' then x.[Donations_Amt] else 0 end) as 'BR WEBC DONOR$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Brisbane WEBC%' then x.[Donations_Amt] else 0 end) as 'BR WEBC DONOR$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Brisbane WEBC%' then x.[Donations_Amt] else 0 end) as 'BR WEBC DONOR$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Brisbane WEBC%' then x.[Donations_Amt] else 0 end) as 'BR WEBC DONOR$ 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Brisbane WEBC%' then x.[Reg_Amt] else 0 end) as 'BR WEBC REG$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Brisbane WEBC%' then x.[Reg_Amt] else 0 end) as 'BR WEBC REG$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Brisbane WEBC%' then x.[Reg_Amt] else 0 end) as 'BR WEBC REG$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Brisbane WEBC%' then x.[Reg_Amt] else 0 end) as 'BR WEBC REG$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Brisbane WEBC%' then x.[Reg_Amt] else 0 end) as 'BR WEBC REG$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Brisbane WEBC%' then x.[Reg_Amt] else 0 end) as 'BR WEBC REG$ 2010'

      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Calgary WEBC%' then x.[RFI] else 0 end) as 'CA WEBC RFI 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Calgary WEBC%' then x.[RFI] else 0 end) as 'CA WEBC RFI 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Calgary WEBC%' then x.[RFI] else 0 end) as 'CA WEBC RFI 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Calgary WEBC%' then x.[RFI] else 0 end) as 'CA WEBC RFI 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Calgary WEBC%' then x.[RFI] else 0 end) as 'CA WEBC RFI 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Calgary WEBC%' then x.[RFI] else 0 end) as 'CA WEBC RFI 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Calgary WEBC%' then x.[Participant] else 0 end) as 'CA WEBC REG 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Calgary WEBC%' then x.[Participant] else 0 end) as 'CA WEBC REG 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Calgary WEBC%' then x.[Participant] else 0 end) as 'CA WEBC REG 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Calgary WEBC%' then x.[Participant] else 0 end) as 'CA WEBC REG 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Calgary WEBC%' then x.[Participant] else 0 end) as 'CA WEBC REG 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Calgary WEBC%' then x.[Participant] else 0 end) as 'CA WEBC REG 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Calgary WEBC%' then x.[Donations_Amt] else 0 end) as 'CA WEBC DONOR$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Calgary WEBC%' then x.[Donations_Amt] else 0 end) as 'CA WEBC DONOR$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Calgary WEBC%' then x.[Donations_Amt] else 0 end) as 'CA WEBC DONOR$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Calgary WEBC%' then x.[Donations_Amt] else 0 end) as 'CA WEBC DONOR$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Calgary WEBC%' then x.[Donations_Amt] else 0 end) as 'CA WEBC DONOR$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Calgary WEBC%' then x.[Donations_Amt] else 0 end) as 'CA WEBC DONOR$ 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Calgary WEBC%' then x.[Reg_Amt] else 0 end) as 'CA WEBC REG$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Calgary WEBC%' then x.[Reg_Amt] else 0 end) as 'CA WEBC REG$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Calgary WEBC%' then x.[Reg_Amt] else 0 end) as 'CA WEBC REG$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Calgary WEBC%' then x.[Reg_Amt] else 0 end) as 'CA WEBC REG$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Calgary WEBC%' then x.[Reg_Amt] else 0 end) as 'CA WEBC REG$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Calgary WEBC%' then x.[Reg_Amt] else 0 end) as 'CA WEBC REG$ 2010'

      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Edmonton WEBC%' then x.[RFI] else 0 end) as 'ED WEBC RFI 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Edmonton WEBC%' then x.[RFI] else 0 end) as 'ED WEBC RFI 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Edmonton WEBC%' then x.[RFI] else 0 end) as 'ED WEBC RFI 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Edmonton WEBC%' then x.[RFI] else 0 end) as 'ED WEBC RFI 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Edmonton WEBC%' then x.[RFI] else 0 end) as 'ED WEBC RFI 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Edmonton WEBC%' then x.[RFI] else 0 end) as 'ED WEBC RFI 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Edmonton WEBC%' then x.[Participant] else 0 end) as 'ED WEBC REG 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Edmonton WEBC%' then x.[Participant] else 0 end) as 'ED WEBC REG 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Edmonton WEBC%' then x.[Participant] else 0 end) as 'ED WEBC REG 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Edmonton WEBC%' then x.[Participant] else 0 end) as 'ED WEBC REG 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Edmonton WEBC%' then x.[Participant] else 0 end) as 'ED WEBC REG 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Edmonton WEBC%' then x.[Participant] else 0 end) as 'ED WEBC REG 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Edmonton WEBC%' then x.[Donations_Amt] else 0 end) as 'ED WEBC DONOR$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Edmonton WEBC%' then x.[Donations_Amt] else 0 end) as 'ED WEBC DONOR$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Edmonton WEBC%' then x.[Donations_Amt] else 0 end) as 'ED WEBC DONOR$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Edmonton WEBC%' then x.[Donations_Amt] else 0 end) as 'ED WEBC DONOR$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Edmonton WEBC%' then x.[Donations_Amt] else 0 end) as 'ED WEBC DONOR$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Edmonton WEBC%' then x.[Donations_Amt] else 0 end) as 'ED WEBC DONOR$ 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Edmonton WEBC%' then x.[Reg_Amt] else 0 end) as 'ED WEBC REG$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Edmonton WEBC%' then x.[Reg_Amt] else 0 end) as 'ED WEBC REG$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Edmonton WEBC%' then x.[Reg_Amt] else 0 end) as 'ED WEBC REG$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Edmonton WEBC%' then x.[Reg_Amt] else 0 end) as 'ED WEBC REG$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Edmonton WEBC%' then x.[Reg_Amt] else 0 end) as 'ED WEBC REG$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Edmonton WEBC%' then x.[Reg_Amt] else 0 end) as 'ED WEBC REG$ 2010'

      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Montreal WEBC%' then x.[RFI] else 0 end) as 'MO WEBC RFI 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Montreal WEBC%' then x.[RFI] else 0 end) as 'MO WEBC RFI 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Montreal WEBC%' then x.[RFI] else 0 end) as 'MO WEBC RFI 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Montreal WEBC%' then x.[RFI] else 0 end) as 'MO WEBC RFI 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Montreal WEBC%' then x.[RFI] else 0 end) as 'MO WEBC RFI 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Montreal WEBC%' then x.[RFI] else 0 end) as 'MO WEBC RFI 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Montreal WEBC%' then x.[Participant] else 0 end) as 'MO WEBC REG 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Montreal WEBC%' then x.[Participant] else 0 end) as 'MO WEBC REG 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Montreal WEBC%' then x.[Participant] else 0 end) as 'MO WEBC REG 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Montreal WEBC%' then x.[Participant] else 0 end) as 'MO WEBC REG 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Montreal WEBC%' then x.[Participant] else 0 end) as 'MO WEBC REG 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Montreal WEBC%' then x.[Participant] else 0 end) as 'MO WEBC REG 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Montreal WEBC%' then x.[Donations_Amt] else 0 end) as 'MO WEBC DONOR$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Montreal WEBC%' then x.[Donations_Amt] else 0 end) as 'MO WEBC DONOR$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Montreal WEBC%' then x.[Donations_Amt] else 0 end) as 'MO WEBC DONOR$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Montreal WEBC%' then x.[Donations_Amt] else 0 end) as 'MO WEBC DONOR$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Montreal WEBC%' then x.[Donations_Amt] else 0 end) as 'MO WEBC DONOR$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Montreal WEBC%' then x.[Donations_Amt] else 0 end) as 'MO WEBC DONOR$ 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Montreal WEBC%' then x.[Reg_Amt] else 0 end) as 'MO WEBC REG$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Montreal WEBC%' then x.[Reg_Amt] else 0 end) as 'MO WEBC REG$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Montreal WEBC%' then x.[Reg_Amt] else 0 end) as 'MO WEBC REG$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Montreal WEBC%' then x.[Reg_Amt] else 0 end) as 'MO WEBC REG$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Montreal WEBC%' then x.[Reg_Amt] else 0 end) as 'MO WEBC REG$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Montreal WEBC%' then x.[Reg_Amt] else 0 end) as 'MO WEBC REG$ 2010'

      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Ottawa WEBC%' then x.[RFI] else 0 end) as 'OT WEBC RFI 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Ottawa WEBC%' then x.[RFI] else 0 end) as 'OT WEBC RFI 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Ottawa WEBC%' then x.[RFI] else 0 end) as 'OT WEBC RFI 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Ottawa WEBC%' then x.[RFI] else 0 end) as 'OT WEBC RFI 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Ottawa WEBC%' then x.[RFI] else 0 end) as 'OT WEBC RFI 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Ottawa WEBC%' then x.[RFI] else 0 end) as 'OT WEBC RFI 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Ottawa WEBC%' then x.[Participant] else 0 end) as 'OT WEBC REG 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Ottawa WEBC%' then x.[Participant] else 0 end) as 'OT WEBC REG 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Ottawa WEBC%' then x.[Participant] else 0 end) as 'OT WEBC REG 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Ottawa WEBC%' then x.[Participant] else 0 end) as 'OT WEBC REG 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Ottawa WEBC%' then x.[Participant] else 0 end) as 'OT WEBC REG 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Ottawa WEBC%' then x.[Participant] else 0 end) as 'OT WEBC REG 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Ottawa WEBC%' then x.[Donations_Amt] else 0 end) as 'OT WEBC DONOR$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Ottawa WEBC%' then x.[Donations_Amt] else 0 end) as 'OT WEBC DONOR$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Ottawa WEBC%' then x.[Donations_Amt] else 0 end) as 'OT WEBC DONOR$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Ottawa WEBC%' then x.[Donations_Amt] else 0 end) as 'OT WEBC DONOR$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Ottawa WEBC%' then x.[Donations_Amt] else 0 end) as 'OT WEBC DONOR$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Ottawa WEBC%' then x.[Donations_Amt] else 0 end) as 'OT WEBC DONOR$ 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Ottawa WEBC%' then x.[Reg_Amt] else 0 end) as 'OT WEBC REG$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Ottawa WEBC%' then x.[Reg_Amt] else 0 end) as 'OT WEBC REG$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Ottawa WEBC%' then x.[Reg_Amt] else 0 end) as 'OT WEBC REG$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Ottawa WEBC%' then x.[Reg_Amt] else 0 end) as 'OT WEBC REG$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Ottawa WEBC%' then x.[Reg_Amt] else 0 end) as 'OT WEBC REG$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Ottawa WEBC%' then x.[Reg_Amt] else 0 end) as 'OT WEBC REG$ 2010'

      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Sydney WEBC%' then x.[RFI] else 0 end) as 'SY WEBC RFI 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Sydney WEBC%' then x.[RFI] else 0 end) as 'SY WEBC RFI 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Sydney WEBC%' then x.[RFI] else 0 end) as 'SY WEBC RFI 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Sydney WEBC%' then x.[RFI] else 0 end) as 'SY WEBC RFI 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Sydney WEBC%' then x.[RFI] else 0 end) as 'SY WEBC RFI 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Sydney WEBC%' then x.[RFI] else 0 end) as 'SY WEBC RFI 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Sydney WEBC%' then x.[Participant] else 0 end) as 'SY WEBC REG 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Sydney WEBC%' then x.[Participant] else 0 end) as 'SY WEBC REG 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Sydney WEBC%' then x.[Participant] else 0 end) as 'SY WEBC REG 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Sydney WEBC%' then x.[Participant] else 0 end) as 'SY WEBC REG 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Sydney WEBC%' then x.[Participant] else 0 end) as 'SY WEBC REG 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Sydney WEBC%' then x.[Participant] else 0 end) as 'SY WEBC REG 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Sydney WEBC%' then x.[Donations_Amt] else 0 end) as 'SY WEBC DONOR$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Sydney WEBC%' then x.[Donations_Amt] else 0 end) as 'SY WEBC DONOR$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Sydney WEBC%' then x.[Donations_Amt] else 0 end) as 'SY WEBC DONOR$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Sydney WEBC%' then x.[Donations_Amt] else 0 end) as 'SY WEBC DONOR$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Sydney WEBC%' then x.[Donations_Amt] else 0 end) as 'SY WEBC DONOR$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Sydney WEBC%' then x.[Donations_Amt] else 0 end) as 'SY WEBC DONOR$ 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Sydney WEBC%' then x.[Reg_Amt] else 0 end) as 'SY WEBC REG$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Sydney WEBC%' then x.[Reg_Amt] else 0 end) as 'SY WEBC REG$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Sydney WEBC%' then x.[Reg_Amt] else 0 end) as 'SY WEBC REG$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Sydney WEBC%' then x.[Reg_Amt] else 0 end) as 'SY WEBC REG$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Sydney WEBC%' then x.[Reg_Amt] else 0 end) as 'SY WEBC REG$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Sydney WEBC%' then x.[Reg_Amt] else 0 end) as 'SY WEBC REG$ 2010'

      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Toronto WEBC%' then x.[RFI] else 0 end) as 'TO WEBC RFI 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Toronto WEBC%' then x.[RFI] else 0 end) as 'TO WEBC RFI 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Toronto WEBC%' then x.[RFI] else 0 end) as 'TO WEBC RFI 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Toronto WEBC%' then x.[RFI] else 0 end) as 'TO WEBC RFI 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Toronto WEBC%' then x.[RFI] else 0 end) as 'TO WEBC RFI 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Toronto WEBC%' then x.[RFI] else 0 end) as 'TO WEBC RFI 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Toronto WEBC%' then x.[Participant] else 0 end) as 'TO WEBC REG 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Toronto WEBC%' then x.[Participant] else 0 end) as 'TO WEBC REG 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Toronto WEBC%' then x.[Participant] else 0 end) as 'TO WEBC REG 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Toronto WEBC%' then x.[Participant] else 0 end) as 'TO WEBC REG 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Toronto WEBC%' then x.[Participant] else 0 end) as 'TO WEBC REG 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Toronto WEBC%' then x.[Participant] else 0 end) as 'TO WEBC REG 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Toronto WEBC%' then x.[Donations_Amt] else 0 end) as 'TO WEBC DONOR$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Toronto WEBC%' then x.[Donations_Amt] else 0 end) as 'TO WEBC DONOR$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Toronto WEBC%' then x.[Donations_Amt] else 0 end) as 'TO WEBC DONOR$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Toronto WEBC%' then x.[Donations_Amt] else 0 end) as 'TO WEBC DONOR$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Toronto WEBC%' then x.[Donations_Amt] else 0 end) as 'TO WEBC DONOR$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Toronto WEBC%' then x.[Donations_Amt] else 0 end) as 'TO WEBC DONOR$ 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Toronto WEBC%' then x.[Reg_Amt] else 0 end) as 'TO WEBC REG$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Toronto WEBC%' then x.[Reg_Amt] else 0 end) as 'TO WEBC REG$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Toronto WEBC%' then x.[Reg_Amt] else 0 end) as 'TO WEBC REG$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Toronto WEBC%' then x.[Reg_Amt] else 0 end) as 'TO WEBC REG$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Toronto WEBC%' then x.[Reg_Amt] else 0 end) as 'TO WEBC REG$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Toronto WEBC%' then x.[Reg_Amt] else 0 end) as 'TO WEBC REG$ 2010'

      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Vancouver WEBC%' then x.[RFI] else 0 end) as 'VA WEBC RFI 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Vancouver WEBC%' then x.[RFI] else 0 end) as 'VA WEBC RFI 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver WEBC%' then x.[RFI] else 0 end) as 'VA WEBC RFI 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Vancouver WEBC%' then x.[RFI] else 0 end) as 'VA WEBC RFI 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Vancouver WEBC%' then x.[RFI] else 0 end) as 'VA WEBC RFI 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Vancouver WEBC%' then x.[RFI] else 0 end) as 'VA WEBC RFI 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Vancouver WEBC%' then x.[Participant] else 0 end) as 'VA WEBC REG 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Vancouver WEBC%' then x.[Participant] else 0 end) as 'VA WEBC REG 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver WEBC%' then x.[Participant] else 0 end) as 'VA WEBC REG 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Vancouver WEBC%' then x.[Participant] else 0 end) as 'VA WEBC REG 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Vancouver WEBC%' then x.[Participant] else 0 end) as 'VA WEBC REG 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Vancouver WEBC%' then x.[Participant] else 0 end) as 'VA WEBC REG 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Vancouver WEBC%' then x.[Donations_Amt] else 0 end) as 'VA WEBC DONOR$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Vancouver WEBC%' then x.[Donations_Amt] else 0 end) as 'VA WEBC DONOR$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver WEBC%' then x.[Donations_Amt] else 0 end) as 'VA WEBC DONOR$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Vancouver WEBC%' then x.[Donations_Amt] else 0 end) as 'VA WEBC DONOR$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Vancouver WEBC%' then x.[Donations_Amt] else 0 end) as 'VA WEBC DONOR$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Vancouver WEBC%' then x.[Donations_Amt] else 0 end) as 'VA WEBC DONOR$ 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Vancouver WEBC%' then x.[Reg_Amt] else 0 end) as 'VA WEBC REG$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Vancouver WEBC%' then x.[Reg_Amt] else 0 end) as 'VA WEBC REG$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver WEBC%' then x.[Reg_Amt] else 0 end) as 'VA WEBC REG$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Vancouver WEBC%' then x.[Reg_Amt] else 0 end) as 'VA WEBC REG$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Vancouver WEBC%' then x.[Reg_Amt] else 0 end) as 'VA WEBC REG$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Vancouver WEBC%' then x.[Reg_Amt] else 0 end) as 'VA WEBC REG$ 2010'
      
      FROM (
SELECT [Run_Da]
      ,[Run_Date]
      ,[Event_Code]
      ,[Event_Name]
      ,[RFI]
      ,[Walker]
      ,[Rider]
      ,[Participant]
      ,[Crew]
      ,[Reg_Amt]
      ,[Donations_Amt]
  FROM [CFScott].[dbo].[ops_report]
) as x
GROUP BY x.[Run_Date]
ORDER BY x.[Run_Date]


TRUNCATE TABLE [CFScott].[dbo].[koi_master_underware]
INSERT INTO [CFScott].[dbo].[koi_master_underware] (
[Run_Date]
,[CA UA RFI 2015]
,[CA UA RFI 2014]
,[CA UA RFI 2013]
,[CA UA RFI 2012]
,[CA UA RFI 2011]
,[CA UA RFI 2010]
,[CA UA REG 2015]
,[CA UA REG 2014]
,[CA UA REG 2013]
,[CA UA REG 2012]
,[CA UA REG 2011]
,[CA UA REG 2010]
,[CA UA DONOR$ 2015]
,[CA UA DONOR$ 2014]
,[CA UA DONOR$ 2013]
,[CA UA DONOR$ 2012]
,[CA UA DONOR$ 2011]
,[CA UA DONOR$ 2010]
,[CA UA REG$ 2015]
,[CA UA REG$ 2014]
,[CA UA REG$ 2013]
,[CA UA REG$ 2012]
,[CA UA REG$ 2011]
,[CA UA REG$ 2010]
,[ED UA RFI 2015]
,[ED UA RFI 2014]
,[ED UA RFI 2013]
,[ED UA RFI 2012]
,[ED UA RFI 2011]
,[ED UA RFI 2010]
,[ED UA REG 2015]
,[ED UA REG 2014]
,[ED UA REG 2013]
,[ED UA REG 2012]
,[ED UA REG 2011]
,[ED UA REG 2010]
,[ED UA DONOR$ 2015]
,[ED UA DONOR$ 2014]
,[ED UA DONOR$ 2013]
,[ED UA DONOR$ 2012]
,[ED UA DONOR$ 2011]
,[ED UA DONOR$ 2010]
,[ED UA REG$ 2015]
,[ED UA REG$ 2014]
,[ED UA REG$ 2013]
,[ED UA REG$ 2012]
,[ED UA REG$ 2011]
,[ED UA REG$ 2010]
,[OT UA RFI 2015]
,[OT UA RFI 2014]
,[OT UA RFI 2013]
,[OT UA RFI 2012]
,[OT UA RFI 2011]
,[OT UA RFI 2010]
,[OT UA REG 2015]
,[OT UA REG 2014]
,[OT UA REG 2013]
,[OT UA REG 2012]
,[OT UA REG 2011]
,[OT UA REG 2010]
,[OT UA DONOR$ 2015]
,[OT UA DONOR$ 2014]
,[OT UA DONOR$ 2013]
,[OT UA DONOR$ 2012]
,[OT UA DONOR$ 2011]
,[OT UA DONOR$ 2010]
,[OT UA REG$ 2015]
,[OT UA REG$ 2014]
,[OT UA REG$ 2013]
,[OT UA REG$ 2012]
,[OT UA REG$ 2011]
,[OT UA REG$ 2010]
,[TO UA RFI 2015]
,[TO UA RFI 2014]
,[TO UA RFI 2013]
,[TO UA RFI 2012]
,[TO UA RFI 2011]
,[TO UA RFI 2010]
,[TO UA REG 2015]
,[TO UA REG 2014]
,[TO UA REG 2013]
,[TO UA REG 2012]
,[TO UA REG 2011]
,[TO UA REG 2010]
,[TO UA DONOR$ 2015]
,[TO UA DONOR$ 2014]
,[TO UA DONOR$ 2013]
,[TO UA DONOR$ 2012]
,[TO UA DONOR$ 2011]
,[TO UA DONOR$ 2010]
,[TO UA REG$ 2015]
,[TO UA REG$ 2014]
,[TO UA REG$ 2013]
,[TO UA REG$ 2012]
,[TO UA REG$ 2011]
,[TO UA REG$ 2010]
,[VA UA RFI 2015]
,[VA UA RFI 2014]
,[VA UA RFI 2013]
,[VA UA RFI 2012]
,[VA UA RFI 2011]
,[VA UA RFI 2010]
,[VA UA REG 2015]
,[VA UA REG 2014]
,[VA UA REG 2013]
,[VA UA REG 2012]
,[VA UA REG 2011]
,[VA UA REG 2010]
,[VA UA DONOR$ 2015]
,[VA UA DONOR$ 2014]
,[VA UA DONOR$ 2013]
,[VA UA DONOR$ 2012]
,[VA UA DONOR$ 2011]
,[VA UA DONOR$ 2010]
,[VA UA REG$ 2015]
,[VA UA REG$ 2014]
,[VA UA REG$ 2013]
,[VA UA REG$ 2012]
,[VA UA REG$ 2011]
,[VA UA REG$ 2010]
)
SELECT x.[Run_Date]

      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Calgary UA%' then x.[RFI] else 0 end) as 'CA UA RFI 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Calgary UA%' then x.[RFI] else 0 end) as 'CA UA RFI 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Calgary UA%' then x.[RFI] else 0 end) as 'CA UA RFI 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Calgary UA%' then x.[RFI] else 0 end) as 'CA UA RFI 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Calgary UA%' then x.[RFI] else 0 end) as 'CA UA RFI 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Calgary UA%' then x.[RFI] else 0 end) as 'CA UA RFI 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Calgary UA%' then x.[Participant] else 0 end) as 'CA UA REG 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Calgary UA%' then x.[Participant] else 0 end) as 'CA UA REG 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Calgary UA%' then x.[Participant] else 0 end) as 'CA UA REG 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Calgary UA%' then x.[Participant] else 0 end) as 'CA UA REG 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Calgary UA%' then x.[Participant] else 0 end) as 'CA UA REG 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Calgary UA%' then x.[Participant] else 0 end) as 'CA UA REG 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Calgary UA%' then x.[Donations_Amt] else 0 end) as 'CA UA DONOR$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Calgary UA%' then x.[Donations_Amt] else 0 end) as 'CA UA DONOR$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Calgary UA%' then x.[Donations_Amt] else 0 end) as 'CA UA DONOR$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Calgary UA%' then x.[Donations_Amt] else 0 end) as 'CA UA DONOR$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Calgary UA%' then x.[Donations_Amt] else 0 end) as 'CA UA DONOR$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Calgary UA%' then x.[Donations_Amt] else 0 end) as 'CA UA DONOR$ 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Calgary UA%' then x.[Reg_Amt] else 0 end) as 'CA UA REG$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Calgary UA%' then x.[Reg_Amt] else 0 end) as 'CA UA REG$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Calgary UA%' then x.[Reg_Amt] else 0 end) as 'CA UA REG$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Calgary UA%' then x.[Reg_Amt] else 0 end) as 'CA UA REG$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Calgary UA%' then x.[Reg_Amt] else 0 end) as 'CA UA REG$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Calgary UA%' then x.[Reg_Amt] else 0 end) as 'CA UA REG$ 2010'

      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Edmonton UA%' then x.[RFI] else 0 end) as 'ED UA RFI 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Edmonton UA%' then x.[RFI] else 0 end) as 'ED UA RFI 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Edmonton UA%' then x.[RFI] else 0 end) as 'ED UA RFI 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Edmonton UA%' then x.[RFI] else 0 end) as 'ED UA RFI 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Edmonton UA%' then x.[RFI] else 0 end) as 'ED UA RFI 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Edmonton UA%' then x.[RFI] else 0 end) as 'ED UA RFI 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Edmonton UA%' then x.[Participant] else 0 end) as 'ED UA REG 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Edmonton UA%' then x.[Participant] else 0 end) as 'ED UA REG 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Edmonton UA%' then x.[Participant] else 0 end) as 'ED UA REG 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Edmonton UA%' then x.[Participant] else 0 end) as 'ED UA REG 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Edmonton UA%' then x.[Participant] else 0 end) as 'ED UA REG 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Edmonton UA%' then x.[Participant] else 0 end) as 'ED UA REG 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Edmonton UA%' then x.[Donations_Amt] else 0 end) as 'ED UA DONOR$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Edmonton UA%' then x.[Donations_Amt] else 0 end) as 'ED UA DONOR$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Edmonton UA%' then x.[Donations_Amt] else 0 end) as 'ED UA DONOR$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Edmonton UA%' then x.[Donations_Amt] else 0 end) as 'ED UA DONOR$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Edmonton UA%' then x.[Donations_Amt] else 0 end) as 'ED UA DONOR$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Edmonton UA%' then x.[Donations_Amt] else 0 end) as 'ED UA DONOR$ 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Edmonton UA%' then x.[Reg_Amt] else 0 end) as 'ED UA REG$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Edmonton UA%' then x.[Reg_Amt] else 0 end) as 'ED UA REG$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Edmonton UA%' then x.[Reg_Amt] else 0 end) as 'ED UA REG$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Edmonton UA%' then x.[Reg_Amt] else 0 end) as 'ED UA REG$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Edmonton UA%' then x.[Reg_Amt] else 0 end) as 'ED UA REG$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Edmonton UA%' then x.[Reg_Amt] else 0 end) as 'ED UA REG$ 2010'

      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Ottawa UA%' then x.[RFI] else 0 end) as 'OT UA RFI 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Ottawa UA%' then x.[RFI] else 0 end) as 'OT UA RFI 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Ottawa UA%' then x.[RFI] else 0 end) as 'OT UA RFI 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Ottawa UA%' then x.[RFI] else 0 end) as 'OT UA RFI 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Ottawa UA%' then x.[RFI] else 0 end) as 'OT UA RFI 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Ottawa UA%' then x.[RFI] else 0 end) as 'OT UA RFI 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Ottawa UA%' then x.[Participant] else 0 end) as 'OT UA REG 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Ottawa UA%' then x.[Participant] else 0 end) as 'OT UA REG 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Ottawa UA%' then x.[Participant] else 0 end) as 'OT UA REG 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Ottawa UA%' then x.[Participant] else 0 end) as 'OT UA REG 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Ottawa UA%' then x.[Participant] else 0 end) as 'OT UA REG 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Ottawa UA%' then x.[Participant] else 0 end) as 'OT UA REG 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Ottawa UA%' then x.[Donations_Amt] else 0 end) as 'OT UA DONOR$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Ottawa UA%' then x.[Donations_Amt] else 0 end) as 'OT UA DONOR$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Ottawa UA%' then x.[Donations_Amt] else 0 end) as 'OT UA DONOR$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Ottawa UA%' then x.[Donations_Amt] else 0 end) as 'OT UA DONOR$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Ottawa UA%' then x.[Donations_Amt] else 0 end) as 'OT UA DONOR$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Ottawa UA%' then x.[Donations_Amt] else 0 end) as 'OT UA DONOR$ 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Ottawa UA%' then x.[Reg_Amt] else 0 end) as 'OT UA REG$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Ottawa UA%' then x.[Reg_Amt] else 0 end) as 'OT UA REG$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Ottawa UA%' then x.[Reg_Amt] else 0 end) as 'OT UA REG$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Ottawa UA%' then x.[Reg_Amt] else 0 end) as 'OT UA REG$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Ottawa UA%' then x.[Reg_Amt] else 0 end) as 'OT UA REG$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Ottawa UA%' then x.[Reg_Amt] else 0 end) as 'OT UA REG$ 2010'

      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Toronto UA%' then x.[RFI] else 0 end) as 'TO UA RFI 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Toronto UA%' then x.[RFI] else 0 end) as 'TO UA RFI 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Toronto UA%' then x.[RFI] else 0 end) as 'TO UA RFI 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Toronto UA%' then x.[RFI] else 0 end) as 'TO UA RFI 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Toronto UA%' then x.[RFI] else 0 end) as 'TO UA RFI 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Toronto UA%' then x.[RFI] else 0 end) as 'TO UA RFI 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Toronto UA%' then x.[Participant] else 0 end) as 'TO UA REG 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Toronto UA%' then x.[Participant] else 0 end) as 'TO UA REG 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Toronto UA%' then x.[Participant] else 0 end) as 'TO UA REG 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Toronto UA%' then x.[Participant] else 0 end) as 'TO UA REG 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Toronto UA%' then x.[Participant] else 0 end) as 'TO UA REG 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Toronto UA%' then x.[Participant] else 0 end) as 'TO UA REG 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Toronto UA%' then x.[Donations_Amt] else 0 end) as 'TO UA DONOR$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Toronto UA%' then x.[Donations_Amt] else 0 end) as 'TO UA DONOR$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Toronto UA%' then x.[Donations_Amt] else 0 end) as 'TO UA DONOR$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Toronto UA%' then x.[Donations_Amt] else 0 end) as 'TO UA DONOR$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Toronto UA%' then x.[Donations_Amt] else 0 end) as 'TO UA DONOR$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Toronto UA%' then x.[Donations_Amt] else 0 end) as 'TO UA DONOR$ 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Toronto UA%' then x.[Reg_Amt] else 0 end) as 'TO UA REG$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Toronto UA%' then x.[Reg_Amt] else 0 end) as 'TO UA REG$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Toronto UA%' then x.[Reg_Amt] else 0 end) as 'TO UA REG$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Toronto UA%' then x.[Reg_Amt] else 0 end) as 'TO UA REG$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Toronto UA%' then x.[Reg_Amt] else 0 end) as 'TO UA REG$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Toronto UA%' then x.[Reg_Amt] else 0 end) as 'TO UA REG$ 2010'

      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Vancouver UA%' then x.[RFI] else 0 end) as 'VA UA RFI 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Vancouver UA%' then x.[RFI] else 0 end) as 'VA UA RFI 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver UA%' then x.[RFI] else 0 end) as 'VA UA RFI 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Vancouver UA%' then x.[RFI] else 0 end) as 'VA UA RFI 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Vancouver UA%' then x.[RFI] else 0 end) as 'VA UA RFI 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Vancouver UA%' then x.[RFI] else 0 end) as 'VA UA RFI 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Vancouver UA%' then x.[Participant] else 0 end) as 'VA UA REG 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Vancouver UA%' then x.[Participant] else 0 end) as 'VA UA REG 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver UA%' then x.[Participant] else 0 end) as 'VA UA REG 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Vancouver UA%' then x.[Participant] else 0 end) as 'VA UA REG 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Vancouver UA%' then x.[Participant] else 0 end) as 'VA UA REG 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Vancouver UA%' then x.[Participant] else 0 end) as 'VA UA REG 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Vancouver UA%' then x.[Donations_Amt] else 0 end) as 'VA UA DONOR$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Vancouver UA%' then x.[Donations_Amt] else 0 end) as 'VA UA DONOR$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver UA%' then x.[Donations_Amt] else 0 end) as 'VA UA DONOR$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Vancouver UA%' then x.[Donations_Amt] else 0 end) as 'VA UA DONOR$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Vancouver UA%' then x.[Donations_Amt] else 0 end) as 'VA UA DONOR$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Vancouver UA%' then x.[Donations_Amt] else 0 end) as 'VA UA DONOR$ 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Vancouver UA%' then x.[Reg_Amt] else 0 end) as 'VA UA REG$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Vancouver UA%' then x.[Reg_Amt] else 0 end) as 'VA UA REG$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver UA%' then x.[Reg_Amt] else 0 end) as 'VA UA REG$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Vancouver UA%' then x.[Reg_Amt] else 0 end) as 'VA UA REG$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Vancouver UA%' then x.[Reg_Amt] else 0 end) as 'VA UA REG$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Vancouver UA%' then x.[Reg_Amt] else 0 end) as 'VA UA REG$ 2010'


      FROM (
SELECT [Run_Da]
      ,[Run_Date]
      ,[Event_Code]
      ,[Event_Name]
      ,[RFI]
      ,[Walker]
      ,[Rider]
      ,[Participant]
      ,[Crew]
      ,[Reg_Amt]
      ,[Donations_Amt]
  FROM [CFScott].[dbo].[ops_report]
) as x
GROUP BY x.[Run_Date]
ORDER BY x.[Run_Date]


TRUNCATE TABLE [CFScott].[dbo].[koi_master_hero]
INSERT INTO [CFScott].[dbo].[koi_master_hero] (
[Run_Date]
,[LA CCH RFI 2015]
,[LA CCH RFI 2014]
,[LA CCH RFI 2013]
,[LA CCH RFI 2012]
,[LA CCH RFI 2011]
,[LA CCH RFI 2010]
,[LA CCH REG 2015]
,[LA CCH REG 2014]
,[LA CCH REG 2013]
,[LA CCH REG 2012]
,[LA CCH REG 2011]
,[LA CCH REG 2010]
,[LA CCH DONOR$ 2015]
,[LA CCH DONOR$ 2014]
,[LA CCH DONOR$ 2013]
,[LA CCH DONOR$ 2012]
,[LA CCH DONOR$ 2011]
,[LA CCH DONOR$ 2010]
,[LA CCH REG$ 2015]
,[LA CCH REG$ 2014]
,[LA CCH REG$ 2013]
,[LA CCH REG$ 2012]
,[LA CCH REG$ 2011]
,[LA CCH REG$ 2010]
,[VA CCH RFI 2015]
,[VA CCH RFI 2014]
,[VA CCH RFI 2013]
,[VA CCH RFI 2012]
,[VA CCH RFI 2011]
,[VA CCH RFI 2010]
,[VA CCH REG 2015]
,[VA CCH REG 2014]
,[VA CCH REG 2013]
,[VA CCH REG 2012]
,[VA CCH REG 2011]
,[VA CCH REG 2010]
,[VA CCH DONOR$ 2015]
,[VA CCH DONOR$ 2014]
,[VA CCH DONOR$ 2013]
,[VA CCH DONOR$ 2012]
,[VA CCH DONOR$ 2011]
,[VA CCH DONOR$ 2010]
,[VA CCH REG$ 2015]
,[VA CCH REG$ 2014]
,[VA CCH REG$ 2013]
,[VA CCH REG$ 2012]
,[VA CCH REG$ 2011]
,[VA CCH REG$ 2010]
)
SELECT x.[Run_Date]

      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Los Angeles CCH%' then x.[RFI] else 0 end) as 'LA CCH RFI 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Los Angeles CCH%' then x.[RFI] else 0 end) as 'LA CCH RFI 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Los Angeles CCH%' then x.[RFI] else 0 end) as 'LA CCH RFI 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Los Angeles CCH%' then x.[RFI] else 0 end) as 'LA CCH RFI 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Los Angeles CCH%' then x.[RFI] else 0 end) as 'LA CCH RFI 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Los Angeles CCH%' then x.[RFI] else 0 end) as 'LA CCH RFI 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Los Angeles CCH%' then x.[Participant] else 0 end) as 'LA CCH REG 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Los Angeles CCH%' then x.[Participant] else 0 end) as 'LA CCH REG 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Los Angeles CCH%' then x.[Participant] else 0 end) as 'LA CCH REG 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Los Angeles CCH%' then x.[Participant] else 0 end) as 'LA CCH REG 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Los Angeles CCH%' then x.[Participant] else 0 end) as 'LA CCH REG 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Los Angeles CCH%' then x.[Participant] else 0 end) as 'LA CCH REG 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Los Angeles CCH%' then x.[Donations_Amt] else 0 end) as 'LA CCH DONOR$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Los Angeles CCH%' then x.[Donations_Amt] else 0 end) as 'LA CCH DONOR$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Los Angeles CCH%' then x.[Donations_Amt] else 0 end) as 'LA CCH DONOR$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Los Angeles CCH%' then x.[Donations_Amt] else 0 end) as 'LA CCH DONOR$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Los Angeles CCH%' then x.[Donations_Amt] else 0 end) as 'LA CCH DONOR$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Los Angeles CCH%' then x.[Donations_Amt] else 0 end) as 'LA CCH DONOR$ 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Los Angeles CCH%' then x.[Reg_Amt] else 0 end) as 'LA CCH REG$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Los Angeles CCH%' then x.[Reg_Amt] else 0 end) as 'LA CCH REG$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Los Angeles CCH%' then x.[Reg_Amt] else 0 end) as 'LA CCH REG$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Los Angeles CCH%' then x.[Reg_Amt] else 0 end) as 'LA CCH REG$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Los Angeles CCH%' then x.[Reg_Amt] else 0 end) as 'LA CCH REG$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Los Angeles CCH%' then x.[Reg_Amt] else 0 end) as 'LA CCH REG$ 2010'

      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Vancouver CH%' then x.[RFI] else 0 end) as 'VA CCH RFI 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Vancouver CH%' then x.[RFI] else 0 end) as 'VA CCH RFI 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver CH%' then x.[RFI] else 0 end) as 'VA CCH RFI 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Vancouver CH%' then x.[RFI] else 0 end) as 'VA CCH RFI 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Vancouver CH%' then x.[RFI] else 0 end) as 'VA CCH RFI 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Vancouver CH%' then x.[RFI] else 0 end) as 'VA CCH RFI 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Vancouver CH%' then x.[Participant] else 0 end) as 'VA CCH REG 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Vancouver CH%' then x.[Participant] else 0 end) as 'VA CCH REG 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver CH%' then x.[Participant] else 0 end) as 'VA CCH REG 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Vancouver CH%' then x.[Participant] else 0 end) as 'VA CCH REG 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Vancouver CH%' then x.[Participant] else 0 end) as 'VA CCH REG 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Vancouver CH%' then x.[Participant] else 0 end) as 'VA CCH REG 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Vancouver CH%' then x.[Donations_Amt] else 0 end) as 'VA CCH DONOR$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Vancouver CH%' then x.[Donations_Amt] else 0 end) as 'VA CCH DONOR$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver CH%' then x.[Donations_Amt] else 0 end) as 'VA CCH DONOR$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Vancouver CH%' then x.[Donations_Amt] else 0 end) as 'VA CCH DONOR$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Vancouver CH%' then x.[Donations_Amt] else 0 end) as 'VA CCH DONOR$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Vancouver CH%' then x.[Donations_Amt] else 0 end) as 'VA CCH DONOR$ 2010'
      ,SUM(case when x.[Event_Name] like '2015%' and x.[Event_Name] like '%Vancouver CH%' then x.[Reg_Amt] else 0 end) as 'VA CCH REG$ 2015'
      ,SUM(case when x.[Event_Name] like '2014%' and x.[Event_Name] like '%Vancouver CH%' then x.[Reg_Amt] else 0 end) as 'VA CCH REG$ 2014'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver CH%' then x.[Reg_Amt] else 0 end) as 'VA CCH REG$ 2013'
      ,SUM(case when x.[Event_Name] like '2012%' and x.[Event_Name] like '%Vancouver CH%' then x.[Reg_Amt] else 0 end) as 'VA CCH REG$ 2012'
      ,SUM(case when x.[Event_Name] like '2011%' and x.[Event_Name] like '%Vancouver CH%' then x.[Reg_Amt] else 0 end) as 'VA CCH REG$ 2011'
      ,SUM(case when x.[Event_Name] like '2010%' and x.[Event_Name] like '%Vancouver CH%' then x.[Reg_Amt] else 0 end) as 'VA CCH REG$ 2010'


      FROM (
SELECT [Run_Da]
      ,[Run_Date]
      ,[Event_Code]
      ,[Event_Name]
      ,[RFI]
      ,[Walker]
      ,[Rider]
      ,[Participant]
      ,[Crew]
      ,[Reg_Amt]
      ,[Donations_Amt]
  FROM [CFScott].[dbo].[ops_report]
) as x
GROUP BY x.[Run_Date]
ORDER BY x.[Run_Date]