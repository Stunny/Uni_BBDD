USE air;

create table LoadAirports(
  idAirport INT,
  airportName VARCHAR(150),
  airportCity VARCHAR(150),
  airportCountry VARCHAR(150),
  airportIATA VARCHAR(10),
  airportICAO VARCHAR(10),
  airportLat DOUBLE,
  airportLong DOUBLE,
  airportHeight DOUBLE,
  airportUTC INT,
  airportDST VARCHAR(10),
  airportTimezone VARCHAR(100)
);

create table LoadAirlines(
  idAirline INT,
  airlineName VARCHAR(150),
  airlineAlias VARCHAR(50),
  airlineIATA VARCHAR(10),
  airlineICAO VARCHAR(10),
  airlineCallsign VARCHAR(50),
  airlineCountry VARCHAR(150),
  airlineIsActive CHAR(5)
);

create table LoadRoutes(
  routeAirline VARCHAR(3),
  routeAirlineId INT,
  routeDepairport VARCHAR(10),
  routeDepAirportId INT,
  routeArrairport VARCHAR(10),
  routeArrairportId INT,
  routeIsShared CHAR(10),
  routeStops INT,
  routePlane VARCHAR(500)
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 5.7\\Uploads\\Airports.csv' INTO TABLE LoadAirports
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(
  idAirport, airportName, airportCity, airportCountry,
  airportIATA, airportICAO, airportLat, airportLong,
  airportHeight, airportUTC, airportDST, airportTimezone
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 5.7\\Uploads\\Airlines.csv' INTO TABLE LoadAirlines
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(
  idAirline, airlineName, airlineAlias, airlineIATA,
  airlineICAO, airlineCallsign, airlineCountry, airlineIsActive
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 5.7\\Uploads\\Routes.csv' INTO TABLE LoadRoutes
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
(
  routeAirline, routeAirlineId, routeDepairport,
  routeDepAirportId, routeArrairport, routeArrairportId,
  routeIsShared, routeStops, routePlane
);
