SELECT name, admin1_code, population, lat, lon, ST_Distance(latlon, 'POINT(-84.1849121 31.7326438)', false) FROM all_cities
WHERE ST_DWithin(latlon, 'POINT(-84.1849121 31.7326438)', 50000, false);
