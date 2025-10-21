create database clinica;
create table animal(
	id serial primary key,
	nome varchar(100),
	especie varchar(20),
	raca varchar(20),
	idade int,
	infos_medicas text
);

create table dono(
	id serial primary key,
	nome_completo varchar(100),
	cpf char(11),
	telefone varchar(14)
);
alter table dono add column id_endereco int;

alter table dono 
add foreign key (id_endereco)
references endereco(id);

create table consulta(
	id serial primary key,
	data_hora timestamp,
	obs_medicas text
);
alter table consulta add column id_animal int;

alter table consulta 
add foreign key (id_animal)
references animal (id);

alter table consulta add column id_veterinario int;

alter table consulta 
add foreign key (id_veterinario)
references veterinario(id);

create table veterinario(
	id serial primary key,
	nome varchar(100),
	crmv char(13),
	especializacao text,
	jornada_diaria_horas int
);

create table endereco(
	id serial primary key,
	cep char(9),
	logradouro varchar(100),
	localidade varchar(50),
	complemento varchar(255),
	numero int,
	bairro varchar(50),
	uf char(2),
	referencia varchar(255)
);

INSERT INTO animal (nome, especie, raca, idade, infos_medicas) 
values ('Rex', 'Cachorro', 'Labrador', 5, 'Vacinas em dia, sem alergias'),
('Mimi', 'Gato', 'Siamês', 3, 'Alergia a certos alimentos'),
('Bidu', 'Cachorro', 'Poodle', 7, 'Problemas articulares'),
('Luna', 'Gato', 'Persa', 2, 'Nenhum problema conhecido'),
('Thor', 'Cachorro', 'Bulldog', 4, 'Histórico de asma');

INSERT INTO dono (nome_completo, cpf, telefone) 
values ('Carlos Silva', '12345678901', '(11)91234-5678'),
('Ana Paula Souza', '23456789012', '(21)99876-5432'),
('Marcos Pereira', '34567890123', '(31)98765-4321'),
('Juliana Lima', '45678901234', '(41)91234-8765'),
('Fernanda Gomes', '56789012345', '(51)99999-8888');

INSERT INTO consulta (data_hora, obs_medicas) 
values('2025-10-20 14:30:00', 'Consulta de rotina, vacina aplicada'),
('2025-10-21 10:00:00', 'Exame de sangue solicitado'),
('2025-10-22 16:45:00', 'Avaliação de problema articular'),
('2025-10-23 09:15:00', 'Tratamento para alergia iniciado'),
('2025-10-24 11:00:00', 'Retorno pós-cirurgia');

INSERT INTO veterinario (nome, crmv, especializacao, jornada_diaria_horas) 
values('Dr. João Martins', 'CRMV1234567890', 'Clínica Geral', 8),
('Dra. Carla Mendes', 'CRMV0987654321', 'Dermatologia', 6),
('Dr. Pedro Alves', 'CRMV1122334455', 'Ortopedia', 7),
('Dra. Marina Costa', 'CRMV5566778899', 'Oncologia', 5),
('Dr. Lucas Rocha', 'CRMV6677889900', 'Cardiologia', 8);

INSERT INTO endereco (cep, logradouro, localidade, complemento, numero, bairro, uf, referencia) 
values('12345-678', 'Rua das Flores', 'São Paulo', 'Apto 101', 123, 'Jardim América', 'SP', 'Próximo ao parque'),
('23456-789', 'Av. Brasil', 'Rio de Janeiro', 'Casa', 456, 'Copacabana', 'RJ', 'Em frente ao mercado'),
('34567-890', 'Rua 7 de Setembro', 'Belo Horizonte', 'Bloco B', 789, 'Savassi', 'MG', 'Perto da padaria'),
('45678-901', 'Praça da Sé', 'Curitiba', '', 101, 'Centro', 'PR', 'Ao lado da igreja'),
('56789-012', 'Alameda Santos', 'Porto Alegre', 'Sala 303', 202, 'Moinhos de Vento', 'RS', 'Próximo ao shopping');



























