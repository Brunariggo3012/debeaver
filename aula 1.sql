--planilha /tabela: estudantes 
create table estudante(
   id serial primary key,   -- coluna de identificação
   nome varchar(100),-- tamanho é variável
   matricula char(10),-- tamanho é fixo
   curso varchar(50),
   login varchar(20),
   senha varchar(15),
   data_nascimento date -- recebe datas no formato yyyy-mm-dd
);


--planilha/tabela: docente

create table docente(
id serial primary key,
nome varchar(100),
matricula char(7),
unidade_curricular varchar(20),
login varchar (20)
);