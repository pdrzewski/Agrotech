DROP DATABASE agrotech;
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
('AgroSilos Norte', '12345678000101', '11987654321', 'contato@agrosilosnorte.com.br'),
('Cereais do Sul', '12345678000102', '21987654322', 'contato@cereaisdosul.com.br'),
('Grãos Dourados', '12345678000103', '31987654323', 'contato@graosdourados.com.br'),
('SiloTech Solutions', '12345678000104', '41987654324', 'contato@silotech.com.br'),
('Campo Verde Armazéns', '12345678000105', '51987654325', 'contato@campoverde.com.br'),
('AgriForte Silos', '12345678000106', '61987654326', 'contato@agriforte.com.br'),
('Armazém do Agricultor', '12345678000107', '71987654327', 'contato@armazemagricultor.com.br'),
('Safra & Cia', '12345678000108', '81987654328', 'contato@safraecia.com.br'),
('Grãos Nobres', '12345678000109', '91987654329', 'contato@graosnobres.com.br'),
('Terra Fértil Armazéns', '12345678000110', '11987654330', 'contato@terrafertil.com.br'),
('AgroMega Silos', '12345678000111', '21987654331', 'contato@agromega.com.br'),
('Cereal Express', '12345678000112', '31987654332', 'contato@cerealexpress.com.br'),
('SiloSeguro', '12345678000113', '41987654333', 'contato@siloseguro.com.br'),
('Grãos Premium', '12345678000114', '51987654334', 'contato@graospremium.com.br'),
('AgroTech Armazéns', '12345678000115', '61987654335', 'contato@agrotech.com.br'),
('SiloMax Solutions', '12345678000116', '71987654336', 'contato@silomax.com.br'),
('Campo Belo Grãos', '12345678000117', '81987654337', 'contato@campobelo.com.br'),
('AgroSafra Silos', '12345678000118', '91987654338', 'contato@agrosafra.com.br'),
('Terra Rica Armazéns', '12345678000119', '11987654339', 'contato@terrarica.com.br'),
('Grãos do Cerrado', '12345678000120', '21987654340', 'contato@graoscerrado.com.br'),
('SiloVerde', '12345678000121', '31987654341', 'contato@siloverde.com.br'),
('AgroFértil Silos', '12345678000122', '41987654342', 'contato@agrofertil.com.br'),
('Cereal Nobre', '12345678000123', '51987654343', 'contato@cerealnobre.com.br'),
('SiloTech Agro', '12345678000124', '61987654344', 'contato@silotechagro.com.br'),
('Grãos do Vale', '12345678000125', '71987654345', 'contato@graosdovale.com.br'),
('AgroArmazém', '12345678000126', '81987654346', 'contato@agroarmazem.com.br'),
('SiloSeg Agricultura', '12345678000127', '91987654347', 'contato@siloseg.com.br'),
('Terra Nova Grãos', '12345678000128', '11987654348', 'contato@terranova.com.br'),
('AgroCereal Silos', '12345678000129', '21987654349', 'contato@agrocereal.com.br'),
('SiloMax Armazéns', '12345678000130', '31987654350', 'contato@silomaxarmazens.com.br');

INSERT INTO usuario (login, senha, fkEmpresa) VALUES
('admin', 'senha123', 1),
('usuario1', 'abc456', 1),
('gerente', 'secure789', 2),
('operador', 'op123', 3);

INSERT INTO silo (setor, fkEmpresa) VALUES
('A', 1), ('B', 1),
('A', 2), ('B', 2),
('A', 3), ('B', 3),
('A', 4), ('B', 4),
('A', 5), ('B', 5),
('A', 6), ('B', 6),
('A', 7), ('B', 7),
('A', 8), ('B', 8),
('A', 9), ('B', 9),
('A', 10), ('B', 10),
('A', 11), ('B', 11),
('A', 12), ('B', 12),
('A', 13), ('B', 13),
('A', 14), ('B', 14),
('A', 15), ('B', 15),
('A', 16), ('B', 16),
('A', 17), ('B', 17),
('A', 18), ('B', 18),
('A', 19), ('B', 19),
('A', 20), ('B', 20),
('A', 21), ('B', 21),
('A', 22), ('B', 22),
('A', 23), ('B', 23),
('A', 24), ('B', 24),
('A', 25), ('B', 25),
('A', 26), ('B', 26),
('A', 27), ('B', 27),
('A', 28), ('B', 28),
('A', 29), ('B', 29),
('A', 30), ('B', 30);

INSERT INTO sensor (tipo, posicao, fkSilo) VALUES
('DHT11', 'superior', 1),
('DHT11', 'meio', 1),
('DHT11', 'inferior', 1),
('DHT11', 'superior', 2),
('DHT11', 'meio', 2),
('DHT11', 'inferior', 2),
('DHT11', 'superior', 3),
('DHT11', 'meio', 3),
('DHT11', 'inferior', 3),
('DHT11', 'superior', 4),
('DHT11', 'meio', 4),
('DHT11', 'inferior', 4),
('DHT11', 'superior', 5),
('DHT11', 'meio', 5),
('DHT11', 'inferior', 5),
('DHT11', 'superior', 6),
('DHT11', 'meio', 6),
('DHT11', 'inferior', 6),
('DHT11', 'superior', 7),
('DHT11', 'meio', 7),
('DHT11', 'inferior', 7),
('DHT11', 'superior', 8),
('DHT11', 'meio', 8),
('DHT11', 'inferior', 8),
('DHT11', 'superior', 9),
('DHT11', 'meio', 9),
('DHT11', 'inferior', 9),
('DHT11', 'superior', 10),
('DHT11', 'meio', 10),
('DHT11', 'inferior', 10),
('DHT11', 'superior', 11),
('DHT11', 'meio', 11),
('DHT11', 'inferior', 11),
('DHT11', 'superior', 12),
('DHT11', 'meio', 12),
('DHT11', 'inferior', 12),
('DHT11', 'superior', 13),
('DHT11', 'meio', 13),
('DHT11', 'inferior', 13),
('DHT11', 'superior', 14),
('DHT11', 'meio', 14),
('DHT11', 'inferior', 14),
('DHT11', 'superior', 15),
('DHT11', 'meio', 15),
('DHT11', 'inferior', 15),
('DHT11', 'superior', 16),
('DHT11', 'meio', 16),
('DHT11', 'inferior', 16),
('DHT11', 'superior', 17),
('DHT11', 'meio', 17),
('DHT11', 'inferior', 17),
('DHT11', 'superior', 18),
('DHT11', 'meio', 18),
('DHT11', 'inferior', 18),
('DHT11', 'superior', 19),
('DHT11', 'meio', 19),
('DHT11', 'inferior', 19),
('DHT11', 'superior', 20),
('DHT11', 'meio', 20),
('DHT11', 'inferior', 20),
('DHT11', 'superior', 21),
('DHT11', 'meio', 21),
('DHT11', 'inferior', 21),
('DHT11', 'superior', 22),
('DHT11', 'meio', 22),
('DHT11', 'inferior', 22),
('DHT11', 'superior', 23),
('DHT11', 'meio', 23),
('DHT11', 'inferior', 23),
('DHT11', 'superior', 24),
('DHT11', 'meio', 24),
('DHT11', 'inferior', 24),
('DHT11', 'superior', 25),
('DHT11', 'meio', 25),
('DHT11', 'inferior', 25),
('DHT11', 'superior', 26),
('DHT11', 'meio', 26),
('DHT11', 'inferior', 26),
('DHT11', 'superior', 27),
('DHT11', 'meio', 27),
('DHT11', 'inferior', 27),
('DHT11', 'superior', 28),
('DHT11', 'meio', 28),
('DHT11', 'inferior', 28),
('DHT11', 'superior', 29),
('DHT11', 'meio', 29),
('DHT11', 'inferior', 29),
('DHT11', 'superior', 30),
('DHT11', 'meio', 30),
('DHT11', 'inferior', 30);

INSERT INTO dados (data_dado, temperatura, umidade, fkSensor) VALUES
('2025-04-15 10:00:00', 25.9, 13.1, 2),
('2025-04-15 10:15:00', 28.3, 13.7, 2),
('2025-04-15 10:30:00', 27.3, 13.1, 2),
('2025-04-15 10:45:00', 27.6, 14.7, 2),
('2025-04-15 11:00:00', 24.1, 13.1, 2),
('2025-04-15 11:15:00', 28.3, 13.3, 2),
('2025-04-15 11:30:00', 25.1, 14.3, 2),
('2025-04-15 11:45:00', 24.7, 14.0, 2),
('2025-04-15 12:00:00', 25.4, 13.5, 2);

INSERT INTO dados (data_dado, temperatura, umidade, fkSensor) VALUES
('2025-04-15 10:00:00', 25.9, 13.1, 1),
('2025-04-15 10:15:00', 28.3, 13.7, 1),
('2025-04-15 10:30:00', 27.3, 13.1, 1),
('2025-04-15 10:45:00', 27.6, 14.7, 1),
('2025-04-15 11:00:00', 24.1, 13.1, 1),
('2025-04-15 11:15:00', 28.3, 13.3, 1),
('2025-04-15 11:30:00', 25.1, 14.3, 1),
('2025-04-15 11:45:00', 24.7, 14.0, 1),
('2025-04-15 12:00:00', 25.4, 13.5, 1);

INSERT INTO dados (data_dado, temperatura, umidade, fkSensor) VALUES
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
