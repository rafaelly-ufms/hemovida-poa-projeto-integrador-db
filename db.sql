CREATE TABLE Doador (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100),
  cpf CHAR(11) UNIQUE,
  tipo_sanguineo VARCHAR(3),
  data_nascimento DATE
);

CREATE TABLE Agendamento (
  id SERIAL PRIMARY KEY,
  doador_id INTEGER REFERENCES Doador(id),
  posto_id INTEGER REFERENCES PostoColeta(id),
  data_hora TIMESTAMP
);

CREATE TABLE Doacao (
  id SERIAL PRIMARY KEY,
  agendamento_id INTEGER REFERENCES Agendamento(id),
  data_doacao DATE DEFAULT CURRENT_DATE
);

CREATE TABLE Notificacao (
  id SERIAL PRIMARY KEY,
  doador_id INTEGER REFERENCES Doador(id),
  mensagem TEXT,
  enviada_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Estoque (
  tipo_sanguineo VARCHAR(3) PRIMARY KEY,
  quantidade_ml INTEGER
);

-- INSERIR NOVO DOADOR 
INSERT INTO Doador (nome, cpf, tipo_sanguineo, data_nascimento)
VALUES ('Maria Rafaelly', '12345678900', 'B+', '1999-10-21');

-- ATUALIZAR ESTOQUE
UPDATE Estoque SET quantidade_ml = quantidade_ml - 450 WHERE tipo_sanguineo = 'B+';

-- REMOVER AGENDAMENTO CANCELADO
DELETE FROM Agendamento WHERE id = 5;

-- HISTÓRICO DE DOAÇÕES POR DOADOR
SELECT d.nome, doa.data_doacao
FROM Doador d
JOIN Agendamento a ON d.id = a.doador_id
JOIN Doacao doa ON doa.agendamento_id = a.id
WHERE d.cpf = '12345678900';