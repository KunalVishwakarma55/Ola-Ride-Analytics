-- Retrieve all bookings
SELECT * FROM Bookings;

-- 1. Retrieve all successful bookings
CREATE VIEW Successful_Bookings AS
SELECT * FROM Bookings
WHERE Booking_Status = 'Success';

SELECT * FROM Successful_Bookings;

-- 2. Find the average ride distance for each vehicle type
CREATE VIEW Average_Ride_Distance_By_Vehicle AS
SELECT Vehicle_Type, AVG(Ride_Distance) AS avg_distance
FROM Bookings
GROUP BY Vehicle_Type;

SELECT * FROM Average_Ride_Distance_By_Vehicle;

-- 3. Get the total number of cancelled rides by customers
CREATE VIEW Total_Cancelled_Rides_By_Customers AS
SELECT COUNT(*) AS total_cancelled
FROM Bookings
WHERE Booking_Status = 'Canceled by Customer';

SELECT * FROM Total_Cancelled_Rides_By_Customers;

-- 4. List the top 5 customers who booked the highest number of rides
SELECT TOP 5 Customer_ID, COUNT(*) AS total_rides
FROM Bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues
SELECT COUNT(*) AS total_cancelled_by_driver
FROM Bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings
SELECT MAX(Driver_Ratings) AS max_rating,
       MIN(Driver_Ratings) AS min_rating
FROM Bookings
WHERE Vehicle_Type = 'Prime Sedan';

-- 7. Retrieve all rides where payment was made using UPI
SELECT *
FROM Bookings
WHERE Payment_Method = 'UPI';

-- 8. Find the average customer rating per vehicle type
SELECT Vehicle_Type, ROUND(AVG(Customer_Rating), 2) AS Avg_Customer_Rating
FROM Bookings
GROUP BY Vehicle_Type;

-- 9. Calculate the total booking value of rides completed successfully
SELECT SUM(Booking_Value) AS Total_Successful_Booking_Value
FROM Bookings
WHERE Booking_Status = 'Success';

-- 10. List all incomplete rides along with the reason
SELECT Booking_ID, Incomplete_Rides_Reason
FROM Bookings
WHERE Incomplete_Rides = 1;
