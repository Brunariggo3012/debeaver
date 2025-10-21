--clínica veterinária
create table animal(
 id serial primary key,
nome varchar (100),
especie varchar (20),
raca varchar (20),
idade int,
informacoes_medicas text
);
create table dono (
id serial primary key
nome_completo varchar (100),
cpf char (11),
telefone varchar (14)
-- enderec
);
 select * from animal a 
 inner join dono d on d.id_dono
 
create table consulta (
id sreial primary key,
data_hora timestamp,
-- animal ,
-- veterinario,
obs_medicas text
);

create table veterinario (
id serial primary key,
nome varchar (100),
crmv char (13),
especializacao text,
jornada_diaria_horas int
);

create table endereco (
id serial primary key,
cep char (9),
logradouro varchar (100),
localidade varchar (50),
complemento varchar (255),
numero int,
bairro varchar (50),
uf char (2),
referencia varchar (255)
);
































