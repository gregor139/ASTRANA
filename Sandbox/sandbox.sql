
create database sandbox;

use sandbox;

--create schema grd authorization dbo;

CREATE TABLE SANDBOX.dbo.LT_VUM18_REFERENZEN
    (
      MAND VARCHAR(2),
      FILEPERIODE VARCHAR(8),
      REFERENZ VARCHAR(12) not null primary key,
      KATEGORIE VARCHAR(12),
      CODE_UAP VARCHAR(12),
      BESCHREIBUNG_DE VARCHAR(4000),
      BESCHREIBUNG_FR VARCHAR(4000),
      BESCHREIBUNG_IT VARCHAR(4000),
      GUELTIG_VON VARCHAR(8),
      GUELTIG_BIS VARCHAR(8),
      PRLA_ProzessLauf DECIMAL(18,0) DEFAULT 21925. ,
      PROZ_Prozess INTEGER DEFAULT 600005
	  )
;

