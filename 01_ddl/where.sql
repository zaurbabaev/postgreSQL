/*
WHERE- filtirasiya etmək üçün
*/

SELECT *
FROM employee;

/*
müqayisə operatorları rəqəm və tarixlərdə istifadə olunur.
*/
SELECT id,
       first_name,
       last_name,
       salary
FROM employee
WHERE salary > 1000
ORDER BY salary;

/*
Sətirlərdə = istifadə olnur.
*/
SELECT id,
       first_name,
       last_name,
       salary
FROM employee
WHERE first_name = 'Ivan';

/*Pet ilə başlayan first_nameni tapmaq % işarəsi əvvəldə gələrsə əvvəldən müxtəlif sayda
  sonda gələrsə sondan müxtəlif sayda simvol deməkdir*/
SELECT id,
       first_name,
       last_name,
       salary
FROM employee
WHERE first_name LIKE 'Pet%';

/*LIKE registira həssasdır. yəni Upper və lover fərqi vardır. Bunları nəzrə almamaq üçün Postgresin özünün ILIKE-si var*/
SELECT id,
       first_name,
       last_name,
       salary
FROM employee
WHERE last_name LIKE '%ov'
ORDER BY salary DESC;

SELECT id,
       first_name,
       last_name,
       salary
FROM employee
WHERE last_name ILIKE '%Ov';

/*1000 və 1500 arası salary-ni tapmaq BETWEEN*/
SELECT id,
       first_name,
       last_name,
       salary
FROM employee
WHERE salary BETWEEN 1000 AND 1500;

/* IN istifadə edərkən mötərizə daxilində olan dəyərlərə uyğun olan cavablar gələcək. IN və ya deməkdir*/
SELECT id,
       first_name,
       last_name,
       salary
FROM employee
WHERE salary IN (1000, 1500, 2000);

/*IN daxilindəki şərtlərdən biri olan və adı Iv-lə başlayan employeelər*/
SELECT id,
       first_name,
       last_name,
       salary
FROM employee
WHERE salary IN (1000, 1100, 2000)
  AND first_name LIKE 'Iv%';

/*IN-də daxilində olan salarylərə uyğun olanı və ya first_name İv ilə başlayan employeelər*/
SELECT id,
       first_name,
       last_name,
       salary
FROM employee
WHERE salary IN (1000, 1100, 2000)
   OR first_name LIKE 'Iv%';

