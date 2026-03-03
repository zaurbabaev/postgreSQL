/* 2 müxtəlif cədvəldə oxşar sütunlar olarsa
   1 select vasitəsilə hər 2 cədvəl məlumatlarını gətirmək üçün
   UNİON-dan istifadə olunur UNİON ALL bütün məlumatları gətirir oxşar olsa belə javada LİST kimi düşünmək olar*/

/* Eyni cədvələ mürəkkəb sorğu göndərmək və bu nəticəni birləşdirmək üçündə istifadə olunur*/
SELECT first_name
FROM employee
WHERE company_id IS NOT NULL
UNION ALL
SELECT first_name
FROM employee
WHERE salary IS NULL;

/*Sadə UNION javada SET kimi işləyir*/
SELECT first_name
FROM employee
WHERE company_id IS NOT NULL
UNION
SELECT first_name
FROM employee
WHERE salary IS NULL;

/* UNION istifadə etmək üçün:
Sütun sayı eyni olmalıdır
Data tipləri uyğun olmalıdır
Sütun sırası eyni olmalıdır

UNION
Duplicate sətrləri silir
DISTINCT kimi davranır
Bir az yavaşdır

UNION ALL
Duplicate-ləri silmir
Daha sürətlidir

*/

