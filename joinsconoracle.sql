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
alemania y de brasil.Mayusculas igual*/

select company_name, phone
from customers
where country = 'Germany'
or country= 'Brazil';

/*2. Muestra el nombre de producto y su UnitPrice para la categoria 
de beverages. Ordenado por precio de menor a mayor*/

select product_name, unit_price
from products
inner join categories on products.category_id=categories.category_id
where category_name='Beverages'
order by unit_price asc;

/*3. muestra el total de unidades vendidas para cada categoria
ordenado de mayor a menor*/

select categories.category_name, sum(order_details.quantity)total
from products
inner join order_details on products.product_id=order_details.product_id
inner join categories on products.category_id=categories.category_id
group by categories.category_name
order by total desc;


/*4. dime qué empleado es el que más ha vendido*/

select employees.firstname, sum(order_details.unit_price*order_details.quantity)totalventas
from orders
inner join employees on employees.employee_id=orders.employee_id
inner join order_details on orders.order_id=order_details.order_id
group by employees.firstname
order by totalventas;



where rownum = 1;

/*5. dime qué país ha sido el que más caro ha comprado en media*/

select customers.country, avg(order_details.unit_price*order_details.quantity)total
from orders
inner join customers on orders.customer_id=customers.customer_id
inner join order_details on orders.order_id=order_details.order_id
group by customers.country
order by total desc;

/*arreglado bien hecho*/
select customers.country, sum(order_details.unit_price*order_details.quantity)/(order_details.quantity)total
from orders
inner join customers on orders.customer_id=customers.customer_id
inner join order_details on orders.order_id=order_details.order_id
group by customers.country
order by total desc;



/*6. muestra las fechas de venta para el cliente ALFKI- Se agrego inner join esta en tablas diferentes*/

select orders.order_date, customers.customer_code
from orders
inner join customers on orders.customer_id=customers.customer_id
where customers.customer_code='ALFKI';

/*7. Muestra los pedidos que no han sido transportados. (no shippedDate)*/

select order_id, customer_id
from orders
where shipped_date is null;


/*Subquery*/
select * from orders
where freight = (select max(freight) from orders);

select max(freight) from orders;







