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
('2025-04-15 10:00:00', 25.5, 13.2, 1),
('2025-04-15 10:15:00', 26.1, 13.5, 1);

INSERT INTO dados (data_dado, temperatura, umidade, fkSensor) VALUES
('2025-04-15 10:00:00', 25.5, 13.2, 1),
('2025-04-15 10:15:00', 26.1, 13.5, 1),
('2025-04-15 10:30:00', 24.9, 13.8, 2),
('2025-04-15 10:45:00', 25.8, 13.9, 2),
('2025-04-15 11:00:00', 27.0, 13.1, 3),
('2025-04-15 11:15:00', 26.5, 13.3, 3),
('2025-04-15 11:30:00', 28.2, 13.7, 4),
('2025-04-15 11:45:00', 27.8, 13.2, 4),
('2025-04-15 12:00:00', 29.1, 13.5, 5),
('2025-04-15 12:15:00', 28.5, 13.8, 5),
('2025-04-15 12:30:00', 27.3, 13.1, 6),
('2025-04-15 12:45:00', 26.8, 13.5, 6);


INSERT INTO dados (data_dado, temperatura, umidade, fkSensor) VALUES
('2025-04-15 10:00:00', 25.5, 13.2, 1),
('2025-04-15 10:15:00', 26.1, 13.5, 1),
('2025-04-15 10:30:00', 24.9, 13.8, 1),
('2025-04-15 10:45:00', 25.8, 13.9, 1),
('2025-04-15 11:00:00', 27.0, 13.1, 1),
('2025-04-15 11:15:00', 26.5, 13.3, 1),
('2025-04-15 11:30:00', 28.2, 13.7, 1),
('2025-04-15 11:45:00', 27.8, 13.2, 1);


SELECT * FROM empresa;
SELECT * FROM usuario;
SELECT * FROM silo;
SELECT * FROM sensor;
SELECT * FROM dados;

select emp.nome as Empresa, sen.posicao, sil.setor from empresa as emp inner join silo as sil on sil.fkEmpresa = emp.id inner join sensor as sen on sen.fkSilo = sil.id;

SELECT temperatura, umidade, data_dado FROM dados da
INNER JOIN sensor se ON se.id = da.fkSensor
WHERE fkSilo = 1;

SELECT temperatura, umidade, 
data_dado,
TIME(data_dado) as momento_grafico
FROM dados da
INNER JOIN sensor se
ON se.id = da.fkSensor
WHERE fkSilo = 1
ORDER BY momento_grafico;