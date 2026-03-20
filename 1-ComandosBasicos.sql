

/*
AULA 01 - INSTALAÇÃO VSCODE + SSM SQL SERVER

AULA 02 - SELECT 

SELECT * FROM person.Person;
SELECT Title FROM person.person;
SELECT * FROM person.EmailAddress;

---------- DESAFIO -------------
01) A EQUIPE DE MARKETING PRECISA DE FAZER UMA PESQUISA SOBRE NOMES MAIS COMUNS DE SUES CLIENTES E PRECISA DO NOME E 
SOBRENOME DE TODOS OS CLIENTES QUE ESÃO CADASTRADOS NO SISTEMA.

RESPOSTA:
SELECT FirstName, LastName FROM Person.Person;
*/

/*
AULA 03 - DISTINCT

select * from Person.Person;
DISTINCT - REMOVE INFORMAÇÕES DUPLICADAS (NOME, IDADE, PAIS, ETC)  

SELECT FirstName from person.Person;			-- traz todos os nomes da tabela Person que deu total de 19972 linhas
SELECT DISTINCT FirstName FROM person.Person;	-- com o distinct ele traz os nomes sem repetições apena uma vez total 1018 linhas

---------- DESAFIO -------------
01) QUANTOS NOMES OBRENOMES ÚNICOS TEMOS EM NOSSA TABELA PERSON.PERSON?

RESPOSTA:
SELECT * FROM Person.Person;
SELECT DISTINCT FirstName FROM person.Person;		-- temos total de 1018 nomes unicos
SELECT DISTINCT LastName FROM person.person;		-- temos total de 1206 sobrenomes unicos
*/

/*
AULA 04 - WHERE 
WHERE
operadores (=, >, <, >=, <=, <>, AND, OR)
select * from Person.Person;

SELECT * FROM Person.Person
WHERE LastName = 'miller' and FirstName = 'Anna'; 

SELECT * FROM Production.Product
WHERE Color = 'blue' or Color = 'black';
WHERE ListPrice > 1500;
WHERE ListPrice > 1500 and ListPrice < 5000; 
WHERE Color <> 'red';

---------- DESAFIO -------------
01) A EQUIPE DE PRODUÇÃO DE PRODUTOS PRECISA DO NOME DE TODAS AS PEÇAS QUE PESAM MAIS QUE 500kg MAS NÃO MAIS QUE 
700kg PARA INSPEÇÃO.

RESPOSTA 1:
SELECT Name FROM Production.Product
WHERE Weight > 500 and Weight <= 700;
	------------------------------------	
RESPOSTA 2:
SELECT Name FROM Production.Product
WHERE Weight BETWEEN 500 AND 700;


02) FOI PEDIDO PELO MARKETING UMA RELAÇÃO DE TODOS OS EMPREGADOS (employee) QUE SÃO CASADOS (single = solteiro, 
marrid = casado) E SÃO ASALARIADOS (salarid)

R:	SELECT * FROM HumanResources.Employee
	WHERE MaritalStatus = 'M' AND SalariedFlag = 1;

03) UM USUÁRIO CHAMADO PETER KREBS ESTÁ DEVENDO UM PAGAMENTO, CONSIGA O EMAIL DELE PARA QUE POSSAMEOS ENVIAR UMA
COBRANÇA!
(você vai ter que usar a tabela person.person e depois a tabela person.emailaddress)

R:	SELECT * FROM Person.Person
	WHERE FirstName = 'Peter' AND LastName = 'Krebs';

	(BusinessEntityID = 26)

	SELECT * FROM Person.EmailAddress
	WHERE BusinessEntityID = 26;

	EmailAddress (peter0@adventure-works.com)
*/

/*
AULA 05 - COUNT 

SELECT COUNT(*) FROM Person.Person;
SELECT COUNT(Title) FROM Person.Person;
SELECT COUNT(DISTINCT TITLE) FROM Person.Person;

---------- DESAFIO -------------
TABELA -> SELECT * FROM Production.Product;

01) QUERO SABER QUANTOS PRODUTOS TEMOS CADASTRADOS EM NOSSA TABELA DE PRODUTOS (production.product)

RESPOSTA:
SELECT COUNT(*) FROM Production.Product;
504 PRODUTOS CADASTRADOS

02) QUERO SABER QUANTOS TAMANHOS DE PRODUTOS TEMOS CADASTRADO EM NOSSA TABELA (production.product)

RSPOSTA:
SELECT COUNT(size) FROM Production.Product;
--211 TAMANHOS CADASTRADOS


03) QUERO SABER QUANTOS TAMANHOS DIFERENTES DE PRODUTOS EU TENHO CADASTRADO EM NOSSA TABELA. (production.product)

RESPOSTA:
SELECT COUNT(DISTINCT Size) FROM Production.Product;
--18 TAMANHOS DIFERENTES CADASTRADOS 
*/

/*
AULA 06 - TOP 

SELECT TOP 10 * FROM TABELA

SELECT TOP 10 * FROM Production.Product;

---------- DESAFIO -------------
SEM DESAFIO
*/

/*
AULA 07 - ORDER BY 

OERDER BY ..... ASC, DESC;

SELECT * FROM Person.Person;
SELECT * FROM Person.Person
ORDER BY FirstName ASC;

SELECT * FROM Person.Person
ORDER BY FirstName DESC;

SELECT FirstName, LastName FROM Person.Person
ORDER BY FirstName ASC, LastName DESC;

---------- DESAFIO -------------
TABELA -> SELECT * FROM Production.Product; 

01) OBTER O ProductID DOS 10 PRODUTOS MAIS CAROS CADASTRADOS NO SISTEMA, LISTANDO DO MAIS CARO PARA O MAIS BARATO.

RESPOSTA:
SELECT TOP 10 ProductID, ListPrice FROM Production.Product
ORDER BY ListPrice desc;

02) OBTER O NOME E NÚMERO DOS PRODUTOS QUE TEM O ProfuctID ENTRE 1 E 4

RESPOSTA:
SELECT TOP 4 Name, ProductNumber FROM Production.Product
ORDER BY ProductID ASC;
*/

/*
AULA 08 - BETWEEN

O between é usados para encontrar valores entre um valor mínimo e valor máximo.

valor BETWEEN mínimo AND máximo;

É a mesma coisa que dizer:
valor >= mínimo AND valor <= máximo;

SELECT * FROM Production.Product
WHERE ListPrice BETWEEN 1000 AND 1500;

SELECT * FROM Production.Product
WHERE ListPrice NOT BETWEEN 1000 AND 1500;

SELECT * FROM HumanResources.Employee
WHERE HireDate BETWEEN '2009/01/01' AND '2010/01/01'
ORDER BY HireDate;

AULA 09 - IN

Nós usamos o operador IN junto com o Where, para verificar se um valor correspondem com qualquer valor passado
na lista de valores

valor IN (valore1, valor2)
valor IN (SELECT valor FRM nomeDaTabela)

SELECT * FROM Person.Person
WHERE BusinessEntityID IN (2,7,13);

Outra forma de fazer também, porem mais longo o comando

SELECT * FROM Person.Person
WHERE BusinessEntityID = 2 OR BusinessEntityID = 7 OR BusinessEntityID = 13;


SELECT * FROM Person.Person
WHERE BusinessEntityID NOT IN (2,7,13);

AULA 10 - LIKE

Vamos dizer que você quer encontrar uma pessoa no banco de dados que você sabe que o nome dela 
era ovi.... alguma coida

SELECT * FROM person.Person
WHERE FirstName like 'ovi%';

SELECT * FROM Person.Person
WHERE FirstName LIKE '%to';

SELECT * FROM Person.Person
WHERE FirstName LIKE '%essa%';

SELECT * FROM Person.Person
WHERE FirstName LIKE '%ro_';


---------- AULA 11 - DESAFIO 8, 9, 10 -------------

01) Quantos produtos temos cadastrado no sistema que custam mais que 1500 doralres? 

RESPOSTA: 39 PRODUTOS
SELECT COUNT(listPrice) FROM Production.Product
WHERE ListPrice > 1500; 

02) Quantas pessoas temos com o sobrenome que inicia com a letra P? 

RESPOSTA: 1187 PESSOAS
SELECT COUNT(LastName) FROM Person.Person
WHERE LastName LIKE 'P%';

03) Em quantas cidades únicas, estão cadastrados nossos clientes?

RESPOSTAS: 575 CIDADES UNICAS
SELECT COUNT(DISTINCT City) FROM Person.Address;

04) Quais são as cidades únicas que temos em nosso sistema?

RESPOSTA:
SELECT DISTINCT City FROM Person.Address;

05) Quantos produtos vermelhos tem preço entre 500 a 1000 dolares?

RESPOSTA: 11 produtos
SELECT COUNT(*) FROM Production.Product
WHERE Color = 'red' AND ListPrice BETWEEN 500 AND 1000;

06) Quantos produtos cadastrados tem a palavra 'road' no nome deles?

RESPOSTA: 103 produtos
SELECT COUNT(*) FROM Production.Product
WHERE Name like '%road%';

*/

/*

AULA 12 - MIN, MAX, AVG

Funções de agragação basicamente agragam ou combinam dados de uma tabela em um resultado só

SELECT * FROM Production.Product;

SELECT TOP 10 * FROM Sales.SalesOrderDetail;

SELECT TOP 10 SUM(LINETOTAL) FROM Sales.SalesOrderDetail;

SELECT TOP 10 SUM(linetotal) as "Soma" FROM Sales.SalesOrderDetail;

SELECT TOP 10 MIN(LINEtotal) FROM Sales.SalesOrderDetail;

SELECT TOP 10 AVG(LINEtotal) FROM Sales.SalesOrderDetail;


AULA 13 - GROUP BY

O group by basicamente divide o resultado da sua pesqueisa em grupos
Para cada grupo você pode aplicar uma função de agregação, por exemplo:
- calcular a soma de intens
- contar o número de itens naquele grupo

SELECT coluna1, funcaoAgregacao(coluna2)
FROM nomeTabela
GROUP BY coluna1;

SELECT * FROM Sales.SalesOrderDetail;

SELECT SpecialOfferID, SUM(UnitPrice) AS "SOMA"
FROM Sales.SalesOrderDetail
GROUP BY SpecialOfferID;

SELECT SpecialOfferID, UnitPrice FROM Sales.SalesOrderDetail
WHERE SpecialOfferID = 9;

-- vamos dizer que eu quero saber quantos cada produto foi vendido até hoje

SELECT ProductID, COUNT(ProductID) AS "CONTAGEM"
FROM Sales.SalesOrderDetail 
GROUP BY ProductID;

-- Vamos dizer que eu quero saber quantos nomes de cada nome temos cadastrado em nosso banco de dados

SELECT * FROM Person.Person;

SELECT FirstName, COUNT(FirstName) AS "CONTAGEM"
FROM Person.Person
GROUP BY FirstName;

-- na tabela production.product eu quero saber a média de preço para os produtos que são pratas (silver)

SELECT * FROM Production.Product;

SELECT Color, AVG(ListPrice) FROM Production.Product
GROUP BY Color;

SELECT Color, AVG(ListPrice) FROM Production.Product
WHERE Color = 'Silver'
GROUP BY Color;

---------- DESAFIO 12, 13 -------------

01) Eu preciso saber quantas pessoas tem o mesmo MiddleName agrupadas por o MiddleName

RESPOSTA:
SELECT * FROM Person.Person;

SELECT MiddleName, COUNT(MiddleName) AS "QUANTIDADE"
FROM Person.Person 
GROUP BY MiddleName;

02) Eu preciso saber soma e média qual é a quantidade (quantity) que cada produto é vendido na loja.

RESPOSTA:
SELECT * FROM Sales.SalesOrderDetail;

SELECT ProductID, SUM(OrderQty) AS "QUANTIDADE"
FROM Sales.SalesOrderDetail
GROUP BY ProductID;

SELECT ProductID, AVG(OrderQty) AS "MÉDIA"
FROM Sales.SalesOrderDetail
GROUP BY ProductID;

03) Eu quero saber qual foram as 10 vendas que no total tiveram os maiores valores de venda (line Total) 
por produto do maior valor para o menor.

RESPOSTA:
SELECT * FROM Sales.SalesOrderDetail;

SELECT TOP 10 ProductID, SUM(LineTotal) AS "TOTAL"
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY SUM(LineTotal) DESC;

04) Eu preciso saber quantos produtos e qual a quantidade média de produtos que temos cadastrados nas nossas 
ordem de serviço (WordOrder), agrupados por productID

RESPOSTA:
SELECT * FROM Production.WorkOrder;

SELECT ProductID, COUNT(ProductID) AS "CONTAGEM", AVG(OrderQty) AS "MEDIA"
FROM Production.WorkOrder
GROUP BY ProductID;


*/

/*
AULA 14 - HAVING 01:18:19


*/















