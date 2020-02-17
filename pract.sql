CREATE DATABASE test;
USE test;
SELECT DATABASE();

CREATE TABLE USER3(
	user_id INT,
	name VARCHAR(20),
	email VARCHAR(30),
	age INT(3),
	rdate DATE
)

CREATE TABLE user2(
user_id INT PRIMARY KEY AUTO_INCREMENT,
name Varchar(20) NOT NULL,
email Varchar(30) UNIQUE NOT NULL,
age INT(3) DEFAULT '30',
rdate TIMESTAMP
)	

show variables like "character_set_database";

ALTER DATABASE test CHARACTER SET = UTF8;


ALTER TABLE user2 ADD TMP TEXT;
ALTER TABLE user2 MODIFY COLUMN tmp INT(3);
ALTER TABLE user2 DROP tmp;

CREATE DATABASE tmp;
USE tmp;
SHOW DATABASES;

CREATE TABLE tmp(id INT);
DROP TABLE tmp;


USE test;

CREATE TABLE user1(
	user_id INT,
	name VARCHAR(20),
	email VARCHAR(30),
	age INT(3),
	rdate DATE
);

DROP TABLE user1;

INSERT INTO user1(user_id, name, email, age, rdate)
VALUES (1, "jin", "pdj@gmail.com", 30, now()),
(2, "peter", "peter@daum.net", 33, '2017-02-20'),
(3, "alice", "alice@naver.com", 23, '2018-01-05'),
(4, "po", "po@gmail.com", 43, '2002-09-16'),
(5, "andy", "andy@gmail.com", 17, '2016-04-28'),
(6, "jin", "jin1224@gmail.com", 33, '2013-09-02');

USE test;
ALTER TABLE USER2 ADD tmp TEXT;

ALTER TABLE USER2 MODIFY COLUMN tmp INT(3);
ALTER TABLE USER2 DROP tmp;

CREATE DATABASE tmp;
SHOW DATABASES;

DROP DATABASE tmp;
show databases

SELECT *
FROM USER1;

SELECT user_id, NAME, rdate
FROM USER1

SELECT user_id AS "아이디",  NAME AS "이름", rdate AS "등록일"
FROM USER1

SELECT count(DISTINCT(NAME))
FROM USER1

SELECT * 
FROM USER1
WHERE age >= 30

SELECT *
FROM USER1
WHERE rdate >= "2016-01-01"

SELECT *
FROM USER1
WHERE rdate >= "2010-01-01" AND rdate <= "2017-12-13";

SELECT *
FROM USER1
WHERE rdate BETWEEN "2010-01-01" AND "2017-12-13"
ORDER BY rdate asc;

SELECT *
FROM USER1
ORDER BY age DESC, rdate


SELECT email, CONCAT(NAME, "(", age, ")") AS "name_age"
FROM USER1;

SELECT email, CONCAT(NAME, "(", age, ")") AS "name_age"
FROM USER1;

SELECT * 
FROM USER1
WHERE email not LIKE "%gmail%";

SELECT *
FROM USER1
WHERE NAME="peter" OR NAME="alice"

SELECT *
FROM USER1
WHERE NAME IN ("peter", "alice")

SELECT *
FROM USER1
LIMIT 3

SELECT *
FROM USER1
LIMIT 1,3;

UPDATE USER1
SET age=20, email="pdj@daum.net"
WHERE NAME="jin";

SELECT *
FROM  user1

DELETE FROM user1
WHERE rdate <"2016-01-01"

USE world;

SELECT countrycode, COUNT(countrycode)
FROM city
GROUP BY countrycode;

SELECT COUNT(DISTINCT(LANGUAGE)) AS lanuage_count
FROM countrylanguage

SELECT continent, MAX(population) AS population, MAX(gnp) AS gnp
FROM country
GROUP BY continent


SELECT continent, MIN(Population) as Population, MIN(GNP) as GNP
FROM country
WHERE GNP != 0 AND Population != 0
GROUP BY continent


SELECT continent, SUM(population) AS population, SUM(gnp) AS gnp
FROM country
WHERE gnp != 0 AND population != 0
GROUP BY continent


SELECT continent, AVG(Population) as Population, AVG(GNP) as GNP
FROM country
WHERE GNP != 0 AND Population != 0
GROUP BY continent
ORDER BY Population DESC

SELECT continent, AVG(population) AS population, AVG(gnp) AS gnp
FROM country
WHERE gnp != 0 AND population != 0
GROUP BY continent
ORDER BY population desc

SELECT continent, SUM(population) AS population
FROM country
GROUP BY continent
HAVING population > 5000000

SELECT continent, AVG(population) AS population, AVG(gnp) AS gnp, AVG(gnp) / AVG(population) * 1000 AS AVG
FROM country
WHERE gnp != 0 AND population != 0
GROUP BY continent
HAVING AVG > 0.01
ORDER BY AVG desc


SELECT DISTINCT(continent)
FROM country

SELECT *
FROM city;

SELECT NAME, population
FROM city
WHERE countrycode="KOR" and population >= 1000000;


SELECT NAME, countrycode, population
FROM city
WHERE population BETWEEN 8000000 AND 10000000;

SELECT *
FROM country;

SELECT CODE, CONCAT(NAME, "(", indepyear,")") AS "NameIndep", continent, population
FROM country
WHERE indepyear BETWEEN 1940 AND 1950
ORDER BY indepyear ASC;


SELECT countrycode, LANGUAGE, percentage
FROM countrylanguage
WHERE LANGUAGE IN ("English", "Spanish", "Korean") AND percentage > 95
ORDER BY percentage desc


SELECT CODE, NAME, continent, governmentform, population
FROM country
WHERE code LIKE "A%" AND governmentform LIKE "%republic%";

SELECT COUNT(DISTINCT(continent)) AS "count"
FROM country

SELECT continent, COUNT(continent) AS count
FROM country
GROUP BY continent
ORDER BY continent asc;

SELECT countrycode, SUM(population) AS population
FROM city
GROUP BY countrycode
HAVING population >= 50000000
ORDER BY population desc;

SELECT LANGUAGE, COUNT(LANGUAGE) AS count
FROM countrylanguage
GROUP BY LANGUAGE
ORDER BY count desc
LIMIT 4, 6

SELECT LANGUAGE, COUNT(LANGUAGE) AS COUNT
FROM countrylanguage
GROUP BY LANGUAGE
HAVING COUNT >= 15
ORDER BY COUNT DESC;


SELECT continent, SUM(surfacearea) AS sumsur
FROM country
GROUP BY continent
ORDER BY sumsur desc


SELECT CODE, NAME, continent, governmentform, population
FROM country
WHERE CODE LIKE "a%" AND governmentform LIKE "%republic%"

SELECT countrycode, LANGUAGE, percentage
FROM countrylanguage
WHERE LANGUAGE IN("english", "korean", "spanish") AND percentage >= 95
ORDER BY percentage DESC;

SELECT CODE, CONCAT(NAME, "(", indepyear, ")"), continent, population
FROM country
WHERE indepyear BETWEEN 1940 AND 1950
ORDER BY indepyear ASC;

SELECT NAME, countrycode, population
FROM city
WHERE population BETWEEN 8000000 AND 10000000
ORDER BY population DESC

SELECT NAME, population
FROM city
WHERE countrycode = "KOR" AND population >= 1000000
ORDER BY population DESC


SELECT DISTINCT(continent)
FROM country


SELECT continent, SUM(surfacearea) AS SUM1
FROM country
GROUP BY continent
ORDER BY SUM1 DESC

SELECT LANGUAGE, COUNT(LANGUAGE) AS COUNT
FROM countrylanguage
GROUP BY LANGUAGE
HAVING COUNT >= 15
ORDER BY COUNT DESC

SELECT LANGUAGE, COUNT(LANGUAGE) AS COUNT
FROM countrylanguage
GROUP BY LANGUAGE
ORDER BY COUNT DESC
LIMIT 4, 6

SELECT countrycode, SUM(population) AS SUM1
FROM city
GROUP BY countrycode
HAVING SUM1 >= 50000000
ORDER BY SUM1 DESC;

SELECT continent, COUNT(continent) AS COUNT
FROM country
GROUP BY continent

SELECT COUNT(DISTINCT(continent))
FROM country

select ceil(12.345)

USE world;

SELECT CountryCode, LANGUAGE, Percentage, CEIL(Percentage)
FROM countrylanguage

SELECT ROUND(12.345 ,2)

SELECT CountryCode, LANGUAGE, percentage, ROUND(Percentage, 0)
FROM countrylanguage

SELECT TRUNCATE(12.345, 2)


SELECT countrycode, LANGUAGE, Peercentage, TRUNCATE(Percentage, 0)
FROM countrylanguage

SELECT CountryCODE, LANGUAGE, Percentage, ROUND(Percentage, 0), TRUNCATE(Percentage, 0)
FROM countrylanguage


#conditional 조건문 만들어 주는 것. 새로 city_scale 열을 생성해준다.

SELECT NAME, population, IF(population > 1000000, "big city", "small city")AS city_scale
FROM city
ORDER BY population DESC;

# IFNULL
# 독립년도가 없는 데이터는 0으로 출력
SELECT IndepYear, IFNULL(IndepYear,0) AS IndepYear
FROM country

#CASE WHEN

SELECT NAME, population, 
	CASE
		WHEN population > 100000000 THEN "upper 1 billion"
		WHEN population > 10000000 THEN "upper 100 million"
		ELSE "below 100 million:"
	END AS result
FROM country


# DATE_FORMAT

USE sakila

SELECT DATE_FORMAT(payment_date, "%Y-%m") AS monthly, SUM(amount) AS amount
FROM payment
GROUP BY monthly

# join
USE world

# inner join
SELECT id, user.name, addr.addr
FROM user
JOIN addr
ON user.user_id = addr.user_id;

SELECT country.name AS city_name, city.name AS country_name
FROM city
JOIN country
ON city.CountryCode = country.code

SELECT id, user.name, addr.addr
FROM user
RIGHT JOIN addr
ON user.user_id = addr.user_id


#union
SELECT NAME
FROM user
UNION
SELECT addr
FROM addr

USE world
# full outer join
SELECT id, user.name, addr.addr
FROM user
LEFT JOIN addr
ON user.user_id = addr.user_id
UNION
SELECT id, user.name, addr.addr
FROM user
RIGHT JOIN addr
ON user.user_id = addr.user_id


#subquery
SELECT
	(SELECT COUNT(NAME) FROM city) AS totle_city,
	(SELECT COUNT(NAME) FROM country) AS total_country,
	(SELECT COUNT(DISTINCT(language)) FROM countrylanguage) AS total_language
FROM DUAL

# subquery from
SELECT *
FROM
	(SELECT countrycode, NAME, population
	FROM city
	WHERE population > 8000000
	ORDER BY population ASC) AS city
JOIN
	(SELECT CODE, name
	FROM country) AS country
ON city.countrycode = country.code	


# subquery where
SELECT CODE, NAME, headofstate
FROM country
WHERE CODE IN(
					SELECT DISTINCT(countrycode) FROM city WHERE population > 8000000
)



SELECT CEIL(12.34)

USE world

SELECT CountryCode, Language, Percentage, CEIL(Percentage)
FROM countrylanguage

SELECT ROUND(12.345,2)

SELECT countrycode, LANGUAGE, percentage, ROUND(percentage,0)
FROM countrylanguage

SELECT truncate(12.345 ,2)

SELECT CountryCode, Language, Percentage, ROUND(Percentage, 0), TRUNCATE(Percentage,
0)
FROM countrylanguage



SELECT NAME, population, IF(population >1000000, "big city", "small city") AS city_code
FROM city


SELECT NAME, population, if(population > 100000, "bigcity", "smallcity") AS city_code
FROM city

SELECT indepyear, IFNULL(IndepYear,0) AS IndepYear
FROM country

SELECT NAME, population,
	case
		when population >10000000 then "upper 1 billion"
		when population >1000000 then "upper 100million"
		ELSE "below 100 million"
	END AS result
	
FROM country  


SELECT NAME, population,
	CASE
		when population > 10000000 Then "upper 1 billion"
		when population > 1000000 then "upper 100million"
		ELSE "below 100 million"
	END AS result
FROM country

USE sakila
SELECT DATE_FORMAT(payment_date, "%Y-%m") AS monthly, SUM(amount) AS amount
FROM payment
GROUP BY monthly

USE world
SELECT id, user.name, addr.addr
FROM user
JOIN addr
ON user.user_id = addr.user_id

SELECT country.Name AS coty_name, city.name AS country_name
from city
JOIN country
ON city.countryCode = country.code

SELECT id, user.name, addr.addr
FROM user
LEFT JOIN addr
ON user.user_id = addr.user_id

SELECT id, user.name, addr.addr
FROM user
RIGHT JOIN addr
ON user.user_id = addr.user_id

SELECT name
FROM user
UNION
SELECT addr
FROM addr

SELECT
	(SELECT COUNT(NAME) FROM city) AS total_city,
	(SELECT COUNT(NAME) FROM country) AS total_country,
	(SELECT COUNT(DISTINCT(language)) FROM countrylanugages) AS totlal_lauguage
FROM dual


SELECT *
FROM
	(SELECT countrycode, NAME, population
	FROM city
	WHERE population > 8000000) AS city
JOIN
	(SELECT CODE, name
	FROM country) AS country
ON city.countrycode = coutnry.code



SELECT code, name, HeadOfState
FROM country
WHERE code IN (
SELECT DISTINCT(countrycode) FROM city WHERE population > 8000000
)


SELECT CODE, NAME, headofstates
FROM cuntry
WHERE CODE IN(
		SELECT DISTINCT(countrycode) FROM city WHERE population > 800000
		)


CREATE INDEX population
ON city(population)

DROP INDEX Population
ON city

CREATE VIEW code_name AS
SELECT code, NAME
FROM country

USE world
SELECT continent, AVG(population) AS Population, AVG(GNP) AS GNP, AVG(GNP) / AVG(POPULATION) * 1000 AS AVG
FROM country
WHERE gnp!=0 AND population != 0
GROUP BY continent
HAVING AVG > 0.01
ORDER BY AVG desc



SELECT continent, AVG(Population) as Population, AVG(GNP) as GNP,
AVG(GNP) / AVG(Population) * 1000 as AVG
FROM country
WHERE GNP != 0 AND Population != 0
GROUP BY continent
HAVING AVG > 0.01
ORDER BY AVG DESC


SELECT continent, SUM(Population) as Population
FROM country
GROUP BY continent
HAVING Population > 500000000


SELECT *
FROM city
JOIN code_name
ON city.countrycode = code_name.code


SELECT
	(SELECT COUNT(NAME) FROM city) AS total_city,
	(SELECT COUNT(NAME) FROM country) AS total_coutnry,
	(SELECT COUNT(DISTINCT(language)) FROM countrylanguage) AS total_language
FROM DUAL

SELECT *
FROM
	(SELECT countrycode, NAME, population
	FROM city
	WHERE population > 8000000) AS city
JOIN
	(SELECT CODE, name
	FROM country) AS country
ON city.countrycode = country.code

SELECT CODE, NAME, headofstate
FROM country
WHERE CODE IN(
	SELECT DISTINCT(countrycode) FROM city WHERE population > 800000
	)












































