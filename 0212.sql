# server - Database - Table 

#1. Create

#1-1. 데이터 베이스

SHOW DATABASES; # 데이터베이스확인

# 생성

CREATE DATABASE test;

# 선택

USE test;
# 확인
SELECT DATABASE();

#2. Table
CREATE TABLE USER1(
	user_id INT,
	name VARCHAR(20),
	email VARCHAR(30),
	age INT(3),
	rdate DATE
)
	
	# 두가지 조건을 같이 가지게 된느 것이 Primary Key)
	# Auto_Increment 데이터가 없으면 1씩 늘어나게 해준다.
USER2CREATE TABLE USER2(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(20) NOT NULL,
	email VARCHAR(30) UNIQUE NOT NULL,
	age INT(3) DEFAULT 30, 
	rdate TiMESTAMP
)
		

# 2. 수정

# 2-1 데이터베이스
SHOW VARIABLES LIKE "character_set_database"
ALTER DATABASE test CHARACTER SET = utf8

# 2-2 테이블 

ALTER TABLE USER2 ADD tmp TEXT;
ALTER TABLE USER2 MODIFY COLUMN tmp INT(3);
ALTER TABLE USER2 DROP tmp;

# 3. Drop
CREATE DATABASE tmp
DROP DATABASE tmp
SHOW DATABASES;

# 3-2 테이블
DROP TABLE USER3
test

USE test
# 4. Insert
INSERT INTO USER1(user_id, name, email, age, rdate);
VALUE(1, "jin", "jin@gmail.com", 32, NOW());

SELECT NOW()

INSERT INTO USER1(user_id, name, email, age, rdate)
VALUES (1, "jin", "pdj@gmail.com", 30, now()),
(2, "peter", "peter@daum.net", 33, '2017-02-20'),
(3, "alice", "alice@naver.com", 23, '2018-01-05'),
(4, "po", "po@gmail.com", 43, '2002-09-16'),
(5, "andy", "andy@gmail.com", 17, '2016-04-28'),
(6, "jin", "jin1224@gmail.com", 33, '2013-09-02');


# 5. SELECT : 데이터 조회

SELECT user_id, NAME, age
 
FROM USER1

SELECT *
FROM USER1;

SELECT user_id AS "ID" name AS "UserName", age AS "AGES"
FROM USER1

# DITSINCT 중복제거
SELECT DISTINCT(NAME)
FROM USER1

#WHERE 조건 검색
SELECT COUNT(DISTINCT(NAME))
FROM USER1
WHERE age >= 30;

# and or not

SELECT *
FROM USER1
WHERE age >= 20 AND age < 40;

# BETWEEN A AND B
SELECT * 
FROM USER1
WHERE age BETWEEN 23 AND 33 # 날짜도 가능

#ORDER BY 정렬
SELECT *
FROM USER1
ORDER BY NAME, age DESC;

#나이가 20세에서 40세 사이에 있는  사용자를 이름순으로 정렬하고 중복 데이터를 제거해서 출력
SELECT distinct(NAME)
FROM USER1
WHERE age BETWEEN 20 AND 39
ORDER BY name desc


#concat 컬럼 데이터 합치기

SELECT NAME, age, CONCAT(NAME, "(", age, ")") AS "name_age"
FROM USER1

#like : where 절에서 특젇 문자열이 들어간 데이터 조회
# %는 어떤 숫자나 문자가 온다는 의미 % 디음 문자에!
# p가 오는 데이터를 select한다.. 하면 %p 문자가 있거나 없거나..
SELECT *
FROM USER1
WHERE email LIKE "%@daum.%"
# where email not like"%net" 아닌거를 차고 싶다면! 

# in : 여러개의 조건을 조회할 때 사용

SELECT *
FROM USER1
# WHERE NAME="andy" OR NAME ="peter" OR NAME="po"
WHERE NAME IN ("andy", "peter", "po")

# 서브퀴리 안에서 하나 더 가져온다..서브쿼리 서브ㅜ쿼리 조인
SELECT *
FROM USER1
WHERE NAME IN (
 select distinct(NAME)
FROM USER1
WHERE age > 30
)


# LIMIT

SELECT *
FROM USER1
LIMIT 3

# 3부터 아래 다섯개가 나옴..
SELECT *
FROM USER1
LIMIT 3, 5

# 6. UPDATE

# 20 대로 바꿔주눈 것
UPDATE USER1 
SET age=20, rdate="2019-12-12"
WHERE age BETWEEN 20 AND 29

# 조회
SELECT *
FROM USER1
WHERE age BETWEEN 20 AND 29

#where 절에 seelct를 넣어 보면 미리 볼 수 있음 업데이트 전에

# 7. delete

DELETE FROM USER1
WHERE rdate > "2019-11-01"

SELECT * 
FROM USER1

USE world
city

SELECT *
FROM country;

# quiz 1

SELECT DISTINCT(continent)
FROM country
ORDER BY continent;

# kor 한국 코드를
#quiz 2
SELECT NAME, population
FROM city
WHERE countrycode = "KOR" and population >= 1000000
ORDER BY population DESC;

#quiz 3
SELECT NAME, countrycode, population 
FROM city
WHERE population BETWEEN 8000000 AND 1000000
ORDER BY population DESC;

#quiz 4
SELECT CODE, concat(NAME, "(", IndepYear, ")"),continent, population 
FROM country
WHERE indepyear BETWEEN 1940 AND 1950
ORDER BY indepyear, population DESC

# quiz 5
SELECT countrycode, LANGUAGE, percentage
FROM countrylanguage
WHERE LANGUAGE IN ("English","korean","spanish")
AND percentage >= 95
ORDER BY percentage DESC

# quiz 6
SELECT CODE, NAME, continent, governmentform, population
FROM country
WHERE code like "A%" AND governmentform LIKE "%republic%";

# group by
# city 테이블에서 나라별 도시의 갯수를 출력
SELECT countrycode, COUNT(countrycode) AS count 
FROM city
GROUP BY countrycode

# country language 테이블에서 저체 언어의 갯수를 출력
SELECT count(distinct(LANGUAGE))
FROM countrylanguage

#대륙별 인수수와 gnp의 최대값을 출력
# continent에 대해서만 그룹바이를 하면 오류가 난다. 그룹바이 해줄만한 함수를 다른 변수들에 적용
SELECT continent, max(population), max(GNP), SUM(gnp)/SUM(population)
FROM country
GROUP BY continent;

# 대륙별 전체인구를 구하고 5억 이상인 대륙만 출력
# having : groupt by가 실행되고 난 결과에 조건을 추가
# where는 그룹바이 위에 와야 한다1
SELECT continent, SUM(population) AS DATA
FROM country
GROUP BY continent;
having SUM(population) > 50000000


###################
#mysql 20191031_01~04
###################

SELECT countrycode, NAME, population
FROM city;

# 변수명 이름 바꿔주기  as 사용
SELECT countrycode AS code, NAME, population
FROM city;

# 조건걸어 데이터 가져오기
SELECT countrycode AS code, NAME, population
FROM city
WHERE population >= 5000000 AND population <= 8000000;

# select
SELECT countrycode AS code, NAME, population
FROM city
WHERE population >= 5000000 AND population <= 8000000 AND countrycode = "CHN";

#betweeen 사용

SELECT countrycode AS code, NAME, population
FROM city
WHERE population BETWEEN 500000 AND 8000000;


#order by 사용
SELECT countrycode AS code, NAME, population
FROM city
WHERE population BETWEEN 5000000 AND 8000000
ORDER BY countrycode, population DESC;

# concat 사용
SELECT countrycode AS CODE, NAME, population, CONCAT(NAME, "(", population, ")") AS city_population
FROM city
WHERE population BETWEEN 5000000 AND 800000
AND countrycode lkie "c%" #씨로 시작되는 문자
ORDER BY countrycode ASC, population desc

SELECT countrycode AS CODE, NAME, population, CONCAT(NAME, "(", population, ")") AS city_population
FROM city
WHERE population BETWEEN 5000000 AND 8000000
AND countrycode LIKE "%R%"
AND (countrycode = "BRA" OR countrycode = "BRA") # ()를 하면 우선순위가 높게 된다.
ORDER BY countrycode ASC, population desc


# in을 사용할 경우 선택하는 것
SELECT countrycode AS CODE, NAME, population, CONCAT(NAME, "(", population, ")") AS city_population
FROM city
WHERE population BETWEEN 5000000 AND 8000000
AND countrycode LIKE "%R%"
AND countrycode IN ("BRA", "GBR") # ()를 하면 우선순위가 높게 된다.
ORDER BY countrycode ASC, population desc

#limit을 사용한 경우
# in을 사용할 경우 선택하는 것
SELECT countrycode AS CODE, NAME, population, CONCAT(NAME, "(", population, ")") AS city_population
FROM city
WHERE population BETWEEN 5000000 AND 8000000
#AND countrycode LIKE "%R%"
#AND countrycode IN ("BRA", "GBR") # ()를 하면 우선순위가 높게 된다.
ORDER BY countrycode ASC, population desc
LIMIT 5, 3 # 다섯번째부터 3개 6, 7, 8이 나온다.

# group by
# countrycode 개수 세기
SELECT countrycode, COUNT(countrycode), SUM(population), MAX(population), AVG(population) AS avg_population
FROM city
WHERE population >= 5000000
GROUP BY countrycode
HAVING avg_population >= 8000000;



#quiz2
#quiz 2.1

SELECT count(distinct(continent)) AS count
FROM country

#quiz 2.2
SELECT continent, COUNT(continent) AS count
FROM country
GROUP BY continent
ORDER BY COUNT desc

# quiz 2.3
SELECT countrycode, sum(population) AS Population
FROM city
GROUP BY countrycode
HAVING population >= 5000000
ORDER BY population DESC 

# quiz 2.4
SELECT LANGUAGE, COUNT(LANGUAGE) AS count
FROM countrylanguage
GROUP BY LANGUAGE
ORDER BY COUNT DESC
LIMIT 4, 6

# quiz 2.5
SELECT LANGUAGE, COUNT(LANGUAGE) AS COUNT
FROM countrylanguage
GROUP BY LANGUAGE
HAVING COUNT >= 15
ORDER BY COUNT DESC

# quiz 2.6
SELECT continent, sum(surfacearea) as surfacearea
FROM country
GROUP BY continent
ORDER BY surfacearea desc


#mysql intermediate
#sakila database download


#20191031_02

#소수점, 올림, 반올림, 버림 함수
SELECT ceil(12.345) #올림
SELECT ROUND(12.345, 2) #반올림
SELECT TRUNCATE(12.345 ,2) # 버림
use world
#
SELECT CODE, CEIL((GNP / population) * 1000)
FROM country

SELECT CODE, round((GNP / population) * 1000, 2)
FROM country

# 조건문

# IF : IF(조건, 참, 거짓)
# 도시의 인구가 100만이상 big city, 100만 미만 small city 출력
# column : city_scale

SELECT NAME, population
, IF(population >= 1000000, "big city", "small city")
AS city_scale
FROM city


# IFNULL : IFNULL(참, 거짓)
# country 테이블에서 독립년도(IndepYearf)가 없으면 0으로 출력

SELECT NAME, IFNULL(IndepYear, 0) AS IndepYear 
FROM country

# CASE
# CASE 
# 		WHEN (조건1) THEN (출력1)
# 		WHEN (조건2) THEN (출력2)
# END AS (컬럼명)

# 나라별 10억 이상, 1억 이상, 1억 이하 조건을 출력
SELECT name, population,
	CASE
		WHEN population > 1000000000 THEN "upper 1 bilion"
		WHEN population > 100000000 THEN "upper 100 milion"
		ELSE "below 100 milion"
	END AS result
FROM country;

# DATE_FORMAT : 날짜 데이터의 포맷을 변경헤주는 함수
# sakila

USE sakila

# Payment에서 월별 총 매출 출력
SELECT payment_data, amount
FROM payment
GROUP BY payment_date


# Payment에서 월별 총 매출 출력 date_format 사용 월별 매출, 횟수 사용
# pdf에 있는 형태 참고해서 보기.
SELECT DATE_FORMAT(payment_date, "%W") AS monthly, COUNT(amount), sum(amount)
FROM payment
GROUP BY monthly

# JOIN : merge()

# 데이터 만드는 것. pdf 파일에서 가져옴.
USE world

CREATE TABLE user (
user_id int(11) unsigned NOT NULL AUTO_INCREMENT,
name varchar(30) DEFAULT NULL,
PRIMARY KEY (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE addr (
id int(11) unsigned NOT NULL AUTO_INCREMENT,
addr varchar(30) DEFAULT NULL,
user_id int(11) DEFAULT NULL,
PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO user(name)
VALUES ("jin"),
("po"),
("alice"),
("petter");
INSERT INTO addr(addr, user_id)
VALUES ("seoul", 1),
("pusan", 2),
("deajeon", 3),
("deagu", 5),
("seoul", 6);

SELECT *
FROM user



# inner join
SELECT *
FROM addr
JOIN user
ON addr.user_id = user.user_id



SELECT addr.addr, addr.user_id, user.name
FROM addr
JOIN user
ON addr.user_id = user.user_id

# world 도시이름, 국가이름 출력
SELECT city.countrycode, city.name, country.name
FROM city
JOIN country
ON city.countrycode = country.code

# left join
SELECT id, addr.addr, addr.user_id, IFNULL(user.name, "-")
FROM addr
LEFT JOIN user
ON addr.user_id = user.user_id

# right join

# right join
SELECT id, addr.addr, user.user_id, IFNULL(user.name, "-")
FROM addr # 먼저 쓴 쪽이 left 그 다음이 right
right JOIN user
ON addr.user_id = user.user_id

# union: select 문의 결과를 합쳐서 출력
# 자동으로 중복을 제거
SELECT NAME
FROM user
UNION # 중복데이터를 그대로 두고 싶다면.. all을 써준다.
SELECT addr
FROM addr

# outer join
# uninon이 중복 제거 하는 효과가 있다..
SELECT user.name, addr.addr, addr.user_id 
FROM user
LEFT JOIN addr #left
ON user.user_id = addr.user_id
union
SELECT user.name, addr.addr, addr.user_id
FROM user
RIGHT JOIN addr #right
ON user.user_id = addr.user_id



# sub-query : 쿼리문 안에 쿼리가 있는 문법
# select, from, where 등등

# 전체 나라수, 전체 도시수, 전체 언어수를 출력
SELECT 1, 2, 3

# 쿼리 안에 쿼리가 있는 것. select 문에 선택되는 변수들을 적어준다고 생각
SELECT
(SELECT COUNT(*)
FROM city) AS total_country,

(SELECT COUNT(*)
FROM country) AS total_city,


(SELECT COUNT(DISTINCT(LANGUAGE))
FROM countrylanguage) AS total_language


# from 절 sub-query
# 800만 이상이 되는 도시의 국가 코드, 도시이름, 국가 이름, 도시인구수를 출력
SELECT *
FROM
	(SELECT countrycode, NAME, population
	FROM city
	WHERE population >= 8000000) AS city

JOIN 

	(SELECT CODE, NAME
	FROM country) AS country
ON city.countrycode = country.code

# 800만 이상 도시의 국가코드, 국가이름, 대통령 이름 출력

SELECT CODE, NAME, HeadofState
FROM country
WHERE CODE IN(
					SELECT DISTINCT(countrycode) 
					FROM city 
					WHERE population > 800000
					) 


# index : 데이터를 검색할 때 빠르게 찾을 수 있도록 해주는 기능
# inndex : 목차가 있고 없고의 차이
USE employees

EXPLAIN #실행계획을 보는 함수
SELECT COUNT(*)
FROM salaries
WHERE to_date > "2000-01-01"

# index 만드는 방법
CREATE INDEX tdate
ON salaries (to_date)
# 이후에  다시 조회하게 되면 type이 range로 나오는 것을 확인할 수 있다. all이 아니라 
# index가 많으면 데이터가 커지고 속도가 느려질 수도 있다. where 절에 사용되는 컬럼을 인덱스로 지정해준다.  많이 쓰는게 좋지는 않다.
# index 삭제하기
DROP INDEX tdate
ON salaries

# view : 특정 쿼리문에 대한 결과를 저장하는 개념
# 이렇게 만들어지 것은 테이블처럼 사용이 가능하다.
USE world
CREATE VIEW code_name AS 
SELECT CODE, NAME
FROM country

# view를 왜 쓰는지 코드와 네임데이터가 있어서 알아서 붙는다...
SELECT *
FROM city
JOIN code_name
ON city.countrycode = code_name.code

# 만약에  view를 쓰지 않는다면?
SELECT *
FROM city
JOIN 

(SELECT CODE, NAME
FROM country) AS code_name # 예를 걔속 써야하는 번거로움이 있으니 view를 써야한다. 수정복사 불가하고 그냥 쿼리만 가져오는 것..

ON city.countrycode = code_name.Code


#quiz 3

USE world
# 1. 값 바로 넣어버림...
SELECT NAME, population
FROM country
WHERE population > 98881000
ORDER BY population DESC

# 2. 

SELECT *
FROM city

SELECT countrycode, COUNT(district) AS COUNT1
FROM city
GROUP BY countryCode
ORDER BY COUNT1

SELECT COUNT(district) AS COUNT1
FROM city

SELECT *
FROM
	(SELECT COUNT(district) AS COUNT1
	FROM city
	GROUP BY countrycode
	ORDER BY COUNT1) AS city1
JOIN

SELECT country.name AS city_name, city.district AS city_district
	FROM city
	#GROUP BY countrycode
	#ORDER BY COUNT1
	JOIN country
	ON city.countrycode = country.Code


SELECT *
FROM 
	(SELECT countrycode, COUNT(district) AS COUNT1
	FROM city
	GROUP BY countrycode
	ORDER BY COUNT1 desc
	LIMIT 0, 10) AS city1
JOIN
	(SELECT NAME, code
	FROM country) AS country1
ON city1.countrycode = country1.code



SELECT country.name As city_name, countrycode, COUNT(district) AS COUNT1
	FROM city
	GROUP BY countrycode
	ORDER BY COUNT1 desc
	LIMIT 0, 10
JOIN country
ON city.countrycode = country.Code

#3. 
SELECT *
FROM countrylanguage
SELECT *
FROM country

SELECT countrylanguage.language AS language, country.Population AS COUNT
FROM countrylanguage
ORDER BY population desc
LIMIT 0, 10
JOIN country
ON countrylanguage.countrycode = country.Code

####20200214#####

#quiz 1.1

SELECT DISTINCT(continent)
FROM country

SELECT continent
FROM country
GROUP BY continent

#quiz 1.2

SELECT NAME, population
FROM city
where countrycode = "KOR" AND population > 1000000
# and는 왼쪽에서 오른쪽 순서대로 하고 ()를 쓰면 () 연산을 우선으로 한다.

# quiz 1.3
SELECT NAME, countrycode, population
FROM city
WHERE population BETWEEN 8000000 AND 10000000 # 이 숫자까지 다 포함한다. 이상 이하 개념
ORDER BY population DESC

# quiz 1.4

SELECT code, CONCAT(NAME, "(", IndepYear,")") AS NameIndep ,continent, population
FROM country
WHERE IndepYear BETWEEN 1940 AND 1950
ORDER BY IndepYear

# quiz 1.5
# 데이터를 먼저 보고 싶다면 limit 만큼 검색이 되도록 한다..
SELECT *
FROM countrylanguage
LIMIT 10

SELECT * 
FROM countrylanguage
WHERE percentage >= 95 AND LANGUAGE IN ("spanish", "Korean", "English")
ORDER BY percentage desc


# join & sub-query
# quiz 3.1

# 사용하는 언아가 3가지 이하
SELECT countrycode, COUNT(LANGUAGE) AS language_count
FROM countrylanguage
GROUP BY countrycode
HAVING language_count <= 3

# alb만 조회 해보기
SELECT *
FROM countrylanguage
WHERE countrycode = "ALB"

# group concat 사용
SELECT countrycode, group_concat(LANGUAGE) AS languages, COUNT(LANGUAGE) AS language_count
FROM countrylanguage
GROUP BY countrycode
HAVING language_count <= 3


# 인구가 300만 이상인 도시
SELECT *
FROM city
WHERE population > 3000000

#join
select city.countrycode, city.name, city.population, country.name, city.language_count, city.languages # 전체 결과를 city로 해줬기 때문에 cl을 city로 변경해준다.
from
	SELECT city.countrycode, city.name, city.population, cl.language_count, cl.languages
	from
		(SELECT countrycode, group_concat(LANGUAGE) AS languages, COUNT(LANGUAGE) AS language_count
		FROM countrylanguage
		GROUP BY countrycode
		HAVING language_count <= 3) AS cl
	JOIN
		(SELECT *
		FROM city
		WHERE population > 3000000) AS city
	ON city.countrycode = cl.countrycode
JOIN
	country
ON country.code = city.countrycode



CREATE VIEW cl AS
	SELECT city.countrycode, city.name, city.population, cl.language_count, cl.languages
	from
		(SELECT countrycode, group_concat(LANGUAGE) AS languages, COUNT(LANGUAGE) AS language_count
		FROM countrylanguage
		GROUP BY countrycode
		HAVING language_count <= 3) AS cl
	JOIN
		(SELECT *
		FROM city
		WHERE population > 3000000) AS city
	ON city.countrycode = cl.countrycode


# view 이용
select city.countrycode, city.name, city.population, country.name, city.language_count, city.languages # 전체 결과를 city로 해줬기 때문에 cl을 city로 변경해준다.
FROM
	cl AS city
JOIN
	country
ON country.code = city.countrycode



# quiz 4.3

USE sakila

SELECT *
FROM category
LIMIT 10


SELECT *
FROM payment, rental, inventory, film_category, category
WHERE payment.rental_id = rental.rental_id
	AND rental.inventory_id = inventory.inventory_id
	AND inventory.film_id = film_category.film_id
	AND film_category.category_id = category.category_id

SELECT category.name, sum(payment.amount) AS amount
FROM payment, rental, inventory, film_category, category
WHERE payment.rental_id = rental.rental_id
	AND rental.inventory_id = inventory.inventory_id
	AND inventory.film_id = film_category.film_id
	AND film_category.category_id = category.category_id
GROUP BY category.name
ORDER BY amount desc

















































