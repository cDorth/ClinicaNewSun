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