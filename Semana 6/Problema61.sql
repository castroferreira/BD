-- Problema 6.1
use pubs;

-- a) Todos os tuplos da tabela autores (authors);
SELECT * FROM authors;

-- b) O primeiro nome, o último nome e o telefone dos autores;
SELECT au_fname, au_lname, phone FROM authors;

-- c) Consulta definida em b) mas ordenada pelo primeiro nome (ascendente) e depois o último nome 
-- (ascendente);
SELECT au_fname, au_lname, phone FROM authors 
ORDER BY au_fname ASC, au_lname ASC;

-- d) Consulta definida em c) mas renomeando os atributos para (first_name, last_name, telephone);
SELECT au_fname AS first_name, au_lname AS last_name, phone AS telephone FROM authors 
ORDER BY au_fname ASC , au_lname ASC;

-- e) Consulta definida em d) mas só os autores da Califórnia (CA) cujo último nome é diferente de ‘Ringer’;
SELECT au_fname AS first_name, au_lname AS last_name, phone AS telephone, state FROM authors
WHERE state='CA' AND au_lname <> 'Ringer' 
ORDER BY au_fname ASC , au_lname ASC;

-- f) Todas as editoras (publishers) que tenham ‘Bo’ em qualquer parte do nome;
SELECT * FROM publishers WHERE pub_name LIKE'%Bo%';

-- g) Nome das editoras que têm pelo menos uma publicação do tipo ‘Business’;
SELECT DISTINCT pub_name FROM publishers JOIN titles ON publishers.pub_id=titles.pub_id WHERE type='business';

-- h) Número total de vendas de cada editora;
SELECT pub_name AS publisher, SUM(qty) AS Sales FROM publishers 
JOIN titles ON publishers.pub_id=titles.pub_id 
JOIN sales ON titles.title_id=sales.title_id
GROUP BY pub_name;

-- i) Número total de vendas de cada editora agrupado por título;
SELECT pub_name AS publisher, title, SUM(qty) AS Sales FROM publishers 
JOIN titles ON publishers.pub_id=titles.pub_id 
JOIN sales ON titles.title_id=sales.title_id
GROUP BY pub_name, title;

-- j) Nome dos títulos vendidos pela loja ‘Bookbeat’;
SELECT title AS Titles FROM titles 
JOIN sales ON titles.title_id=sales.title_id
JOIN stores ON sales.stor_id=stores.stor_id
WHERE stores.stor_name='Bookbeat';

-- k) Nome de autores que tenham publicações de tipos diferentes;
SELECT au_fname, au_lname FROM authors
JOIN titleauthor ON authors.au_id=titleauthor.au_id
JOIN titles ON titleauthor.title_id=titles.title_id
GROUP BY au_fname, au_lname
HAVING COUNT (DISTINCT type) > 1; 

-- l) Para os títulos, obter o preço médio e o número total de vendas agrupado por tipo (type) e 
-- editora (pub_id);
SELECT AVG(price) AS Price_Media, SUM(qty) AS Total_Sales FROM titles
JOIN sales ON sales.title_id=titles.title_id
GROUP BY pub_id,type;

-- m) Obter o(s) tipo(s) de título(s) para o(s) qual(is) o máximo de dinheiro “à cabeça” (advance) é
-- uma vez e meia superior à média do grupo (tipo);
-- n) Obter, para cada título, nome dos autores e valor arrecadado por estes com a sua venda;
-- o) Obter uma lista que incluía o número de vendas de um título (ytd_sales), o seu nome, a 
-- faturação total, o valor da faturação relativa aos autores 
-- e o valor da faturação relativa à editora;
-- p) Obter uma lista que incluía o número de vendas de um título (ytd_sales), o seu nome, o nome de
-- cada autor, o valor da faturação de cada autor e o valor da faturação relativa à editora;
-- q) Lista de lojas que venderam pelo menos um exemplar de todos os livros;
-- r) Lista de lojas que venderam mais livros do que a média de todas as lojas.
-- s) Nome dos títulos que nunca foram vendidos na loja “Bookbeat”;
-- t) Para cada editora, a lista de todas as lojas que nunca venderam títulos dessa editora;