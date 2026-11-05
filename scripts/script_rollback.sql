-- Trabalho acadêmico: PI - Programação em Banco de Dados (2025/01)
-- Universidade Tuiuti do Paraná (UTP)
-- Script para desfazer as ações de criação do banco CarteiraVirtualDB.

-- Usar o banco
USE CarteiraVirtualDB;
GO

-- Excluir objetos na ordem correta
DROP VIEW IF EXISTS Wallet.vw_SaldoPorUsuario;
DROP TABLE IF EXISTS Wallet.Carteira;
DROP TABLE IF EXISTS Wallet.Cotacao;
DROP TABLE IF EXISTS Wallet.Moeda;
DROP TABLE IF EXISTS Wallet.Cliente;
GO

-- Excluir esquema
DROP SCHEMA IF EXISTS Wallet;
GO

-- Excluir banco
USE master;
GO

DROP DATABASE IF EXISTS CarteiraVirtualDB;
GO
