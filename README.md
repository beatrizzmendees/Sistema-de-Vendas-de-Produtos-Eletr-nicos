# Sistema de Vendas de Eletrônicos — Projeto SQL (PostgreSQL)

Projeto de banco de dados desenvolvido como parte da Capacitação de Ciência de Dados, com o objetivo de simular o sistema de vendas de uma loja de eletrônicos, cobrindo desde a modelagem e criação do banco de dados até funções, procedures, triggers, transações, permissões e backup.

## 📋 Sobre o projeto

O projeto simula o funcionamento de uma loja de eletrônicos (notebooks, monitores, periféricos, smartphones e áudio), contemplando o ciclo completo de vendas: cadastro de produtos e clientes, registro de pedidos, itens de cada pedido e pagamentos.

O arquivo `Sistema_de_Vendas.sql` contém todo o script, dividido nas seguintes etapas:

- Criação das tabelas
- Inserção de dados
- Consultas simples, com joins, agrupamentos e subconsultas
- Criação de view
- Função SQL
- Stored procedures
- Trigger
- Transação
- Usuários e permissões
- Backup e restore
- Álgebra relacional

## 🗂️ Estrutura do banco de dados

O banco `Sistema_Vendas` é composto por 7 tabelas:

| Tabela | Descrição |
|---|---|
| `categorias` | Categorias de produtos (Notebooks, Monitores, Periféricos, Smartphones, Áudio) |
| `produtos` | Produtos vendidos, cada um associado a uma categoria |
| `clientes` | Clientes cadastrados, com cidade, UF e CPF |
| `funcionarios` | Funcionários responsáveis pelo atendimento dos pedidos |
| `pedidos` | Pedidos feitos pelos clientes, com data e status |
| `itens_pedidos` | Tabela associativa entre pedido e produto, com quantidade e valor unitário de cada item |
| `pagamentos` | Pagamento referente a cada pedido (1 pagamento por pedido) |

**Relacionamentos**

- `produtos.id_categoria` → `categorias.id_categoria`
- `pedidos.id_cliente` → `clientes.id_cliente`
- `pedidos.id_funcionario` → `funcionarios.id_funcionario`
- `itens_pedidos.id_pedido` → `pedidos.id_pedido`
- `itens_pedidos.id_produto` → `produtos.id_produto`
- `pagamentos.id_pedido` → `pedidos.id_pedido`

`itens_pedidos` funciona como tabela associativa (N:N) entre pedidos e produtos, já que um pedido pode ter vários produtos e um produto pode aparecer em vários pedidos.

## 📊 Dados inseridos

- 5 categorias
- 65 produtos
- 50 clientes
- 5 funcionários
- 46 pedidos
- 131 itens de pedido
- 43 pagamentos

## 🔍 Consultas e funcionalidades implementadas

**Consultas simples**
Filtros por preço, status do pedido e status do pagamento.

**Joins**
Pedidos com cliente e funcionário responsável, itens de pedido com produto e categoria, pedidos com forma/status de pagamento (incluindo `LEFT JOIN` para pedidos sem pagamento).

**Agrupamento (GROUP BY / HAVING)**
Total vendido por categoria, número de pedidos por funcionário, clientes que gastaram mais de R$2.000, ticket médio por cliente.

**Subconsultas**
Clientes que nunca fizeram pedido, clientes que já compraram, produtos acima/abaixo do preço médio.

**View**
`view_resumo_pedidos`: resumo de cada pedido com cliente, status, valor total e forma de pagamento.

**Função SQL**
`calculo_totalpedido(id_pedido)`: calcula o valor total de um pedido.

**Stored Procedures**
- `registrar_venda(...)`: registra um pedido e seu item em uma única chamada.
- `registrar_pagamento(...)`: registra um pagamento e atualiza o status do pedido para "Pago".

**Trigger**
`trg_baixar_estoque`: dá baixa automática no estoque ao inserir um item de pedido, bloqueando a operação se não houver estoque suficiente.

**Transação**
Exemplo de `BEGIN`/`COMMIT` garantindo que pedido e item só são confirmados juntos.

**Usuários e permissões**
- `app_vendas`: leitura/escrita, sem permissão de `DELETE`.
- `app_relatorios`: acesso somente leitura a todas as tabelas.

**Backup e restore**
Exemplos de uso de `pg_dump` e `pg_restore`.

**Álgebra relacional**
Exemplos de seleção, projeção, união, interseção, junção e agrupamento.

## 🚀 Como executar

1. Crie o banco no PostgreSQL:
   ```sql
   CREATE DATABASE "Sistema_Vendas";
   ```
2. Execute o script `Sistema_de_Vendas.sql` completo (via `psql`, pgAdmin ou outra ferramenta de sua preferência).
3. O script cria as tabelas, popula com dados de exemplo e já traz exemplos de execução das funções, procedures, trigger, transação e consultas.

## 🛠️ Tecnologias utilizadas

PostgreSQL — SQL (DDL, DML, DQL, DCL) e PL/pgSQL

## 👩‍💻 Autora

**Ana Beatriz Mendes de Sousa**
[LinkedIn](https://www.linkedin.com/in/ana-beatriz-mendes-de-sousa) · [GitHub](https://github.com/beatrizzmendees)
