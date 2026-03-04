/*Company-si olmayan employee-yə company əlavə edək*/
UPDATE employee
SET company_id=(SELECT id FROM company WHERE name = 'Google')
WHERE first_name = 'Sveta';

/* Update və Delete etdikdə nəticə olaraq bizə ancaq neçə sətir dəyişildiyi və silindiyi barədə output qayıdır.
  Əgər biz bütün məlumatları görmək istəyiriksə o zaman
  RETURNING * istifadə edə bilərik bu zaman bütün sətir bizə qayıdacaq */
UPDATE employee
SET company_id=(SELECT id FROM company WHERE name = 'Google')
WHERE first_name = 'Sveta'
RETURNING *;

/* RETURNING (column) yazdıqda isə hansı column göstərilibsə onlarda nəticə olaraq bizə qayıdacaq. */
UPDATE employee
SET company_id=(SELECT id FROM company WHERE name = 'Google')
WHERE first_name = 'Sveta'
RETURNING first_name, last_name;

SELECT *
FROM employee;