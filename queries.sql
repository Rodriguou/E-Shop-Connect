USE eshopconnect;

-- 2.a | Consultar todos os produtos existentes na loja
SELECT name, fk_brandName, type, preco
FROM product;

-- 2.b | Consultar os nomes de todos os usuários
SELECT name
FROM users;

-- 2.c | Consultar as lojas que vendem produtos;
SELECT DISTINCT store.name
FROM store
INNER JOIN product ON store.pk_sid = product.fk_sid;

-- 2.d | Consultar os endereços relacionando  com os clientes;
SELECT
	address.name AS endereco,
    users.name AS nome
FROM address
INNER JOIN users ON address.fk_userId = users.pk_userId
INNER JOIN buyer ON users.pk_userId = buyer.pk_userId;

-- 2.e | Consultar todos os produtos do tipo laptop;
SELECT *
FROM product
WHERE type = 'laptop';

-- 2.f | Consultar o endereço, hora de inicio e hora final dos pontos de serviço da mesma cidade que o usuário cujo ID é 5
SELECT
	servicepoint.streetAddr AS endereco,
    servicepoint.startTime AS horaInicio,
    servicepoint.endTime AS horaFim
FROM servicepoint
INNER JOIN aftersalesservicesat ON servicepoint.pk_spid = aftersalesservicesat.fk_spid
INNER JOIN brand ON aftersalesservicesat.fk_brandName = brand.pk_brandName
INNER JOIN product ON brand.pk_brandName = product.fk_brandName
INNER JOIN comments ON product.pk_pid = comments.fk_pid
INNER JOIN buyer ON comments.fk_userId = buyer.pk_userId
INNER JOIN users ON buyer.pk_userId = users.pk_userId
INNER JOIN address ON users.pk_userId = address.fk_userId
WHERE address.city = servicepoint.city AND users.pk_userId = 5;

-- 2.g | Consultar a quantidade total de produtos que foram colocados no carrinho (shopping cart),considerando a loja com ID (sid) igual a 8
SELECT SUM(savetoshoppingcart.quantity) AS quantidade
FROM savetoshoppingcart
INNER JOIN product ON savetoshoppingcart.fk_pid = product.pk_pid AND product.fk_sid = 8;

-- 2.h | Consultar os comentários do produto 123456789
SELECT content AS comentario
FROM comments
WHERE fk_pid = 123456789;