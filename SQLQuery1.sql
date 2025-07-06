select * from Bookings;

---1. Retrieve all successful bookings:---
Create View Successful_Bookings as 
select * from Bookings where Booking_Status='Success';

select * from Successful_Bookings;

---Find the average ride distance for each vehicle type:---
create view average_ride_distance_for_each_vehicle_type as
select Vehicle_Type, AVG(Ride_Distance) as avg_distance from Bookings group by Vehicle_Type;

select * from average_ride_distance_for_each_vehicle_type;

--Get the total number of cancelled rides by customers:--
create view total_number_of_cancelled_rides_by as
select COUNT(Canceled_Rides_by_Customer) as total_number from Bookings where Booking_Status='Canceled by Customer';

select * from  total_number_of_cancelled_rides_by;


--List the top 5 customers who booked the highest number of rides:
select top 5 Customer_ID,COUNT(*) as total_ride from Bookings group by Customer_ID order by total_ride desc;

--Get the number of rides cancelled by drivers due to personal and car-related issues:select count(*) as total_cancelled from Bookings where Canceled_Rides_by_Driver='Personal & Car related issue'--Find the maximum and minimum driver ratings for Prime Sedan bookings:select max(Driver_Ratings) as maximum,min(Driver_Ratings) as minimum from Bookings WHERE Vehicle_Type='Prime Sedan'; --Retrieve all rides where payment was made using UPI: select * from Bookings where Payment_Method='UPI'; --Find the average customer rating per vehicle type:select Vehicle_Type, round(AVG(Customer_Rating),2) as Avg_Customer_Rating from Bookings group by Vehicle_Type;--Calculate the total booking value of rides completed successfully:select sum(Booking_Value) from Bookings where Booking_Status='Success';--List all incomplete rides along with the reason:SELECT Booking_ID, Incomplete_Rides_Reason FROM bookings WHERE Incomplete_Rides = 1;