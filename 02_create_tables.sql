use [dw-op-saude-01]
go

CREATE EXTERNAL TABLE [dbo].[DimEmpresa_ext] (
			"NUM_EMPRESA" bigint not null, 
			"NOME_EMPRESA" [nvarchar](150) not null, 
			"RAZAO_SOCIAL" [nvarchar](150) not null, 
			"CNPJ" [nvarchar](14)
)
WITH
(
    LOCATION='/dimEmpresa/ExtDim-Empresa.csv'
,   DATA_SOURCE = AzureDataLakeStorage
,   FILE_FORMAT = TextFileFormat
,   REJECT_TYPE = VALUE
,   REJECT_VALUE = 0
)
go

--drop table [dbo].DimEmpresa;
CREATE TABLE [dbo].DimEmpresa
(
			"NUM_EMPRESA" bigint not null, 
			"NOME_EMPRESA" [nvarchar](150) not null, 
			"RAZAO_SOCIAL" [nvarchar](150) not null, 
			"CNPJ" [nvarchar](14)
)
WITH (DISTRIBUTION = HASH([NUM_EMPRESA])) 
go




CREATE EXTERNAL FILE FORMAT TextFileFormatv2
WITH
(   FORMAT_TYPE = DELIMITEDTEXT
,    FORMAT_OPTIONS    (   FIELD_TERMINATOR = ';'
                    ,    STRING_DELIMITER = '"'
                    ,    DATE_FORMAT         = 'dd/MM/yyyy'
                    ,    USE_TYPE_DEFAULT = FALSE
                    )
)
go


CREATE EXTERNAL TABLE [dbo].[DimPrestador_ext] (
	COD_PRESTADOR bigint not null,
	NOME_FANTASIA nvarchar(150),
	NOME_COMPLETO nvarchar(150),
	COD_CRM nvarchar(50),
	UF_CRM nvarchar(150),
	DAT_NASCIMENTO date,
	NUM_CPF nvarchar(20),
	NUM_CNPJ nvarchar(20),
	TIPO_PRESTADOR  nvarchar(50),
	GRUPO_PRESTADOR nvarchar(50),
	SITUACAO nvarchar(50),
	DESC_ESPECIALIDADE nvarchar(50),
	ESPECIALIDADE_PRINCIPAL nvarchar(50),
	IND_GUIA_MEDICO nvarchar(50),
	DESC_AREA_ATUACAO nvarchar(150),
	AREA_ATUACAO_PRINCIPAL nvarchar(50),
	TIPO_ENDERECO nvarchar(50),
	FINALIDADE_ENDERECO nvarchar(150),
	LOGRADOURO nvarchar(150),
	NUMERO nvarchar(50),
	COMPLEMENTO nvarchar(150),
	BAIRRO nvarchar(150),
	CIDADE nvarchar(150),
	ESTADO nvarchar(50),
	CEP nvarchar(20),
	END_NR_LATITUDE nvarchar(150),
	END_NR_LONGITUDE nvarchar(150),
	IMPRIMIR_GUIA_MEDICO nvarchar(20),
	CON_NRO_TEL nvarchar(20),
	CON_NRO_FAX nvarchar(20),
	CON_NRO_CEL nvarchar(20),
	CON_DES_EMAIL nvarchar(20),
	CNAES nvarchar(20)
)
WITH
(
    LOCATION='/dimPrestador/ExtDim-Prestador.csv'
,   DATA_SOURCE = AzureDataLakeStorage
,   FILE_FORMAT = TextFileFormatv2
,   REJECT_TYPE = VALUE
,   REJECT_VALUE = 0
)
go




CREATE TABLE [dbo].DimPrestador
(
	COD_PRESTADOR bigint not null,
	NOME_FANTASIA nvarchar(150),
	NOME_COMPLETO nvarchar(150),
	COD_CRM nvarchar(50),
	UF_CRM nvarchar(150),
	DAT_NASCIMENTO date,
	NUM_CPF nvarchar(20),
	NUM_CNPJ nvarchar(20),
	TIPO_PRESTADOR  nvarchar(50),
	GRUPO_PRESTADOR nvarchar(50),
	SITUACAO nvarchar(50),
	DESC_ESPECIALIDADE nvarchar(50),
	ESPECIALIDADE_PRINCIPAL nvarchar(50),
	IND_GUIA_MEDICO nvarchar(50),
	DESC_AREA_ATUACAO nvarchar(150),
	AREA_ATUACAO_PRINCIPAL nvarchar(50),
	TIPO_ENDERECO nvarchar(50),
	FINALIDADE_ENDERECO nvarchar(150),
	LOGRADOURO nvarchar(150),
	NUMERO nvarchar(50),
	COMPLEMENTO nvarchar(150),
	BAIRRO nvarchar(150),
	CIDADE nvarchar(150),
	ESTADO nvarchar(50),
	CEP nvarchar(20),
	END_NR_LATITUDE nvarchar(150),
	END_NR_LONGITUDE nvarchar(150),
	IMPRIMIR_GUIA_MEDICO nvarchar(20),
	CON_NRO_TEL nvarchar(20),
	CON_NRO_FAX nvarchar(20),
	CON_NRO_CEL nvarchar(20),
	CON_DES_EMAIL nvarchar(20),
	CNAES nvarchar(20)
)
WITH (DISTRIBUTION = HASH(COD_PRESTADOR)) 
go