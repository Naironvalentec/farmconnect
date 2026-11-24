# FarmConnect 🏥

Sistema de gestão para farmácias — controle de stock por lote, validade, vendas e utilizadores com perfis distintos.

## Estrutura do Banco de Dados

### Tabelas

| Tabela | Descrição |
|--------|-----------|
| `categoria` | Categorias de produtos (Comprimidos, Charopes, Vacinas, Soros, Primeiros socorros) |
| `produto` | Produtos com princípio ativo, forma farmacêutica, preço e exige receita |
| `lote` | Lotes com validade, quantidade e preço de custo por farmácia/fornecedor |
| `farmacia` | Farmácias cadastradas |
| `fornecedor` | Fornecedores de medicamentos |
| `cliente` | Clientes finais |
| `utilizador` | Utilizadores do sistema (perfis: Gerente / Balcao) |
| `venda` | Vendas realizadas |
| `item_venda` | Itens de cada venda (produto, quantidade, preço unitário) |

### Views

- **`vw_stock_produto`** — Stock atual por produto e farmácia, ignorando lotes vencidos
- **`vw_vendas_clientes`** — Total de vendas e gasto acumulado por cliente

### Triggers

- **`trg_item_venda_antes`** — Bloqueia venda de lote expirado e impede vender mais do que o stock disponível
- **`trg_item_venda_depois`** — Faz a baixa automática do stock após registar a venda

## Regras de Negócio

- Um lote não pode ter quantidade negativa (`CHECK`)
- Preço de custo e preço de venda nunca podem ser negativos
- Preços e quantidades são validados antes de qualquer inserção em `item_venda`
- Cada venda está ligada a uma farmácia, um cliente e um utilizador

## Como Restaurar o Banco

1. Tenha MySQL 8+ instalado
2. Clone o repositório:

```bash
git clone https://github.com/Naironvalentec/farmconnect.git
cd farmconnect
```

3. Restaure o schema e os dados:

```bash
mysql -u root -p < farmconnect.sql
```

Ou abra o `farmconnect.sql` no MySQL Workbench, DBeaver ou phpMyAdmin e execute.

## Tecnologias

- MySQL 26.7 Enterprise
- InnoDB com foreign keys e constraints
- Charset UTF-8

## Autor

Nairon Valentec
