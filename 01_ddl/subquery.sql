/*Minimal salarysı olan 2 işçi*/
SELECT *
FROM employee
ORDER BY salary
LIMIT 2;


/*Həmin bu 2 işçinin avg-si tapmaq üçün subquery yazılır sonda bu queryə alias verilməlidir
  Vacib məqam budur ki biz FROM-dan sonra cədvəl deyildə Select vasitəsilə bu cədvəldən gələn nəticəyə görə
  edirik.
*/
SELECT AVG(empl.salary)
FROM (SELECT *
      FROM employee
      ORDER BY salary
      LIMIT 2) empl;


/*Maximal salarysi olan 2 işçi üçün*/
SELECT *
FROM employee
ORDER BY salary DESC
LIMIT 2;


SELECT AVG(emp.salary)
FROM (SELECT *
      FROM employee
      ORDER BY salary DESC
      LIMIT 2) emp;


/* Bütün eployeelər və qarşılarında avg(salary)*/
SELECT *,
       (SELECT AVG(salary) FROM employee) avg
FROM employee;

/* Bütün eployeelər və qarşılarında avg(salary)-dan başqa max(salary)-da görstərsin bu zaman avg və max
   hər biri üçün ayrıca subquery yazılmalıdır*/
SELECT first_name,
       last_name,
       salary,
       (SELECT AVG(salary) FROM employee) avg,
       (SELECT MAX(salary) FROM employee) max
FROM employee;

/* Max salary ilə employee-nin aldığı salary arasındakı fərq*/
SELECT first_name AS name,
       last_name  AS surname,
       salary,
       (SELECT MAX(salary)
        FROM employee) - salary
                  AS max_sal_diff
FROM employee;




