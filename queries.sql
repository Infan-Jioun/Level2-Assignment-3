-- Users Table
CREATE TABLE users (
    user_id INTEGER PRIMARY KEY,
    name TEXT,
    email TEXT,
    phone TEXT,
    role TEXT
);

-- Vehicles Table
CREATE TABLE vehicles (
    vehicle_id INTEGER PRIMARY KEY,
    name TEXT,
    type TEXT,
    model TEXT,
    registration_number TEXT,
    rental_price INTEGER,
    status TEXT
);

-- Bookings Table
CREATE TABLE bookings (
    booking_id INTEGER PRIMARY KEY,
    user_id INTEGER,
    vehicle_id INTEGER,
    start_date DATE,
    end_date DATE,
    status TEXT,
    total_cost INTEGER
);


INSERT INTO users VALUES
(1, 'Alice', 'alice@example.com', '1234567890', 'Customer'),
(2, 'Bob', 'bob@example.com', '0987654321', 'Admin'),
(3, 'Charlie', 'charlie@example.com', '1122334455', 'Customer');


INSERT INTO vehicles VALUES
(1, 'Toyota Corolla', 'car', '2022', 'ABC-123', 50, 'available'),
(2, 'Honda Civic', 'car', '2021', 'DEF-456', 60, 'rented'),
(3, 'Yamaha R15', 'bike', '2023', 'GHI-789', 30, 'available'),
(4, 'Ford F-150', 'truck', '2020', 'JKL-012', 100, 'maintenance');


INSERT INTO bookings VALUES
(1, 1, 2, '2023-10-01', '2023-10-05', 'completed', 240),
(2, 1, 2, '2023-11-01', '2023-11-03', 'completed', 120),
(3, 3, 2, '2023-12-01', '2023-12-02', 'confirmed', 60),
(4, 1, 1, '2023-12-10', '2023-12-12', 'pending', 100);
-- Query 1: JOIN
SELECT
    bookings.booking_id,
    users.name AS customer_name,
    vehicles.name AS vehicle_name,
    bookings.start_date,
    bookings.end_date,
    bookings.status
FROM
   bookings
INNER JOIN
     users ON bookings.user_id = users.user_id
INNER JOIN
     vehicles ON bookings.vehicle_id = vehicles.vehicle_id;
-- Query 2
SELECT * FROM
     vehicles WHERE  NOT EXISTS (
        SELECT 1
        FROM  bookings
        WHERE bookings.vehicle_id = vehicles.vehicle_id
    );
-- Query 3
SELECT * FROM vehicles WHERE  type = 'car' AND status = 'available';
-- Query 4
SELECT vehicles.name,  COUNT(*) AS total_bookings FROM
    bookings
INNER JOIN
    vehicles  ON bookings.vehicle_id = vehicles.vehicle_id
GROUP BY
    vehicles.vehicle_id, vehicles.name
HAVING
    COUNT(*) > 2;
