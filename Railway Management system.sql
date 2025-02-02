create database Railway ;
use Railway;

# creating train_schedule table
CREATE TABLE Train_schedule(
	Train_no int,
    Station_code varchar(10),
    Station_name varchar(100),
    Arrival_Time TIME,
    Departure_Time TIME,
    Distance INT,
    Source_Station VARCHAR(20),
    Source_Station_Name VARCHAR(100),
    Destination_Station VARCHAR(20),
    Destination_Station_Name VARCHAR(100));
    
    # Entering records in table
    
    INSERT INTO train_schedule (train_no, station_code, station_name, arrival_time, departure_time, 
                distance, source_station, source_station_name, destination_station, destination_station_name)
	VALUES 
	(101, 'NDLS', 'New Delhi', '05:30:00', '05:40:00', 180, 'NDLS', 'New Delhi', 'HUB', 'Hubli'),
	(101, 'HUB', 'Hubli', '10:00:00', '10:10:00', 650, 'NDLS', 'New Delhi', 'HUB', 'Hubli'),
	(102, 'MAQ', 'Mangalore', '06:15:00', '06:25:00', 250, 'MAQ', 'Mangalore', 'SBC', 'Bengaluru'),
	(102, 'SBC', 'Bengaluru', '09:00:00', '09:15:00', 350, 'MAQ', 'Mangalore', 'SBC', 'Bengaluru'),
	(103, 'CSM', 'Mumbai CST', '07:30:00', '07:40:00', 220, 'CSM', 'Mumbai CST', 'PUNE', 'Pune'),
	(103, 'PUNE', 'Pune', '11:00:00', '11:10:00', 170, 'CSM', 'Mumbai CST', 'PUNE', 'Pune'),
	(104, 'SRC', 'Howrah', '06:00:00', '06:05:00', 100, 'SRC', 'Howrah', 'BBS', 'Bhubaneswar'),
	(104, 'BBS', 'Bhubaneswar', '08:30:00', '08:40:00', 500, 'SRC', 'Howrah', 'BBS', 'Bhubaneswar'),
	(105, 'SRE', 'Surat', '05:45:00', '05:50:00', 350, 'SRE', 'Surat', 'BCT', 'Mumbai Bandra'),
	(105, 'BCT', 'Mumbai Bandra', '08:30:00', '08:40:00', 440, 'SRE', 'Surat', 'BCT', 'Mumbai Bandra');
    
    # Here are some queries on Above Table 
    -- 1. Get all Train's Schedule 
    
    SELECT * 
    FROM train_schedule;
    
    
    -- 2. Get Schedule of Train No. "104" ?
    
    SELECT * 
    FROM train_schedule
	WHERE Train_no = 104;

-- 3. Find the station of Train_no. "102" ?

 SELECT train_no, Station_code, Station_name, arrival_time, Departure_Time
 FROM train_schedule 
 WHERE train_no = 102;
 
 -- 4.  Find the source and destination od Train_no. "105" ?
 
 SELECT Train_no, Source_station_name, Destination_station_name
 FROM train_schedule
 WHERE train_no = 105;
 
 -- 5. Get All Trains Departing from "New delhi" Station ?
 
 SELECT  train_no, station_name, departure_time
 FROM train_schedule
 WHERE source_station_name = "New Delhi";
 
 -- 6. Find the Total Distance Traveled by a Trainno. "104" /
 
 SELECT train_no, SUM(Distance) as total_distance
 FROM train_schedule
 WHERE train_no = 104
 GROUP BY train_no;
 
 -- 7. Get the First and Last Station Arrival Times for a Trainno. "104" ?
 
 SELECT train_no,
        MIN(Arrival_time) as first_arrival_time,
        MAX(Departure_time) as last_departure_time
 FROM train_schedule 
 WHERE train_no = 104
 GROUP BY train_no ;
 
 -- 8. Find the Average Distance for All Trains
 
 SELECT AVG(distance) as Average_distance
 FROM train_schedule;
 
 -- 9. Get the Station with the Maximum Distance Covered ?
 
 SELECT station_name, SUM(distance) as total_distance
 from train_schedule 
 group by station_name 
 order by total_distance desc limit 1;
 
 -- 10 Get All Trains Arriving at a Specific Station "Mumbai" ?
 
SELECT train_no, station_name, arrival_time 
from train_schedule 
WHERE station_name = "Mumbai CST";


-- 11.  Find the Earliest Departure Time for Each Train.
SELECT train_no, MIN(Departure_time) as Earlier_departure
FROM train_schedule 
GROUP BY train_no; 

-- 12. List of Trains  that operates Between Two Cities  New Delhi and Bhubaneswar ?

SELECT train_no, source_station_name, departure_station_name
FROM train_schedule 
WHERE source_station_name = "New Delhi" AND destination_station_name = "Bhubaneswar"; 

-- 13. Find Trains Departing After 08:00:00 ?

SELECT train_no, station_name, departure_time
FROM train_schedule 
WHERE depature_time;

-- 14. Find the Number of Stations for Each Train ?

SELECT train_no, COUNT(DISTINCT station_name) as numbers_Station
FROM train_schedule 
GROUP BY train_no;