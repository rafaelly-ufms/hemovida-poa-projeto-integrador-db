# Hemovida POA - Banco de dados

Este repositório documenta a estruturação do banco de dados e o seu gerenciamento de código.

## Tecnologias Utilizadas

- PostgreSQL
- SQL
- Git e GitHub

## Estrutura do Banco de Dados
O banco foi implementado com PostgreSQL, contendo as seguintes entidades:

- Doador – Cadastro de doadores, com dados como nome, CPF, tipo sanguíneo e data de nascimento.
- Agendamento – Controle de horários e locais para doação.
- Doacao – Registro das doações realizadas.
- Notificacao – Mensagens enviadas ao doador.
- Estoque – Quantidade de sangue disponível por tipo sanguíneo.

Exemplo de Criação de Tabela:

``
CREATE TABLE Doador (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100),
  cpf CHAR(11) UNIQUE,
  tipo_sanguineo VARCHAR(3),
  data_nascimento DATE
);
``

Exemplos de Queries:

- Inserção de novos dados
- Atualização de estoque
- Consultas de histórico de doações
- Relatórios com JOINs entre tabelas
- Consulte o início deste arquivo para mais exemplos de queries SQL.

## Gerenciamento de Código com Git

O versionamento foi realizado com o sistema Git, seguindo as seguintes práticas:
- Branch principal: main
- Branch de desenvolvimento: dev
- Branches específicas: feat/, fix/, docs/
- Commits e mensagens descritivas
- Uso do GitHub para pull requests e histórico de alterações

Exemplo de Fluxo:

``
git checkout -b feat/new_queries
git add .
git commit -m "feat(nome_arquivo): descrição da mudança"
git push origin feat/new_queries
``