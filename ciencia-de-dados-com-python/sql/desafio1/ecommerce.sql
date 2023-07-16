-- Criação do Banco de Dados para o cenário ecommerce --

CREATE DATABASE ecommerce;

USE ecommerce;

-- Criação de tabelas --

CREATE TABLE cliente(
	idCliente INT AUTO_INCREMENT PRIMARY KEY,
    Pnome VARCHAR(10) NOT NULL,
    NomeMeio CHAR(10),
    Sobrenome VARCHAR(15) NOT NULL,
    CPF CHAR(11) NOT NULL,
    DataNascimento DATE NOT NULL,
    Endereco VARCHAR(255) NOT NULL
);

CREATE TABLE produto(
	idProduto INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    categoria_crianca BOOL DEFAULT FALSE,
    Categoria ENUM("Eletronico", "Brinquedo", "Alimento") NOT NULL,
    Descricao VARCHAR(255) NOT NULL,
    Valor FLOAT DEFAULT 0,
    Avaliacao FLOAT DEFAULT 0
);

CREATE TABLE pedido(
	idPedido INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    StatusPedido ENUM('Cancelado','Em andamento', 'Em processamento', 'Enviado', 'Entregue') DEFAULT('Em processamento') NOT NULL,
    Descricao VARCHAR(45) NOT NULL,
    Frete FLOAT DEFAULT 10,
    FOREIGN KEY (idCliente) REFERENCES cliente(idCliente)
);

CREATE TABLE pagamento(
	idPagamento INT AUTO_INCREMENT PRIMARY KEY,
    PIX VARCHAR(255),
    Boleto VARCHAR(45),
    TipoPagamento ENUM('PIX', 'Boleto', 'Cartão') NOT NULL,
    idCliente INT NOT NULL,
    idPedido INT NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES pedido(idCliente),
    FOREIGN KEY (idPedido) REFERENCES pedido(idPedido)
);

CREATE TABLE boleto(
	idBoleto INT AUTO_INCREMENT PRIMARY KEY,
    Valor FLOAT DEFAULT 0,
    DataPagamento DATE,
    idPagamento INT NOT NULL,
    idPedido INT NOT NULL,
    idCliente INT NOT NULL,
    FOREIGN KEY (idPagamento) REFERENCES pagamento(idPagamento),
    FOREIGN KEY (idPedido) REFERENCES pagamento(idPedido),
    FOREIGN KEY (idCliente) REFERENCES pagamento(idCliente)
);

CREATE TABLE cartao(
	idCartao INT AUTO_INCREMENT PRIMARY KEY,
    TitularCartao VARCHAR(100),
    NumeroCartao VARCHAR(20),
    BandeiraCartao VARCHAR(45),
    ValidadeCartao DATE,
    Valor FLOAT DEFAULT 0,
    idPagamento INT NOT NULL,
    idPedido INT NOT NULL,
    idCliente INT NOT NULL,
    FOREIGN KEY (idPagamento) REFERENCES pagamento(idPagamento),
    FOREIGN KEY (idPedido) REFERENCES pagamento(idPedido),
    FOREIGN KEY (idCliente) REFERENCES pagamento(idCliente)
);

CREATE TABLE pix(
	idPIX INT AUTO_INCREMENT PRIMARY KEY,
    Valor FLOAT DEFAULT 0,
    Chave VARCHAR(255) NOT NULL,
    idPagamento INT NOT NULL,
    idPedido INT NOT NULL,
    idCliente INT NOT NULL,
    FOREIGN KEY (idPagamento) REFERENCES pagamento(idPagamento),
    FOREIGN KEY (idPedido) REFERENCES pagamento(idPedido),
    FOREIGN KEY (idCliente) REFERENCES pagamento(idCliente)
);

CREATE TABLE relacao_produto_pedido(
	idProduto INT NOT NULL,
    idPedido INT NOT NULL,
    Quantidade INT NOT NULL,
    StatusProdutoPedido ENUM('Disponível', 'Indisponível'),
    FOREIGN KEY (idProduto) REFERENCES produto(idProduto),
    FOREIGN KEY (idPedido) REFERENCES pedido(idPedido)
);

CREATE TABLE estoque(
	idEstoque INT AUTO_INCREMENT PRIMARY KEY,
    LocalEstoque VARCHAR(45) NOT NULL,
    Quantidade INT DEFAULT 0 NOT NULL
);

CREATE TABLE produto_em_estoque(
	idProduto INT NOT NULL,
    idEstoque INT NOT NULL,
    Quantidade INT,
    FOREIGN KEY (idProduto) REFERENCES produto(idProduto),
    FOREIGN KEY (idEstoque) REFERENCES estoque(idEstoque)
);

CREATE TABLE fornecedor(
	idFornecedor INT AUTO_INCREMENT PRIMARY KEY,
    RazaoSocial VARCHAR(100) NOT NULL,
    Cnpj VARCHAR(15) NOT NULL UNIQUE,
    Contato VARCHAR(11),
    Endereco VARCHAR(255)
);

CREATE TABLE produto_fornecedor(
	idFornecedor INT NOT NULL,
	idProduto INT NOT NULL,
    Quantidade INT NOT NULL,
    FOREIGN KEY (idFornecedor) REFERENCES fornecedor(idFornecedor),
    FOREIGN KEY (idProduto) REFERENCES produto(idProduto)
);

CREATE TABLE vendedor(
	idVendedor INT AUTO_INCREMENT PRIMARY KEY,
    RazaoSocial VARCHAR(100) NOT NULL,
    NomeFantasia VARCHAR(45),
    Cnpj VARCHAR(15) NOT NULL UNIQUE,
    Endereco VARCHAR(255),
    Telefone VARCHAR(15)
);

CREATE TABLE produto_vendedor(
	idVendedor INT NOT NULL,
    idProduto INT NOT NULL,
    Quantidade INT,
    FOREIGN KEY (idVendedor) REFERENCES vendedor(idVendedor),
    FOREIGN KEY (idProduto) REFERENCES produto(idProduto)
);