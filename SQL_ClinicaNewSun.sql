CREATE DATABASE ClinicaNewSun

USE ClinicaNewSun

CREATE TABLE Medico (
	CRM varchar(10) PRIMARY KEY NOT NULL,
	email varchar(80) unique,
	nome varchar(100),
	dataNasc date,
	sexo BIT
);
SELECT * FROM Medico

CREATE TABLE Especialidades (
	idEspecialidade int PRIMARY KEY NOT NULL,
	Especialidade varchar(16) NOT NULL unique
)

CREATE TABLE cargaHoraria (
	idHorario int PRIMARY KEY NOT NULL,
	horario datetime
);

CREATE TABLE horarioMedico (
	idHorarioMedico int PRIMARY KEY NOT NULL,
	CRM varchar(10) ,
	idHorario int
);

CREATE TABLE Paciente (
	idPaciente int PRIMARY KEY NOT NULL,
	CPF varchar(14) unique,
	email varchar(80) unique,
	nome varchar(100),
	dataNasc date,
	sexo BIT,
	CRM varchar(10) 
);

CREATE TABLE Prontuario (
	idProntuario int PRIMARY KEY NOT NULL,
	nome varchar(100),
	dataNasc date,
	sexo BIT,
	anamnese varchar(700),
	diagnostico varchar(700),
	planoTratamento varchar(700),
	CPF varchar(14) unique,
	idPaciente int,
	CRM varchar(10) 
)

CREATE TABLE Consulta (
	idConsulta int PRIMARY KEY NOT NULL,
	dataConsulta datetime,
	CRM varchar(10),
	idPaciente int
);

CREATE TABLE EspecialidadeMedico (
	idEspecialidadeMedic int PRIMARY KEY NOT NULL,
	idEspecialidade int,
	CRM varchar(10)
);

CREATE TABLE telefonePaciente (
	idPaciente int PRIMARY KEY NOT NULL,
	telefone varchar(17)
);

CREATE TABLE telefoneMedico (
	CRM varchar(10) PRIMARY KEY NOT NULL,
	telefone varchar(17)
);

--INSERÇÃO DE VALORES

INSERT INTO Paciente (idPaciente, CPF, email, nome, dataNasc, sexo, CRM)
VALUES
(1, '123.456.789-01', 'joao.silva@example.com', 'João Silva', '1985-03-22', 1, 'CRM12345'),
(2, '987.654.321-02', 'maria.souza@example.com', 'Maria Souza', '1990-07-11', 0, 'CRM54321'),
(3, '456.789.123-03', 'carlos.santos@example.com', 'Carlos Santos', '1978-12-05', 1, 'CRM98765'),
(4, '321.654.987-04', 'ana.lima@example.com', 'Ana Lima', '2000-02-17', 0, 'CRM54321'),
(5, '654.321.987-05', 'fernando.alves@example.com', 'Fernando Alves', '1995-05-30', 1, 'CRM11111');

INSERT INTO Medico (CRM, email, nome, dataNasc, sexo)
VALUES
('CRM12345', 'dr.joaopereira@example.com', 'Dr. João Pereira', '1970-05-15', 1),
('CRM54321', 'dra.anaoliveira@example.com', 'Dra. Ana Oliveira', '1982-09-27', 0),
('CRM98765', 'dr.carlosalmeida@example.com', 'Dr. Carlos Almeida', '1965-03-10', 1),
('CRM65432', 'dra.marianunes@example.com', 'Dra. Maria Nunes', '1990-12-02', 0),
('CRM11111', 'dr.fernandoribeiro@example.com', 'Dr. Fernando Ribeiro', '1985-07-18', 1);

INSERT INTO Consulta (idConsulta, dataConsulta, CRM, idPaciente)
VALUES
(1, '2024-10-01 09:30:00', 'CRM12345', 1),
(2, '2024-10-02 11:00:00', 'CRM54321', 2),
(3, '2024-10-03 14:15:00', 'CRM98765', 3),
(4, '2024-10-04 08:45:00', 'CRM65432', 4),
(5, '2024-10-05 13:00:00', 'CRM11111', 5);

INSERT INTO cargaHoraria (idHorario, horario)
VALUES
(1, '2024-10-01 08:00:00'),
(2, '2024-10-01 12:00:00'),
(3, '2024-10-01 14:00:00'),
(4, '2024-10-02 09:00:00'),
(5, '2024-10-02 15:00:00');

INSERT INTO horarioMedico (idHorarioMedico, CRM, idHorario)
VALUES
(1, 'CRM12345', 1),
(2, 'CRM54321', 2),
(3, 'CRM98765', 3),
(4, 'CRM65432', 4),
(5, 'CRM11111', 5);

INSERT INTO EspecialidadeMedico (idEspecialidadeMedic, idEspecialidade, CRM)
VALUES
(1, 101, 'CRM12345'),
(2, 102, 'CRM54321'),
(3, 103, 'CRM98765'),
(4, 104, 'CRM65432'),
(5, 105, 'CRM11111');

SELECT * FROM Medico

SELECT * FROM Medico
INNER JOIN EspecialidadeMedico ON EspecialidadeMedico.CRM = Medico.CRM
