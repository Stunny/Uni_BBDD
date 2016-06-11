USE air;

create table LoadAirports(
  idAirport INT NOT NULL,
  airportName VARCHAR(150),
  airportCity VARCHAR(150),
  airportCountry VARCHAR(150),
  airportIATA VARCHAR(3),
  airportICAO VARCHAR(4),
  airportLat DOUBLE NOT NULL,
  airportLong DOUBLE NOT NULL,
  airportHeight DOUBLE NOT NULL,
  airportUTC INT NOT NULL,
  airportDST CHAR,
  airportTimezone VARCHAR(100)
);

create table LoadAirlines(
  idAirline INT NOT NULL,
  airlineName VARCHAR(150),
  airlineAlias VARCHAR(50),
  airlineIATA VARCHAR(2),
  airlineICAO VARCHAR(3),
  airlineCallsign VARCHAR(50),
  airlineCountry VARCHAR(150),
  airlineIsActive CHAR(1)
);

create table LoadRoutes(
  routeAirline VARCHAR(3),
  routeAirlineId INT NOT NULL,
  routeDepairport VARCHAR(4),
  routeDepAirportId INT NOT NULL,
  routeArrairport VARCHAR(4),
  routeArrairportId INT NOT NULL,
  routeIsShared CHAR(1),
  routeStops INT NOT NULL CHECK(routeStops >= 0),
  routePlane VARCHAR(500)
);

LOAD DATA INFILE 'Airports.csv' INTO TABLE LoadAirports
FIELDS TERMINATED BY ',' ENCLOSED BY '""'
LINES TERMINATED BY '\r\n'
(
  idAirport, airportName, airportCity, airportCountry,
  airportIATA, airportICAO, airportLat, airportLong,
  airportHeight, airportUTC, airportDST, airportTimezone
);

LOAD DATA INFILE 'Airlines.csv' INTO TABLE LoadAirlines
FIELDS TERMINATED BY ',' ENCLOSED BY '""'
LINES TERMINATED BY '\r\n'
(
  idAirline, airlineName, airlineAlias, airlineIATA,
  airlineICAO, airlineCallsign, airlineCountry, airlineIsActive
);

LOAD DATA INFILE 'Routes.csv' INTO TABLE LoadRoutes
FIELDS TERMINATED BY ',' ENCLOSED BY '""'
LINES TERMINATED BY '\r\n'
(
  routeAirline, routeAirlineId, routeDepairport,
  routeDepAirportId, routeArrairport, routeArrairportId,
  routeIsShared, routeStops, routePlane
);
