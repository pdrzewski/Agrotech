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
    localidade varchar(100),
    fkEmpresa int,
    foreign key (fkEmpresa) references Empresa(id));
    
create table Sensor (
    id int primary key auto_increment,
    tipo varchar(20),
    fkSilo int,
    foreign key (fkSilo) references Silo(id));
    
create table Dados(
    id int primary key auto_increment,
    data_dado datetime default current_timestamp,
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

INSERT INTO Silo (setor, localidade, fkEmpresa) VALUES
('Silo A','Primeiro silo ao norte, próximo ao armazém central', 1),
('Silo B','Ao lado do Silo 1, a leste da entrada principal', 1),
('Silo Principal', 'Terceiro silo ao sul, próximo à área de carregamento', 2),
('Silo Secundário', 'Silo central, entre Silo 3 e Silo 5', 2),
('Unidade 1', 'Último silo a oeste, próximo à cerca perimetral', 3),
('Unidade 2', 'Último silo a oeste, próximo à cerca perimetral', 3);

INSERT INTO Sensor (tipo, fkSilo) VALUES
('DHT11', 1),
('DHT11', 2),
('DHT11', 3),
('DHT11', 4),
('DHT11', 5),
('DHT11', 6);

INSERT INTO Dados (data_dado, temperatura, umidade, fkSensor) VALUES
('2025-04-15 10:00:00', 25.5, 60.2, 1),
('2025-04-15 10:15:00', 26.1, 61.5, 1),
('2025-04-15 10:30:00', 24.9, 59.8, 2),
('2025-04-15 10:45:00', 25.8, 60.9, 2),
('2025-04-15 11:00:00', 27.0, 62.1, 3),
('2025-04-15 11:15:00', 26.5, 61.3, 3),
('2025-04-15 11:30:00', 28.2, 58.7, 4),
('2025-04-15 11:45:00', 27.8, 59.2, 4),
('2025-04-15 12:00:00', 29.1, 63.5, 5),
('2025-04-15 12:15:00', 28.5, 62.8, 5),
('2025-04-15 12:30:00', 27.3, 60.1, 6),
('2025-04-15 12:45:00', 26.8, 59.5, 6);

SELECT * FROM Empresa;
SELECT * FROM Usuario;
SELECT * FROM Silo;
SELECT * FROM Sensor;
SELECT * FROM Dados;