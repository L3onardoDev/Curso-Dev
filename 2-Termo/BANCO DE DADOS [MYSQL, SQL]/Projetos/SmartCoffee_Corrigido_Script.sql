CREATE DATABASE SMARTCOFFEE_LEONARDO_CORRIGIDO;

USE SMARTCOFFEE_LEONARDO_CORRIGIDO;


CREATE TABLE Delivery (
Localizacao VARCHAR(58),
Nota_Fiscal VARCHAR(58),
Metodo_Pagamento INT,
Informacoes_Cliente VARCHAR(58) NOT NULL,
Endereco_Entrega VARCHAR(58) NOT NULL,
ID_Delivery INT PRIMARY KEY AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Funcionarios (
Cargo VARCHAR(15),
Turno VARCHAR(18),
Nome VARCHAR(32) NOT NULL,
CPF VARCHAR(11) NOT NULL,
Data_Emissao DATETIME NOT NULL,
ID_Funcionarios INT PRIMARY KEY AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Produtos (
Preco INT,
Nome VARCHAR(32) NOT NULL,
Descricao VARCHAR(38),
Preco_Unitario INT,
Categoria DATETIME,
ID_Produtos INT PRIMARY KEY AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Estoque (
Nota_Fiscal VARCHAR(58) NOT NULL,
ID_Estoque INT PRIMARY KEY AUTO_INCREMENT PRIMARY KEY,
Novo_Estoque VARCHAR(38),
Quantidade INT,
Checagem_Estoque VARCHAR(38),
Unidade_Medida VARCHAR(15)
);

CREATE TABLE Clientes (
Nome VARCHAR(32) NOT NULL,
Data_Nascimento DATETIME NOT NULL,
Telefone VARCHAR(20),
CPF VARCHAR(11) NOT NULL,
Email VARCHAR(58),
ID_Cliente INT AUTO_INCREMENT,
PRIMARY KEY(ID_Cliente)
);

CREATE TABLE Prog_Fidelidade (
Pontos INT,
Informacoes_Cliente VARCHAR(50) NOT NULL,
Data_Validade_Fidelidade DATETIME,
Informacoes_Cartoes VARCHAR(60) NOT NULL,
Checagem_Pontos INT,
ID_Prog_Fidelidade INT AUTO_INCREMENT,
PRIMARY KEY(ID_Prog_Fidelidade)
);

CREATE TABLE Pagamentos (
ID_Pagamento INT AUTO_INCREMENT,
Data_Emissao DATETIME,
Quem_Pagou VARCHAR(32) NOT NULL,
Status_Pagamento VARCHAR(32),
Valor_Pago INT NOT NULL,
Metodo_Pagamento VARCHAR(35),
PRIMARY KEY(ID_Pagamento)
);

CREATE TABLE Pedidos (
Quantidade  INT,
Data_Hora DATE ,
Valor_Total DECIMAL,
Status VARCHAR(32) NOT NULL,
Tipo_Pedido VARCHAR(32),
ID_Pedidos INT AUTO_INCREMENT,
PRIMARY KEY(ID_Pedidos)
);

CREATE TABLE Consome (
ID_Estoque INT,
ID_Produtos INT,
FOREIGN KEY(ID_Estoque) REFERENCES Estoque (ID_Estoque),
FOREIGN KEY(ID_Produtos) REFERENCES Produtos (ID_Produtos)
);

CREATE TABLE Entrega (
ID_Funcionarios INT,
ID_Delivery INT,
FOREIGN KEY(ID_Funcionarios) REFERENCES Funcionarios (ID_Funcionarios),
FOREIGN KEY(ID_Delivery) REFERENCES Delivery (ID_Delivery)
);

CREATE TABLE Realiza (
ID_Cliente INT,
ID_Prog_Fidelidade INT,
ID_Pedidos INT,
FOREIGN KEY(ID_Cliente) REFERENCES Clientes (ID_Cliente),
FOREIGN KEY(ID_Pedidos) REFERENCES Pedidos (ID_Pedidos),
FOREIGN KEY (ID_Prog_Fidelidade) REFERENCES Prog_Fidelidade (ID_Prog_Fidelidade)
);

CREATE TABLE Atende (
ID_Pedidos INT,
ID_Funcionarios INT,
FOREIGN KEY(ID_Pedidos) REFERENCES Pedidos (ID_Pedidos),
FOREIGN KEY(ID_Funcionarios) REFERENCES Funcionarios (ID_Funcionarios)
);

CREATE TABLE Contem (
ID_Produtos INT,
ID_Pedidos INT,
FOREIGN KEY(ID_Produtos) REFERENCES Produtos (ID_Produtos),
FOREIGN KEY(ID_Pedidos) REFERENCES Pedidos (ID_Pedidos)
);
