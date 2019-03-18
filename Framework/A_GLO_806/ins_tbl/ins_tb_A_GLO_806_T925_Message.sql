

USE [A_GLO_806];

DELETE FROM glo.A_GLO_806_T925_Message;
INSERT INTO glo.A_GLO_806_T925_Message(Message_KEY,MailGroup_FK,Area_FK,MessageCode,MessageType,IsEnabled, DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (1,1,1,'A_GLO_806_UNKNOWN_ERROR','E',1, getdate(), null);


