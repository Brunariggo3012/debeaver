-- evento
create database evento;
create table dados_evento (
id serial primary key,
nome varchar(100),
descricao text
);

create table agenda (
id serial primary key,
data_inicio date,
data_fim date
);

create table pessoa (
id serial primary key,
nome varchar (50),
cpf char (11)
);

alter table agenda add column id_evento int;

alter table agenda
add foreign key (id_evento)
references evento(id);

alter table agenda add column id_pessoa int;

alter table agenda 
add foreign key (id_pessoa)
references pessoa(id);

insert into dados_evento (nome, descricao) 
values('Conferência de Tecnologia 2025'),
('Workshop de Marketing Digital'),
('Seminário de Sustentabilidade'),
('Feira de Inovação e Startups'),
('Encontro Anual de Vendas');

insert into agenda (data_inicio, data_fim, id_evento, id_pessoa) 
values('2025-11-10 09:00:00', '2025-11-10 17:00:00', 1, 101),
('2025-12-05 14:00:00', '2025-12-05 18:00:00', 2, 102),
('2025-11-20 08:30:00', '2025-11-20 12:30:00', 3, 103),
('2025-12-15 10:00:00', '2025-12-15 16:00:00', 4, 104),
('2025-11-25 13:00:00', '2025-11-25 15:00:00', 5, 105);

insert into pessoa (nome, cpf) 
values('Ana Silva', '123.456.789-00'),
('Bruno Souza', '987.654.321-11'),
('Carla Pereira', '456.789.123-22'),
('Diego Martins', '321.654.987-33'),
('Elisa Fernandes', '789.123.456-44');



SELECT * FROM Clientes;


SELECT nome, email FROM Clientes;


SELECT produto_id, nome, preco, estoque FROM Produtos;


SELECT * FROM Clientes WHERE cidade = 'São Paulo';


SELECT * FROM Produtos WHERE preco > 100;


SELECT * FROM Pedidos WHERE status = 'Entregue';


SELECT * FROM Produtos ORDER BY preco DESC;


SELECT * FROM Clientes WHERE cidade = 'Rio de Janeiro' AND idade > 18;


SELECT cliente_id, COUNT(*) AS total_pedidos FROM Pedidos GROUP BY cliente_id;


SELECT * FROM Clientes WHERE nome LIKE 'Jo%';


SELECT * FROM Produtos WHERE nome LIKE '%camisa%';


SELECT Pedidos.pedido_id, Clientes.nome, Pedidos.data_pedido
FROM Pedidos
INNER JOIN Clientes ON Pedidos.cliente_id = Clientes.cliente_id;


SELECT ItensPedido.pedido_id, Produtos.nome, ItensPedido.quantidade
FROM ItensPedido
INNER JOIN Produtos ON ItensPedido.produto_id = Produtos.produto_id;


SELECT Clientes.nome, Pedidos.pedido_id, Pedidos.status
FROM Clientes
INNER JOIN Pedidos ON Clientes.cliente_id = Pedidos.cliente_id;


CREATE VIEW vw_ClientesAtivos AS
SELECT * FROM Clientes WHERE status = 'ativo';


CREATE VIEW vw_PedidosEntregues AS
SELECT Pedidos.pedido_id, Clientes.nome, Pedidos.data_pedido
FROM Pedidos
INNER JOIN Clientes ON Pedidos.cliente_id = Clientes.cliente_id
WHERE Pedidos.status = 'Entregue';


CREATE VIEW vw_ProdutosEstoqueBaixo AS
SELECT produto_id, nome, estoque
FROM Produtos
WHERE estoque < 10;


