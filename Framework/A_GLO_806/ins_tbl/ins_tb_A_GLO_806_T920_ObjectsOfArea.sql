--select 'VALUES ('+ cast(row_number() over (order by name) as varchar(200))+',1,''A_GLO_806'',''glo'','''+name+''',''T'',''A'','+'getdate(),null);'
--from sys.tables
--where name like 'A_GLO_806_T%'
--order by name;

USE [A_GLO_806];

DELETE FROM glo.A_GLO_806_T920_ObjectsOfArea;

INSERT INTO glo.A_GLO_806_T920_ObjectsOfArea(Object_KEY,Area_FK,DatabaseName,SchemaName,ObjectName,ObjectType,LayerCode,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (1,1,'A_GLO_806','glo','A_GLO_806_T001_Language','T','A',getdate(),null);
INSERT INTO glo.A_GLO_806_T920_ObjectsOfArea(Object_KEY,Area_FK,DatabaseName,SchemaName,ObjectName,ObjectType,LayerCode,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (2,1,'A_GLO_806','glo','A_GLO_806_T002_Translation','T','A',getdate(),null);
INSERT INTO glo.A_GLO_806_T920_ObjectsOfArea(Object_KEY,Area_FK,DatabaseName,SchemaName,ObjectName,ObjectType,LayerCode,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (3,1,'A_GLO_806','glo','A_GLO_806_T802_DWH_Audit_Trace_Dtl','T','A',getdate(),null);
INSERT INTO glo.A_GLO_806_T920_ObjectsOfArea(Object_KEY,Area_FK,DatabaseName,SchemaName,ObjectName,ObjectType,LayerCode,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (4,1,'A_GLO_806','glo','A_GLO_806_T806_DWH_Audit_ProcessId','T','A',getdate(),null);
INSERT INTO glo.A_GLO_806_T920_ObjectsOfArea(Object_KEY,Area_FK,DatabaseName,SchemaName,ObjectName,ObjectType,LayerCode,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (5,1,'A_GLO_806','glo','A_GLO_806_T901_Connexion','T','A',getdate(),null);
INSERT INTO glo.A_GLO_806_T920_ObjectsOfArea(Object_KEY,Area_FK,DatabaseName,SchemaName,ObjectName,ObjectType,LayerCode,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (6,1,'A_GLO_806','glo','A_GLO_806_T902_Environment','T','A',getdate(),null);
INSERT INTO glo.A_GLO_806_T920_ObjectsOfArea(Object_KEY,Area_FK,DatabaseName,SchemaName,ObjectName,ObjectType,LayerCode,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (7,1,'A_GLO_806','glo','A_GLO_806_T903_Mailgroup','T','A',getdate(),null);
INSERT INTO glo.A_GLO_806_T920_ObjectsOfArea(Object_KEY,Area_FK,DatabaseName,SchemaName,ObjectName,ObjectType,LayerCode,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (8,1,'A_GLO_806','glo','A_GLO_806_T904_Messages','T','A',getdate(),null);
INSERT INTO glo.A_GLO_806_T920_ObjectsOfArea(Object_KEY,Area_FK,DatabaseName,SchemaName,ObjectName,ObjectType,LayerCode,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (9,1,'A_GLO_806','glo','A_GLO_806_T905_ErrorEventFact','T','A',getdate(),null);
INSERT INTO glo.A_GLO_806_T920_ObjectsOfArea(Object_KEY,Area_FK,DatabaseName,SchemaName,ObjectName,ObjectType,LayerCode,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (10,1,'A_GLO_806','glo','A_GLO_806_T906_TransportInfo','T','A',getdate(),null);
INSERT INTO glo.A_GLO_806_T920_ObjectsOfArea(Object_KEY,Area_FK,DatabaseName,SchemaName,ObjectName,ObjectType,LayerCode,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (11,1,'A_GLO_806','glo','A_GLO_806_T907_TransportISPACDestination','T','A',getdate(),null);
INSERT INTO glo.A_GLO_806_T920_ObjectsOfArea(Object_KEY,Area_FK,DatabaseName,SchemaName,ObjectName,ObjectType,LayerCode,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (12,1,'A_GLO_806','glo','A_GLO_806_T908_Version','T','A',getdate(),null);
INSERT INTO glo.A_GLO_806_T920_ObjectsOfArea(Object_KEY,Area_FK,DatabaseName,SchemaName,ObjectName,ObjectType,LayerCode,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (13,1,'A_GLO_806','glo','A_GLO_806_T909_TblAlerting','T','A',getdate(),null);
INSERT INTO glo.A_GLO_806_T920_ObjectsOfArea(Object_KEY,Area_FK,DatabaseName,SchemaName,ObjectName,ObjectType,LayerCode,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (14,1,'A_GLO_806','glo','A_GLO_806_T910_Setting','T','A',getdate(),null);
INSERT INTO glo.A_GLO_806_T920_ObjectsOfArea(Object_KEY,Area_FK,DatabaseName,SchemaName,ObjectName,ObjectType,LayerCode,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (15,1,'A_GLO_806','glo','A_GLO_806_T911_Area','T','A',getdate(),null);
INSERT INTO glo.A_GLO_806_T920_ObjectsOfArea(Object_KEY,Area_FK,DatabaseName,SchemaName,ObjectName,ObjectType,LayerCode,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (16,1,'A_GLO_806','glo','A_GLO_806_T912_Mandant','T','A',getdate(),null);
INSERT INTO glo.A_GLO_806_T920_ObjectsOfArea(Object_KEY,Area_FK,DatabaseName,SchemaName,ObjectName,ObjectType,LayerCode,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (17,1,'A_GLO_806','glo','A_GLO_806_T913_Job','T','A',getdate(),null);
INSERT INTO glo.A_GLO_806_T920_ObjectsOfArea(Object_KEY,Area_FK,DatabaseName,SchemaName,ObjectName,ObjectType,LayerCode,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (18,1,'A_GLO_806','glo','A_GLO_806_T914_Task','T','A',getdate(),null);
INSERT INTO glo.A_GLO_806_T920_ObjectsOfArea(Object_KEY,Area_FK,DatabaseName,SchemaName,ObjectName,ObjectType,LayerCode,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (19,1,'A_GLO_806','glo','A_GLO_806_T915_Screen','T','A',getdate(),null);
INSERT INTO glo.A_GLO_806_T920_ObjectsOfArea(Object_KEY,Area_FK,DatabaseName,SchemaName,ObjectName,ObjectType,LayerCode,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (20,1,'A_GLO_806','glo','A_GLO_806_T916_ErrorEvent','T','A',getdate(),null);
INSERT INTO glo.A_GLO_806_T920_ObjectsOfArea(Object_KEY,Area_FK,DatabaseName,SchemaName,ObjectName,ObjectType,LayerCode,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (21,1,'A_GLO_806','glo','A_GLO_806_T917_ErrorDetail','T','A',getdate(),null);
INSERT INTO glo.A_GLO_806_T920_ObjectsOfArea(Object_KEY,Area_FK,DatabaseName,SchemaName,ObjectName,ObjectType,LayerCode,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (22,1,'A_GLO_806','glo','A_GLO_806_T918_Log','T','A',getdate(),null);
INSERT INTO glo.A_GLO_806_T920_ObjectsOfArea(Object_KEY,Area_FK,DatabaseName,SchemaName,ObjectName,ObjectType,LayerCode,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (23,1,'A_GLO_806','glo','A_GLO_806_T919_Date','T','A',getdate(),null);
INSERT INTO glo.A_GLO_806_T920_ObjectsOfArea(Object_KEY,Area_FK,DatabaseName,SchemaName,ObjectName,ObjectType,LayerCode,DWH_INS_Audit_DT,DWH_UPD_Audit_DT)
VALUES (24,1,'A_GLO_806','glo','A_GLO_806_T920_ObjectsOfArea','T','A',getdate(),null);
