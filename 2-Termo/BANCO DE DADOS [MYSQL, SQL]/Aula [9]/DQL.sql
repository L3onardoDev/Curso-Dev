-- Active: 1788268010002@@127.0.0.1@3306@smartcoffee_dml_leonardo
CREATE DATABASE SMARTCOFFEE_DQL_LEONARDO;

USE SMARTCOFFEE_DQL_LEONARDO;

INSERT INTO Cliente(Nome, Email, Telefone, Cidade, Ativo) VALUES
('Manuella Rossatt', 'Manuella@Email.com', '1999812131', 'Limeira', TRUE);

----------------------------- Consultas com SELECT -----------------------------
----------------------- Estrutura de construção do SELECT-----------------------
--------------------------------------------------------------------------------

SELECT Coluna
FROM Tabela;

--  1. Exemplo: SELECT PARA TODAS AS COLUNAS
SELECT * FROM Cliente;

-- 2. Exemplo: SELECT POR COLUNAS
SELECT Nome, Email, Ativo FROM Cliente;

-- 3. Exemplo: ALIAS É UM APELIDO PARA O RESULTADO
-- Eu pedi o resultado da coluna 'Nome' mais ela vai chamar 'Cliente'.
SELECT Nome AS Cliente,
    Telefone AS Contato
FROM Cliente;

SELECT Ativo AS Status 
FROM Cliente;

SELECT Nome_Produto, Preco, Preco * 0.80 AS Preco_Promocao
FROM Produto;

-- 4. Exemplo: ELIMINANDO REPETIÇÕES
-- Ao utilizar o 'DISTINCT' ele filtra oque é repetido e retira
SELECT DISTINCT Cidade
FROM cliente;

SELECT Cidade FROM Cliente;

-- 5. Exemplo: FILTRO EM REGISTROS
SELECT Nome_Produto, Preco
FROM Produto
WHERE Preco > 10;

SELECT Nome_Produto, Preco
FROM Produto
WHERE Preco <> 10;

SELECT Nome_Produto, Preco
FROM Produto
WHERE Ativo = TRUE;

SELECT ID_Pedido, Data_Pedido, Valor_Total
FROM Pedido
WHERE Valor_Total >= 25.00;

-- Outros Operadores De Comparação
-- '=' Igual
-- '<>' Diferente
-- '>' Maior
-- '>=' Maior Igual
-- '<' Menor
-- '<=' Menor Igual

--  6. Exemplo: AND, OR E NOT
--  Exemplo com AND
SELECT Nome_Produto, Preco
FROM Produto
WHERE Preco >= 8 AND Preco <= 20;

-- Exemplo com OR
-- OR = OU
SELECT Nome, Cidade
FROM Cliente
WHERE Cidade = 'Limeira' OR Cidade = 'Piracicaba'

-- Exemplo com NOT
-- NOT é utilizado para "Esconder" uma coluna
SELECT Nome, Cidade
FROM Cliente
WHERE NOT Cidade = 'Limeira';

-- EXEMPLO COM AND E OR JUNTOS, UTILIZAR ()
SELECT Nome, Cidade, Ativo
FROM Cliente
WHERE Ativo = TRUE
AND (Cidade = 'Limeira' OR Cidade = 'Americana');

-- 7. Exemplo: BETWEEN - PESQUISA POR INTERVALOS
-- VER PRODUTOS QUE COMECAM COM 8.00 E TERMINAM COM 15.00
SELECT Nome_Produto, Preco
FROM Produto
WHERE Preco BETWEEN 8.00 AND 15.00

SELECT ID_Pedido, Data_Pedido, Valor_Total
FROM Pedido
WHERE Data_Pedido BETWEEN '2026-09-01 00:00:00' AND '2026-09-30 23:59:59';

-- 8. Exemplo: IN - VÁRIAS POSSIBILIDADES
-- USAR PARA ELIMINAR A QUANTIDADE DE OR
SELECT Nome, Cidade
FROM Cliente
WHERE Cidade IN ('Limeira', 'Americana', 'Piracicaba');

SELECT Nome, Cidade
FROM Cliente
WHERE Cidade NOT IN ('Limeira', 'Americana');


-- 9. Exemplo: LIKE - PESQUISANDO POR TEXTOS
SELECT Nome_Produto
FROM Produto
WHERE Nome_Produto LIKE 'Café%';
-- Começa Com a Palavra Deseja

SELECT Nome_Produto
FROM Produto
WHERE Nome_Produto LIKE '%Chocolate%';
-- Possui Palavra Desejada

SELECT Nome_Produto
FROM Produto
WHERE Nome_Produto LIKE '%Silva';
-- Utilizando % Como Coringa

SELECT Nome_Produto
FROM Produto
WHERE Nome_Produto LIKE '_ilva';
-- Utilizando _ Como Coringa

SELECT Nome
FROM Cliente
WHERE Nome LIKE 'br_';
-- Utilizando _ Como Coringa

-- 10. Exemplo: NULL- AUSÊNCIA DE VALOR
SELECT Nome, Telefone
FROM Cliente
WHERE Telefone IS NULL;

SELECT Nome, Telefone
FROM Cliente
WHERE Telefone IS NOT NULL;

-- 11. Exemplo: ORDEM BY - ORDENAR RESULTADOS
--  ASC É CRESCESTE E DESC É DECRESCENTE

SELECT Nome_Produto, Preeco
FROM Produto
ORDEM BY Preco ASC;

SELECT Nome_Produto, Preco
FROM Produto
ORDER BY Preco DESC;

SELECT Cidade, Nome
FROM Cliente
ORDER BY Cidade ASC, Nome DESC;

-- 12. Exemplo: LIMIT - LIMITANDO A QUANTIDADE DE RESULTADOS
SELECT Nome_Produto, Preco
FROM Produto
ORDER BY Preco DESC
LIMIT 8;

SELECT Nome_Produto, Preco
FROM Produto
ORDER BY Nome_Produto
LIMIT 8 OFFSET 8;

-- 13. Exemplo: COLUNAS COM CÁLCULOS
SELECT Nome_Produto, Preco, Preco * 1.10 AS Preco_Com_Reajuste
FROM Produto;

-- CALCULO COM SUBTOTAL
SELECT ID_Item, Quantidade, Preco_Unitario, Quantidade * Preco_Unitario AS SubTotal
FROM Item_Pedido;

-- 14. Exemplo: FUNÇÕES ÚTEIS EM CONSULTAS
SELECT UPPER(Nome) AS Nome_Maisculo
    LOWER(Email) AS Email_Minusculo
FROM Cliente;
-- DEIXAR EM MAISCULO E MINUSCULO

SELECT CONCAT(Nome, ' - ', Cidade) AS Clientes_Cidades
FROM Clientes;
-- JUNTAR INFORMAÇÕES ENTRE CAMPOS

SELECT Nome_Produto, Preco, ROUND(Preco * 0.90, 2) AS Precos_Desconto
FROM produto;
-- ARREDONDAR CASAS DECIMAIS

SELECT ID_Pedido, Data_Pedido, DATE(Data_Pedido) AS Data_Pedido, YEAR(Data_Pedido) AS Ano_Pedido, MONTH(Data_Pedido) AS Mês_Pedido
FROM Pedido;
-- FORMATAÇÃO DE RESULTADOS POR DATA, MES E ANO

SELECT Nome,
COALESCE(Telefone, 'Não Informado') AS Telefone
FROM Cliente;
-- SUBSTITUINDO NULL PARA TEXTO DESEJADO

-- 15. Exemplo: FUNÇÕES DE AGREGAÇÃO
-- COUNT() Contar
-- SUM() Somar
-- AVG() Calcular Média
-- MIN() Menor Valor
-- MAX() Maior Valor

SELECT COUNT(*) AS Total_clientes
FROM Cliente;
-- QUANTOS CLIENTES TEMOS EM NOSSA TABELA CLIENTE?

SELECT AVG(Preco) AS Preco_medio
FROM Produto;
-- CALCULE O PREÇO MÉDIO DOS PRODUTOS

SELECT MIN(Preco) AS Menor_preco,
MAX(Preco) AS Maior_preco,
AVG(Preco) AS Preco_medio
FROM Produto;
-- RESUMO DOS PREÇOS

SELECT SUM(Valor_total) AS Faturamento
FROM Pedido
WHERE Status_Pedido = 'FINALIZADO';
-- TOTAL PEDIDOS FINALIZADOS

-- 16. Exemplo: GROUP BY - AGRUPAR DADOS

SELECT Cidade,
COUNT(*) AS Quantidade_Clientes
FROM Cliente
GROUP BY Cidade;

SELECT ID_Categoria,
COUNT(*) AS Quantidade_Produtos
FROM Produto
GROUP BY ID_Categoria;

-- 17. Exemplo: HAVING - FILTRAR GRUPOS
-- WHERE FILTRA LINHAS ANTES DO AGRUPAMENTO
-- HAVING FILTRA GRUPOS DEPOIS DO GROUP BY

SELECT Cidade,
    COUNT(*) AS Quantidade_Clientes
FROM Cliente
GROUP BY Cidade
HAVING COUNT(*) >= 2;

-- CIDADES COM PELO MENOS DOIS CLIENTES

-- 18. Exemplo: RESUMO E ORDEM DE UMA CONSULTA COMPLETA
SELECT Colunas
FROM Tabela
WHERE Condicao
GROUP BY Colunas_Agrupar
HAVING Condicao_Agrupar
ORDER BY Colunas
LIMIT Quantidade;

-- Exemplo de construção de uma consulta

SELECT Nome, Cidade, COUNT(*) AS Quantidade_Clientes
FROM Cliente
WHERE Cidade = 'Limeira'
GROUP BY Cidade
HAVING COUNT(*) >= 3
LIMIT 5;

-- Parte 2 - Relacionamento entre tabelas
-- Uso de joins
-- INNER JOIN - INNER JOIN ENTRE DUAS TABELAS

-- 19. Exemplo: PEDIDOS COM O NOME DO CLIENTE

SELECT P.ID_PEDIDO, P.DATA_PEDIDO, C.NOME AS CLIENTE, P.VALOR_TOTAL
FROM PEDIDO AS P
INNER JOIN CLIENTE AS C
ON C.ID_CLIENTE = P.ID_CLIENTE

-- OBS: Relacione o cliente cujo ID_CLIENTE é igual ID_CLIENTE gravado no pedido
-- ALIASES - São como atribuição de pedidos para consultar de várias tabelas mais curtas e legíveis

-- LEFT JOIN - Mantém todos os registros da tabela da esquerda mesmo quando não possui correspondência

-- 20. Exemplo: Tods os clientes inclusive quem nunca comprou

SELECT C.NOME, P.ID_PEDIDO, P.DATA_PEDIDO
FROM CLIENTE AS C
LEFT JOIN PEDIDO AS P
ON P.ID_CLIENTE = C.ID_CLIENTE
ORDER BY C.NOME;

-- 21. Exemplo: Clientes Sem Pedido
SELECT C.ID_CLIENTE, C.NOME
FROM CLIENTE AS C
LEFT JOIN PEDIDO AS P
ON P.ID_CLIENTE = C.ID_CLIENTE
WHERE P.ID_PEDIDO IS NULL;

-- JOIN COM TRÊS TABELAS

-- 22. Exemplo: Itens de pedido com nome do produto
SELECT P.ID_PEDIDO, PR.NOME_PRODUTO AS PRODUTO, IP.QUANTIDADE, IP.PRECO_UNITARIO, IP.QUANTIDADE * IP.PRECO_UNITARIO AS SUBTOTAL
FROM PEDIDO AS P
INNER JOIN ITEM_PEDIDO AS IP
ON IP.ID_PEDIDO = P.ID_PEDIDO
INNER JOIN PRODUTO AS PR
ON PR.ID_PRODUTO = IP.ID_PRODUTO
ORDER BY P.ID_PEDIDO;

-- 23. Exemplo: Joins Com Categoria 

SELECT PR.NOME_PRODUTO AS PRODUTO, CA.NOME_CATEGORIA AS CATEGORIA, PR.PRECO
FROM PRODUTO AS PR
INNER JOIN CATEGORIA AS CA
ON CA.ID_CATEGORIA = PR.ID_CATEGORIA
ORDER BY CA.NOME_CATEGORIA, PR.NOME_PRODUTO;

--  24. Exemplo: Quantidade de produtos por categoria

SELECT CA.NOME AS CATEGORIA, COUNT(PR.ID_PRODUTOS) AS QTDE_PRODUTOS
FROM CATEGORIA AS CA
LEFT JOIN PRODUTO AS PR
ON PR.ID_CATEGORIA = CA.ID_CATEGORIA
GROUP BY CA.ID_CATEGORIA, CA.NOME
ORDER BY QTDE_PRODUTOS DESC;

-- 25. Exemplo: Total Comprado Por Cliente
SELECT C.NOME AS CLIENTE, COUNT(P.ID_PEDIDO) AS QTDE_PEDIDOS, SUM(P.VALOR_TOTAL) AS TOTAL_COMPRADO
FROM CLIENTE AS C
INNER JOIN PEDIDO AS P
ON P.ID_CLIENTE = C.ID_CLIENTE
WHERE P.STATUS_PEDIDO = 'FINALIZADO'
GROUP BY C.ID_CLIENTE, C.NOME
ORDER BY TOTAL_COMPRADO DESC;

-- RELATÓRIO COMPLETO DO PEDIDO

-- 26. Exemplo: Combinação de várias tabelas para uma comsulta completa
SELECT P.ID_PEDIDO, DATE_FORMAT(P.DATA_PEDIDO, '%d %m %Y %H:%i') AS DATA, C.NOME AS CLIENTE, PR.NOME_PRODUTO AS PRODUTOS, IP.QUANTIDADE, IP.PRECO_UNITARIO, IP.QUANTIDADE * IP.PRECO_UNITARIO AS SUBTOTAL
FROM PEDIDO AS P
INNER JOIN CLIENTE AS C
ON C.ID_CLIENTE = P.ID_CLIENTE
INNER JOIN ITEM_PEDIDO AS IP
ON IP.ID_PEDIDO = P.ID_PEDIDO
INNER JOIN PRODUTO AS PR
ON PR.ID_PRODUTO = IP.ID_PRODUTO
ORDER BY P.ID_PEDIDO, PR.NOME_PRODUTO;

-- OBS: DATE_FORMAT(P.DATA_PEDIDO, '%d %m %Y %H:%i) - FORMATAÇÃO PADRÃO BRASIL
-- CASE - CRIANDO CLASSIFICAÇÕES

-- 27. Exemplo: Classificação Por Regras
SELECT NOME, PRECO
CASE
WHEN PRECO < 8.00 THEN 'Econômico'
WHEN PRECO <= 15.00 THEN 'Intermediário'
ELSE 'Premium'
END AS CLASSIFICAÇÃO
FROM PRODUTO
ORDER BY PRECO;

-- SUBCONSULTA
-- INSERIR UMA CONSULTA DENTRO DE OUTRA CONSULTA

-- 28. Exemplo: Produtos Acima Do Preço Médio
SELECT NOME_PRODUTO, PRECO
FROM PRODUTO
WHERE PRECO > (SELECT AVG(PRECO)
FROM PRODUTO)
ORDER BY PRECO DESC;