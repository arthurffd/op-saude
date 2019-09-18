use [dw-op-saude-01]
go

CREATE USER loaderdw001 FOR LOGIN loaderdw001;
GRANT CONTROL ON DATABASE::[DW-OP-SAUDE-01] to loaderdw001;
EXEC sp_addrolemember 'staticrc60', 'loaderdw001';

CREATE LOGIN loaderdw001 WITH PASSWORD = 'Sapiens2019!';
CREATE USER loaderdw001 FOR LOGIN loaderdw001;


CREATE MASTER KEY
go

CREATE SCHEMA ext
go

CREATE DATABASE SCOPED CREDENTIAL ADLSCredential
WITH
    IDENTITY = '35db8ed1-865e-4e1e-8a15-e48695ef787e@https://login.microsoftonline.com/893644dc-5968-475b-a33a-8f27ba9efee0/oauth2/token',
    SECRET = '_-Ydv=:JDuf7F4NS2gZDmhqE6+jjI1+q' 
go	



CREATE EXTERNAL DATA SOURCE AzureDataLakeStorage
WITH (
    TYPE = HADOOP,
    LOCATION = 'adl://arthurffd001dlk.azuredatalakestore.net',
    CREDENTIAL = ADLSCredential
)
go


CREATE EXTERNAL FILE FORMAT TextFileFormat
WITH
(   FORMAT_TYPE = DELIMITEDTEXT
,    FORMAT_OPTIONS    (   FIELD_TERMINATOR = ';'
                    ,    STRING_DELIMITER = '"'
                    ,    DATE_FORMAT         = 'yyyy-MM-dd HH:mm:ss.fff'
                    ,    USE_TYPE_DEFAULT = FALSE
                    )
)
go
