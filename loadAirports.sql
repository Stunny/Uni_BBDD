use air;

/* CARGA DE DATOS GEOGRAFICOS
Y DE AEROPUERTOS EN LA BASE DE DATOS */

INSERT INTO TimeZone
(timezone_UTC, timezone_name)
SELECT DISTINCT l.airportUTC, l.airportTimezone
FROM LoadAirports as l;

INSERT INTO Country
(country_name, DST)
SELECT DISTINCT airportCountry, airportDST
FROM LoadAirports;


INSERT INTO City
(city_name, id_country)
SELECT DISTINCT l.airportCity, c.id_country
FROM loadairports as l, country as c
WHERE c.country_name=l.airportCountry;

INSERT INTO Airport
(identifier, airport_name, latitude, longitude, height, IATA, ICAO, id_city)
SELECT idAirport, airportName, airportLat, airportLong, airportHeight
        , airportIATA, airportICAO, c.id_city
FROM LoadAirports, City as c, Country as co
WHERE loadairports.airportCity=c.city_name AND c.id_country=co.id_country AND loadairports.airportCountry=co.country_name;
