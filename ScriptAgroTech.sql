create database agrotech;

use agrotech;

create table empresa (
    id int primary key auto_increment,
    nome varchar(45),
    cnpj char(14),
    telefone char(11),
    email varchar(70));
    
create table usuario (
    id int primary key auto_increment,
    login varchar(45),
    senha varchar(45),
    fkEmpresa int,
    foreign key (fkEmpresa) references empresa(id));

create table silo (
    id int primary key auto_increment,
    setor varchar(20),
    fkEmpresa int,
    foreign key (fkEmpresa) references empresa(id));
    
create table sensor (
    id int primary key auto_increment,
    tipo varchar(20),
    posicao varchar(20),
    fkSilo int,
    constraint nomePosicao check (posicao in('superior','meio','inferior')),
    foreign key (fkSilo) references silo(id));
    
create table dados(
    id int primary key auto_increment,
    data_dado datetime default current_timestamp,
    temperatura decimal(4,2),
    umidade decimal(4,2),
    fkSensor int,
    foreign key (fkSensor) references sensor(id));

INSERT INTO empresa (nome, cnpj, telefone, email) VALUES
('AgriTech Soluções', '12345678000190', '11987654321', 'contato@agritech.com.br'),
('Fazenda Esperança', '98765432000210', '31998765432', 'esperanca@fazenda.com'),
('Silos do Brasil', '23456789000320', '41987654321', 'info@silosbrasil.com.br');

INSERT INTO usuario (login, senha, fkEmpresa) VALUES
('admin', 'senha123', 1),
('usuario1', 'abc456', 1),
('gerente', 'secure789', 2),
('operador', 'op123', 3);

INSERT INTO silo (setor, fkEmpresa) VALUES
('A', 1),
('B', 1),
('A', 2),
('B', 2),
('C', 3),
('D', 3);

INSERT INTO sensor (tipo, posicao, fkSilo) VALUES
('DHT11', 'meio', 1),
('DHT11', 'inferior', 2),
('DHT11', 'meio', 3),
('DHT11', 'superior', 4),
('DHT11', 'superior', 5),
('DHT11', 'inferior', 6);

INSERT INTO dados (data_dado, temperatura, umidade, fkSensor) VALUES
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

SELECT * FROM empresa;
SELECT * FROM usuario;
SELECT * FROM silo;
SELECT * FROM sensor;
SELECT * FROM dados;

select emp.nome as Empresa, sen.posicao, sil.setor from empresa as emp inner join silo as sil on sil.fkEmpresa = emp.id inner join sensor as sen on sen.fkSilo = sil.id;
