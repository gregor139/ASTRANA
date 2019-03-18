

USE [A_GLO_806];

DELETE FROM glo.A_GLO_806_T911_Area;
INSERT INTO glo.A_GLO_806_T911_Area(Area_KEY,AreaName,AreaDescription,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (1,'GLO','Fachbereichsübergreifend', getdate(), null);
INSERT INTO glo.A_GLO_806_T911_Area(Area_KEY,AreaName,AreaDescription,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (2,'VU','Verkehrsunfälle', getdate(), null);
INSERT INTO glo.A_GLO_806_T911_Area(Area_KEY,AreaName,AreaDescription,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (3,'IVZ','Informationssystem Verkehrszulassung', getdate(), null);
INSERT INTO glo.A_GLO_806_T911_Area(Area_KEY,AreaName,AreaDescription,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (4,'VMON','Verkehrsmonitoring', getdate(), null);
INSERT INTO glo.A_GLO_806_T911_Area(Area_KEY,AreaName,AreaDescription,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (5,'ETC','Easy Traffic Control', getdate(), null);
INSERT INTO glo.A_GLO_806_T911_Area(Area_KEY,AreaName,AreaDescription,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (6,'TDCost','Controllingsystem', getdate(), null);