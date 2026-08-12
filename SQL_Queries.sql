use Ola
select * from Bookings ;

-- 1. Retrieve all successful bookings:

Create View Successful_Bookings as
select * from Bookings 
Where Booking_Status = 'Success' ;

select * from Successful_Bookings ;



-----------------x----------------------------x-------------------------x-----------


-- 2. Find the average ride distance for each vehicle type:

CREATE VIEW Avg_Ride_Distance_by_Vehicle AS
select Vehicle_Type , AVG(Ride_Distance) as Avg_Distance
from Bookings group by Vehicle_Type ;

select * from Avg_Ride_Distance_by_Vehicle ;


-----------------x----------------------------x-------------------------x-----------



-- 3. Get the total number of cancelled rides by customers:

Create View Total_Cancelled_By_Customers AS
select count(*) as Total_Cancelled from Bookings 
where Booking_Status = 'Canceled by Customer' ;

Select * from Total_Cancelled_By_Customers ;


-----------------x----------------------------x-------------------------x-----------


-- 4. List the top 5 customers who booked the highest number of rides:
Create View Top_5_Customers as
select Top 5 Customer_ID , count(Booking_ID) as Total_Rides
from Bookings Group by Customer_ID Order by Total_Rides DESC ; 

select * from Top_5_Customers ;

-----------------x----------------------------x-------------------------x-----------



-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:

Create View Rides_Canceled_by_Drivers_P_C_Issues as
select count(*) as Total_Rides from Bookings 
Where Canceled_Rides_by_Driver = 'Personal & Car related issue' ; --- 4449

 
select * from Rides_Canceled_by_Drivers_P_C_Issues ;


-----------------x----------------------------x-------------------------x-----------


-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

Create View Max_Min_Driver_Rating as
Select 
Max(Driver_Ratings) as Maximum_Rating,
Min(Driver_Ratings) as Minimum_Rating
from Bookings Where Vehicle_Type = 'Prime Sedan' ;


-----------------x----------------------------x-------------------------x-----------


-- 7. Retrieve all rides where payment was made using UPI:

Create View All_UPI_Payment as
select * from Bookings 
Where Payment_Method = 'UPI' ;

select * from All_UPI_Payment ;


-----------------x----------------------------x-------------------------x-----------

-- 8. Find the average customer rating per vehicle type:

Create View Avg_Customer_Rating_By_VehicleType as
select Vehicle_Type , CAST(AVG(Customer_Rating) as decimal(10,2)) as Average_Rating
from Bookings Group by Vehicle_Type ;


select * from Avg_Customer_Rating_By_VehicleType ;


-----------------x----------------------------x-------------------------x-----------


-- 9. Calculate the total booking value of rides completed successfully:

Create View Total_Booking_Value_of_Success_Rides as 
select sum(Booking_Value) as Total_Booking_Value 
from Bookings Where Booking_Status = 'Success' ;

select * from Total_Booking_Value_of_Success_Rides

-----------------x----------------------------x-------------------------x-----------

-- 10. List all incomplete rides along with the reason:

Create View Incomplete_Rides as
select Booking_ID , Incomplete_Rides , Incomplete_Rides_Reason
from Bookings where Incomplete_Rides = 'Yes'

select * from Incomplete_Rides ;


-----------------x----------------------------x-------------------------x-----------


-- Avg of V_TAT 
-- SELECT AVG(TRY_CAST(V_TAT AS INT)) AS Average_TAT FROM Bookings;