CREATE DATABASE railway_performance_db;
use railway_performance_db;

CREATE TABLE Train_Operations (
    Record_ID INT PRIMARY KEY,
    Train_ID VARCHAR(20),
    Route_ID VARCHAR(20),
    Station_ID VARCHAR(20),
    Travel_Date DATE,
    Scheduled_Departure TIME,
    Delay_Minutes INT,
    Passenger_Count INT,
    Cancellation_Flag VARCHAR(10),
    Delay_Reason VARCHAR(100),
    On_Time_Flag VARCHAR(10),
    Revenue_INR DECIMAL(12,2)
);
 CREATE TABLE Trains (
    Train_ID VARCHAR(20) PRIMARY KEY,
    Train_Name VARCHAR(100),
    Train_Type VARCHAR(50),
    Coach_Count INT,
    Operating_Zone VARCHAR(50)
);
CREATE TABLE Stations (
    Station_ID VARCHAR(20) PRIMARY KEY,
    Station_Name VARCHAR(100),
    Zone VARCHAR(50),
    Station_Type VARCHAR(50)
);
CREATE TABLE Routes (
    Route_ID VARCHAR(20) PRIMARY KEY,
    Origin_Station_ID VARCHAR(20),
    Destination_Station_ID VARCHAR(20),
    Distance_KM INT,
    Origin_Station varchar(100),
    Destination_Station VARCHAR(100)
);

CREATE TABLE Delay_Reasons (
    Delay_Reason_ID INT PRIMARY KEY,
    Delay_Reason VARCHAR(100),
    Severity VARCHAR(30)
);

USE railway_performance_db;
ALTER TABLE Train_Operations
ADD CONSTRAINT fk_train_operations_train
FOREIGN KEY (Train_id) REFERENCES Trains(Train_id);

USE railway_performance_db;
ALTER TABLE Train_Operations
ADD CONSTRAINT fk_train_operations_station
FOREIGN KEY (Station_ID) REFERENCES Stations(Station_ID);

USE railway_performance_db;
ALTER TABLE Train_Operations
DROP FOREIGN KEY fk_train_operation_route;

ALTER TABLE Train_Operations
ADD CONSTRAINT fk_train_operations_route
FOREIGN KEY (Route_ID) REFERENCES Routes(Route_ID);