/*
QUESTÕES:
    1. Liste todos os clientes e os pedidos que eles fizeram, se houver.
    2. Encontre os clientes que nunca realizaram um pedido.
    3. Liste todos os produtos e, se vendidos, quantas unidades foram compradas.
    4. Mostre os clientes e o valor total que cada um gastou.
    5. Liste todos os pedidos e, caso o cliente não exista, indique "Cliente desconhecido".
*/

-- * (1) Liste todos os clientes e os pedidos que eles fizeram, se houver. --
SELECT 
	cl.nome,
	pr.nome_produto,
	pe.quantidade,
	pe.data_pedido
FROM clientes cl
LEFT JOIN pedidos pe USING(id_cliente)
LEFT JOIN produtos pr USING(id_produto)

-- * (2) Encontre os clientes que nunca realizaram um pedido. --
WITH clientes_quantidade_pedidos AS (
	SELECT
		cl.id_cliente,
		cl.nome AS nome_cliente,
		pe.quantidade AS total_pedidos
	FROM clientes cl
	LEFT JOIN pedidos pe USING(id_cliente)
)
SELECT c.nome_cliente
FROM clientes_quantidade_pedidos c
WHERE total_pedidos IS NULL

-- * (3) Liste todos os produtos e, se vendidos, quantas unidades foram compradas. --
SELECT 
	pr.id_produto,
	pr.nome_produto,
	SUM(pe.quantidade) AS total_vendido
FROM produtos pr
LEFT JOIN pedidos pe USING (id_produto)
GROUP BY pr.id_produto, pr.nome_produto

-- * (4) Mostre os clientes e o valor total que cada um gastou. --
SELECT 
	cl.id_cliente,
	cl.nome,
	COALESCE(SUM(pr.preco * pe.quantidade), 0) AS total_gasto
FROM clientes cl
LEFT JOIN pedidos pe USING(id_cliente)
LEFT JOIN produtos pr USING(id_produto)
GROUP BY cl.id_cliente, cl.nome
ORDER BY total_gasto DESC;

-- * (5) Liste todos os pedidos e, caso o cliente não exista, indique "Cliente desconhecido". --
SELECT 
	pe.id_pedido,
	COALESCE(cl.nome, 'Cliente desconhecido') AS nome_cliente,
	pr.nome_produto,
	pe.data_pedido
FROM pedidos pe
LEFT JOIN clientes cl USING(id_cliente)
LEFT JOIN produtos pr USING(id_produto)