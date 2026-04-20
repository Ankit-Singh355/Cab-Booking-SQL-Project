--- Customers and Booking Analysis

SELECT c.CustomerID, c.Name, COUNT(*) AS CompletedBookings 
FROM Customers c 
JOIN Bookings b ON c.CustomerID = b.CustomerID 
WHERE b.Status = 'Completed' 
GROUP BY c.CustomerID, c.Name 
ORDER BY CompletedBookings DESC ;

--- Customer Cancellations Behavior

SELECT CustomerID, COUNT(*) AS CancelledBookings
FROM Bookings
WHERE Status = 'Canceled'
GROUP BY CustomerID;

--- Overall Revenue Analysis

SELECT SUM(Fare) AS TotalRevenue
FROM TripDetails;

--- Average Trip Distance

SELECT AVG(DistanceKM) AS AvgDistance
FROM TripDetails;

--- Booking Status Distribution

SELECT Status, COUNT(*) AS Total
FROM Bookings
GROUP BY Status;

--- Driver Rating Analysis

SELECT d.Name, AVG(f.Rating) AS AvgRating
FROM Drivers d
JOIN Cabs c ON d.DriverID = c.DriverID
JOIN Bookings b ON c.CabID = b.CabID
JOIN Feedback f ON b.BookingID = f.BookingID
GROUP BY d.Name;

--- Popular Routes

SELECT PickupLocation, DropLocation, COUNT(*) AS TotalTrips
FROM Bookings
GROUP BY PickupLocation, DropLocation
ORDER BY TotalTrips DESC;

--- Driver Earnings Analysis

SELECT d.Name, SUM(t.Fare) AS TotalEarnings
FROM Drivers d
JOIN Cabs c ON d.DriverID = c.DriverID
JOIN Bookings b ON c.CabID = b.CabID
JOIN TripDetails t ON b.BookingID = t.BookingID
GROUP BY d.Name;

--- Peak Booking Day

SELECT DAYNAME(BookingDate) AS Day, COUNT(*) AS TotalBookings
FROM Bookings
GROUP BY Day
ORDER BY TotalBookings DESC;

--- ShortTrip VS LongTrip

SELECT COUNT(*) AS ShortTrips FROM TripDetails WHERE DistanceKM < 10;
SELECT COUNT(*) AS LongTrips FROM TripDetails WHERE DistanceKM >= 10;

--- High Fare Trips

SELECT * FROM TripDetails ORDER BY Fare DESC LIMIT 5;

--- Low Rating Analysis

SELECT * FROM Feedback
WHERE Rating < 3;

--- Active Customers

SELECT DISTINCT CustomerID
FROM Bookings
WHERE Status = 'Completed';
