select * from bancoagustin.clientes;
select * from bancoagustin.cuentas;
select * from bancoagustin.prestamo;
select * from bancoagustin.sucursales;


insert into bancoagustin.clientes (DNI, nombre, direccion, telefono) values ('49054805', 'elena', 'calle castilla', '657115121');
delete from bancoagustin.clientes where nombre like 'madrid';


insert into bancoagustin.sucursales (numero_sucursal, direccion, telefono) values (1, 'calle valencia', '9022020220');

insert into bancoagustin.cuentas (numero_cuenta, balance, fecha, tipo, cliente, sucursal) values (123456, '100.02', '02/02/2017','cuenta bancaria','49054805', '1');

insert into bancoagustin.prestamo (numero_prestamo, tipo, cantidad, cliente,sucursal) values (1,'directo',500.2,'49054805', '1');




