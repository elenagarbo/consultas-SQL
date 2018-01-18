/*consulta select añadir comentarios*/
select * from clientes;
select * from pedidos;
select * from productos;

/*select NOMBRE CAMPOS, from NOMBRE TABLA*/
select Nombre, TELEFONO from clientes where ciudad LIKE 'BARCELONA' or ciudad like 'logroño' order by nombre desc;

/*LIKE es un comparador*/

/*insertar un registro - no olivar insert into y values*/
insert into clientes (idcliente, nombre, ciudad, telefono,mail) values (null,'pedro', 'madrid', '622102030', 'pedro@gmail.com');


insert into clientes (nombre, ciudad, telefono,mail) values ('pedro', 'madrid', '622102030', 'pedro@gmail.com');

/*sin campos, poner valores ordenados */
insert into clientes values ('pedro', 'madrid', '622102030', 'pedro@gmail.com');

select distinct nombre from clientes; /*distinct me quita los duplicados*/
select distinct * from clientes; /*distinct no funciona xk el ID cada uno es distinto*/


/* al poner barcelona, como esta el cliente en tabla pedidos es foreign key, no deja borrar*/
delete from clientes where ciudad like 'logroño';

/*actualiza datos con condicion*/
update clientes set ciudad ='valencia' where nombre='pedro';



