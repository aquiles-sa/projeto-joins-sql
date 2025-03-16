/*
QUESTÕES
    1. Liste todos os clientes e todos os pedidos, incluindo clientes sem pedidos e pedidos sem clientes.
    2. Encontre os clientes que nunca compraram e os produtos que nunca foram vendidos.
    3. Liste todos os produtos e os pedidos feitos, mesmo que não tenham sido vendidos.
    4. Mostre todas as combinações possíveis entre clientes e pedidos.
    5. Liste o total de pedidos por cliente, garantindo que todos os clientes apareçam.
*/

-- * (1) Liste todos os clientes e todos os pedidos, incluindo clientes sem pedidos e pedidos sem clientes. --
SELECT 
	cl.id_cliente,
	COALESCE(cl.nome, 'Cliente desconhecido') AS nome_cliente,
	pe.id_pedido,
	COALESCE(pr.nome_produto, 'Produto desconhecido') AS nome_produto,
	COALESCE(pe.quantidade::TEXT, 'Sem pedido') AS quantidade_vendida,
	pe.data_pedido
FROM clientes cl
FULL OUTER JOIN pedidos pe USING(id_cliente)
FULL OUTER JOIN produtos pr USING(id_produto)
ORDER BY cl.id_cliente, pe.id_pedido;

-- * (2) Encontre os clientes que nunca compraram e os produtos que nunca foram vendidos. --
WITH clientes_e_produtos_compras_vendas AS (
	SELECT
		cl.id_cliente,
		COALESCE(cl.nome, 'Cliente desconhecido') AS nome_cliente,
		pr.id_produto,
		COALESCE(pr.nome_produto, 'Produto desconhecido') AS nome_produto,
		pe.quantidade AS quantidade_vendida
	FROM clientes cl
	FULL OUTER JOIN pedidos pe USING(id_cliente)
	FULL OUTER JOIN produtos pr USING(id_produto)
)
SELECT * FROM clientes_e_produtos_compras_vendas
WHERE quantidade_vendida IS NULL;

-- * (3) Liste todos os produtos e os pedidos feitos, mesmo que não tenham sido vendidos. --
SELECT
	pr.id_produto,
	pr.nome_produto,
	COALESCE(pe.quantidade, 0) AS quantidade_vendida,
	pe.data_pedido
FROM produtos pr
FULL OUTER JOIN pedidos pe USING(id_produto)

-- * (4) Mostre todas as combinações possíveis entre clientes e pedidos. --
SELECT
	cl.id_cliente,
	cl.nome,
	pe.id_pedido,
	pe.id_produto,
	pe.quantidade,
	pe.data_pedido
FROM clientes cl
FULL OUTER JOIN pedidos pe USING(id_cliente)

-- * (5) Liste o total de pedidos por cliente, garantindo que todos os clientes apareçam. --
SELECT 
	cl.id_cliente,
	cl.nome,
	COUNT(id_pedido) AS total_pedidos
FROM clientes cl
FULL OUTER JOIN pedidos pe USING(id_cliente)
GROUP BY cl.id_cliente, cl.nome
ORDER BY total_pedidos DESC;