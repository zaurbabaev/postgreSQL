/*
Aggregation Functions => SUM, AVG, MAX, MIN, COUNT adətən GROUP BY ilə birlikdə istifadə olunur.
Bu funksiyaların adı ona görə belədir ki, 1 neçə sətiri birləşdirərək 1 sətir qaytarır
*/

/*
Bütün salary sütununun cəmi SUM
*/
SELECT SUM(salary)
FROM employee;

/*
Cədvəldəki bütün salary sütununun ədədi ortasını hesablayır.
*/
SELECT AVG(salary)
FROM employee;

/*
Hər employee sətrində onun maaşı ilə birlikdə ümumi orta maaş (avg) də görünsün.
*/
SELECT first_name,
       salary,
       AVG(salary) OVER () AS avg_salary
FROM employee
GROUP BY first_name, salary;

/*
MAX salary
*/
SELECT MAX(salary)
FROM employee;

/*
MIN salary
*/
SELECT MIN(salary)
FROM employee;

/*
Cədvəldəki bütün sətrlərin sayını qaytarır count(*).
*/
SELECT COUNT(*)
FROM employee;

/*
Salary-sı NULL olan employee əlavə edək
*/
INSERT INTO employee(first_name, last_name)
VALUES ('Arni', 'Paramonov');

/*
count(column) yazsaq o zaman NULL olmayan columnları qaytaracaq
*/
SELECT COUNT(salary)
FROM employee;

SELECT *
FROM employee;


/*
Bütün hərflər kiçik
*/
SELECT LOWER(first_name)
FROM employee;

/*
Bütün hərflər böyük
*/
SELECT UPPER(first_name)
FROM employee;

/*
İlk hərf böyük sonrakılar kiçik
*/
SELECT INITCAP(first_name)
FROM employee;

/*
Sətirləri birləşdirmək
*/
SELECT CONCAT(first_name, CONCAT(' ', last_name))
FROM employee;

SELECT CONCAT(first_name, ' ', last_name) AS fullname
FROM employee;

/*
Sətirləri birləşdirmək üçün daha sadə üsul || istifadə etməkdir
*/
SELECT first_name
           || ' ' ||
       last_name AS full_name
FROM employee;

/*
Serverə üzrə cari tarixi göstərir
*/
SELECT now();