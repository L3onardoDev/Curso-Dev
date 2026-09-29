-- Active: 1788268010002@@127.0.0.1@3306@smartcoffee_dml_leonardo
-- REVISÃO DML - AULA 8

-- REVISÃO DE INSERTS (INSERIR DADOS EM TABELAS)

INSERT INTO Cliente (Nome, Email, Telefone, Cidade, Ativo) VALUES
('Kauan R', 'KauanR@email.com', '19990000000', 'Limeira', True),
('Laura C', 'LauraC@email.com', '19990101010', 'Limeira', True),
('Laura N', 'LauraN@email.com', '19990202020', 'Limeira', True),
('Laura R', 'LauraR@email.com', '19990303030', 'Limeira', True),
('Leonardo B', 'LeonardoB@email.com', '19990404040', 'Limeira', True),
('Leonardo B P', 'LeonardoBP@gmail.com', '19990505050', 'Americana', True),
('Lidia M', 'Lidia@email.com', '19990606060', 'Belem', True),
('Livia V', 'LiviaV@email.com', NULL, 'Limeira', True),
('Marcos V', 'Marcos@email.com', '19990707070', 'Campo Mourão', True),
('Nicolas N', 'NicolasN@email.com', '19990808080', '', True),
('Nicolas F', 'NicolasF@email.com', '19990909090', 'Campinas', True),
('Pablo H', 'PabloH@email.com', '199910101010', 'Indaiatuba', True),
('Sophie A', 'SophieA@email.com', '19991111111', 'Campinas', True),
('Vinicius H', 'ViniciusH@email.com', Null, 'Limeira', True),
('Vitoria S', 'VitoriaS@email.com', '199913131313', 'Limeira', True),
('Virginia S', 'VirginiaS@email.com', Null, 'Boston', True);

SELECT * FROM Cliente; -- Mostrar a tabela.

SELECT * FROM Cliente -- Mostrar itens expecificos dentro da tabela.
WHERE ID_CLIENTE = 14;

INSERT INTO Categoria (NOME_CATEGORIA) VALUES -- Inserir os dados 'Combo Especiais' e 'Nutela' na Categoria.
('Combo Especiais'), ('Nutela');
SELECT * FROM Cliente;

INSERT INTO Pedido (DATA_PEDIDO, STATUS_PEDIDO, VALOR_TOTAL, ID_CLIENTE) VALUES
(NOW(), 'Aberto', 0.00, 1);
SET @Pedido = LAST_INSERT_ID();
SELECT @Pedido;

INSERT INTO Item_Pedido (ID_PEDIDO, ID_PRODUTO, QUANTIDADE, PRECO_UNITARIO, OBSERVACAO) VALUES
(@Pedido, 2, 2, 13.00, 'NUTELLA')

-------------------------------------------------------------------------------
---------------------- Atualizando Dados No Banco De Dados --------------------
-------------------------------------------------------------------------------

UPDATE Cliente -- Seleciona a tabela desejada
SET TELEFONE = 1909123764 -- Seta na tabela que deseja. Tabela 'Cliente' Na Coluna 'TELEFONE'. WHERE define qual pessoa deseja alterar.
WHERE ID_CLIENTE = 17;

-- Alterar 3 campos ao mesmo tempo.
UPDATE Cliente
SET TELEFONE = 1909123764,
CIDADE = 'OURINHOS',
ATIVO = FALSE
WHERE ID_CLIENTE = 17;

-- Tomar MUITO CUIDADO | NÃO ESQUECER DO WHERE
UPDATE Cliente
-- SET ATIVO = FALSE; -- ISSO ALTERA TODOS DA TABELA PARA 'FALSE'.

UPDATE Cliente
-- SET VALOR_TOTAL = 1.00; -- ISSO ALTERA TODOS DA TABELA PARA 1.0

-------------------------------------------------------------------------------
-------------------------------- Dicas De Ouro --------------------------------
--------------- Executar o SELECT Sempre Antes De Atualizar -------------------
-------------------- SELECT * FROM TABELA_QUE_DESEJO --------------------------
-------------------------------------------------------------------------------

-- Condicionais 
UPDATE PRODUTO
SET PRECO = 
CASE 
    WHEN PRECO < 30 THEN PRECO * 1.50
    ELSE PRECO * 1.25
END
WHERE ATIVO = True;


UPDATE Cliente
SET TELEFONE = NULL
WHERE ID_CLIENTE = 23;

-- Remove As Linhas
DELETE FROM Cliente
WHERE ID_CLIENTE = 23;

-- Remove/Limpa Todas As Linhas Rapidamente (Sem Perguntar)
TRUNCATE TABLE Cliente;

-- Remove A Tabela Por Inteiro
DROP TABLE Cliente;

-- Excluindo Dados De Forma Lógica
UPDATE Cliente;
SET Ativo = False
WHERE ID_CLIENTE = 23;

-------------------------------------------------------------------------------
---------------------- Cadastrando Um Procedimento De Compra ------------------
-------------------------------------------------------------------------------

-- Passo 1: Adicionando novo cliente
INSERT INTO Cliente (NOME, EMAIL, TELEFONE, CIDADE, ATIVO) VALUES
('Bruno M', 'BrunoM@email.com', '199999999', 'Piracicaba', True);
SET @Cliente = LAST_INSERT_ID();

-- Passo 2: Adicionando um novo pedido
INSERT INTO Pedido (DATA_PEDIDO, STATUS_PEDIDO, VALOR_TOTAL, ID_CLIENTE) VALUES
(NOW(), 'ABERTO', 0.00, @Cliente);
SET @Pedido = LAST_INSERT_ID();

-- Passo 3: Adicionando itens ao pedido
INSERT INTO ITEM_PEDIDO (ID_PEDIDO, ID_PRODUTO, QUANTIDADE, PRECO_UNITARIO, OBSERVACAO) VALUES
(@Pedido, 5, 1, 15.50, 'Mel');

-- Passo 4: Atualizando o valor total do pedido
UPDATE Pedido
SET VALOR_TOTAL = 22.00,
STATUS_PEDIDO = 'Preparando'
WHERE ID_PEDIDO = @Pedido;

-- Passo 5: Registrando Pagamento
INSERT INTO PAGAMENTO (ID_PEDIDO, ID_FORMA_PAGAMENTO, VALOR, DATA_PAGAMENTO) VALUES
(@Pedido, 2, 22.00, NOW());

-- Consulta De Forma Completa
SELECT p.ID_PEDIDO,
    c.Nome AS Cliente,
    p.STATUS_PEDIDO,
    p.VALOR_TOTAL
FROM Pedido p
JOIN Cliente c ON c.ID_CLIENTE = p.ID_CLIENTE
WHERE p.ID_PEDIDO = @Pedido;