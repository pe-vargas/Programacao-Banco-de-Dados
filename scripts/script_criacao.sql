-- Trabalho acadêmico: PI - Programação em Banco de Dados (2025/01)
-- Universidade Tuiuti do Paraná (UTP)
-- Banco de dados para gerenciamento de carteiras virtuais de criptomoedas.
-- Integrantes: Alexandre Mehes, Heloisa dos Santos, João Manfron e Pedro Vargas

-- Criar o banco de dados
CREATE DATABASE CarteiraVirtualDB;
GO

-- Usar o banco recém-criado
USE CarteiraVirtualDB;
GO

-- Criar o esquema
CREATE SCHEMA Wallet;
GO

-- Tabela de Clientes
CREATE TABLE Wallet.Cliente (
    ClienteID INT PRIMARY KEY IDENTITY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PassHash CHAR(32) NOT NULL -- MD5 hash
);
GO

-- Tabela de Moedas
CREATE TABLE Wallet.Moeda (
    MoedaID INT PRIMARY KEY IDENTITY,
    Nome VARCHAR(50) NOT NULL,
    Simbolo VARCHAR(10) NOT NULL UNIQUE
);
GO

-- Tabela de Cotações
CREATE TABLE Wallet.Cotacao (
    CotacaoID INT PRIMARY KEY IDENTITY,
    MoedaID INT FOREIGN KEY REFERENCES Wallet.Moeda(MoedaID),
    ParMoeda VARCHAR(20) NOT NULL,
    Preco DECIMAL(18,2) NOT NULL,
    DataCotacao DATETIME DEFAULT SYSDATETIME()
);
GO

-- Tabela de Carteira Virtual
CREATE TABLE Wallet.Carteira (
    CarteiraID INT PRIMARY KEY IDENTITY,
    ClienteID INT FOREIGN KEY REFERENCES Wallet.Cliente(ClienteID),
    MoedaID INT FOREIGN KEY REFERENCES Wallet.Moeda(MoedaID),
    EnderecoCarteira VARCHAR(50) UNIQUE NOT NULL,
    Saldo DECIMAL(18,8) NOT NULL
);
GO

-- Índices para consulta
CREATE INDEX idx_Cliente_Email ON Wallet.Cliente (Email);
CREATE INDEX idx_Carteira_ClienteID ON Wallet.Carteira (ClienteID);
CREATE INDEX idx_Cotacao_MoedaID ON Wallet.Cotacao (MoedaID);
GO

-- Inserção de dados
INSERT INTO Wallet.Cliente (Nome, Email, PassHash)
VALUES
    ('Roberto', 'roberto@email.com', 'e10adc3949ba59abbe56e057f20f883e'),
    ('Cleriton', 'cleriton@email.com', 'e10adc3949ba59abbe56e057f20f883e');
GO

INSERT INTO Wallet.Moeda (Nome, Simbolo)
VALUES
    ('Bitcoin', 'BTC'),
    ('Ethereum', 'ETH'),
    ('Litecoin', 'LTC');
GO

INSERT INTO Wallet.Cotacao (MoedaID, ParMoeda, Preco)
VALUES
    (1, 'BTC/USD', 60356.70),
    (2, 'ETH/USD', 2570.52),
    (3, 'LTC/USD', 63.59);
GO

INSERT INTO Wallet.Carteira (ClienteID, MoedaID, EnderecoCarteira, Saldo)
VALUES
    (1, 1, '3QT1c5GxaqCnNvUusQsZ2jS6rWTRsNJSYp', 0.50000000),
    (2, 2, '2Bj1x5HnwbCnAbUwsQsZ7jX4rWXYsABCDF', 1.75000000);
GO

-- Visão: saldo por usuário
CREATE VIEW Wallet.vw_SaldoPorUsuario AS
SELECT
    c.Nome,
    m.Nome AS Moeda,
    ct.Saldo
FROM Wallet.Carteira ct
JOIN Wallet.Cliente c ON ct.ClienteID = c.ClienteID
JOIN Wallet.Moeda m ON ct.MoedaID = m.MoedaID;
GO

-- Consulta
SELECT * FROM Wallet.vw_SaldoPorUsuario;
GO
