-- Active: 1788268010002@@127.0.0.1@3306@smartcoffee_dml_leonardo

-------------------------------------------------------------------------------
----------------------------------- Parte A ----------------------------------- 
-------------------------------------------------------------------------------

-- 1. Cadastrar dois novos clientes
INSERT INTO Cliente (NOME, EMAIL, TELEFONE, CIDADE, ATIVO) VALUES
('Bruno M', 'BrunoM@email.com', '199999999', 'Piracicaba', True)
('Leonardo Barbosa', 'LeonardoBarbosa@email.com', '199999212', 'Limeira', True);
SET @Cliente = LAST_INSERT_ID();

-- 2. Cadastre uma nova categoria chamada Especiais Da Casa
INSERT INTO CATEGORIA (NOME_CATEGORIA) VALUES
('Especiarias da Casa');

-- 3. Cadastre três produtos na nova categoria

INSERT INTO PRODUTO (NOME_PRODUTO, PRECO, ATIVO, ID_CATEGORIA) VALUES
('PÃO DE QUEIJO', 3.00, 1, 11),
('REFRIGERANTE', 4.00, 1, 11),
('MISTO QUENTE', 6.00, 1, 11);

SELECT * FROM CATEGORIA;

-- 4. Insira um cliente sem telefone e observe o uso de NULL

INSERT INTO CLIENTE (NOME, EMAIL, TELEFONE, CIDADE, ATIVO, DATA_CADASTRO) VALUES
('Michel S', 'MichelS@EMAIL.COM', NULL, 'LIMEIRA', TRUE, NULL);

SELECT * FROM Cliente;

-- 5. Crie um novo pedido para um dos clientes cadastrados

INSERT INTO PEDIDO (DATA_PEDIDO, STATUS_PEDIDO, VALOR_TOTAL, ID_CLIENTE) VALUES
('2024-06-01 07:41:23', 'ABERTO', 15.00, 29);

SELECT * FROM Pedido;

-- 6. Use LAST_INSERT_ID() para inserir pelo menos dois itens o pedido criado

SET @Pedido = LAST_INSERT_ID();
SELECT @Pedido;

INSERT INTO ITEM_PEDIDO (ID_PEDIDO, ID_PRODUTO, QUANTIDADE, PRECO_UNITARIO, OBSERVACAO) VALUES
(@Pedido, 1, 2, 3.00, 'Sem queijo'),
(@Pedido, 2, 1, 4.00, 'Com gelo');

SELECT * FROM ITEM_PEDIDO;

-------------------------------------------------------------------------------
----------------------------------- Parte B ----------------------------------- 
-------------------------------------------------------------------------------

-- 7. Corrija o telefone de um dos clientes criados.

UPDATE CLIENTE
SET TELEFONE = '199999999928'
WHERE ID_CLIENTE = 3;

-- 8. Altere cidade e telefone de outro cliente em um único UPDATE.
UPDATE CLIENTE
SET CIDADE = 'Piracicaba', TELEFONE = '199999999928'
WHERE ID_CLIENTE = 4;

-- 9. Aumente em 8% o preço dos produtos da categoria 'Especiais da Casa'.
UPDATE PRODUTO
SET PRECO = PRECO * 0.8
WHERE ID_CATEGORIA = (SELECT ID_CATEGORIA FROM CATEGORIA WHERE NOME_CATEGORIA = 'Especiais da Casa');

-- 10. Altere o status do pedido criado para 'PREPARANDO'.
UPDATE PEDIDO
SET STATUS_PEDIDO = 'PREPARANDO'
WHERE ID_PEDIDO = @Pedido;

-- 11. Atualize valor_total do pedido de acordo com os itens cadastrados.
--     Você pode calcular previamente com SELECT SUM(quantidade * preco_unitario).
UPDATE PEDIDO
SET VALOR_TOTAL = (SELECT (quantidade * preco_unitario) FROM ITEM_PEDIDO WHERE ID_PEDIDO = @Pedido)
WHERE ID_PEDIDO = @Pedido;

-- 12. Escolha um dos produtos criados e faça uma exclusão lógica (ativo = FALSE).
UPDATE PRODUTO
SET ATIVO = FALSE
WHERE ID_PRODUTO = 1;

-- PARTE C - DELETE

-- 13. Crie um cliente de teste sem pedidos.
--     Depois localize e exclua apenas esse cliente.
INSERT INTO Cliente (NOME, EMAIL, TELEFONE, CIDADE, ATIVO) VALUES
('Leonardo BPZ', 'LeonardoBPZ1@email.com', '23213251', 'Cidade Teste', True);

SELECT * FROM cliente;

DELETE FROM Cliente
WHERE ID_CLIENTE = 31;

-- 14. Tente excluir um cliente da base original que possua pedidos.
--     Deixe o DELETE comentado após o teste e descreva o erro abaixo.
-- Resultado observadO:

-- DELETE FROM Cliente
-- WHERE ID_CLIENTE = 1;

-- NÃO APAGOU O CLIENTE PORQUE ELE POSSUI PEDIDOS, EA CHAVE ESTRANGEIRA IMPEDE EXCLUSÃO.

-- 15. Explique em comentário por que a FK bloqueou a exclusão.
-- Resposta: A FK bloqueou a exclusão porque o cliente tem registros registados na tabela de pedidos. E ela bloqueia porque ainda tem registros relacionados a ele.

-- 16. Crie uma categoria temporária chamada 'Excluir Depois' e remova-a.
INSERT INTO CATEGORIA (NOME_CATEGORIA) VALUES
('Excluir Depois');

SELECT * FROM CATEGORIA;

DELETE FROM CATEGORIA
WHERE NOME_CATEGORIA = 'Excluir Depois';

-- PARTE D - INTEGRIDADE E ERROS CONTROLADOS
-- Execute uma tentativa por vez. Depois deixe o comando problemático comentado.

-- 17. Tente inserir um produto com id_categoria = 9999.
-- Qual restrição impediu a operação?


-- 18. Tente cadastrar um cliente usando 'ana@email.com'.
-- Qual restrição impediu a operação?


-- 19. Tente criar um pedido com id_cliente = 9999.
-- Qual restrição impediu a operação?


-- 20. Escreva em comentários a diferença entre os três erros anteriores.


-- PARTE E - DESAFIO COMPLETO COM TRANSAÇÃO

-- 21. Inicie uma transação.


-- 22. Dentro dela, cadastre um cliente, um pedido e dois itens relacionados.


-- 23. Faça uma consulta com JOIN comprovando que os registros existem
--     enquanto a transação está aberta.


-- 24. Execute ROLLBACK e depois use SELECT para provar que o cadastro foi desfeito.


-- 25. Repita o processo com novos dados e finalize usando COMMIT.
--     Depois consulte os registros persistidos.
