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
Last Updates:  2019/09/22 <br />
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
- "arthurffd001dlk" - "Data Lake Storage Gen1": contém os arquivos originais que foram processados e carregados no Data Lake. Selecione Data Explorer para visualizar os arquivos carregados. É possível realizar análises sobre os arquivos originais carregados, como fizemos com Python utilizando Jupyter Notebook.<br /><br />
- "arthurffd001dlkanalytics" - "Data Lake Analytics": permite realizar análises e executar scripts em cima dos arquivos do DataLake; <br /><br />
- ~~"DW-OP-SAUDE-01 (server-arthurfd001/DW-OP-SAUDE-01)" - "SQL data warehouse": Banco de Dados - Data Warehouse contendo as tabelas finais (fatos e dimensões) para análises de BI. Contém também os dados do servidor SQL Server.~~  O Data Warehouse está pausado no Azure e devido ao alto custo, no lugar iremos utilizar um banco de dados SQL Server do Azure.<br /><br />
- "SQL_DB_arthurffd001" - "SQL Database": Banco de dados SQL Server dentro do Azure cloud. Contém as tabelas finais (fatos e dimensões) para análises de BI
<br /><br />
- "OP-Saude" - "Data factory (V2)": Data Factory contém o pipeline com todo o fluxo de dados, desde carregar o arquivo de origem até armazenar na tabela final de DW. Selecione "Author and Monitor" para visualizar o pipeline. <br />
![data_factory_pipelines](data_factory_pipelines.png?raw=true "GET")<br/><br />
![pipeline_executions](pipeline_executions.png?raw=true "GET")<br/><br />
![pipeline_detail](pipeline_detail.png?raw=true "GET")
<br /><br />

### SQL Server (Data warehouse):
DW Database Server:<br />
servidor: server-arthurfd001.database.windows.net<br />
database: SQL_DB_arthurffd001 <br />
usuario: loaderdw001 <br />
senha:  Sapiens2019! <br />

## Tabelas
- Tabelas Dimensoes:<br />
	- Empresa (carregada)
	- Prestador (carregada)
	- Beneficiario (carregada)
	- Consultas (pendente)
	- Procedimentos (pendente)
	- Diarias (pendente)
	- Pacotes (pendente)
 <br />
 
- Tabelas Fatos:<br />
	- Custos (carregada)
	- Receitas (pendente) 
	- Vidas  (pendente)
<br />

- Scripts banco de dados:<br />
	- 01_create_access_objects
	- 02_create_tables
<br /><br />
![sql_db](sql_db.png?raw=true "GET")
<br /><br />

## Análises
Na camada de Data Lake é possível realizar análises exploratórias nos arquivos originais carregados. 
Neste caso, o arquivo DLK_Analysis_Files_001 (Jupyter Notebook e tbm script Python) contém uma análise exploratória simples utilizando a biblioteca Pandas.
<br />
![datalake](datalake.png?raw=true "GET")
<br /><br />
![Jupyter_pandas_analysis](Jupyter_pandas_analysis.png?raw=true "GET")
<br /><br />

## Relatórios
Na camada de visualização, teriamos os relatórios sugeridos abaixo, a serem criados a no Power BI (pendente).<br />
Os dados seriam lidos a partir das tabelas finais do Data WareHouse, porém existe também a possibilidade de gerar relatórios com os dados brutos a partir do Data Lake, para ajudar em analises exploratórias.<br />
<br />

### Beneficiários alta utilização:
- Arquivo Power BI: "beneficiarios_custos.pbix" ou  export em PDF: "beneficiarios_custos.pdf"
- Somar custos por beneficiario por periodo (trimestre), reportar os que ultrapassem um certo valor de threshold para investigação para investigar fraudes;
- Grafico de colunas (beneficiario), ordenado por valor decrescente, uma linha indicando qual o valor de threshold (média de custos).
<br /><br />
![powerbi_custos.png](powerbi_custos.png?raw=true "GET") 
<br /><br />

### Prestadores com excesso de atendimentos / procedimentos (pendente):
- Somar valores por prestadores, por periodo (mensal), reportar os que ultrapassem um certo valor de threshold para investigação de fraude;
- Grafico de colunas (prestador), ordenado por valor decrescente, uma linha indicando qual o valor de threshold.

### Tendencia de Receita por empresas (pendente):
- Analisar tendencia de aumento ou queda da receita por empresa (trending, predicção simples). 
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
