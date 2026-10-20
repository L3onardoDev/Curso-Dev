-- Active: 1788268010002@@127.0.0.1@3306@smartcoffee_dml_leonardo
-- ============================================================
-- AULA 09 - ATIVIDADE PRÁTICA DE DQL
-- Nome: Leonardo Barbosa Pereira
-- Turma: DEVI'E Data: 06/10/2026
-- Base: smartcoffee_dml_leonardo
-- ============================================================

USE smartcoffee_dml_leonardo

-- PARTE A - AQUECIMENTO

-- 1. Liste todos os clientes cadastrados. 
SELECT * FROM Cliente;

-- 2. Exiba apenas nome, cidade e e-mail dos clientes.
SELECT Nome, Cidade, Email 
FROM Cliente;

-- 3. Liste os nomes das cidades sem repetir valores.
SELECT DISTINCT Cidade 
FROM Cliente;

-- 4. Liste todos os produtos em ordem crescente de preço.
SELECT * FROM Produto 
ORDER BY Preco ASC;

-- 5. Mostre apenas os 5 produtos mais caros.
SELECT * FROM Produto
ORDER BY Preco DESC LIMIT 5;

-- PARTE B - FILTROS

-- 6. Liste os produtos com preço entre R$ 8,00 e R$ 15,00.
SELECT * FROM Produto
WHERE Preco BETWEEN 8 AND 15;


-- 7. Liste os clientes das cidades Limeira ou Americana.
SELECT * FROM Cliente 
WHERE Cidade IN ('Limeira', 'Americana');


-- 8. Localize os produtos cujo nome contém a palavra “Café”.
SELECT * FROM Produto 
WHERE Nome_Produto LIKE '%Café%';


-- 9. Liste os clientes que não informaram telefone.
SELECT * FROM Cliente 
WHERE Telefone IS NULL;


-- 10. Mostre os pedidos FINALIZADOS com valor acima de R$ 20,00,
--     do maior para o menor valor.
SELECT * FROM Pedido
WHERE Status_Pedido = 'FINALIZADO' AND Valor_total > 20
ORDER BY Valor_total DESC;

-- PARTE C - CÁLCULOS E AGRUPAMENTOS

-- 11. Informe quantos produtos estão cadastrados.
SELECT COUNT(*) AS Quantidade_Produtos FROM Produto;

-- 12. Mostre menor preço, maior preço e preço médio dos produtos.
SELECT MIN(Preco) AS Menor_preco,
    MAX(Preco) AS Maior_preco,
    AVG(Preco) AS Preco_medio
FROM Produto;
-- 13. Informe quantos clientes existem em cada cidade.

SELECT Cidade,
COUNT(*) AS Quantidade_Clientes
FROM Cliente
GROUP BY Cidade;

-- 14. Mostre somente as cidades que possuem dois ou mais clientes.

SELECT Cidade,
    COUNT(*) AS Quantidade_Clientes
FROM Cliente
GROUP BY Cidade
HAVING COUNT(*) >= 2;

-- 15. Calcule o faturamento total considerando apenas pedidos FINALIZADOS.

SELECT SUM(Valor_total) AS Faturamento
FROM Pedido
WHERE Status_Pedido = 'FINALIZADO';

-- PARTE D - RELACIONAMENTOS

-- 16. Liste cada pedido exibindo id, data, nome do cliente, status e valor total.
SELECT P.ID_Pedido, P.Data_Pedido, C.Nome AS Nome_Cliente,
P.Status_Pedido, P.Valor_total
FROM Pedido P
INNER JOIN Cliente C 
ON P.ID_Cliente = C.ID_Cliente;


-- 17. Liste cada produto acompanhado do nome de sua categoria.
SELECT P.Nome_Produto, C.Nome_Categoria
FROM Produto P
INNER JOIN Categoria C
ON P.ID_Categoria = C.ID_Categoria;


-- 18. Gere um relatório dos itens vendidos: pedido, produto, quantidade, preço unitário e subtotal.
SELECT I.ID_Pedido, P.Nome_Produto, I.Quantidade, I.Preco_Unitario,
(I.Quantidade * I.Preco_Unitario) AS Subtotal
FROM Item_Pedido I
INNER JOIN Produto P
ON I.ID_Produto = P.ID_Produto;


-- 19. Mostre todos os clientes, inclusive aqueles que nunca fizeram pedidos.
SELECT C.NOME, P.ID_PEDIDO, P.DATA_PEDIDO
FROM CLIENTE AS C
LEFT JOIN PEDIDO AS P
ON P.ID_CLIENTE = C.ID_CLIENTE
ORDER BY C.NOME;

-- 20. Liste apenas os clientes que nunca fizeram pedidos.
SELECT C.ID_CLIENTE, C.NOME
FROM CLIENTE AS C
LEFT JOIN PEDIDO AS P
ON P.ID_CLIENTE = C.ID_CLIENTE
WHERE P.ID_PEDIDO IS NULL;

-- PARTE E - DESAFIO GERENCIAL

-- 21. Informe quantos pedidos FINALIZADOS cada cliente realizou e quanto
--     cada cliente gastou. Ordene do maior gasto para o menor.
SELECT C.NOME AS CLIENTE, COUNT(P.ID_PEDIDO) AS QTDE_PEDIDOS, SUM(P.VALOR_TOTAL) AS TOTAL_COMPRADO
FROM CLIENTE AS C
INNER JOIN PEDIDO AS P
ON P.ID_CLIENTE = C.ID_CLIENTE
WHERE P.STATUS_PEDIDO = 'FINALIZADO'
GROUP BY C.ID_CLIENTE, C.NOME
ORDER BY TOTAL_COMPRADO DESC;

-- 22. Mostre a quantidade de produtos e o preço médio de cada categoria.
SELECT C.NOME_CATEGORIA AS CATEGORIA, COUNT(P.ID_PRODUTO) AS QTDE_PRODUTOS, AVG(P.PRECO) AS PRECO_MEDIO
FROM CATEGORIA AS C
LEFT JOIN PRODUTO AS P ON C.ID_CATEGORIA = P.ID_CATEGORIA
GROUP BY C.ID_CATEGORIA, C.NOME_CATEGORIA;

-- 23. Descubra quais produtos possuem preço superior ao preço médio geral.
SELECT NOME_PRODUTO, PRECO
FROM PRODUTO
WHERE PRECO > (SELECT AVG(PRECO) FROM PRODUTO);

-- 24. Classifique os produtos como Econômico, Intermediário ou Premium.
-- Defina e informe suas faixas de preço.
SELECT NOME_PRODUTO, PRECO,
CASE
WHEN PRECO < 8.00 THEN 'Econômico'
WHEN PRECO <= 15.00 THEN 'Intermediário'
ELSE 'Premium'
END AS CLASSIFICACAO
FROM PRODUTO
ORDER BY PRECO;