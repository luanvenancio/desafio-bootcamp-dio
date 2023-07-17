DROP DATABASE IF EXISTS Oficina;
CREATE DATABASE IF NOT EXISTS Oficina;
USE Oficina;

CREATE TABLE Conserto (
    idConserto INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(45) NOT NULL
);

CREATE TABLE Revisao (
    idRevisao INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(45) NOT NULL
);

CREATE TABLE Mecanico (
    idMecanico INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(55) NOT NULL,
	Sobrenome VARCHAR(55) NOT NULL,
    Endereco VARCHAR(255) NOT NULL,
    Especialidade VARCHAR(45) NOT NULL
);

CREATE TABLE Equipe_Mecanicos (
    idEquipeMecanicos INT AUTO_INCREMENT PRIMARY KEY,
    CONSTRAINT fk_Mecanico FOREIGN KEY (idEquipeMecanicos) REFERENCES Mecanico(idMecanico)
);

CREATE TABLE Veiculo (
    idVeiculo INT AUTO_INCREMENT PRIMARY KEY,
    idRevisao INT,
    Placa CHAR(7) NOT NULL,
    CONSTRAINT placa_idVeiculo UNIQUE (idVeiculo, Placa),
    CONSTRAINT fk_eqp_mecanicos FOREIGN KEY (idVeiculo) REFERENCES Equipe_Mecanicos(idEquipeMecanicos),
    CONSTRAINT fk_conserto FOREIGN KEY (idVeiculo) REFERENCES Conserto(idConserto),
    CONSTRAINT fk_revisao FOREIGN KEY (idRevisao) REFERENCES Revisao(idRevisao)
);

CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    idVeiculo INT,
    CONSTRAINT fk_veiculo FOREIGN KEY (idVeiculo) REFERENCES Veiculo(idVeiculo)
);

CREATE TABLE Cliente_PessoaFisica (
    idCliente_PessoaFisica INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(55) NOT NULL,
    Sobrenome VARCHAR(55) NOT NULL,
    CPF CHAR(11) NOT NULL,
    Endereco VARCHAR(255),
    Contato CHAR(11),
    CONSTRAINT unique_cpf_cliente_PessoaFisica UNIQUE (CPF),
    CONSTRAINT fk_idCliente_pessoafisica FOREIGN KEY (idCliente_PessoaFisica) REFERENCES Cliente(idCliente),
    CONSTRAINT fk_veiculo_pessoafisica FOREIGN KEY (idCliente_PessoaFisica) REFERENCES Veiculo(idVeiculo),
    CONSTRAINT fk_cliente_pessoafisica FOREIGN KEY (idCliente_PessoaFisica) REFERENCES Cliente(idCliente)
);

CREATE TABLE Cliente_PessoaJuridica (
    idCliente_PessoaJuridica INT AUTO_INCREMENT PRIMARY KEY,
    RazaoSocial VARCHAR(45) NOT NULL,
    CNPJ CHAR(15) NOT NULL,
    Endereco VARCHAR(255),
    Contato CHAR(11),
    CONSTRAINT unique_cnpj_Cliente_PessoaJuridica UNIQUE (CNPJ),
    CONSTRAINT fk_Cliente_pessoajuridica FOREIGN KEY (idCliente_PessoaJuridica) REFERENCES Cliente(idCliente),
    CONSTRAINT fk_veiculo_pessoajuridica FOREIGN KEY (idCliente_PessoaJuridica) REFERENCES Veiculo(idVeiculo)
);

CREATE TABLE Ordem_Servico (
    idOrdemServico INT AUTO_INCREMENT PRIMARY KEY,
    DataEmissao DATE,
    ValorServico FLOAT NOT NULL,
    ValorPeca FLOAT NOT NULL,
    ValorTotal FLOAT NOT NULL,
    Status ENUM('CONCLUIDO', 'EM ANDAMENTO', 'CANCELADO'),
    DataConclusao DATE
);

CREATE TABLE Autorizacao (
    idAutorizacao INT AUTO_INCREMENT PRIMARY KEY,
    Autorizado BOOL DEFAULT FALSE,
    CONSTRAINT fk_autorizacao_cliente FOREIGN KEY (idAutorizacao) REFERENCES Cliente(idCliente),
    CONSTRAINT fk_autorizacao_veiculo FOREIGN KEY (idAutorizacao) REFERENCES Veiculo(idVeiculo),
    CONSTRAINT fk_autorizacao_Ordem_Servico FOREIGN KEY (idAutorizacao) REFERENCES Ordem_Servico(idOrdemServico)
);

CREATE TABLE Pecas (
    idPecas INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(45),
    Valor FLOAT NOT NULL
);

CREATE TABLE Ordem_Servico_Pecas (
    idOrdemServicoPecas INT AUTO_INCREMENT PRIMARY KEY,
    CONSTRAINT fk_pecas FOREIGN KEY (idOrdemServicoPecas)
        REFERENCES Pecas (idPecas),
    CONSTRAINT fk_os_pecas FOREIGN KEY (idOrdemServicoPecas)
        REFERENCES Ordem_Servico (idOrdemServico)
);

CREATE TABLE Referencia (
    idReferencia INT AUTO_INCREMENT PRIMARY KEY,
    CONSTRAINT fk_referencia FOREIGN KEY (idReferencia) REFERENCES Ordem_Servico(idOrdemServico)
);

CREATE TABLE Servicos (
    idServicos INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(255),
    Valor FLOAT NOT NULL
);

SHOW TABLES;