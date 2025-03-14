/*
QUESTÕES:
    1. Liste os detalhes dos pedidos, incluindo nome do cliente e nome do produto.
    2. Encontre os clientes que já compraram mais de um produto.
    3. Liste os produtos vendidos e a quantidade total vendida de cada um.
    4. Mostre os clientes que compraram um produto específico.
    5. Liste os pedidos realizados em uma determinada data.
*/

-- * (1) Liste os detalhes dos pedidos, incluindo nome do cliente e nome do produto. --
SELECT cl.nome AS nome_cliente, pr.nome_produto as nome_produto, pe.quantidade, pe.data_pedido
FROM pedidos pe
INNER JOIN clientes cl USING(id_cliente)
INNER JOIN produtos pr USING(id_produto)

-- * (2) Encontre os clientes que já compraram mais de um produto. --
WITH cliente_multicompras AS (
	SELECT 
		pe.id_cliente, 
		cl.nome AS nome_cliente, 
		COUNT(DISTINCT pe.id_produto) AS total_comprado
	FROM pedidos pe
	INNER JOIN clientes cl USING(id_cliente)
	GROUP BY pe.id_cliente, cl.nome
)
SELECT
	c.nome_cliente,
	c.total_comprado
FROM cliente_multicompras c
WHERE total_comprado > 1;

-- * (3) Liste os produtos vendidos e a quantidade total vendida de cada um. --
SELECT
	pe.id_produto,
	pr.nome_produto AS produto, 
	SUM(pe.quantidade) AS quantidade_total_vendida
FROM pedidos pe
INNER JOIN produtos pr USING(id_produto)
GROUP BY pe.id_produto, pr.nome_produto

-- * (4) Mostre os clientes que compraram um produto específico. --
WITH clientes_produto_especifico AS (
	SELECT 
		cl.nome AS nome_cliente,
		pr.nome_produto AS nome_produto,
		SUM(pe.quantidade) AS quantidade_vendida
	FROM pedidos pe
	INNER JOIN clientes cl USING(id_cliente)
	INNER JOIN produtos pr USING(id_produto)
	GROUP BY cl.nome, pr.nome_produto
)
SELECT 
	c.nome_cliente,
	c.nome_produto,
	c.quantidade_vendida 
FROM clientes_produto_especifico c
WHERE c.nome_produto = 'Notebook';

-- * (5) Liste os pedidos realizados em uma determinada data. --
WITH pedido_data_especifica AS (
	SELECT 
		cl.nome AS nome_cliente,
        pr.nome_produto AS nome_produto,
        pe.quantidade AS quantidade,
		pe.data_pedido
	FROM pedidos pe
	INNER JOIN clientes cl USING(id_cliente)
	INNER JOIN produtos pr USING(id_produto)
)
SELECT * FROM pedido_data_especifica
WHERE data_pedido = '2024-03-01';

