use littlelemondm;

#Task1: create a new procedure called AddBooking to add a new table booking record.
DELIMITER //
create procedure AddBooking(IN booking_id INT, IN customer_id INT, IN table_num INT, IN booking_date DATE)
BEGIN
	insert into bookings(bookingID, tableNumber, bookingDate, CustomerID)
    values (booking_id, table_num, booking_date, customer_id);
    select 'New booking added.' AS 'Confirmation';
END //
DELIMITER ;
call AddBooking(5, 3, 4, "2022-12-30");

#Task2: Little Lemon need you to create a new procedure called UpdateBooking that they can use to update existing bookings in the booking tbale.
DELIMITER //
create procedure UpdateBooking(IN booking_id INT, IN booking_date DATE)
BEGIN
	UPDATE bookings
    SET bookingDate = booking_date
    WHERE booking_id = bookingID;
    
    select concat('Booking ', booking_id, ' updated') AS 'Confrimation';
END //
DELIMITER ;

call UpdateBooking(5, "2022-12-17");

#Task3: Little Lemon need you to create a new procedure called CancelBooking that they can use to cancel or remove a booking.
DELIMITER //
create procedure CancelBooking(IN booking_id INT)
BEGIN
	delete from bookings
    where bookingID = booking_id;
    select concat('Booking ', booking_id, ' cancelled') as 'Confirmation';
END //
DELIMITER ;

call CancelBooking(5);

select * from bookings;


