# projeto-joins-sql

Este é um repositório que contém uma série de exercícios para praticar e entender as operações de JOINS em SQL. Esses exercícios cobrem vários tipos de junção, como INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN e CROSS JOIN. Todos os exercícios foram feitos utilizando o PostgreSQL como SGBD.

<h2>Objetivo</h2>
O objetivo deste repositório é fornecer exemplos práticos para aprender e dominar o uso de JOINS em SQL, sendo essenciais para combinar dados de várias tabelas de maneira eficiente. Os exercícios estão organizados em pastas específicas para cada tipo de JOIN. 

<h2>Estrutura</h2>
<ul>
  <li><b>Datasets:</b> pasta que contém a criação e inserção de valores para cada entidade do banco de dados.</li>
  <li><b>Exercícios:</b> pasta que contém cada arquivo sql de cada JOIN.</li>
</ul>

<h3>Exercícios</h3>
<details>
  <summary><b>INNER JOIN</b></summary>
  <ol>
    <li>Liste os detalhes dos pedidos, incluindo nome do cliente e nome do produto.</li>
    <li>Encontre os clientes que já compraram mais de um produto.</li>
    <li>Liste os produtos vendidos e a quantidade total vendida de cada um.</li>
    <li>Mostre os clientes que compraram um produto específico.</li>
    <li>Liste os pedidos realizados em uma determinada data.</li>
  </ol>
</details>
<details>
  <summary><b>LEFT JOIN</b></summary>
  <ol>
    <li>Liste todos os clientes e os pedidos que eles fizeram, se houver.</li>
    <li>Encontre os clientes que nunca realizaram um pedido.</li>
    <li>Liste todos os produtos e, se vendidos, quantas unidades foram compradas.</li>
    <li>Mostre os clientes e o valor total que cada um gastou.</li>
    <li>Liste todos os pedidos e, caso o cliente não exista, indique "Cliente desconhecido".</li>
  </ol>
</details>
<details>
  <summary><b>RIGHT JOIN</b></summary>
  <ol>
    <li>Liste todos os pedidos, incluindo clientes que fizeram esses pedidos.</li>
    <li>Encontre os produtos que já foram vendidos pelo menos uma vez.</li>
    <li>Liste todos os produtos e os pedidos associados a eles, incluindo produtos que nunca foram vendidos.</li>
    <li>Mostre os produtos que foram vendidos e os que não foram.</li>
    <li>Liste os produtos com a soma total das quantidades vendidas.</li>
  </ol>
</details>
<details>
  <summary><b>FULL OUTER JOIN</b></summary>
  <ol>
    <li>Liste todos os clientes e todos os pedidos, incluindo clientes sem pedidos e pedidos sem clientes.</li>
    <li>Encontre os clientes que nunca compraram e os produtos que nunca foram vendidos.</li>
    <li>Liste todos os produtos e os pedidos feitos, mesmo que não tenham sido vendidos.</li>
    <li>Mostre todas as combinações possíveis entre clientes e pedidos.</li>
    <li>Liste o total de pedidos por cliente, garantindo que todos os clientes apareçam.</li>
  </ol>
</details>
<details>
  <summary><b>CROSS JOIN</b></summary>
  <ol>
    <li>Gere todas as combinações possíveis entre clientes e produtos.</li>
    <li>Liste todas as combinações de pedidos e produtos.</li>
    <li>Mostre todas as combinações entre clientes e possíveis datas de pedidos.</li>
    <li>Crie uma matriz de todas as combinações entre produtos e quantidades possíveis.</li>
    <li>Liste todas as possibilidades de compras, combinando clientes e produtos.</li>
  </ol>
</details>
