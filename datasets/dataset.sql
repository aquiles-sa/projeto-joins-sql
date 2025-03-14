-- Tabela clientes
CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

INSERT INTO clientes (nome, email)
VALUES
('João Silva', 'joao@email.com'),
('Maria Oliveira ', 'maria@email.com'),
('Carlos Santos', 'carlos@email.com'),
('Ana Souza', 'ana@email.com');