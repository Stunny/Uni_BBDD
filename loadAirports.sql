use air;

/* CARGA DE DATOS EN LA BASE DE DATOS */

INSERT INTO TimeZone
(id_timezone, timezone_name)
SELECT(airportUTC, airportTimezone)
FROM LoadAirports;

INSERT INTO Country
(country_name, DST)
SELECT(airportCountry, airportDST)
FROM LoadAirports;

INSERT INTO City
(city_name, id_timezone, id_country)
SELECT(l.airportCity, l.airportUTC, c.id_country)
FROM LoadAirports as l, Country as c
WHERE l.airportCountry = c.country_name;

INSERT INTO Airport
(identifier, airport_name, latitude, longitude, height, IATA, ICAO, id_city)
SELECT(idAirport, airportName, airportLat, airportLong, airportHeight
        , airportIATA, airportICAO, c.id_city)
FROM LoadAirports as l, City as c
WHERE l.airportCountry = (
  SELECT country_name
  FROM Country
  WHERE id_country = c.id_country
);
