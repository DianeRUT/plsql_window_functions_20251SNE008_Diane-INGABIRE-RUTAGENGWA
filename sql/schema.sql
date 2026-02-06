-- Drop tables if they already exist (clean re-run)
DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS rooms;

-- Create Rooms Table
CREATE TABLE rooms (
    room_id SERIAL PRIMARY KEY,
    room_type VARCHAR(50) NOT NULL,
    price_per_night NUMERIC(10, 2),
    status VARCHAR(20) DEFAULT 'Available'
);

-- Create Customers Table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Bookings Table
CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(customer_id),
    room_id INTEGER REFERENCES rooms(room_id),
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    total_amount NUMERIC(10, 2),
    booking_date DATE DEFAULT CURRENT_DATE
);

INSERT INTO rooms (room_type, price_per_night, status) VALUES 
('Standard', 100.00, 'Available'),
('Deluxe', 250.00, 'Available'),
('Suite', 500.00, 'Available'),
('Presidential', 1200.00, 'Available');

INSERT INTO customers (full_name, email, phone) VALUES 
('Alice Johnson', 'alice@email.com', '555-0111'),
('Bob Smith', 'bob@email.com', '555-0222'),
('Charlie Brown', 'charlie@email.com', '555-0333');

-- Data spread over Jan, Feb, and March for analysis
INSERT INTO bookings (customer_id, room_id, check_in_date, check_out_date, total_amount, booking_date) VALUES 
(1, 1, '2024-01-05', '2024-01-07', 200.00, '2024-01-01'),
(2, 2, '2024-01-10', '2024-01-15', 1250.00, '2024-01-02'),
(3, 3, '2024-02-01', '2024-02-05', 2000.00, '2024-01-20'),
(1, 4, '2024-02-15', '2024-02-17', 2400.00, '2024-02-10'),
(2, 1, '2024-03-01', '2024-03-04', 300.00, '2024-02-25'),
(3, 2, '2024-03-10', '2024-03-12', 500.00, '2024-03-01');

-- Prepare data for SELF JOIN

UPDATE bookings
SET booking_date = '2024-01-02'
WHERE booking_id = 1;
