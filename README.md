# Trabalho Acadêmico de Programação em Banco de Dados

**Universidade Tuiuti do Paraná | 2025**

## Sobre o trabalho

Projeto desenvolvido em equipe como atividade acadêmica da disciplina de **Programação em Banco de Dados**, do curso de Análise e Desenvolvimento de Sistemas da Universidade Tuiuti do Paraná (UTP).

O trabalho consiste na elaboração de dois scripts SQL para o Microsoft SQL Server, destinados à criação e ao rollback de um banco de dados para uma aplicação de carteira virtual de criptomoedas.

## Objetivos

Desenvolver uma estrutura de banco de dados relacional capaz de gerenciar:

- Clientes e usuários;
- Moedas;
- Cotações de criptomoedas;
- Carteiras virtuais individuais.

## Tecnologias utilizadas

- Microsoft SQL Server
- SQL
- SQL Server Management Studio (SSMS)

## Implementação

O projeto contempla:

- Criação do banco de dados `CarteiraVirtualDB`;
- Criação do esquema `Wallet`;
- Criação e relacionamento das tabelas;
- Definição de chaves primárias e estrangeiras;
- Criação de índices para otimização de consultas;
- Inserção de dados de exemplo;
- Criação de uma VIEW para consulta do saldo por usuário;
- Script de rollback para exclusão dos objetos e do banco de dados.

## Estrutura do projeto

```text
scripts/
├── script_criacao.sql
└── script_rollback.sql

documentacao/
├── trabalho_original.docx
└── enunciado.pdf
```

## Integrantes

- Alexandre Mehes
- Heloisa dos Santos
- João Manfron
- Pedro Vargas

## Informações acadêmicas

| Informação | Detalhes |
|---|---|
| Instituição | Universidade Tuiuti do Paraná (UTP) |
| Curso | Análise e Desenvolvimento de Sistemas |
| Disciplina | Programação em Banco de Dados |
| Professor | Sérgio |
| Período | 2025/01 |
| Tipo | Trabalho acadêmico em equipe |

---

**Observação:** Este repositório tem finalidade acadêmica e documental, reunindo os arquivos e scripts desenvolvidos para a atividade proposta na disciplina.
