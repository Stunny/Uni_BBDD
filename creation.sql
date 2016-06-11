DROP DATABASE IF EXISTS air;

CREATE DATABASE air;
USE air;

create table Airport(
		id_airport INT NOT NULL AUTO_INCREMENT,
		identifier INT NOT NULL,
    airport_name VARCHAR(150),
    id_city INT NOT NULL,
    latitude DOUBLE,
    longitude DOUBLE,
		height DOUBLE,
		IATA VARCHAR(3),
		ICAO VARCHAR(4),
		PRIMARY KEY(id_airport)
);

create table Airline(
	id_airline INT NOT NULL AUTO_INCREMENT,
	identifier INT NOT NULL,
	airline_name VARCHAR(150),
	id_country INT NOT NULL,
	alias VARCHAR(150),
	callsign VARCHAR(50),
	is_active CHAR,
	IATA VARCHAR(2),
	ICAO VARCHAR(3),
	PRIMARY KEY(id_airline)
);

create table Route(
	id_route INT NOT NULL AUTO_INCREMENT,
	id_airline INT NOT NULL,
	id_depairport INT NOT NULL,
	id_arrairport INT NOT NULL,
	isShared CHAR(1),
	route_plane VARCHAR(500),
	route_stops INT NOT NULL CHECK(route_stops >= 0),
	PRIMARY KEY(id_route)
);
/*
create table DST(
	id_DST CHAR NOT NULL,
	PRIMARY KEY(id_DST)
);
*/
create table TimeZone(
	id_timezone INT NOT NULL,
	timezone_name VARCHAR(150),
	/*timezone_UTC INT NOT NULL,*/
	PRIMARY KEY(id_timezone)
);

create table Country(
	id_country INT NOT NULL AUTO_INCREMENT,
	country_name VARCHAR(150),
	DST CHAR,
	PRIMARY KEY(id_country)
);

create table City(
	id_city INT NOT NULL AUTO_INCREMENT,
	city_name VARCHAR(150),
	id_country INT NOT NULL,
	id_timezone INT NOT NULL,
	PRIMARY KEY(id_city)
);

ALTER TABLE Airport
ADD CONSTRAINT fk_city
FOREIGN KEY(id_city)
REFERENCES City(id_city);

ALTER TABLE Airline
ADD CONSTRAINT fk_country
FOREIGN KEY(id_country)
REFERENCES Country(id_country);

ALTER TABLE Route
ADD CONSTRAINT fk_airline
FOREIGN KEY(id_airline)
REFERENCES Airline(id_airline);

ALTER TABLE Route
ADD CONSTRAINT fk_depairport
FOREIGN KEY(id_depairport)
REFERENCES Airport(id_airport);

ALTER TABLE Route
ADD CONSTRAINT fk_arrairport
FOREIGN KEY(id_arrairport)
REFERENCES Airport(id_airport);

ALTER TABLE City
ADD CONSTRAINT fk_citycountry
FOREIGN KEY(id_country)
REFERENCES Country(id_country);

ALTER TABLE City
ADD CONSTRAINT fk_citytimezone
FOREIGN KEY(id_timezone)
REFERENCES TimeZone(id_timezone);
/*
ALTER TABLE Country
ADD CONSTRAINT fk_dst
FOREIGN KEY(id_DST)
REFERENCES DST(id_DST);
*/
