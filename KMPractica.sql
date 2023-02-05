create schema secondtest_ddl authorization pvzxrmvf;
create table secondtest_ddl.Vehiculo(
	idvehiculo varchar (10) not null, ---PK
	idmodelo varchar (10) not null, ----FK
	idaseguradora varchar (10) not null, ---FK
	idcolor varchar (10) not null, ----FK
	matricula varchar (7) not null,
	numeropoliza varchar (10) not null,
	kilometros varchar (10) not null,
	fechacompra date not null,
	fechabaja date null );
---—añadimos PK a vehiculo	
alter table secondtest_ddl.vehiculo
add constraint vehiculo_PK primary key (idvehiculo);
create table secondtest_ddl.modelos
	(idmodelo varchar (10) not null, ---- PK, FK
	nombremodelo varchar (20) not null,
	idmarca varchar (10) not null );
---añadimos PK
alter table secondtest_ddl.modelos
add constraint modelo_PK primary key (idmodelo);

create table secondtest_ddl.marcas(
	idmarca varchar(10) not null,
	nombremarca varchar(20) not null,
	idgrupo varchar (10) not null
);
---añadir PK a la tabla marcas
alter table secondtest_ddl.marcas
add constraint marcas_PK primary key (idmarca);
create table secondtest_ddl.grupo(
	idgrupo varchar (10) not null,
	nombregrupo varchar (20) not null
);
---añadir PK a la tabla grupo
alter table secondtest_ddl.grupo
add constraint grupo_PK primary key (idgrupo);
create table secondtest_ddl.colores(
	idcolor varchar (10) not null,
	nombrecolor varchar (20) not null
);
----add PK to tabla colores
alter table secondtest_ddl.colores
add constraint colores_PK primary key (idcolor);
create table secondtest_ddl.revisiones(
	idvehiculo varchar (10) not null, ---PK, FK
	idrevision varchar (10) not null, ---PK
	fecharevision date not null,
	kilometrosdiarevision varchar (10) not null,
	importerevision decimal(6,2) not null,
	idmoneda varchar (10) not null ---fk
);
---añadir PK a la tabla revisiones
alter table secondtest_ddl.revisiones
add constraint revisiones_PK primary key (idvehiculo, idrevision);
create table secondtest_ddl.aseguradora(
	idaseguradora varchar (10) not null, ---PK,FK
	nombreempresa varchar (20) not null
);
---añadir PK a la tabla aseguradora
alter table secondtest_ddl.aseguradora
add constraint aseguradora_PK primary key (idaseguradora);
create table secondtest_ddl.moneda(
	idmoneda varchar (10) not null,
	nombremoneda varchar (20) not null,
	simbolomoneda varchar (2) null
);
---añadir PK a la tabla moneda
alter table secondtest_ddl.moneda
add constraint moneda_PK primary key (idmoneda);
---añadir FK a vehiculo
alter table secondtest_ddl.Vehiculo
add constraint Vehiculo_modelo_FK foreign key (idmodelo)
references secondtest_ddl.modelos(idmodelo);
alter table secondtest_ddl.vehiculo
add constraint Vehiculo_aseguradora_FK foreign key (idaseguradora)
references secondtest_ddl.aseguradora(idaseguradora);
alter table secondtest_ddl.vehiculo
add constraint Vehiculo_colores_FK foreign key (idcolor)
references secondtest_ddl.colores(idcolor);
---añadir FK a modelos
alter table secondtest_ddl.modelos
add constraint modelos_marcas_FK foreign key (idmarca)
references secondtest_ddl.marcas(idmarca);
----añadir FK a marcas
alter table secondtest_ddl.marcas
add constraint marca_grupo_FK foreign key (idgrupo)
references secondtest_ddl.grupo(idgrupo);
----añadir FK a revisiones
alter table secondtest_ddl.revisiones
add constraint revisiones_vehiculo_FK foreign key (idvehiculo)
references secondtest_ddl.vehiculo(idvehiculo);
---añadir FK a la tabla revisiones
alter table secondtest_ddl.revisiones
add constraint revisiones_moneda foreign key (idmoneda)
references secondtest_ddl.moneda(idmoneda);
---rellenar datos
----añadimos datos a la tabla grupo

insert into secondtest_ddl.grupo
(idgrupo, nombregrupo)
values ('001', 'Volkswagon');

insert into secondtest_ddl.grupo
(idgrupo, nombregrupo)
values ('002', 'Stellantis');
insert into secondtest_ddl.grupo
(idgrupo, nombregrupo)
values ('003', 'Daimler');
insert into secondtest_ddl.grupo
(idgrupo, nombregrupo)
values ('004', 'Toyota');
insert into secondtest_ddl.grupo
(idgrupo, nombregrupo)
values ('005', 'Renault');




---añadir datos a tabla marcas
insert into secondtest_ddl.marcas
(idmarca, nombremarca, idgrupo)
values ('101', 'Audi', '001');

insert into secondtest_ddl.marcas
(idmarca, nombremarca, idgrupo)
values ('102', 'Seat', '001');

insert into secondtest_ddl.marcas
(idmarca, nombremarca, idgrupo)
values ('103', 'Peugeot', '002');
insert into secondtest_ddl.marcas
(idmarca, nombremarca, idgrupo)
values ('104', 'Citroen', '002');
insert into secondtest_ddl.marcas
(idmarca, nombremarca, idgrupo)
values ('105', 'Mercedes', '003');
insert into secondtest_ddl.marcas
(idmarca, nombremarca, idgrupo)
values ('106', 'Smart', '003');
insert into secondtest_ddl.marcas
(idmarca, nombremarca, idgrupo)
values ('107', 'Toyota', '004');
insert into secondtest_ddl.marcas
(idmarca, nombremarca, idgrupo)
values ('108', 'Lexus', '004');
insert into secondtest_ddl.marcas
(idmarca, nombremarca, idgrupo)
values ('109', 'Daihatsu', '004');
insert into secondtest_ddl.marcas
(idmarca, nombremarca, idgrupo)
values ('110', 'Renault', '005');
insert into secondtest_ddl.marcas
(idmarca, nombremarca, idgrupo)
values ('111', 'Nissan', '005');
insert into secondtest_ddl.marcas
(idmarca, nombremarca, idgrupo)
values ('112', 'Mitsubishi', '005');

----añadir datos a la tabla modelos
insert into secondtest_ddl.modelos
(idmodelo, nombremodelo, idmarca)
values ('100', 'A4', '101');
insert into secondtest_ddl.modelos
(idmodelo, nombremodelo, idmarca)
values ('200', 'Ibiza', '102');
insert into secondtest_ddl.modelos
(idmodelo, nombremodelo, idmarca)
values ('300', '206', '103');
insert into secondtest_ddl.modelos
(idmodelo, nombremodelo, idmarca)
values ('400', 'Aircross', '104');
insert into secondtest_ddl.modelos
(idmodelo, nombremodelo, idmarca)
values ('500', '350D', '105');
insert into secondtest_ddl.modelos
(idmodelo, nombremodelo, idmarca)
values ('600', 'Forfour', '106');
insert into secondtest_ddl.modelos
(idmodelo, nombremodelo, idmarca)
values ('700', 'Tundra', '107');
insert into secondtest_ddl.modelos
(idmodelo, nombremodelo, idmarca)
values ('800', 'UX', '108');
insert into secondtest_ddl.modelos
(idmodelo, nombremodelo, idmarca)
values ('900', 'Valera', '109');
insert into secondtest_ddl.modelos
(idmodelo, nombremodelo, idmarca)
values ('1000', 'Arkana', '110');
insert into secondtest_ddl.modelos
(idmodelo, nombremodelo, idmarca)
values ('1100', 'Altima', '111');
insert into secondtest_ddl.modelos
(idmodelo, nombremodelo, idmarca)
values ('1200', 'Juke', '111');
insert into secondtest_ddl.modelos
(idmodelo, nombremodelo, idmarca)
values ('1300', 'Yaris', '107');
insert into secondtest_ddl.modelos
(idmodelo, nombremodelo, idmarca)
values ('1400', 'Clio', '110');
insert into secondtest_ddl.modelos
(idmodelo, nombremodelo, idmarca)
values ('1500', 'ForTwo', '106');


---select * from secondtest_ddl.marcas;

select * from secondtest_ddl.modelos m ;

---añadir datos a la tabla moneda
insert into secondtest_ddl.moneda
(idmoneda, nombremoneda, simbolomoneda)
values ('1', 'Euro', '€');
insert into secondtest_ddl.moneda
(idmoneda, nombremoneda, simbolomoneda)
values ('2', 'Dollar', '$');
----añadir datos a la tabla aseguradora
insert into secondtest_ddl.aseguradora
(idaseguradora, nombreempresa)
values ('1', 'Mapfre');
insert into secondtest_ddl.aseguradora
(idaseguradora, nombreempresa)
values ('2', 'Generali');
insert into secondtest_ddl.aseguradora
(idaseguradora, nombreempresa)
values ('3', 'Allianz');
insert into secondtest_ddl.aseguradora
(idaseguradora, nombreempresa)
values ('4', 'Verti');

---insert data into tabla colores
insert into secondtest_ddl.colores
(idcolor, nombrecolor)
values ('1', 'Orange');
insert into secondtest_ddl.colores
(idcolor, nombrecolor)
values ('2', 'Blue');
insert into secondtest_ddl.colores
(idcolor, nombrecolor)
values ('3', 'Green');
insert into secondtest_ddl.colores
(idcolor, nombrecolor)
values ('4', 'Red');
insert into secondtest_ddl.colores
(idcolor, nombrecolor)
values ('5', 'Silver');
insert into secondtest_ddl.colores
(idcolor, nombrecolor)
values ('6', 'Black');
insert into secondtest_ddl.colores
(idcolor, nombrecolor)
values ('7', 'White');
insert into secondtest_ddl.colores
(idcolor, nombrecolor)
values ('8', 'Beige');

----añadimos datos a la tabla vehiculo
insert into secondtest_ddl.vehiculo
(idvehiculo, idmodelo,idaseguradora,idcolor,matricula,numeropoliza,kilometros,fechacompra,fechabaja)
values ('100','1100', '2', '4', '4676NAH', '64891111', '100168', '2020-01-31', '2021-10-15');
insert into secondtest_ddl.vehiculo
(idvehiculo, idmodelo,idaseguradora,idcolor,matricula,numeropoliza,kilometros,fechacompra,fechabaja)
values ('200','600', '2', '2', '0202ZBF', '67891112', '215161', '2006-10-25', NULL);
insert into secondtest_ddl.vehiculo
(idvehiculo, idmodelo,idaseguradora,idcolor,matricula,numeropoliza,kilometros,fechacompra,fechabaja)
values ('300','500', '2', '2', '3685MOF', '67891113', '200917', '2006-10-26', NULL);
insert into secondtest_ddl.vehiculo
(idvehiculo, idmodelo,idaseguradora,idcolor,matricula,numeropoliza,kilometros,fechacompra,fechabaja)
values ('400','300', '3', '2', '0243LMZ', '12341111', '264768', '2011-12-17', NULL);
insert into secondtest_ddl.vehiculo
(idvehiculo, idmodelo,idaseguradora,idcolor,matricula,numeropoliza,kilometros,fechacompra,fechabaja)
values ('500','1400', '1', '6', '6774FXS', '23451111', '98562', '2021-11-23', NULL);
insert into secondtest_ddl.vehiculo
(idvehiculo, idmodelo,idaseguradora,idcolor,matricula,numeropoliza,kilometros,fechacompra,fechabaja)
values ('600','200', '3', '7', '0815GYR', '12341112', '87322', '2010-05-26', '2021-09-18');
insert into secondtest_ddl.vehiculo
(idvehiculo, idmodelo,idaseguradora,idcolor,matricula,numeropoliza,kilometros,fechacompra,fechabaja)
values ('700','200', '4', '7', '1344LMR', '34561111', '305205', '1999-02-02', '2018-12-06');
insert into secondtest_ddl.vehiculo
(idvehiculo, idmodelo,idaseguradora,idcolor,matricula,numeropoliza,kilometros,fechacompra,fechabaja)
values ('800','600', '4', '1', '2093GSW', '34561112', '200177', '2013-11-05', NULL);
insert into secondtest_ddl.vehiculo
(idvehiculo, idmodelo,idaseguradora,idcolor,matricula,numeropoliza,kilometros,fechacompra,fechabaja)
values ('900','800', '1', '6', '5621KPX', '98761111', '195622', '2014-11-08', NULL);
insert into secondtest_ddl.vehiculo
(idvehiculo, idmodelo,idaseguradora,idcolor,matricula,numeropoliza,kilometros,fechacompra,fechabaja)
values ('1000','900', '1', '4', '4060LTB', '98761112', '99912', '2018-1-12', '2019-06-04');


---añadir datos a la tabla revisiones
insert into secondtest_ddl.revisiones
(idvehiculo, idrevision, fecharevision, kilometrosdiarevision, importerevision, idmoneda)
values ('100', '101', '2021-02-28', '44201', 200.02, '2');
insert into secondtest_ddl.revisiones
(idvehiculo, idrevision, fecharevision, kilometrosdiarevision, importerevision, idmoneda)
values ('200', '201', '2010-11-25', '60522', 175.02, '1');
insert into secondtest_ddl.revisiones
(idvehiculo, idrevision, fecharevision, kilometrosdiarevision, importerevision, idmoneda)
values ('200', '202', '2014-11-27', '103366', 186.32, '1');
insert into secondtest_ddl.revisiones
(idvehiculo, idrevision, fecharevision, kilometrosdiarevision, importerevision, idmoneda)
values ('200', '203', '2018-11-27', '180019', 200.02, '1');
insert into secondtest_ddl.revisiones
(idvehiculo, idrevision, fecharevision, kilometrosdiarevision, importerevision, idmoneda)
values ('300', '301', '2010-10-26', '120854', 175.22, '2');
insert into secondtest_ddl.revisiones
(idvehiculo, idrevision, fecharevision, kilometrosdiarevision, importerevision, idmoneda)
values ('300', '302', '2015-10-26', '164884', 187.90, '2');
insert into secondtest_ddl.revisiones
(idvehiculo, idrevision, fecharevision, kilometrosdiarevision, importerevision, idmoneda)
values ('300', '303', '2019-10-27', '190032', 201.24, '2');
insert into secondtest_ddl.revisiones
(idvehiculo, idrevision, fecharevision, kilometrosdiarevision, importerevision, idmoneda)
values ('400', '401', '2015-12-17', '36252', 167.90, '1');
insert into secondtest_ddl.revisiones
(idvehiculo, idrevision, fecharevision, kilometrosdiarevision, importerevision, idmoneda)
values ('400', '402', '2019-12-18', '79969', 201.24, '1');
insert into secondtest_ddl.revisiones
(idvehiculo, idrevision, fecharevision, kilometrosdiarevision, importerevision, idmoneda)
values ('500', '501', '2022-11-23', '85487', 204.06, '1');
insert into secondtest_ddl.revisiones
(idvehiculo, idrevision, fecharevision, kilometrosdiarevision, importerevision, idmoneda)
values ('600', '601', '2014-05-26', '60207', 186.32, '2');
insert into secondtest_ddl.revisiones
(idvehiculo, idrevision, fecharevision, kilometrosdiarevision, importerevision, idmoneda)
values ('600', '602', '2020-05-25', '82654', 194.30, '2');
insert into secondtest_ddl.revisiones
(idvehiculo, idrevision, fecharevision, kilometrosdiarevision, importerevision, idmoneda)
values ('700', '701', '2003-02-02', '80595', 150.85, '1');
insert into secondtest_ddl.revisiones
(idvehiculo, idrevision, fecharevision, kilometrosdiarevision, importerevision, idmoneda)
values ('700', '702', '2018-02-02', '302141', 175.22 , '1');
insert into secondtest_ddl.revisiones
(idvehiculo, idrevision, fecharevision, kilometrosdiarevision, importerevision, idmoneda)
values ('800', '801', '2018-11-15', '76211', 187.26, '2');
insert into secondtest_ddl.revisiones
(idvehiculo, idrevision, fecharevision, kilometrosdiarevision, importerevision, idmoneda)
values ('800', '802', '2021-11-08', '44201', 201.32, '2');
insert into secondtest_ddl.revisiones
(idvehiculo, idrevision, fecharevision, kilometrosdiarevision, importerevision, idmoneda)
values ('900', '901', '2018-12-10', '68989', 200.02, '2');
insert into secondtest_ddl.revisiones
(idvehiculo, idrevision, fecharevision, kilometrosdiarevision, importerevision, idmoneda)
values ('900', '902', '2022-11-10', '105878', 204.04, '2');
insert into secondtest_ddl.revisiones
(idvehiculo, idrevision, fecharevision, kilometrosdiarevision, importerevision, idmoneda)
values ('1000', '1001', '2021-12-12', '118815', 201.32, '2');

