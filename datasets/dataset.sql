-- Tabela clientes
CREATE TABLE Clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE
);

INSERT INTO Clientes (nome, email)
VALUES
('João Silva', 'joao@email.com'),
('Maria Oliveira ', 'maria@email.com'),
('Carlos Santos', 'carlos@email.com'),
('Ana Souza', 'ana@email.com');

CREATE TABLE Produtos (
    id_produto SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10, 2) 
);

INSERT INTO Produtos (nome, preco)
VALUES
('Notebook', 3500.00)
('Smartphone', 2200.00)
('Mouse', 120.00)
('Teclado', 200.00)