-- loja de roupa
create table produto (
id serial primary key,
nome varchar (30),
preco numeric (5,2),
-- categoria
quantidade int,
cor varchar (20),
tamanho varchar (3)
);

create table categoria (
id serial primary key,
nome varchar (30),
);

create table cliente (
id serial primary key,
nome varchar (100),
email varchar (50),
telefone varchar (14)
);

create table venda (
id serial primary key,
data_hora timestamp,
forma_pagamemto varchar (10),
-- produto,
-- atendente 
);

create table atendente (
id serial primary key,
nome varchar (100),
cpf char(11)
);
