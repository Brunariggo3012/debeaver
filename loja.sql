--Loja de roupas
create database loja; 
create table produto(
	id serial primary key,
	nome varchar(30),
	preco numeric(5,2),
	quantidade int,
	cor varchar(20),
	tamanho varchar(3)
);

alter table produto add column id_categoria int;

alter table produto
add foreign key (id_categoria)
references categoria(id);

create table categoria(
	id serial primary key,
	nome varchar(30)
);

create table cliente(
	id serial primary key,
	nome varchar(100),
	email varchar(50),
	telefone varchar(14)
);

create table atendente(
	id serial primary key,
	nome varchar(100),
	cpf char(11)
);

create table venda(
	id serial primary key,
	data_hora timestamp,
	forma_pagamento varchar(10)
);

alter table venda add column id_produto int;

alter table venda
add foreign key (id_produto)
references produto(id);

alter table venda add column id_atendente int;

alter table venda
add foreign key (id_atendente) 
references atendente(id);

alter table venda add column id_cliente int;

alter table venda
add foreign key (id_cliente)
references cliente(id);

insert  into  produto (nome, preco, quantidade, cor, tamanho) 
values ('Camiseta Branca', 49.90, 100, 'Branco', 'M'),
('Calça Jeans', 129.90, 50, 'Azul', 'G'),
('Tênis Esportivo', 199.99, 30, 'Preto', 'M'),
('Jaqueta Couro', 299.90, 20, 'Preto', 'G'),
('Vestido Floral', 89.50, 40, 'Vermelho', 'P');

insert into categoria (nome) 
values ('Roupas'),
('Calçados'),
('Acessórios'),
('Esporte'),
('Moda Feminina');

insert  into  cliente (nome, email, telefone) 
values ('Ana Paula Silva', 'ana.silva@email.com', '(11)91234-5678'),
('João Pedro Souza', 'joao.souza@email.com', '(21)99876-5432'),
('Maria Oliveira', 'maria.oliveira@email.com', '(31)98765-4321'),
('Carlos Eduardo', 'carlos.edu@email.com', '(41)93456-7890'),
('Beatriz Ramos', 'beatriz.ramos@email.com', '(51)97654-3210');

insert into atendente (nome, cpf)
values ('Lucas Mendes', '12345678901'),
('Fernanda Costa', '23456789012'),
('Ricardo Lima', '34567890123'),
('Juliana Rocha', '45678901234'),
('Patrícia Martins', '56789012345');

insert into venda (data_hora, forma_pagamento) 
values ('2025-10-20 14:30:00', 'Cartão'),
('2025-10-19 16:45:00', 'Dinheiro'),
('2025-10-18 11:20:00', 'Pix'),
('2025-10-17 18:00:00', 'Cartão'),
('2025-10-21 09:15:00', 'Pix');


select * from Clientes;
select nome, email from Clientes;
select produto_id, nome, preco, estoque from Produtos;
select * from Clientes where cidade = 'Brasilia';
select * from Produtos where preco > 100;
select * from Pedidos where status = 'Entregue';
select * from Clientes where cidade = 'Petropolis' and idade > 18;
select * from Produtos order by preco desc;

select cliente_id, COUNT(*) as total_pedidos
from Pedidos

select * from Clientes where nome like 'Jo%';
select * from Produtos where nome like '%camisa%';

select Pedidos.pedido_id, Clientes.nome, Pedidos.data_pedido
from didos
inner join Clientes on Pedidos.cliente_id = Clientes.cliente_id;

select ItensPedido.pedido_id, Produtos.nome, ItensPedido.quantidade
from itensPedido
inner join Produtos on ItensPedido.produto_id = Produtos.produto_id;

select Clientes.nome, Pedidos.pedido_id, Pedidos.status
from Clientes
inner join Pedidos on Clientes.cliente_id = Pedidos.cliente_id;

create view vw_ClientesAtivos as
select * from Clientes where status = 'ativo';

create view vw_PedidosEntregues as
select Pedidos.pedido_id, Clientes.nome, Pedidos.data_pedido
from Pedidos
inner join clientes on Pedidos.cliente_id = Clientes.cliente_id
where Pedidos.status = 'Entregue';

create view vw_ProdutosEstoqueBaixo as
select produto_id, nome, estoque
from Produtos
where estoque < 10;


