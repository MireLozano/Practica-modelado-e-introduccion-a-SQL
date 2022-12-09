-- PRACTICA MODELADO DE DATOS --


create schema mireia_hernandez authorization goyibubl;



-- MODELOS DE COCHE --

create table  mireia_hernandez.modelos(
	id_modelo integer NOT NULL, -- PK
	id_marca integer  NOT NULL, -- FK -> marcas
	modelo varchar (30) NOT NULL
);

alter  table  mireia_hernandez.modelos
add constraint pk_modelo primary key (id_modelo);






-- MARCAS DE COCHE --

create table  mireia_hernandez.marcas(
	id_marca integer NOT NULL, -- PK
	id_grupoempresarial integer NOT NULL, -- FK -> gruposempresariales
	marca varchar(30) NOT NULL
);

alter table  mireia_hernandez.marcas
add constraint  pk_marca primary key (id_marca);






-- GRUPOS EMPRESARIALES --

create table  mireia_hernandez.gruposempresariales(
	id_grupoempresarial integer NOT NULL, -- PK
	nombre varchar (30) NOT NULL
);

alter table  mireia_hernandez.gruposempresariales
add constraint pk_grupoempresarial primary key (id_grupoempresarial);






-- POLIZAS --

create table  mireia_hernandez.polizas(
	id_poliza integer NOT NULL, -- PK
	id_coche integer NOT NULL, -- FK -> coche
	id_aseguradora integer NOT NULL, -- FK -> aseguradoras
	numero_poliza integer NOT NULL
);

alter table mireia_hernandez.polizas
add constraint pk_poliza primary key (id_poliza);






-- ASEGURADORAS --

create table  mireia_hernandez.aseguradoras(
	id_aseguradora integer NOT NULL, -- PK
	aseguradora varchar(50)NOT NULL
);

alter table  mireia_hernandez.aseguradoras
add constraint pk_aseguradora primary key (id_aseguradora);







-- DIVISAS --

create  table  mireia_hernandez.divisas(
	id_divisa integer NOT NULL, -- PK
	nombre varchar(30) NOT NULL,
	region varchar(30) NOT NULL
);

alter table  mireia_hernandez.divisas
add constraint pk_divisa primary key (id_divisa);








-- REVISION VEHICULOS --

create table  mireia_hernandez.revisiones(
	km integer  NOT NULL,
	id_coche integer NOT NULL, -- PK, FK --> coches
	id_divisa integer  NOT NULL, -- FK --> divisas
	fecha_revision timestamp NOT NULL, -- PK
	precio integer NOT NULL
);

alter table mireia_hernandez.revisiones
add constraint pk_revision primary key (fecha_revision, id_coche);







-- COLORES --

create table  mireia_hernandez.colores(
	id_color integer  NOT NULL, -- PK
	color varchar(20) NOT NULL
);

alter table  mireia_hernandez.colores
add constraint  pk_color primary key (id_color);






-- COCHES --

create table  mireia_hernandez.coches(
	id_coche integer  NOT NULL, -- PK
	id_modelo integer  NOT NULL, -- FK --> modelos
	id_color integer  NOT NULL, -- FK --> colores
	fecha_compra date  NOT NULL,
	matricula varchar(10) NOT NULL,
	km_total integer NOT NULL
);
			
alter table  mireia_hernandez.coches
add constraint pk_coche primary key (id_coche);







-- FOREIGNKEYS --

alter table  mireia_hernandez.marcas
add constraint marca_grupoempresarial foreign key (id_grupoempresarial)
references mireia_hernandez.gruposempresariales (id_grupoempresarial);

alter table  mireia_hernandez.modelos
add constraint modelo_marca foreign key (id_marca)
references mireia_hernandez.marcas (id_marca);

alter table  mireia_hernandez.polizas
add constraint poliza_aseguradora foreign key (id_aseguradora)
references mireia_hernandez.aseguradoras (id_aseguradora);

alter table  mireia_hernandez.polizas
add constraint poliza_coche foreign key (id_coche)
references mireia_hernandez.coches (id_coche);

alter table  mireia_hernandez.coches
add constraint coche_modelo foreign key (id_modelo)
references mireia_hernandez.modelos (id_modelo);

alter table mireia_hernandez.coches
add constraint coche_color foreign key (id_color)
references mireia_hernandez.colores (id_color);

alter table  mireia_hernandez.revisiones
add constraint revision_coche foreign key (id_coche)
references mireia_hernandez.coches (id_coche);

alter table  mireia_hernandez.revisiones
add constraint revision_divisa foreign key (id_divisa)
references mireia_hernandez.divisas (id_divisa);




------------------------------------------------------------------





-- DIVISAS --

insert into mireia_hernandez.divisas
	(id_divisa, nombre, region)
	values ('001','euro','UE');

insert into mireia_hernandez.divisas
	(id_divisa, nombre, region)
	values ('002','dolar','USA');

insert into mireia_hernandez.divisas
	(id_divisa, nombre, region)
	values ('003','peso','Latam');

insert into mireia_hernandez.divisas
	(id_divisa, nombre, region)
	values ('004','won','Norcorea');

insert into mireia_hernandez.divisas
	(id_divisa, nombre, region)
	values ('005','dirham','Emiratos arabes');





-- GRUPOS EMPRESARIALES --

insert into mireia_hernandez.gruposempresariales
	(id_grupoempresarial, nombre)
	values ('001','Stellantis');

insert into mireia_hernandez.gruposempresariales
	(id_grupoempresarial, nombre)
	values ('002','Tata');

insert into mireia_hernandez.gruposempresariales
	(id_grupoempresarial, nombre)
	values ('003','Daimler');

insert into mireia_hernandez.gruposempresariales
	(id_grupoempresarial, nombre)
	values ('004','Volkswagen');




-- MARCAS --

insert into mireia_hernandez.marcas
	(id_marca, id_grupoempresarial, marca)
	values ('001','001','Dodge');

insert into mireia_hernandez.marcas
	(id_marca, id_grupoempresarial, marca)
	values ('002','001','Maserati');

insert into mireia_hernandez.marcas
	(id_marca, id_grupoempresarial, marca)
	values ('003','002' ,'Jaguar');





-- MODELOS --

insert into mireia_hernandez.modelos
	(id_modelo, id_marca, modelo)
	values ('001','001','Challenger');

insert into mireia_hernandez.modelos
	(id_modelo, id_marca, modelo)
	values ('002','002','Ghibli');

insert into mireia_hernandez.modelos
	(id_modelo, id_marca, modelo)
	values ('003','002','GranCabrio');

insert into mireia_hernandez.modelos
	(id_modelo, id_marca, modelo)
	values ('004','003','I-Pace');

insert into mireia_hernandez.modelos
	(id_modelo, id_marca, modelo)
	values ('005','003','F-type');

insert into mireia_hernandez.modelos
	(id_modelo, id_marca, modelo)
	values ('006','003','F-Pace');




-- ASEGURADORAS --

insert into mireia_hernandez.aseguradoras
	(id_aseguradora, aseguradora)
	values ('001','Mapfre');

insert into mireia_hernandez.aseguradoras
	(id_aseguradora, aseguradora)
	values ('002','Racc');

insert into mireia_hernandez.aseguradoras
	(id_aseguradora, aseguradora)
	values ('003','Reale');



-- COLORES --

insert into mireia_hernandez.colores
	(id_color, color)
	values ('001','rojo intenso');

insert into mireia_hernandez.colores
	(id_color, color)
	values('002','blanco perla');

insert into mireia_hernandez.colores
	(id_color, color)
	values ('003','negro mica');

insert into mireia_hernandez.colores
	(id_color, color)
	values ('004','plata royal');




-- COCHES --

insert into mireia_hernandez.coches
	(id_coche, id_modelo, id_color, fecha_compra, matricula, km_total)
	values ('001','001','003','2020-01-03','5177KMN',6000);

insert into mireia_hernandez.coches
	(id_coche, id_modelo, id_color, fecha_compra, matricula, km_total)
	values ('002','001','004','2022-05-12','5254LKM',57000);

insert into mireia_hernandez.coches
	(id_coche, id_modelo, id_color, fecha_compra, matricula, km_total)
	values ('003','001','002','2017-11-02','7456FGG',34000);

insert into mireia_hernandez.coches
	(id_coche, id_modelo, id_color, fecha_compra, matricula, km_total)
	values ('004','001','001','2016-04-02','9665LGH',23000);

insert into mireia_hernandez.coches
	(id_coche, id_modelo, id_color, fecha_compra, matricula, km_total)
	values ('005','002','001','2021-09-28','8478HDJ',50025);

insert into mireia_hernandez.coches
	(id_coche, id_modelo, id_color, fecha_compra, matricula, km_total)
	values ('006','002','002','2017-12-15','5465DFG',75500);

insert into mireia_hernandez.coches
	(id_coche, id_modelo, id_color, fecha_compra, matricula, km_total)
	values ('007','003','001','2016-02-13','9521ELK',87920);

insert into mireia_hernandez.coches
	(id_coche, id_modelo, id_color, fecha_compra, matricula, km_total)
	values ('008','003','002','2021-12-02','5436LKJ',22200);

insert into mireia_hernandez.coches
	(id_coche, id_modelo, id_color, fecha_compra, matricula, km_total)
	values ('009','003','002','2018-01-03','6455JJJ',16500);

insert into mireia_hernandez.coches
	(id_coche, id_modelo, id_color, fecha_compra, matricula, km_total)
	values ('010','004', '001','2014-01-07','1415LLM',84000);

insert into mireia_hernandez.coches
	(id_coche, id_modelo, id_color, fecha_compra, matricula, km_total)
	values ('011','005','004','2016-12-12','7474HHI',48520);

insert into mireia_hernandez.coches
	(id_coche, id_modelo, id_color, fecha_compra, matricula, km_total)
	values ('012','005','001','2019-03-22','1232VVW',120700);

insert into mireia_hernandez.coches
	(id_coche, id_modelo, id_color, fecha_compra, matricula, km_total)
	values ('013','006','001','2015-07-29','8993KML',9999);

insert into mireia_hernandez.coches
	(id_coche, id_modelo, id_color, fecha_compra, matricula, km_total)
	values ('014','006','003','2022-12-05','9612TJK',100);

insert into mireia_hernandez.coches
	(id_coche, id_modelo, id_color, fecha_compra, matricula, km_total)
	values ('015','006','001','2022-01-01','9147QWE',560);




-- POLIZAS --

insert into mireia_hernandez.polizas
	(id_poliza, id_coche, id_aseguradora, numero_poliza)
	values ('001','001','002','0000231');

insert into mireia_hernandez.polizas
	(id_poliza, id_coche, id_aseguradora, numero_poliza)
	values ('002','002','003','0000231');

insert into mireia_hernandez.polizas
	(id_poliza, id_coche, id_aseguradora, numero_poliza)
	values ('003','003','003','0000541');

insert into mireia_hernandez.polizas
	(id_poliza, id_coche, id_aseguradora, numero_poliza)
	values ('004','004','002',' 0000254');

insert into mireia_hernandez.polizas
	(id_poliza, id_coche, id_aseguradora, numero_poliza)
	values ('005','005','003','0000254');

insert into mireia_hernandez.polizas
	(id_poliza, id_coche, id_aseguradora, numero_poliza)
	values ('006','006','001','0000999');

insert into mireia_hernandez.polizas
	(id_poliza, id_coche, id_aseguradora, numero_poliza)
	values ('007','007','002','0000555');

insert into mireia_hernandez.polizas
	(id_poliza, id_coche, id_aseguradora, numero_poliza)
	values ('008','008','003','0000457');
	
insert into mireia_hernandez.polizas
	(id_poliza, id_coche, id_aseguradora, numero_poliza)
	values ('009','009','001','0000885');
	
insert into mireia_hernandez.polizas
	(id_poliza, id_coche, id_aseguradora, numero_poliza)
	values ('010','010','002','0000879');
	
insert into mireia_hernandez.polizas
	(id_poliza, id_coche, id_aseguradora, numero_poliza)
	values ('011','011','001','0000662');
	
insert into mireia_hernandez.polizas
	(id_poliza, id_coche, id_aseguradora, numero_poliza)
	values ('012','012','002','0000111');
	
insert into mireia_hernandez.polizas
	(id_poliza, id_coche, id_aseguradora, numero_poliza)
	values ('013','013','003','0000233');
	
insert into mireia_hernandez.polizas
	(id_poliza, id_coche, id_aseguradora, numero_poliza)
	values ('014','014','002','0000413');
	
insert into mireia_hernandez.polizas
	(id_poliza, id_coche, id_aseguradora, numero_poliza)
	values ('015','015','003','0000100');





-- REVISIONES --

insert into mireia_hernandez.revisiones
	(id_coche, km, id_divisa, fecha_revision, precio)
	values ('001',35000,'001','2023-02-14 12:00:00',60);

insert into mireia_hernandez.revisiones
	(id_coche, km, id_divisa, fecha_revision, precio)
	values ('002',35000,'003','2023-02-14 11:00:00',60);
	
insert into mireia_hernandez.revisiones
	(id_coche, km, id_divisa, fecha_revision, precio)
	values ('003',35000,'002','2023-02-14 10:00:00',60);

insert into mireia_hernandez.revisiones
	(id_coche, km, id_divisa, fecha_revision, precio)
	values ('004',35000,'004','2023-02-16 13:00:00',60);
	
insert into mireia_hernandez.revisiones
	(id_coche, km, id_divisa, fecha_revision, precio)
	values ('005',75000,'004','2023-02-16 16:00:00',60);
	
insert into mireia_hernandez.revisiones
	(id_coche, km, id_divisa, fecha_revision, precio)
	values ('006',35000,'002','2023-03-14 15:00:00',60);

insert into mireia_hernandez.revisiones
	(id_coche, km, id_divisa, fecha_revision, precio)
	values ('007',80000,'005','2023-01-01 10:00:00',60);

	
insert into mireia_hernandez.revisiones
	(id_coche, km, id_divisa, fecha_revision, precio)
	values ('007',35000,'001','2024-06-04 18:00:00',65);
	
insert into mireia_hernandez.revisiones
	(id_coche, km, id_divisa, fecha_revision, precio)
	values ('008',70000,'004','2023-01-01 12:30:00',60);
	
insert into mireia_hernandez.revisiones
	(id_coche, km, id_divisa, fecha_revision, precio)
	values ('009',35000,'005','2023-08-05 11:00:00',60);
	
insert into mireia_hernandez.revisiones
	(id_coche, km, id_divisa, fecha_revision, precio)
	values ('010',90000,'004','2024-08-10 17:45:00',60);
	
insert into mireia_hernandez.revisiones
	(id_coche, km, id_divisa, fecha_revision, precio)
	values ('011',35000,'001','2023-01-10 09:00:00',65);

insert into mireia_hernandez.revisiones
	(id_coche, km, id_divisa, fecha_revision, precio)
	values ('012',65000,'001','2023-12-14 08:30:00',60);

insert into mireia_hernandez.revisiones
	(id_coche, km, id_divisa, fecha_revision, precio)
	values ('013',35000,'003','2023-04-25 17:10:00',60);
	
insert into mireia_hernandez.revisiones
	(id_coche, km, id_divisa, fecha_revision, precio)
	values ('014',120000,'001','2023-05-17 07:30:00',60);
	
insert into mireia_hernandez.revisiones
	(id_coche, km, id_divisa, fecha_revision, precio)
	values ('015',95000,'001','2023-08-10 10:00:00',70);