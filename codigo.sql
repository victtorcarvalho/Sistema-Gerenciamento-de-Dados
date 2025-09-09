create database db_sistema_faculdade;
drop database db_sistema_faculdade;
use db_sistema_faculdade;
show databases;
show tables;

# Criação da Tabela do Aluno
create table tbl_aluno (
		id int primary key auto_increment,
        nome_completo varchar (255) not null,
        data_nascimento date not null,
        cpf varchar (14) not null,
        status varchar (45) not null,
        RA int not null,
        unique index (id));

# Visualização da tabela
select * from tbl_aluno;

# Inserindo os dados na tabela do Aluno
insert into tbl_aluno
(id, nome_completo, data_nascimento, cpf, status, RA)
values	(1, 'Victor Hugo Modesto de Carvalho', '1998-01-31', '483.844.666-41', 'Ativo', '987654'),
		(2, 'Luis Antonio Aguiar da Silva', '1996-03-22', '123.456.789-10', 'Ativo', '321012'),
        (3, 'Isabella Rodrigues Vieira', '1997-07-10', '987.654.321-00', 'Trancado', '123456'),
        (4, 'Thalita Barros Guimarães', '1998-11-03', '111.222.333-44', 'Ativo', '789101'),
        (5, 'Jackson Borges Vieira dos Santos', '1994-06-19', '555.666.777-88', 'Formado', '012345');

# Criação da Tabela Telefone do Aluno
create table tbl_telefone_aluno (
		id int primary key auto_increment,
        telefone_aluno varchar (45) not null,
        id_aluno int not null,
        
		constraint fk_telefone_aluno
        foreign key (id_aluno)
        references tbl_aluno (id),
        unique index (id));

# Visualização da Tabela
select * from tbl_telefone_aluno;

# Inserindo os dados na tabelo do telefone do Aluno
insert into tbl_telefone_aluno
(id, telefone_aluno, id_aluno)
values	(6, '11976084017',1),
		(7, '11234567891',2),
        (8, '11345678910',3),
        (9, '21456789101',4),
        (10, '11567891011',5);

# Criação da tabela e-mail do Aluno
create table tbl_email_aluno (
		id int primary key auto_increment,
        email varchar (45) not null,
        id_aluno int not null,
        
        constraint fk_email_aluno
        foreign key (id_aluno)
        references tbl_aluno (id),
        unique index (id));

# Visualização da tabela
select * from tbl_email_aluno;

# Inserindo os dados na tabela de e-mail do Aluno
insert into tbl_email_aluno
(id, email, id_aluno)
values	(11, 'victtorhmcarvalho@gmail.com',1),
		(12, 'laguiarsilva@gmail.com',2),
        (13, 'irodriguesvieira@outlook.com',3),
        (14, 'thalitabguimaraes@hotmail.com',4),
        (15, 'Jacksonbvsantos@yahoo.com.br',5);

# Criação da tabela endereço do Aluno
create table tbl_endereco_aluno (
		id int primary key auto_increment,
        logradouro varchar (45) not null,
        cep varchar (45) not null,
        bairro varchar (45) not null,
        cidade varchar (45) not null,
        estado varchar (45) not null,
        pais varchar (45) not null,
        id_aluno int not null,
        
        constraint fk_endereco_aluno
        foreign key (id_aluno)
        references tbl_aluno (id),
        unique index (id));

# Visualização da tabela
select * from tbl_endereco_aluno;

# Inserindo os dados na tabela de endereço do Aluno
insert into tbl_endereco_aluno
(id, logradouro, cep, bairro, cidade, estado, pais, id_aluno)
values 	(16, 'Rua ABC, Nº 001', '483814-000', 'Vila ABC', 'São Paulo', 'SP', 'Brasil',1),
		(17, 'Rua DEF, Nº 002', '123456-000', 'Vila DEF', 'Guarulhos', 'SP', 'Brasil',2),
        (18, 'Rua GHI, Nº 003', '678910-000', 'Vila GHI', 'Ribeirão Preto', 'SP', 'Brasil',3),
        (19, 'Rua JKL, Nª 004', '789101-111', 'Vila JKL', 'Madureira', 'RJ', 'Brasil',4),
        (20, 'Rua MNO, Nª 005', '891011-222', 'Vila MNO', 'São Paulo', 'SP', 'Brasil',5);


# Criação da tabela de curso
create table tbl_curso (
		id int primary key auto_increment,
        nome_curso varchar (45) not null,
        descricao text not null,
        duracao_semestre int not null,
        carga_horaria int not null,
        valor_mensalidade decimal (10,2) not null,
        id_aluno int not null,
        
        constraint fk_curso_aluno
        foreign key (id_aluno)
        references tbl_aluno (id),
        unique index (id));

# Visualização da tabela
select * from tbl_curso;

# Inserindo os dados na tabela do curso
insert into tbl_curso
(id, nome_curso, descricao, duracao_semestre, carga_horaria, valor_mensalidade, id_aluno)
values	(21, 'Análise e Desenvolvimento de Sistemas', 'Graduação Tecnico em Análise e Desenvolvimento de Sistemas', 3, '2480', '280.5', 1),
		(22, 'Gestão de Recursos Humanos', 'Graduação Técnico em Gestão de Recursos Humanos', 2, '1800', '160.7', 2),
        (23, 'Administração de Empresas', 'Graduação Superior em Administração de Empresas', 4, '4200', '300.5', 3),
        (24, 'Nutrição', 'Graduação Técnico em Nutrição', 3, '1800', '180.2', 4),
        (25, 'Medicina', 'Graduação Superior em Medicina', 6, '6800', '400.2', 5);

# Criação da tabela da matéria
create table tbl_materia (
		id int primary key auto_increment,
        nome_materia varchar (45) not null,
        carga_horaria int not null,
        nota decimal (4,2) not null, 
        ementa text not null,
        id_aluno int not null,
        
        constraint fk_materia_aluno
        foreign key (id_aluno)
        references tbl_aluno (id),
        unique index (id));

# Visualização da tabela
select * from tbl_materia;

# Inserindo os dados na tabela da matéria
insert into tbl_materia
(id, nome_materia, carga_horaria, nota, ementa, id_aluno)
values	(26, 'Database Modeling & SQL', '60', '9.8', 'Avaliação, Questionário, Pesquisa, Estudo de Caso, Portfólio', 1),
		(27, 'Recrutamento e Seleção', '60', '10.0', 'Avaliação, Questionário, Pesquisa, Estudo de Caso, Estágio', 2),
        (28, 'Raciocíonio Lógico Matemático', '60', '9.5', 'Avaliação, Questionário', 3),
        (29, 'Nutrição Esportiva', '80', '9.0', 'Avaliação, Questionário, Pesquisa, Estudo de Caso, Estágio Supervisionado', 4),
        (30, 'Anatomia', '80', '9.8', 'Avaliação, Questionário, Pesquisa, Estudo de Caso, Estágio Supervisionado', 5);

# Criação da tabela turma
create table tbl_turma (
		id int primary key auto_increment,
        nome_turma varchar (100) not null, 
        periodo varchar (20) not null,
        ano_semestre varchar (10) not null,
        id_aluno int not null,
        
        constraint fk_turma_aluno
        foreign key (id_aluno)
        references tbl_aluno (id),
        unique index (id));

# Vialização da tabela
select * from tbl_turma;

# Inserindo os dados na tabela turma
insert into tbl_turma
(id, nome_turma, periodo, ano_semestre, id_aluno)
values	(31, 'A1.2025', '1º Semestre', '2025', 1),
		(32, 'E2.2024', '2º Semestre', '2024', 2),
        (33, 'I1.2025', '1º Semestre', '2025', 3),
        (34, 'O2.2024', '2º Semestre', '2024', 4),
        (35, 'U1.2025', '1º Semestre', '2025', 5);

# Criação da tabela histórico acadêmico
create table tbl_historico_academico (
		id int primary key auto_increment,
        semestre varchar (45) not null,
        ano_semestre varchar (10) not null,
        nota_final decimal (4,2) not null,
        status_materia varchar (50) not null,
		id_aluno int not null,
        
        constraint fk_historico_academico_aluno
        foreign key (id_aluno)
        references tbl_aluno (id),
        unique index (id));

# Visualização da tabela
select * from tbl_historico_academico;

# Inserindo os dados na tabela histórico acadêmico
insert into tbl_historico_academico
(id, semestre, ano_semestre, nota_final, status_materia, id_aluno)
values	(36, '1º semestre', '2025', '9.5', 'Aprovado', 1),
		(37, '2º semestre', '2024', '9.9', 'Aprovado', 2),
        (38, '1º semestre', '2025', '9.0', 'Aprovado', 3),
        (39, '2º semestre', '2024', '8.9', 'Aprovado', 4),
        (40, '1º semestre', '2025', '9.5', 'Aprovado', 5);

# Criação da tabela do(a) professor(a)
create table tbl_professor (
		id int primary key auto_increment,
        nome_completo varchar (255) not null,
        cpf varchar (14) not null,
        titulacao varchar (100) not null);

# Visualização da tabela
select * from tbl_professor;

# Inserindo os dados na tabela do(a) professor(a)
insert into tbl_professor
(id, nome_completo, cpf, titulacao)
values	(41, 'Bernardo Gomes da Silva', '123.456.789-10', 'Doutorado'),
		(42, 'Maria Aparecida Fonseca', '987.654.321-00', 'Mestrado'),
        (43, 'Antônio Marcos Pereira', '111.222.333-44', 'Doutorado'),
        (44, 'Marcos Antônio Figueira', '999.888.777-66', 'Mestrado');

# Criação da tabela telefone do(a) professor(a)
create table tbl_telefone_professor (
		id int primary key auto_increment,
        telefone_professor varchar (20) not null,
        id_professor int not null, 
        
        constraint fk_telefone_professor_professor
        foreign key (id_professor)
        references tbl_professor (id),
        unique index (id));

# Visualização da tabela
select * from tbl_telefone_professor;

# Inserindo os dados na tebela do(a) professor(a)
insert into tbl_telefone_professor
(id, telefone_professor, id_professor)
values	(45, '1191234-5678', 41), 
		(46, '1198765-4321', 42),
        (47, '1192233-4455', 43),
        (48, '1195566-7788', 44);

# Criação da tabela e-mail do(a) professor(a)
create table tbl_email_professor (
		id int primary key auto_increment,
        email varchar (100) not null,
        id_professor int not null,
        
        constraint fk_email_professor_professor
        foreign key (id_professor)
        references tbl_professor (id),
        unique index (id));

# Visualização da tabela
select * from tbl_email_professor;

# Inserindo os dados na tabela e-mail do(a) professor(a)
insert into tbl_email_professor
(id, email, id_professor)
values	(49, 'bgomesilva@gmail.com', 41),
		(50, 'mafonseca@gmail.com',  42),
        (51, 'ampereira@gmail.com',  43),
        (52, 'mafigueira@gmail.com', 44);
