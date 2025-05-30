SELECT * FROM city;
SELECT * FROM country;
SELECT * FROM countrylanguage;

#1. Посчитайте количество городов в каждой стране, где IndepYear = 1991 (Independence Year).
SELECT  city.CountryCode, COUNT(city.Name), c.IndepYear 
FROM city JOIN country c ON city.CountryCode = c.Code
WHERE city.CountryCode IN (
    SELECT Code
    FROM Country
    WHERE IndepYear = 1991
)
GROUP BY CountryCode;
#либо
SELECT  city.CountryCode, COUNT(city.Name), c.IndepYear 
FROM city JOIN country c ON city.CountryCode = c.Code
    WHERE IndepYear = 1991
GROUP BY CountryCode;

#2. Узнайте, какая численность населения и средняя продолжительность жизни людей в Аргентине (ARG).
SELECT name ,Population , LifeExpectancy FROM country WHERE code= 'ARG';

#3. В какой стране самая высокая продолжительность жизни?
SELECT Name
FROM Country
WHERE LifeExpectancy IN (
    SELECT MAX(LifeExpectancy)
    FROM Country);

#4. Перечислите все языки, на которых говорят в регионе «Southeast Asia».
SELECT cl.Language 
FROM countrylanguage cl 
join country c on c.Code = cl.CountryCode
where Region = 'Southeast Asia';

#5. Посчитайте сумму SurfaceArea для каждого континента.
SELECT  Continent, SUM(SurfaceArea) as sum_sur_area 
FROM country 
GROUP BY Continent;













