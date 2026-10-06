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

-- 14. Mostre somente as cidades que possuem dois ou mais clientes.


-- 15. Calcule o faturamento total considerando apenas pedidos FINALIZADOS.


-- PARTE D - RELACIONAMENTOS

-- 16. Liste cada pedido exibindo id, data, nome do cliente, status e valor total.


-- 17. Liste cada produto acompanhado do nome de sua categoria.


-- 18. Gere um relatório dos itens vendidos: pedido, produto, quantidade,
--     preço unitário e subtotal.


-- 19. Mostre todos os clientes, inclusive aqueles que nunca fizeram pedidos.


-- 20. Liste apenas os clientes que nunca fizeram pedidos.


-- PARTE E - DESAFIO GERENCIAL

-- 21. Informe quantos pedidos FINALIZADOS cada cliente realizou e quanto
--     cada cliente gastou. Ordene do maior gasto para o menor.


-- 22. Mostre a quantidade de produtos e o preço médio de cada categoria.


-- 23. Descubra quais produtos possuem preço superior ao preço médio geral.


-- 24. Classifique os produtos como Econômico, Intermediário ou Premium.
--     Defina e informe suas faixas de preço.