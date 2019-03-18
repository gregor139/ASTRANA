

USE [A_GLO_806];

DELETE FROM glo.A_GLO_806_T924_MailGroup;
INSERT INTO glo.A_GLO_806_T924_MailGroup(MailGroup_KEY,MailGroupName, DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (1,'DWHStandard', getdate(), null);
INSERT INTO glo.A_GLO_806_T924_MailGroup(MailGroup_KEY,MailGroupName, DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (2,'DWHOperators', getdate(), null);

