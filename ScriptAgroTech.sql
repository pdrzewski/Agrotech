create database agrotech;
use agrotech;

create table Empresa (
    id int primary key auto_increment,
    nome varchar(45),
    cnpj char(14),
    telefone char(11),
    email varchar(70));
    
create table Usuario (
    id int primary key auto_increment,
    login varchar(45),
    senha varchar(45),
    fkEmpresa int,
    foreign key (fkEmpresa) references Empresa(id));

create table Silo (
    id int primary key auto_increment,
    setor varchar(20),
    fkEmpresa int,
    foreign key (fkEmpresa) references Empresa(id));
    
create table Sensor (
    id int primary key auto_increment,
    tipo varchar(20),
    fkSilo int,
    foreign key (fkSilo) references Silo(id));
    
create table Dados(
    id int primary key auto_increment,
    data_dado datetime,
    temperatura decimal(4,2),
    umidade decimal(4,2),
    fkSensor int,
    foreign key (fkSensor) references Sensor(id));

INSERT INTO Empresa (nome, cnpj, telefone, email) VALUES
('AgriTech Soluções', '12345678000190', '11987654321', 'contato@agritech.com.br'),
('Fazenda Esperança', '98765432000210', '31998765432', 'esperanca@fazenda.com'),
('Silos do Brasil', '23456789000320', '41987654321', 'info@silosbrasil.com.br');

INSERT INTO Usuario (login, senha, fkEmpresa) VALUES
('admin', 'senha123', 1),
('usuario1', 'abc456', 1),
('gerente', 'secure789', 2),
('operador', 'op123', 3);

INSERT INTO Silo (setor, fkEmpresa) VALUES
('Silo A', 1),
('Silo B', 1),
('Silo Principal', 2),
('Silo Secundário', 2),
('Unidade 1', 3),
('Unidade 2', 3);

INSERT INTO Sensor (tipo, fkSilo) VALUES
('Temperatura', 1),
('Umidade', 1),
('Temperatura', 2),
('Umidade', 2),
('Temperatura', 3),
('Umidade', 3),
('Temperatura', 5),
('Umidade', 5);

INSERT INTO Dados (data_dado, temperatura, umidade, fkSensor) VALUES
('2025-04-15 10:00:00', 25.5, 60.2, 1),
('2025-04-15 10:00:00', 75.8, NULL, 2),
('2025-04-15 10:15:00', 26.1, 61.5, 1),
('2025-04-15 10:15:00', 76.3, NULL, 2),
('2025-04-15 10:30:00', 24.9, 59.8, 3),
('2025-04-15 10:30:00', 80.1, NULL, 4),
('2025-04-15 10:45:00', 25.8, 60.9, 3),
('2025-04-15 10:45:00', 79.5, NULL, 4),
('2025-04-15 11:00:00', 27.0, 62.1, 5),
('2025-04-15 11:00:00', 82.5, NULL, 6),
('2025-04-15 11:15:00', 26.5, 61.3, 5),
('2025-04-15 11:15:00', 81.9, NULL, 6),
('2025-04-15 11:30:00', NULL, NULL, 7),
('2025-04-15 11:30:00', 28.2, 58.7, 8),
('2025-04-15 11:30:00', 70.3, NULL, 9),
('2025-04-15 11:45:00', 27.8, 59.2, 8),
('2025-04-15 11:45:00', 71.1, NULL, 9),
('2025-04-15 12:00:00', NULL, NULL, 10);
    
