/*USE- entrar en la base de datos*/
use northwnd;
select * from customers;
select * from categories;

/*se usan alias, ejemplo la C*/
select c.companyname, city from customers c where country = 'germany';

select orderid, companyname, orderdate 
from orders 
inner join customers 
on orders.customerid =customers.customerid 
where customers.country = 'germany' 
order by customers.companyname desc;
select * from orders;

/* empleado del reino unido han servido*/
select orderid, firstname
from orders
inner join employees
on orders.employeeid = employees.employeeid
where employees.country ='uk';

select distinct firstname
from orders
inner join employees
on orders.employeeid = employees.employeeid
where employees.country ='uk';

select * from employees where country ='uk';

select firstname, count(orderid)
from orders
inner join employees
on orders.employeeid = employees.employeeid
where employees.country ='uk'
group by firstname
order by firstname desc;

/*Para ordenar por campo calucaluado nombrar  con alias*/

select categoryname, avg(unitsinstock) as total
from products
inner join categories
on products.categoryid = categories.categoryid
group by categoryname
order by total desc;

select * from orderdetails;
select * from customers;
select * from orders;

/*cuanto hemos facturado total de venta en euros a alfreds*/
select customers.companyname, orders.orderid, sum(orderdetails.quantity*orderdetails.unitprice) as totalventas
from orders
inner join customers on orders.customerid = customers.customerid
inner join orderdetails on orders.orderid = orderdetails.orderid
where customers.customerid ='alfki';

select customers.companyname, orders.orderid, sum(orderdetails.quantity*orderdetails.unitprice) as totalventas
from orders
inner join customers on orders.customerid = customers.customerid
inner join orderdetails on orders.orderid = orderdetails.orderid
group by customers.companyname;

/*left join*/


select * from employees;
select * from orders;
/* como todos los empleados han vendido sale igual con inner, left y right*/

select employees.firstname, orders.orderdate
from employees
inner join orders on employees.employeeid=orders.employeeid;

select orderdate, customers.companyname
from orders
right join customers 
on orders.customerid = customers.customerid
where orderid between 10260 and 10270;

insert into customers (customerid, companyname) values ('aa','Ana Alonso');

/*right join aparece los que compran y los que no*/
select orderdate, customers.companyname
from orders
right join customers 
on orders.customerid = customers.customerid;

/*1. Muestra el nombre de compañía y el tfno de los clientes de 
alemania y de brasil.*/

select companyname, phone
from customers
where country = 'germany'
or country= 'brazil';

/*2. Muestra el nombre de producto y su UnitPrice para la categoria 
de beverages. Ordenado por precio de menor a mayor*/

select productname, unitprice
from products
inner join categories on products.categoryid=categories.categoryid
where categoryname='beverages'
order by unitprice asc;

/*3. muestra el total de unidades vendidas para cada categoria
ordenado de mayor a menor*/

select categories.categoryname, sum(orderdetails.quantity)
from products
inner join orderdetails on products.productid=orderdetails.productid
inner join categories on products.categoryid=categories.categoryid
group by categories.categoryname desc;


/*4. dime qué empleado es el que más ha vendido*/

select employees.firstname, sum(orderdetails.unitprice*orderdetails.quantity)totalventas
from orders
inner join employees on employees.employeeid=orders.employeeid
inner join orderdetails on orders.orderid=orderdetails.orderid
group by employees.firstname
order by totalventas desc
limit 1;

/*5. dime qué país ha sido el que más caro ha comprado en media*/

select customers.country, avg(orderdetails.unitprice*orderdetails.quantity)total
from orders
inner join customers on orders.customerid=customers.customerid
inner join orderdetails on orders.orderid=orderdetails.orderid
group by customers.country
order by total desc
limit 1;

select customers.country, sum(orderdetails.unitprice*orderdetails.quantity)/(orderdetails.quantity)total
from orders
inner join customers on orders.customerid=customers.customerid
inner join orderdetails on orders.orderid=orderdetails.orderid
group by customers.country
order by total desc
limit 1;


/*6. muestra las fechas de venta para el cliente ALFKI*/

select orders.orderdate, customers.customerid
from orders
inner join customers on orders.customerid=customers.customerid
where customers.customerid='alfki';

/*7. Muestra los pedidos que no han sido transportados. (no shippedDate)*/

select orderid, customerid
from orders
where shippeddate is null;
