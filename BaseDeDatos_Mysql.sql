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