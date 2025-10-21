create database escola;

--Planilha/Tabela: Estudante
create table estudante(
	id serial primary key, --coluna de identificação
	nome varchar(100), --tamanho é variável
	matricula char(10), --tamanho é fixo
	curso varchar(50),
	login varchar(20),
	senha varchar(15),
	data_nascimento date --recebe datas no formato yyyy-MM-dd
);

--Planilha/Tabela: Docente
create table docente(
	id serial primary key,
	nome varchar(100),
	matricula char(7),
	unidade_curricular varchar(20),
	login varchar(20)
);

alter table estudante add column id_docente int;
--alter table estudante drop column id_docente;

alter table estudante
add foreign key (id_docente)
references docente(id); 

alter table docente add column senha varchar (20);

insert into docente (nome, matricula, unidade_curricular, login, senha )
values ('debora', '13040-0', 'banco de dados', 'ddsouza', '123456'),
       ('carlos', '21345-8','react','carlos','456231'),
       ('felippe','45785-6','redes','felippe','789554'),
       ('roni','12565-6','logica prog.','roni','444455'),
       ('pedro','22231-6','infraestrutura', 'pedro', '001222');

insert into estudante (nome, matricula, login, senha, data_nascimento, id_docente, curso)
values ('Ana','20230101','absouza',	'Ana','1995-04-12', 1, 'banco de dados'),
       ('Bruno','20230102', 'bhlim','Bruno', '1990-09-23', 2,'banco de dados'),
       ('Camila','20230103','cfdias','Camila','1988-01-30', 3,'banco de dados'),
       ('Daniel','20230104','dcmartins','Daniel','1992-06-15', 4,'banco de dados'),
       ('Elisa','20230105','emonteiro','Elisa','1996-11-05', 5,'banco de dados'),
       ('Felipe','20230106','frocha','Felipe','1993-03-20', 1,'banco de dados'),
       ('Gabriela','20230107','gmsilva','Gabriela','1991-12-08', 2, 'banco de dados'),
       ('Henrique','20230108','holima',	'Henrique','1989-07-18', 3,'banco de dados'),
       ('Isabela','20230109', 'imcosta','Isabela','1994-05-25',	4,'banco de dados'),
       ('João Pedro','20230110','jpsantos','Joao','1990-10-10',	5, 'banco de dados');

-- selciona todas as colunas da tabela docente
select * from docente; 

-- seleciona somente a coluna nome da tabela docente 
select nome from docente;

-- seleciona somente a coluna nome e matricula da tabela docente 
select nome, matricula from docente; 

-- seleciona todas as colunas da tabela docente onde a unidade_curricular é igual a banco
select * from docente where unidade_curricular = 'banco';

-- seleciona todas as colunas da tabela docente onde a unidade_curricular começa com R
select * from docente where unidade_curricular like 'R%';

-- seleciona todas as colunas da tabela estudante onde data de nascimento é igual a 1 
select * from estudante where data_nascimento = '1995-04-12';

-- selecioa todas colunas da tabela docente onde a unidade curricular termina com a letra a
select * from docente where unidade_curricular like '%a';

-- seleciona todas as colunas da tabela docente onde a unidade curricular tem a letra a no meio do nome
select * from docente where unidade_curricular like '%a%';

--apelidando tabela docente com a letra d 
select * from docente d where d.unidade_curricular like '%a%';

-- seleciona o nome do estudante e o nome do docente
select d.nome, e.nome 
from estudante e
inner join docente d on d.id = e.id_docente; 




