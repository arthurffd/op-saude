# Desafio Tecnico Softplan
Este é o projeto de desafio ténico da Sofplan 2019.<br />
O desafio consiste em duas etapas, sendo a primeira um desenho arquitetural e a segunda uma atividade de implementação de acordo com a especificação <br />

## Purpose: 
  this document contains necessary information to run the application and explain the purposes and expected results.<br />
<br />
Customer: Sofplan <br />
Developer: Arthur Flores Duarte <br />
<br />
Created Date: 2019/09/18 <br />
Last Updates:  <br />
<br /><br />

## Arquitetura:
Este projeto foi idealizado seguindo padrões de arquitetura de dados sugeridos pela Microsoft Azure, conforme imagem a seguir:<br /><br />
![Data_Architecture_overview](Data_Architecture_overview.jpg?raw=true "GET")

<br /><br />
![Data_Architecture_process](Data_Architecture_process.jpg?raw=true "GET")

<br /><br />

## Acessos:

### Portal Azure:
Acessar a URL: https://portal.azure.com/ <br />
usuario: softplan@arthurffdyahoocombr.onmicrosoft.com  <br />
senha: Sapiens2019! <br /><br />

#### Uma vez logado no portal azure, selecione no menu da esquerda "Grupo de Recursos" e selecione "grupo_recurso_01":
- "arthurffd001" - "Conta de armazenamento": contém os arquivos de originais armazenados em nuvem. Selecione "Blobs" e acesse "blob-opsaude-01" para visualizar os arquivos originais. <br /><br />
- "arthurffd001dlk" - "Data Lake Storage Gen1": contém os arquivos originais que foram processados e carregados no Data Lake. Selecione Data Explorer para visualizar os arquivos carregados. <br /><br />
- "arthurffd001dlkanalytics" - "Data Lake Analytics": permite realizar análises e executar scripts em cima dos arquivos do DataLake; <br /><br />
- "DW-OP-SAUDE-01 (server-arthurfd001/DW-OP-SAUDE-01)" - "SQL data warehouse": Banco de Dados - Data Warehouse contendo as tabelas finais (fatos e dimensões) para análises de BI. Contém também os dados do servidor SQL Server. <br /><br />
- "OP-Saude" - "Data factory (V2)": Data Factory contém o pipeline com todo o fluxo de dados, desde carregar o arquivo de origem até armazenar na tabela final de DW. Selecione "Author and Monitor" para visualizar o pipeline. <br /><br />


### SQL Server (Data warehouse):
DW Database Server:<br />
servidor: server-arthurfd001.database.windows.net<br />
usuario: loaderdw001 <br />
senha:  Sapiens2019! <br />


## Tabelas
- Tabelas Dimensoes:<br />
	- Empresa
	- Prestador
	- Beneficiario
	- Consultas
	- Procedimentos
	- Diarias
	- Pacotes
	
 <br />
 
- Tabelas Fatos:
	- Custos
	- Receitas
	- Vidas

<br /><br />
- Scripts utilizados para criar objetos, permissões do SQL Server - DW:
	- 01_create_access_objetcs.sql
	- 02_create_tables.sql
<br /><br />

## Relatórios
Na camada de visualização, teriamos os relatórios sugeridos abaixo, a serem criados a no Power BI (pendente).<br />
Os dados seriam lidos a partir das tabelas finais do Data WareHouse, porém existe também a possibilidade de gerar relatórios com os dados brutos a partir do Data Lake, para ajudar em analises exploratórias.<br />

### Beneficiários alta utilização (fraude):
- Somar custos por beneficiario por periodo (trimestre), reportar os que ultrapassem um certo valor de threshold para investigação, em planos sem co-participação;
- Grafico de colunas (beneficiario), ordenado por valor decrescente, uma linha indicando qual o valor de threshold. 

### Prestadores com excesso de atendimentos / procedimentos (fraude):
- Somar valores por prestadores, por periodo (mensal), reportar os que ultrapassem um certo valor de threshold para investigação;
- Grafico de colunas (prestador), ordenado por valor decrescente, uma linha indicando qual o valor de threshold.

### Tendencia de Receita por empresas:
- Analisar tendencia de aumento ou queda da receita por empresa. 
- Empresa com queda acentuada devem ser analisadas e ver o motivo da queda, e empresas com aumento possibilidade de melhorar planos ou atenção especial.
- Grafico de linha de tempo, mostrando as maiores variações de queda e outro mostrando as maiores variações de aumento.

<br /><br />
## Referências:
https://www.youtube.com/results?search_query=data+factory+power+bi

Architecture using Azure + PowerBi
https://docs.microsoft.com/en-us/azure/architecture/reference-architectures/data/enterprise-bi-adf

https://docs.microsoft.com/en-us/azure/architecture/example-scenario/data/data-warehouse

https://azure.microsoft.com/pt-br/services/data-factory/

https://www.sqlshack.com/different-azure-storage-types-file-blob-queue-table/

Connection Data Factory to Data Lake Azure (problema de conexão entre ADF e ADL):
https://causewaysolutions.com/create-azure-data-lake-linked-service/
