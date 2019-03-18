

USE [A_GLO_806];

DELETE FROM glo.A_GLO_806_T910_Setting;
INSERT INTO glo.A_GLO_806_T910_Setting(Setting_KEY,Area_FK, SettingName,SettingValue,SettingDescription,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (100,1,'MAIL_SERVER', '-1', 'Name des Mailservers', getdate(), null);
INSERT INTO glo.A_GLO_806_T910_Setting(Setting_KEY,Area_FK, SettingName,SettingValue,SettingDescription,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (101,1,'MAIL_ABSENDER', 'ASTRANA@astra.admin.ch', 'Mailadresse des Standard-Absenders', getdate(), null);
INSERT INTO glo.A_GLO_806_T910_Setting(Setting_KEY,Area_FK, SettingName,SettingValue,SettingDescription,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (200,2,'ABFRAGE_ZEITPUNKT',CAST(getdate() as DATE),'Abfragezeitpunkt für das Corporate Memory von VU', getdate(), null);
INSERT INTO glo.A_GLO_806_T910_Setting(Setting_KEY,Area_FK, SettingName,SettingValue,SettingDescription,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (201,2,'MULTIJOB_DATUM', '-1', 'Startdatum für den ersten Job eines Multi-Jobs', getdate(), null);
INSERT INTO glo.A_GLO_806_T910_Setting(Setting_KEY,Area_FK, SettingName,SettingValue,SettingDescription,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (203,2,'IN_DIRECTORY', '-1', 'Verzeichnisname für die VU-Lieferdateien', getdate(), null);
INSERT INTO glo.A_GLO_806_T910_Setting(Setting_KEY,Area_FK, SettingName,SettingValue,SettingDescription,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (300,3,'ABFRAGE_ZEITPUNKT',CAST(getdate() as DATE),'Abfragezeitpunkt für das Corporate Memory von IVZ', getdate(), null);
INSERT INTO glo.A_GLO_806_T910_Setting(Setting_KEY,Area_FK, SettingName,SettingValue,SettingDescription,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (301,3,'MULTIJOB_DATUM', '-1', 'Startdatum für den ersten Job eines Multi-Jobs', getdate(), null);
INSERT INTO glo.A_GLO_806_T910_Setting(Setting_KEY,Area_FK, SettingName,SettingValue,SettingDescription,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (302,3,'IN_DIRECTORY', '-1', 'Verzeichnisname für die IVZ-Lieferdateien', getdate(), null);
