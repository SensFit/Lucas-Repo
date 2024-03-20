create database sensorAcademia;

use sensorAcademia;

create table academia(
idAcademia INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(80),
cep CHAR(8),
endereco VARCHAR(80),
numero INT
);

create table usuario(
idUsario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
telefone CHAR(11),
email VARCHAR(75),
fkAcademia INT,
constraint fk_usuario_academia foreign key (fkAcademia) references academia(idAcademia)
);

create table maquina(
idMaquina INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
tipo_maquina VARCHAR(50),
qtd_Maquina INT,
dtVerificacao DATE,
fkAcademia INT,
constraint fk_maquina_academia foreign key(fkAcademia) references academia(idAcademia)
);

desc maquina;

-- constraint ck_dtVerificacao check (dtVerificacao in('ativo', 'inativo'))

create table sensor(
idSensor INT PRIMARY KEY AUTO_INCREMENT,
qtdUsoDia INT,
horasUtilizadasDia INT,
atividade VARCHAR(15) not null default 'inativo',
fkAcademia INT,
fkMaquina INT,
constraint ck_atividade check (atividade in('ativo', 'inativo')),
constraint fk_sensor_maquina foreign key(fkAcademia) references academia(idAcademia),
constraint fk_sensor_academia foreign key(fkMaquina) references maquina(idMaquina)
);


Insert into academia (nome, cep, endereco, numero)
values 	('SmartFit', '01555000', 'Paulista', '556'),
		('BlueFit', '01546000', 'Cambuci', '522'),
        ('SmartFit', '01555111', 'Paraiso', '553'),
        ('RedFit', '01456000', 'Ibirapuera', '546');
        
select * from academia;

insert into maquina (nome, tipo_Maquina, qtd_Maquina, dtVerificacao, fkAcademia)
values ('Bicicleta Ergométrica', 'cardio', 5,'2024-02-29', 1);


insert into maquina (nome, tipo_Maquina, qtd_Maquina, dtVerificacao, fkAcademia)
values 	('Esteira', 'cardio', 3,'2024-03-29', 1),
        ('Leg Press ', 'musculação', 2,'2024-02-25', 1),
        ('Barra ', 'funcional', 15,'2024-02-15', 1),
        ('Cadeira Adutora', 'musculação', 2,'2024-01-12', 1),
        ('Tríceps Pulley', 'musculação', 3,'2024-03-05', 1),
        
        ('Bicicleta Ergométrica', 'cardio', 3,'2024-02-29', 2),
		('Esteira', 'cardio', 3,'2023-03-29', 2),
        ('Leg Press ', 'musculação', 3,'2024-01-29', 2),
        ('Barra ', 'funcional', 3,'2024-02-06', 2),
        ('Cadeira Adutora', 'musculação', 3,'2024-05-22', 2),
        ('Tríceps Pulley', 'musculação', 3,'2024-03-23', 2),
        
        ('Bicicleta Ergométrica', 'cardio', 3,'2024-02-29', 3),
		('Esteira', 'cardio', 3,'2024-03-29', 3),
        ('Leg Press ', 'musculação', 3,'2024-02-29', 3),
        ('Barra ', 'funcional', 2,'2024-02-29', 3),
        ('Cadeira Adutora', 'musculação', 30,'2024-02-29', 3),
        ('Tríceps Pulley', 'musculação', 20,'2024-02-29', 3),
        
        ('Bicicleta Ergométrica', 'cardio', 25,'2024-02-29', 4),
		('Esteira', 'cardio', 35,'2024-03-29', 4),
        ('Leg Press ', 'musculação', 10,'2024-02-21', 4),
        ('Barra ', 'funcional', 23,'2024-03-30', 4),
        ('Cadeira Adutora', 'musculação', 13,'2024-01-29', 4),
        ('Tríceps Pulley', 'musculação', 33,'2024-02-20', 4);
        
   select * from maquina;
   -- qtdUsoDia
insert into sensor( qtdUsoDia, horasUtilizadasDia, atividade, fkAcademia, fkMaquina)
values (5, 10, 'ativo', 1, 1);

insert into sensor( qtdUsoDia, horasUtilizadasDia, atividade, fkMaquina, fkAcademia)
values 	(5, 10, 'ativo', 1, 1),
		(15, 20, 'inativo', 2, 1),
        (0, 0, 'ativo', 3, 1),
        (50, 15, 'ativo', 4, 1),
        (5, 12, 'inativo', 5, 1),
        
        (1, 11, 'ativo', 6, 2),
        (10, 9, 'inativo', 7, 2),
        (12, 18, 'inativo', 8, 2),
        (11, 19, 'ativo', 9, 2),
        (25, 20, 'ativo', 10, 2),
        
        (23, 23, 'ativo', 11, 3),
        (17, 24, 'inativo', 12, 3),
        (18, 12, 'ativo', 13, 3),
        (5, 11, 'inativo', 14, 3),
        (19, 5, 'ativo', 15, 3),
        
        (500, 24, 'inativo', 16, 4),
        (55, 19, 'inativo', 17, 4),
        (34, 18, 'ativo', 18, 4),
        (22, 12, 'inativo', 19, 4),
        (28, 15, 'ativo', 20, 4);
        
        
insert into usuario(nome, telefone, email, fkAcademia)
values 	('Giovanna', '11987654325', 'giovanna@sensfit', 1),
		('Gustavo', '11985554325', 'gustavo@sensfit', 2),
        ('Lucas', '11987653325', 'lucas@sensfit', 3),
        ('Bianca', '11987698725', 'bianca@sensfit', 4);

select * from sensor;
select * from maquina;
select * from academia;

drop table usuario;

select * from academia as fit
inner join usuario as usu on usu.fkAcademia = fit.idAcademia
inner join maquina as equip on equip.fkAcademia = fit.idAcademia
inner join sensor as sen on sen.fkAcademia = fit.idAcademia; 
