-- Problema 6.1
use pubs;

-- a) Todos os tuplos da tabela autores (authors);
SELECT * FROM authors;

-- b) O primeiro nome, o �ltimo nome e o telefone dos autores;
SELECT au_fname, au_lname, phone FROM authors;

-- c) Consulta definida em b) mas ordenada pelo primeiro nome (ascendente) e depois o �ltimo nome 
-- (ascendente);
SELECT au_fname, au_lname, phone FROM authors 
ORDER BY au_fname ASC, au_lname ASC;

-- d) Consulta definida em c) mas renomeando os atributos para (first_name, last_name, telephone);
SELECT au_fname AS first_name, au_lname AS last_name, phone AS telephone FROM authors 
ORDER BY au_fname ASC , au_lname ASC;

-- e) Consulta definida em d) mas s� os autores da Calif�rnia (CA) cujo �ltimo nome � diferente de �Ringer�;
SELECT au_fname AS first_name, au_lname AS last_name, phone AS telephone, state FROM authors
WHERE state='CA' AND au_lname <> 'Ringer' 
ORDER BY au_fname ASC , au_lname ASC;

-- f) Todas as editoras (publishers) que tenham �Bo� em qualquer parte do nome;
SELECT * FROM publishers WHERE pub_name LIKE'%Bo%';

-- g) Nome das editoras que t�m pelo menos uma publica��o do tipo �Business�;
SELECT DISTINCT pub_name FROM publishers JOIN titles ON publishers.pub_id=titles.pub_id WHERE type='business';

-- h) N�mero total de vendas de cada editora;
SELECT pub_name AS publisher, SUM(qty) AS Sales FROM publishers 
JOIN titles ON publishers.pub_id=titles.pub_id 
JOIN sales ON titles.title_id=sales.title_id
GROUP BY pub_name;

-- i) N�mero total de vendas de cada editora agrupado por t�tulo;
SELECT pub_name AS publisher, title, SUM(qty) AS Sales FROM publishers 
JOIN titles ON publishers.pub_id=titles.pub_id 
JOIN sales ON titles.title_id=sales.title_id
GROUP BY pub_name, title;

-- j) Nome dos t�tulos vendidos pela loja �Bookbeat�;
SELECT title AS Titles FROM titles 
JOIN sales ON titles.title_id=sales.title_id
JOIN stores ON sales.stor_id=stores.stor_id
WHERE stores.stor_name='Bookbeat';

-- k) Nome de autores que tenham publica��es de tipos diferentes;
SELECT au_fname, au_lname FROM authors
JOIN titleauthor ON authors.au_id=titleauthor.au_id
JOIN titles ON titleauthor.title_id=titles.title_id
GROUP BY au_fname, au_lname
HAVING COUNT (DISTINCT type) > 1; 

-- l) Para os t�tulos, obter o pre�o m�dio e o n�mero total de vendas agrupado por tipo (type) e 
-- editora (pub_id);
SELECT AVG(price) AS Price_Media, SUM(qty) AS Total_Sales FROM titles
JOIN sales ON sales.title_id=titles.title_id
GROUP BY pub_id,type;

-- m) Obter o(s) tipo(s) de t�tulo(s) para o(s) qual(is) o m�ximo de dinheiro �� cabe�a� (advance) �
-- uma vez e meia superior � m�dia do grupo (tipo);
-- n) Obter, para cada t�tulo, nome dos autores e valor arrecadado por estes com a sua venda;
-- o) Obter uma lista que inclu�a o n�mero de vendas de um t�tulo (ytd_sales), o seu nome, a 
-- fatura��o total, o valor da fatura��o relativa aos autores 
-- e o valor da fatura��o relativa � editora;
-- p) Obter uma lista que inclu�a o n�mero de vendas de um t�tulo (ytd_sales), o seu nome, o nome de
-- cada autor, o valor da fatura��o de cada autor e o valor da fatura��o relativa � editora;
-- q) Lista de lojas que venderam pelo menos um exemplar de todos os livros;
-- r) Lista de lojas que venderam mais livros do que a m�dia de todas as lojas.
-- s) Nome dos t�tulos que nunca foram vendidos na loja �Bookbeat�;
-- t) Para cada editora, a lista de todas as lojas que nunca venderam t�tulos dessa editora;