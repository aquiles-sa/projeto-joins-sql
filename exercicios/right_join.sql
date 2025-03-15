/*
QUESTÕES
    1. Liste todos os pedidos, incluindo clientes que fizeram esses pedidos.
    2. Encontre os produtos que já foram vendidos pelo menos uma vez.
    3. Liste os clientes e seus respectivos pedidos, incluindo clientes sem pedidos.
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