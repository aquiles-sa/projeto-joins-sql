/*
QUESTÕES
    1. Gere todas as combinações possíveis entre clientes e produtos.
    2. Liste todas as combinações de pedidos e produtos.
    3. Mostre todas as combinações entre clientes e possíveis datas de pedidos.
    4. Crie uma matriz de todas as combinações entre produtos e quantidades possíveis.
    5. Liste todas as possibilidades de compras, combinando clientes e produtos.
*/

-- * (1) Gere todas as combinações possíveis entre clientes e produtos. --
SELECT 
	cl.id_cliente,
	cl.nome AS nome_cliente,
	pr.id_produto,
	pr.nome_produto
FROM clientes cl
CROSS JOIN produtos pr

-- * (2) Liste todas as combinações de pedidos e produtos. --
SELECT 
	pe.id_pedido,
	pr.id_produto,
	pr.nome_produto,
	pe.quantidade
FROM pedidos pe
CROSS JOIN produtos pr

-- * (3) Mostre todas as combinações entre clientes e possíveis datas de pedidos. --
SELECT
	cl.id_cliente,
	cl.nome AS nome_cliente,
	pe.data_pedido
FROM clientes cl
CROSS JOIN pedidos pe

-- * (4) Criar uma matriz de todas as combinações entre produtos e quantidades possíveis. --
SELECT
	pr.id_produto,
	pr.nome_produto,
	q.quantidade
FROM produtos pr
CROSS JOIN (SELECT generate_series(1, 10) AS quantidade) q
ORDER BY pr.id_produto, q.quantidade

-- * (5) Liste todas as possibilidades de compras, combinando clientes e produtos. --
SELECT
	cl.id_cliente,
	cl.nome AS nome_cliente,
	pr.id_produto,
	pr.nome_produto
FROM clientes cl
CROSS JOIN produtos pr
ORDER BY cl.id_cliente, pr.id_produto;