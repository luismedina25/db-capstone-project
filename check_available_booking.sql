use  littlelemondm;

insert into bookings (bookingID, tableNumber, bookingDate, CustomerID)
values (1, 5, '2022-10-10', 1),
	   (2, 3, '2022-11-12', 3),
       (3, 2, '2022-10-11', 2),
       (4, 2, '2022-10-13', 1);

select * from bookings;

#Task2: Little Lemon need you to create a stored procedure called checkBooking to check whether a table in the restaurant is already booked
DELIMITER //
create procedure checkBooking(IN bookingsDate DATE, IN tableNum INT)
BEGIN
	declare tableCount INT;
    select COUNT(*) INTO tableCount
    from bookings
    where bookingsDate = bookingDate and tableNum = tableNumber;
    
    IF tableCount > 0 THEN 
		select concat('Table ', tableNum, ' is already booked') AS 'Booking status';
	ELSE
		select concat('Table ', tableNum, ' is available') AS 'Booking status'; 
    END IF;
END // 
DELIMITER ;

call checkBooking("2022-11-12", 3)

#Task3: Little Lemon need to verify a booking, and decline any reservations for tables that are already booked under another name.
DELIMITER //
create procedure AddValidBooking(IN booking_date DATE, IN tableNum INT)
BEGIN
	declare tableCount INT;
    START TRANSACTION;
    
    select COUNT(*) INTO tableCount
    from bookings
    where booking_date = bookingDate and tableNum = tableNumber;
    
    IF tableCount > 0 THEN
		ROLLBACK;
        select concat('Table ', tableNum, ' is already booked - booking cancelled') AS 'Booking status';
	ELSE
		INSERT INTO bookings(bookingDate, tableNumber)
        VALUES(booking_date, tableNum);
        COMMIT;
        select 'Booking successful' AS 'Booking Status';
	END IF;
END //
DELIMITER ;

call AddValidBooking("2022-12-17", 5);