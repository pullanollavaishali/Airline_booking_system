create database Airline;
use Airline;
CREATE TABLE Customer (
    phonenumber VARCHAR(20),
    password VARCHAR(50),
    lastname VARCHAR(50),
    firstname VARCHAR(50),
    username VARCHAR(50) PRIMARY KEY,
    address VARCHAR(255),
    email VARCHAR(100)
);
CREATE TABLE Ticket_Status (
    ticket_id INT PRIMARY KEY,
    status VARCHAR(50)
);
CREATE TABLE Payment (
    username VARCHAR(50),
    ticket_id INT,
    PRIMARY KEY (username, ticket_id),
    FOREIGN KEY (username) REFERENCES Customer(username),
    FOREIGN KEY (ticket_id) REFERENCES Ticket_Status(ticket_id)
);
CREATE TABLE Administrator (
    username VARCHAR(50) PRIMARY KEY,
    password VARCHAR(50)
);
CREATE TABLE Flight (
    flightnumber VARCHAR(50) PRIMARY KEY,
    departure_time DATETIME,
    arrival_time DATETIME,
    departure VARCHAR(100),
    price DECIMAL(10, 2)
);
CREATE TABLE Airline (
    airline_id INT PRIMARY KEY AUTO_INCREMENT,
    airline_name VARCHAR(100),
    airline_logo_path VARCHAR(255)
);
CREATE TABLE Flight_Airline (
    flightnumber VARCHAR(50),
    airline_id INT,
    PRIMARY KEY (flightnumber, airline_id),
    FOREIGN KEY (flightnumber) REFERENCES Flight(flightnumber),
    FOREIGN KEY (airline_id) REFERENCES Airline(airline_id)
);
CREATE TABLE Schedule (
    admin_username VARCHAR(50),
    flightnumber VARCHAR(50),
    PRIMARY KEY (admin_username, flightnumber),
    FOREIGN KEY (admin_username) REFERENCES Administrator(username),
    FOREIGN KEY (flightnumber) REFERENCES Flight(flightnumber)
);
CREATE TABLE Booked_Flights (
    ticket_id INT,
    flightnumber VARCHAR(50),
    PRIMARY KEY (ticket_id, flightnumber),
    FOREIGN KEY (ticket_id) REFERENCES Ticket_Status(ticket_id),
    FOREIGN KEY (flightnumber) REFERENCES Flight(flightnumber)
);