 # Vehicle Rental System - SQL Queries Project

## Project Overview
This project implements four specific SQL queries for a vehicle rental management system based on the given sample database schema. The database consists of three tables:

- **Users**: Stores customer and admin information.
- **Vehicles**: Contains details of available vehicles (cars, bikes, trucks).
- **Bookings**: Records all rental bookings made by customers.

The goal is to demonstrate the use of advanced SQL concepts:
- JOIN operations
- EXISTS / NOT EXISTS subqueries
- WHERE clause filtering
- GROUP BY with HAVING clause

All queries have been tested against the provided sample data and produce the exact expected outputs.

## Database Schema (Sample Data Summary)

### Users Table
| user_id | name    | email               | phone      | role     |
|---------|---------|---------------------|------------|----------|
| 1       | Alice   | alice@example.com   | 1234567890 | Customer |
| 2       | Bob     | bob@example.com     | 0987654321 | Admin    |
| 3       | Charlie | charlie@example.com | 1122334455 | Customer |

### Vehicles Table
| vehicle_id | name           | type  | model | registration_number | rental_price | status      |
|------------|----------------|-------|-------|---------------------|--------------|-------------|
| 1          | Toyota Corolla | car   | 2022  | ABC-123             | 50           | available   |
| 2          | Honda Civic    | car   | 2021  | DEF-456             | 60           | rented      |
| 3          | Yamaha R15     | bike  | 2023  | GHI-789             | 30           | available   |
| 4          | Ford F-150     | truck | 2020  | JKL-012             | 100          | maintenance |

### Bookings Table
| booking_id | user_id | vehicle_id | start_date   | end_date     | status    | total_cost |
|------------|---------|------------|--------------|--------------|-----------|------------|
| 1          | 1       | 2          | 2023-10-01   | 2023-10-05   | completed | 240        |
| 2          | 1       | 2          | 2023-11-01   | 2023-11-03   | completed | 120        |
| 3          | 3       | 2          | 2023-12-01   | 2023-12-02   | confirmed | 60         |
| 4          | 1       | 1          | 2023-12-10   | 2023-12-12   | pending   | 100        |

## Queries Implemented (in queries.sql)

1. **JOIN Query**  
   Retrieves booking details along with customer name and vehicle name using INNER JOINs.

2. **EXISTS Query**  
   Finds all vehicles that have never been booked using NOT EXISTS subquery.

3. **WHERE Query**  
   Filters and displays all available vehicles of a specific type (example: cars).

4. **GROUP BY & HAVING Query**  
   Calculates total bookings per vehicle and shows only those with more than 2 bookings.
