SELECT id,
       first_name AS f_name,
       last_name  AS l_name
FROM employee;

INSERT INTO employee (first_name, last_name, salary)
VALUES ('Ivan', 'Sidrov', 500);

/*
eyni first_name-li employeelərdən yalnız 1ni qaytarır
*/
SELECT DISTINCT ON (first_name) first_name,
                                last_name,
                                salary
FROM employee;

/*
cədvəldən yalnız 2 employeeni istəyirik LIMIT-dən istifadə edirik.
*/
SELECT id,
       first_name,
       last_name,
       salary
FROM employee
LIMIT 2;

/*cədvəldən LIMIT vasitəsilə 2 employee istəyirik amma OFFSET vasitəsilə 1-ni buraxırıq.
Yəni 1ci employeedən başqa 2 və 3 gələcək.*/
SELECT id,
       first_name,
       last_name,
       salary
FROM employee
LIMIT 2 OFFSET 1;


/*
Order by vasitəsilə sortlama edilir hansı sütün sortlanacaqsa o yazılır default olaraq ASC-dir. Kiçikdən böyüyə istəsək DESC yazırıq
*/
SELECT id,
       first_name,
       last_name,
       salary
FROM employee
ORDER BY first_name DESC
-- LIMIT 2 OFFSET 2;


/*
Sortlama first_name və salary-ə əsasən baş verir. first_name-lər eyni olduqda bu sətirlər arası sortlama salarya keçir.
*/
SELECT id,
       first_name,
       last_name,
       salary
FROM employee
ORDER BY first_name, salary;
