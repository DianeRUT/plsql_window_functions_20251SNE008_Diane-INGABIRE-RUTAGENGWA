-- INNER JOIN: Retrieve valid bookings
SELECT 
    b.booking_id,
    c.full_name,
    r.room_type,
    b.check_in_date,
    b.total_amount
FROM bookings b
INNER JOIN customers c ON b.customer_id = c.customer_id
INNER JOIN rooms r ON b.room_id = r.room_id
ORDER BY b.booking_id;

-- LEFT JOIN: Customers with no bookings
SELECT 
    c.customer_id,
    c.full_name,
    b.booking_id
FROM customers c
LEFT JOIN bookings b ON c.customer_id = b.customer_id
WHERE b.booking_id IS NULL;

-- RIGHT JOIN: Rooms with no bookings
SELECT
    r.room_id,
    r.room_type,
    b.booking_id
FROM bookings b
RIGHT JOIN rooms r ON b.room_id = r.room_id
WHERE b.booking_id IS NULL;

-- FULL OUTER JOIN: Customers and bookings
SELECT 
    c.customer_id,
    c.full_name,
    b.booking_id,
    b.room_id,
    b.total_amount
FROM customers c
FULL OUTER JOIN bookings b ON c.customer_id = b.customer_id
ORDER BY c.customer_id;

-- SELF JOIN: Compare bookings made on the same date
SELECT 
    b1.booking_date,
    c1.full_name AS customer_1,
    c2.full_name AS customer_2
FROM bookings b1
INNER JOIN bookings b2 
    ON b1.booking_date = b2.booking_date 
    AND b1.booking_id <> b2.booking_id
INNER JOIN customers c1 ON b1.customer_id = c1.customer_id
INNER JOIN customers c2 ON b2.customer_id = c2.customer_id
ORDER BY b1.booking_date;
