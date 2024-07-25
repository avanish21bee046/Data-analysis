CREATE DATABASE projects;
SHOW DATABASES;

USE projects;

SELECT * FROM HR;

ALTER TABLE HR
CHANGE column ï»¿id emp_id VARCHAR(20) NULL;

DESCRIBE HR; 

SELECT birthdate FROM HR;

SET sql_safe_updates = 0;

UPDATE HR 
SET birthdate = CASE 
WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
ELSE NULL 
END;

ALTER TABLE HR
MODIFY COLUMN birthdate DATE;

UPDATE HR 
SET hire_date = CASE 
WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d')
ELSE NULL 
END;

ALTER TABLE HR
MODIFY COLUMN hire_date DATE;

SELECT birthdate FROM HR; 
SELECT hire_date FROM HR; 

UPDATE HR
SET termdate = date(str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC'));

UPDATE  HR
SET termdate = '0000-00-00' 
WHERE termdate = '';

ALTER TABLE HR
MODIFY COLUMN termdate DATE;

SELECT termdate FROM HR; 
SELECT termdate FROM HR;	

ALTER TABLE HR ADD COLUMN age INT;

UPDATE HR
SET age = timestampdiff(YEAR,birthdate,CURDATE());

SELECT * FROM HR; 
SELECT birthdate,age FROM HR;

SELECT MIN(age) AS youngest, MAX(age) oldest FROM HR;

-- ANSWERS--

SELECT gender, count(*) AS count FROM HR WHERE age >= 18 GROUP BY gender;
SELECT race, count(*) AS count FROM HR WHERE age >= 18 GROUP BY race ORDER BY count(*) DESC;

SELECT MIN(age) AS YOUNGEST, MAX(age) oldest
FROM HR; 

SELECT CASE WHEN age>=18 AND age<=24 THEN '18-24'
            WHEN age>=25 AND age<=34 THEN '25-34'
            WHEN age>=35 AND age<=44 THEN '35-44'
            WHEN age>=45 AND age<=54 THEN '45-54'
            WHEN age>=55 AND age<=64 THEN '18-24'
            ELSE '65+'
END AS age_group,
count(*) AS count   
FROM HR WHERE age>=18 GROUP BY age_group ORDER BY age_group;  

SELECT location, COUNT(*) AS count 
FROM HR 
WHERE age >= 18 GROUP BY location;           

SELECT 
    avg(datediff(termdate, hire_date))/365 AS avg_length_employment
FROM HR 
WHERE termdate <= curdate() AND age >= 18;

SELECT department, gender, COUNT(*) AS count 
FROM HR 
WHERE age >= 18 GROUP BY department, gender
ORDER BY department;

SELECT jobtitle, count(*) AS count 
FROM HR 
WHERE age >= 18 GROUP BY jobtitle ORDER BY jobtitle DESC;

SELECT locatio_state, count(*) AS count
FROM HR
WHERE age >= 18 GROUP BY location_state
ORDER BY count DESC;
   
SELECT * FROM HR;     
     



