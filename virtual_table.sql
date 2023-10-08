USE littlelemondm;

#Task1: In the first task, Little Lemon need you to create a virtual table called OverView that focuses on OrderID, Quantity and Cost columns with the Orders table for al orders with a quantity greater than 2
create view OrdersView AS select orderID, quantity, totalCost where quantity > 2;
select * from OrdersView;

#Task2: For your second task, Little Lemon need information from four tables on all customers with orders that cost more than 150.
select customer.customerID, concat(customer.firstName, " ", customer.lastName) as FullName,
orders.orderID, orders.totalCost, menu.itemName
from customer inner join orders On customer.customerID = orders.customerID 
inner join menu on orders.itemID = menu.itemID 
where orders.totalCost > 150;

