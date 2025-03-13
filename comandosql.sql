-- Criação e utilização do Banco de Dados do projeto.

create database agrotech;

use agrotech;

-- Criação das tabelas Usuário, Dados Arduino e Alerta. --

create table usuario (
re int primary key auto_increment,
usuario varchar(20) not null,
senha varchar(20) not null
)auto_increment=10;


create table dadosAR (
    idDado int primary key auto_increment,
    data date not null,
    horario time not null,
    temperatura varchar(6) not null,
    umidade varchar(6) not null,
    silo int default 1
)auto_increment=100;



create table alerta(
 idAlerta int primary key auto_increment,
 tipo varchar(50),
 fkusuario int,
 fkdado int,
 constraint chk_tipo check(tipo in('temperatura','umidade', 'temperatura e umidade','dentro dos parâmetros')),
 foreign key fk_usuario(fkusuario) references usuario(re),
 foreign key fk_dado(fkdado) references dadosAR(idDado)
)auto_increment=1000;


-- Inserção dos dados nas tabelas. --

insert into usuario (usuario, senha)
values ('AgroPop99034', 'AgroX7pL'),
       ('GreenHarvest785', 'GreeT92z'),
       ('AgroGrow68', 'AgroM3kQ'),
       ('AgroTech21111', 'AgroA4sV'),
       ('NatureYield80', 'NatuJ8wX'),
       ('AgriSolutions498', 'AgriP5mD'),
       ('CropCare26190', 'CropZ6nB'),
       ('AgroTudo66156', 'AgroY1cF'),
	   ('HarvestKing754', 'HarvQ9dR'),
       ('CropCare058', 'CropK2gT');
-----------------------------------------------------       
insert into dadosAR (data, horario, temperatura, umidade, silo)
values ('2023-04-15', '08:23', '22°C', '65%', 2),
       ('2023-07-29', '14:45', '30°C', '30%', 1),
       ('2024-01-05', '06:30', '12°C', '20%', 2),
       ('2024-05-22', '12:15', '35°C', '15%', 1),
       ('2024-08-14', '21:50', '24°C', '70%', 3),
       ('2024-10-30', '16:37', '33°C', '45%', 3),
       ('2024-12-25', '04:05', '15°C', '10%', 1),
       ('2025-02-10', '09:55', '20°C', '60%', 2),
       ('2025-02-27', '22:40', '27°C', '5%', 1);
-----------------------------------------------------
insert into alerta (tipo, fkusuario, fkdado)
values ('umidade', 10, 100),
       ('umidade', 11, 101),
       ('temperatura', 12, 102),
       ('temperatura', 13, 103),
       ('umidade', 14, 104),
       ('temperatura e umidade', 15, 105),
       ('dentro dos parâmetros', 16, 106),
       ('umidade', 17, 107),
       ('umidade', 18, 108);
       
      
-- Selects Gerais dos dados das tabelas --

   select re as 'Registro de Empresa', usuario as 'Usuário', senha as 'Senha' from usuario;
   
   select idDado as 'Número de registro', data as 'Data', horario as 'Horário', temperatura as 'Temperatura', umidade as 'Umidade relativa' from dadosAR; 
   
   select tipo as 'Tipo de Alerta', fkusuario as 'Código de Usuário', fkdado as 'Código de Registro do Dado' from alerta;
   
-- Selects específicos dos dados das tabelas --