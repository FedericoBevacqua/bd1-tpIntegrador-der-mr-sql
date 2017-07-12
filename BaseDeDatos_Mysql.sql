-- Integrantes: Bevacqua - Falon - Medicina --

-- Creación de DataBase -- 

DROP DATABASE tp_final;
CREATE DATABASE tp_final;
USE tp_final;

-- Creación de Tablas --

CREATE TABLE provincia
(codigo TINYINT UNSIGNED PRIMARY KEY,
nombre VARCHAR(30));


CREATE TABLE sistema_operativo
(codigo TINYINT UNSIGNED PRIMARY KEY,
version VARCHAR(30));


CREATE TABLE pais_origen
(codigo TINYINT UNSIGNED PRIMARY KEY,
nombre VARCHAR(30));


CREATE TABLE tipo_tarjeta
(codigo TINYINT UNSIGNED PRIMARY KEY,
tipo VARCHAR(20));


CREATE TABLE banco
(codigo TINYINT UNSIGNED PRIMARY KEY,
nombre VARCHAR(30));


CREATE TABLE localidad
(codigo SMALLINT UNSIGNED PRIMARY KEY,
nombre VARCHAR(30),
codigo_provincia TINYINT UNSIGNED,
FOREIGN KEY(codigo_provincia) REFERENCES provincia(codigo));


CREATE TABLE comercio
(cuit bigint UNSIGNED PRIMARY KEY,
razon_social VARCHAR(30),
telefono BIGINT UNSIGNED,
dom_calle VARCHAR(30),
dom_numero SMALLINT UNSIGNED,
codigo_localidad SMALLINT UNSIGNED,
FOREIGN KEY(codigo_localidad) REFERENCES localidad(codigo));


CREATE TABLE grande
(cuit BIGINT UNSIGNED PRIMARY KEY,
cantidad_sucursales TINYINT UNSIGNED,
FOREIGN KEY(cuit) REFERENCES comercio(cuit));


CREATE TABLE pequeño
(cuit BIGINT UNSIGNED PRIMARY KEY,
nombre_responsable VARCHAR(30),
FOREIGN KEY(cuit) REFERENCES comercio(cuit));


CREATE TABLE terminal
(codigo SMALLINT UNSIGNED PRIMARY KEY,
memoria MEDIUMINT UNSIGNED,
año_importacion SMALLINT UNSIGNED,
cuit_comercio BIGINT UNSIGNED,
codigo_sistema_operativo TINYINT UNSIGNED,
codigo_pais_origen TINYINT UNSIGNED,
FOREIGN Key(cuit_comercio) REFERENCES comercio(cuit),
FOREIGN KEY(codigo_sistema_operativo) REFERENCES sistema_operativo(codigo),
FOREIGN KEY(codigo_pais_origen) REFERENCES pais_origen(codigo));


CREATE TABLE transaccion
(numero_transaccion INT UNSIGNED PRIMARY KEY,
numero_factura INT UNSIGNED,
numero_tarjeta BIGINT UNSIGNED,
monto DECIMAL(10,2) UNSIGNED,
cantidad_cuotas TINYINT UNSIGNED,
fecha DATE,
hora TIME,
codigo_terminal SMALLINT UNSIGNED,
codigo_tipo_tarjeta TINYINT UNSIGNED,
FOREIGN KEY(codigo_terminal) REFERENCES terminal(codigo),
FOREIGN KEY(codigo_tipo_tarjeta) REFERENCES tipo_tarjeta(codigo));


CREATE TABLE tecnico
(cuit bigint UNSIGNED PRIMARY KEY,
nombre VARCHAR(30),
fecha_ingreso DATE,
cbu VARCHAR(23),
alias_cbu VARCHAR(21),
sueldo DECIMAL(9,2) UNSIGNED,
codigo_banco TINYINT UNSIGNED,
FOREIGN KEY(codigo_banco) REFERENCES banco(codigo));


CREATE TABLE reparacion
(codigo MEDIUMINT UNSIGNED PRIMARY KEY,
fecha DATE,
costo DECIMAL(10,2) UNSIGNED,
duracion DECIMAL(4,2) UNSIGNED,
descripcion_tarea VARCHAR(300),
codigo_terminal SMALLINT UNSIGNED,
cuit_tecnico BIGINT UNSIGNED,
FOREIGN KEY(codigo_terminal) REFERENCES terminal(codigo),
FOREIGN KEY(cuit_tecnico) REFERENCES tecnico(cuit));


-- Inserción de Registros --

INSERT INTO provincia(codigo, nombre)
VALUES (1,'Buenos Aires'),
(2,'Entre Ríos'),
(3,'Santa Fe'),
(4,'Córdoba'),
(5,'San Luis');


INSERT INTO sistema_operativo(codigo, version)
VALUES (1,'MS-DOS 2.0'),
(2,'MS-DOS 3.2'),
(3,'MS-DOS 4.0 '),
(4,'MS-DOS 5.0'),
(5,'MS-DOS 7.1');


INSERT INTO pais_origen(codigo, nombre)
VALUES (1,'Estados Unidos'),
(2,'China'),
(3,'Rusia'),
(4,'Alemania'),
(5,'Argentina');


INSERT INTO tipo_tarjeta(codigo, tipo)
VALUES (1,'Debito'),
(2,'Credito');


INSERT INTO banco(codigo, nombre)
VALUES (1,'Galicia'),
(2,'BBVA Francés'),
(3,'Nación'),
(4,'Provincia'),
(5,'Santander Río');


INSERT INTO localidad(codigo, nombre, codigo_provincia)
VALUES (1,'Morón',1),
(2,'Paraná',2),
(3,'Rosario',3),
(4,'Almafuerte',4),
(5,'Merlo',5);


INSERT INTO comercio(cuit, razon_social, telefono, dom_calle, dom_numero, codigo_localidad)
VALUES (30708772964,'Jumbo',44898000,'Juan Manuel de Rosas',658,1),
(30584620389,'Carrefour',08004448484,'San Juan',609,2),
(30685849751,'Dia',48423744,'Salta',2817,3),
(30707941649,'Kaprichos Kiosco',03516073250,'Entre Ríos',215,4),
(10705417651,'El Nuevo Kiosco',02664929090,'San Martín',882,5),
(10705417999,'La Nueva',02663214090,'San Juan',221,5);


INSERT INTO grande(cuit, cantidad_sucursales)
VALUES (30708772964,18),
(30584620389,10),
(30685849751,6);


INSERT INTO pequeño(cuit, nombre_responsable)
VALUES (30707941649,'Martin Diaz'),
(10705417651,'Lucas Bermudez'),
(10705417999,'Adriana Ortiz');


INSERT INTO terminal(codigo, memoria, año_importacion, cuit_comercio, codigo_sistema_operativo, codigo_pais_origen)
VALUES (1,1024,2003,10705417651,1,1),
(2,2048,2007,30707941649,2,2),
(3,4096,2012,30685849751,3,3),
(4,4096,2014,30584620389,4,4),
(5,5120,2016,30708772964,5,5),
(6,5000,2016,10705417999,5,5);


INSERT INTO transaccion(numero_transaccion, numero_factura, numero_tarjeta, monto, cantidad_cuotas, fecha, hora, 
codigo_terminal, codigo_tipo_tarjeta)
VALUES (1,5150,3547554454846521,339.20,8,'2013-01-23','12:23:50',1,1),
(2,6415,1234123412344321,854.30,6,'2015-12-24','15:45:20',2,2),
(3,8254,6284842151846245,3200,2,'2016-07-21','22:25:10',3,2),
(4,9857,5151484515216298,8121.31,12,'2015-08-10','8:45:59',4,1),
(5,7520,9999999999999999,300.45,1,'2015-05-12','16:38:15',5,1),
(6,9880,1518484956548488,192328.10,12,'2015-05-02','11:20:54',4,2);


INSERT INTO tecnico(cuit, nombre, fecha_ingreso, cbu, alias_cbu, sueldo, codigo_banco)
VALUES (30535667590,'Juan Velazquez','2005-05-12','0720281288000036516336','bersar',8500,1),
(30531628550,'Pablo Perez','2008-04-28','0720281288000036516322','tresar',8500,2),
(30214778496,'Nicolas Santilla','2010-09-20','0720281288000036516978','status',6300,3),
(30551210584,'Armando Rodriguez','2013-02-13','0720264568800003651634','sakila',6800,4),
(30595218545,'Mario Martinez','2015-06-02','0720281285567803651638','worlder',7000,5),
(30654848512,'Sergio Luna','2016-12-28','0728245855678646516387','mersenr',6000,2);


INSERT INTO reparacion(codigo, fecha, costo, duracion, descripcion_tarea, codigo_terminal, cuit_tecnico)
VALUES (1,'2008-04-28',16000,64,'Reparacion del Display',1,30535667590),
(2,'2012-02-10',4000,13,'Reparacion del Teclado',2,30531628550),
(3,'2013-08-25',6500,8,'Reparacion del Disco de Almacenamiento',3,30214778496),
(4,'2015-12-04',3000,18,'Reparacion de la Carcasa',4,30551210584),
(5,'2016-03-08',8504,7,'Reparacion del Lector',5,30595218545),
(6,'2009-07-22',9042,23,'Reparacion de la Placa Madre',1,30531628550),
(7,'2011-11-14',2200,6,'Reparacion de las Memorias Ram',1,30214778496),
(8,'2014-11-14',16000,32,'Reparacion del Display',1,30551210584),
(9,'2016-11-14',4200,6,'Reparacion del Teclado',1,30595218545);

-- Muestra para ejercicio J. Pero al agregarlo no realiza cambios el ejercicio 2.C--
-- (10,'2016-04-22',4550,2,'Reparacion del Lector',1,30654848512);