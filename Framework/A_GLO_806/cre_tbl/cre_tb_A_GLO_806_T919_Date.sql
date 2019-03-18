USE [A_GLO_806]
GO

if exists (select 1
from sysobjects
where name = 'A_GLO_806_T919_Date'
and type = 'U')
drop table [glo].A_GLO_806_T919_Date
go

/*==============================================================*/
/* Table: E_GLO_806_DIM_T001_DATUM */
/*==============================================================*/
create table [glo].[A_GLO_806_T919_Date] (
Date_Key int not null,
Jahr int null,
Quartal int null,
MonatNr int null,
MonatName varchar(40) null,
WocheNr int null,
WochentagName varchar(40) null,
Datum datetime null,
TagImJahr int null,
TagImQuartal int null,
TagImMonat int null,
TagInWoche int null,
WochentagArt varchar(40) null,
Feiertag_CH_J_N varchar(40) null,
Sprache char(2) null,
DWH_INS_AUDIT_DT datetime null,
DWH_INS_AUDIT_ID int null,
DWH_UPD_AUDIT_DT datetime null,
DWH_UPD_AUDIT_ID datetime null,
constraint PK_E_GLO_806_DIM_T001_DATUM primary key (Date_Key)
)
go
