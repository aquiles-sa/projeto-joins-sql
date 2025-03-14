-- Tabela clientes
CREATE TABLE Clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE
);

-- Tabela produtos
CREATE TABLE Produtos (
    id_produto SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10, 2) 
);

-- Tabela pedidos
CREATE TABLE Pedidos (
    id_pedido SERIAL PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    data_pedido DATE NOT NULL
    FOREIGN KEY(id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY(id_produto) REFERENCES Produtos(id_produto),
);

INSERT INTO Clientes (nome, email)
VALUES
('João Silva', 'joao@email.com'),
('Maria Oliveira ', 'maria@email.com'),
('Carlos Santos', 'carlos@email.com'),
('Ana Souza', 'ana@email.com');

INSERT INTO Produtos (nome, preco)
VALUES
('Notebook', 3500.00),
('Smartphone', 2200.00),
('Mouse', 120.00),
('Teclado', 200.00);

INSERT INTO Pedidos (id_cliente, id_produto, quantidade, data_pedido)
VALUES
(1, 1, 1, '2024-03-01'),
(1, 3, 2, '2024-03-02'),
(2, 2, 1, '2024-03-03'),
(3, 4, 1, '2024-03-04');