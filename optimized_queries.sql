#Task1: In the first task, Little Lemon need you to create a stored procedure that displays the maximum ordered prepared statements
CREATE PROCEDURE GetMaxQuantity()
SELECT MAX(Quantity)
FROM Orders;

#Task2: Little Lemon need you to help them to create a prepared statement called GetOrderDetail.
PREPARE GetOrderDetail FROM 'SELECT OrderID, Quantity, BillAmount FROM Orders WHERE OrderId = ?';
SET @id = 1;
EXECUTE GetOrderDetail USING @id;

#Task3: Is to create a stored procedure called CancelOrder.
CREATE PROCEDURE CancelOrder(IN orderID INT)
DELETE FROM Orders WHERE OrderID = orderID;
SELECT concat('Order ',orderID, ' is cancelled.') AS Confirmation;
CALL CancelOrder(5);
