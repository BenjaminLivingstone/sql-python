USE world;

#1. ¿Qué consulta harías para obtener todos los países que hablan esloveno? 
#Tu consulta debe devolver el nombre del país, el idioma y el porcentaje de idioma. 
#Tu consulta debe organizar el resultado por porcentaje de idioma en orden descendente. (1)
SELECT countries.name AS country, languages.language, languages.percentage 
FROM languages 
JOIN countries ON languages.country_id = countries.id
WHERE languages.language ='Slovene'
ORDER BY languages.percentage desc;

#2. ¿Qué consulta ejecutarías para mostrar el número total de ciudades para cada país? 
#Su consulta debe devolver el nombre del país y el número total de ciudades. 
#Tu consulta debe organizar el resultado por el número de ciudades en orden descendente. (3)
SELECT countries.name AS Country, COUNT(*) AS "City Count" 
FROM cities
JOIN  countries ON countries.id = cities.country_id
GROUP BY countries.name
ORDER BY COUNT(*) DESC;

#3. ¿Qué consulta harías para obtener todas las ciudades de México con una población de más de 500,000? 
#Tu consulta debe organizar el resultado por población en orden descendente. (1)
SELECT cities.name AS city, cities.population AS population 
FROM cities
JOIN countries ON countries.id=cities.country_id 
WHERE countries.name='Mexico' AND cities.population>=500000
ORDER BY cities.population DESC;

#4. ¿Qué consulta ejecutarías para obtener todos los idiomas en cada país con un porcentaje superior al 89%? 
#Tu consulta debe organizar el resultado por porcentaje en orden descendente. (1)
SELECT languages.language, languages.percentage 
FROM languages
JOIN countries ON countries.id=languages.country_id
WHERE languages.percentage>=89
ORDER BY languages.percentage DESC;

#5. ¿Qué consulta haría para obtener todos los países con un área de superficie inferior a 501 y una población superior a 100,000? (2)
SELECT * FROM countries
WHERE surface_area<501 AND population>100000;

#6. ¿Qué consulta harías para obtener países con solo Monarquía Constitucional con un capital superior a 200 y una esperanza de vida superior a 75 años? (1)
SELECT * FROM countries
WHERE government_form='Constitutional Monarchy' AND capital>200 AND life_expectancy>75;

#7. ¿Qué consulta harías para obtener todas las ciudades de Argentina dentro del distrito de Buenos Aires y tener una población superior a 500,000? 
#La consulta debe devolver el nombre del país, el nombre de la ciudad, el distrito y la población. (2)
SELECT * FROM cities;
SELECT countries.name, cities.name, cities.district, cities.population
FROM cities
JOIN countries ON countries.id=cities.country_id
WHERE countries.name='Argentina' and cities.district='Buenos Aires';

#8. ¿Qué consulta harías para resumir el número de países en cada región? 
#La consulta debe mostrar el nombre de la región y el número de países. 
#Además, la consulta debe organizar el resultado por el número de países en orden descendente. (2)

SELECT * FROM countries;
SELECT region, COUNT(*) 
FROM countries
GROUP BY countries.region
ORDER BY COUNT(*) DESC;


