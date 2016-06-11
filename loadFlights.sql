USE air;
/*CARGO AEROLINEAS Y RUTAS*/
INSERT INTO Airline
(identifier, airline_name, alias, callsign
  ,is_active, IATA, ICAO, id_country)
SELECT (idAirline, airlineName, airlineAlias
    , airlineCallsign, airlineIsActive, airlineIATA
    , airlineICAO, c.id_country)
FROM LoadAirlines as l, Country as c
WHERE l.airlineCountry=c.country_name;

INSERT INTO Route
(id_airline, id_depairport, id_arrairport, route_stops, isShared)
SELECT (routeAirlineId, routeDepAirportId, routeArrairportId
    , routeStops, routeIsShared, routePlane)
FROM LoadRoutes;

drop table LoadAirports;
drop table LoadAirlines;
drop table LoadRoutes;
