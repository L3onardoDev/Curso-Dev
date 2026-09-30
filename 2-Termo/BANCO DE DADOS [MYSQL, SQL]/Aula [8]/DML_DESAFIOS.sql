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

-- 7. Corrija o telefone de um dos 