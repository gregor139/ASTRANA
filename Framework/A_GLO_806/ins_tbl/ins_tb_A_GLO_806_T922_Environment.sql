

USE [A_GLO_806];

DELETE FROM glo.A_GLO_806_T922_Environment;
INSERT INTO glo.A_GLO_806_T922_Environment(Environment_KEY,EnvironmentCode,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (1,'EN', getdate(), null);
INSERT INTO glo.A_GLO_806_T922_Environment(Environment_KEY,EnvironmentCode,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (2,'TE', getdate(), null);
INSERT INTO glo.A_GLO_806_T922_Environment(Environment_KEY,EnvironmentCode,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (3,'IN', getdate(), null);
INSERT INTO glo.A_GLO_806_T922_Environment(Environment_KEY,EnvironmentCode,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (4,'PR', getdate(), null);
