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

## Relatórios
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
