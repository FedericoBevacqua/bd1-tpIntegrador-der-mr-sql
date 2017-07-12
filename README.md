bd1-tpIntegrador-der-mr-sql

# TRABAJO PRÁCTICO INTEGRADOR – BD1



## Integrantes:

 - Bevacqua Federico Iván - 39.336.983
 - Falon Gabriel
 - Nicolás Medicina

----------
**Definición**
------------

Somos una reconocida empresa que se dedica a la comercialización y mantenimiento de
terminales para registrar pagos con tarjetas de débito y crédito.
Nuestras terminales se encuentran en distintos comercios, desde los hipermercados hasta simples quioscos de golosinas. Internamente, los clasificamos en Grandes y Pequeños comercios. De los comercios en general nos interesa saber el nombre o razón social, un número de teléfono de contacto y el domicilio legal, incluyendo Localidad y Provincia, las cuales se encuentran tabuladas. Particularmente de los pequeños, el nombre de una persona responsable y, de los grandes, la cantidad de sucursales.
Nuestras terminales, cuentan con un identificador que las distingue y son vendidas a un único comercio (no se reutilizan entre diferentes comercios). Las terminales, cuentan
además con un sistema operativo desarrollado por nosotros, del cual disponemos varias
versiones, por lo que necesitamos saber la versión de cada terminal. Cada una de las
terminales tiene una determinada cantidad de memoria (en MBytes), país origen de fábrica y año de importación al país.
Se desea almacenar en forma centralizada, las diferentes transacciones de venta realizadas en cada una de las terminales. Por cada transacción se desea persistir: el número único, la terminal que hizo la venta, el número de factura que tiene asociado (opcional), la fecha y hora de la venta, el monto, el tipo de tarjeta (débito o crédito), el número de la tarjeta y en cuántas cuotas se realizó el pago.
Muchas veces, las terminales sufren desperfectos y nosotros mismos somos quienes las
reparamos. Para ello disponemos de técnicos, de los cuales necesitamos saber su nombre, CUIT, sueldo, fecha de ingreso, cbu, alias de cbu y banco. Una terminal puede ser reparada varias veces, pero cada vez por un único técnico. De la reparación en sí misma, queremos saber la fecha, el costo, la duración (en cantidad de horas) y una breve descripción de la tarea realizada.

----------
**Consignas**
------------

**a.**	Definir el DER para el problema anteriormente citado

**b.**	Determinar el MR para el punto anterior

**c.**	Detallar la lista de claves foráneas para el punto anterior

**d.**	Crear una base de datos en MySQL, para el MR definido anteriormente, y detallar los scripts de generación de estructura de la base (DDL)

**e.**	Realizar una carga mínima de datos de prueba (al menos 5 registros por tabla) en la base de datos del punto anterior, mediante la utilización de SQL. Detallar las sentencias utilizadas.

**f.**	Resolver las siguientes definiciones, utilizando SQL:

* a.	Indique el monto total facturado por cada comercio durante el año 2015. Sólo listar aquellos cuya facturación total supere los $200.000.

* b.	Listar la cantidad de reparaciones que hizo cada técnico, ordenados de mayor a menor.

* c.	Listar los técnicos de nombre “Juan” que tengan cuenta en el banco “Galicia”.

* d.	Listar la razón social, domicilio, localidad y provincia de los grandes comercios con más de 3 sucursales, ordenados por provincia y localidad.

* e.	Liste las terminales que han sufrido más de 3 reparaciones.

* f.	Mostrar a los códigos de las terminales y la razón social del comercio a la que pertenece, de todas aquellas que aún no han realizado transacción alguna.

* g.	Liste los números de transacciones, fecha y hora de la venta, monto, razón social del comercio, para todas las ventas realizadas en el mes de Enero de 2013, entre 6 y 12 pagos.

* h.	Liste la cantidad de terminales que se adquirieron por año.

* i.	Listar el/los técnicos que hayan realizado la reparación de mayor costo.

* j.	Liste las terminales que fueron reparadas por todos los técnicos.

* k.	Muestre al nombre y sueldo del técnico que haya realizado la reparación de mayor costo.

**-2-**	Efectuar las siguientes modificaciones, utilizando SQL:

* a.	Por un ajuste en el acuerdo con los técnicos, los sueldos deberán incrementarse un 10%, para todos aquellos que hayan ingresado a partir del 2015.

* b.	Las ventas de la tarjeta 1234-1234-1234-4321 realizadas en las terminales del comercio Carrefour el día 24/12/2015 se cargaron erróneamente. Las mismas pertenecen en realidad a la tarjeta 9999-9999-9999-9999. Solucionar la situación.

* c.	Elimine los técnicos que nunca hicieron una reparación.


**Fecha de entrega: Sábado 8 de julio**