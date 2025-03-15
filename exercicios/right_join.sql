/*
QUESTÕES
    1. Liste todos os pedidos, incluindo clientes que fizeram esses pedidos.
    2. Encontre os produtos que já foram vendidos pelo menos uma vez.
    3. Liste todos os produtos e os pedidos associados a eles, incluindo produtos que nunca foram vendidos.
    4. Mostre os produtos que foram vendidos e os que não foram.
    5. Liste os produtos com a soma total das quantidades vendidas.
*/

-- * (1) Liste todos os pedidos, incluindo clientes que fizeram esses pedidos. --
SELECT 
	pe.id_pedido,
	cl.nome AS nome_cliente,
	pr.nome_produto,
	pe.quantidade,
	pe.data_pedido
FROM pedidos pe
RIGHT JOIN clientes cl USING(id_cliente)
LEFT JOIN produtos pr USING(id_produto)

-- * (2) Encontre os produtos que já foram vendidos pelo menos uma vez. --
WITH pedidos_quantidade_vendida AS (
	SELECT
		pr.id_produto,
		pr.nome_produto,
		pe.quantidade AS quantidade_vendida
	FROM produtos pr
	RIGHT JOIN pedidos pe USING(id_produto)
)
SELECT * FROM pedidos_quantidade_vendida
WHERE quantidade_vendida >= 1

-- * (3) Liste todos os produtos e os pedidos associados a eles, incluindo produtos que nunca foram vendidos. -- 
SELECT
	pr.id_produto,
	pr.nome_produto,
	pe.quantidade,
	cl.nome,
	pe.data_pedido
FROM pedidos pe
RIGHT JOIN produtos pr USING(id_produto)
LEFT JOIN clientes cl USING(id_cliente)

-- * (4) Mostre os produtos que foram vendidos e os que não foram. --
SELECT 
	pr.id_produto,
	pr.nome_produto,
	COALESCE(pe.quantidade, 0) AS quantidade_vendida
FROM pedidos pe
RIGHT JOIN produtos pr USING(id_produto)
ORDER BY quantidade_vendida DESC;

-- * (5) Liste os produtos com a soma total das quantidades vendidas. --
SELECT
	pr.id_produto,
	pr.nome_produto,
	COALESCE(SUM(pe.quantidade), 0) AS quantidade_total_vendida
FROM pedidos pe
RIGHT JOIN produtos pr USING(id_produto)
GROUP BY pr.id_produto, pr.nome_produto
ORDER BY quantidade_total_vendida DESC;