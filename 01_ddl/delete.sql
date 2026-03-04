/*DELETE vasitəsilə 1 cədvəlsən silmək mümkündür*/
DELETE
FROM employee;
/* Bu əmrlə biz employee cədvəlində olan bütün məlumatları silirik*/

/*Salary-sı NULL olan employeeni silək*/
DELETE
FROM employee
WHERE salary IS NULL;

/*Ən yüksək maaşlı employeeni silək*/
DELETE
FROM employee
WHERE salary = (SELECT MAX(salary) FROM employee);

/*Company cədvəlində silmə edə bilmərik. ÇÜnki bu cədvəlin başqa bir cədvəldə yəni employee-də id-si vardır.
  Bu Foreign key olan company_id sütunudur*/
/*] ERROR: update or delete on table "company" violates foreign key constraint "employee_company_id_fkey"
  on table "employee"
Detail: Key (id)=(1) is still referenced from table "employee".*/
DELETE
FROM company
WHERE id = 1;

/*Company cədvəlində delete edə bilmək üçün ilk employee cədvəlində həmin id-ni saxlayan employeeni silmək lazımdır.
  Yada onun company_id-sini null etmək lazımdır*/

DELETE
FROM employee
WHERE company_id = 1;

DELETE
FROM company
WHERE id = 1;

/*Başqa üsul kimi biz cədvələ FOREİGN KEY əlavə edən zaman əlavələrdə edə bilərik
  Bunlaar Foreign key referential action adlanır.

  Action	        Nəticə
CASCADE	        Parent dəyişəndə və ya silinəndə child avtomatik dəyişir.
SET NULL	    Parent silinəndə child-də foreign key NULL olur.
SET DEFAULT	    Parent silinəndə child sütunu default dəyərə keçir.
RESTRICT	    Parent silinməsinə icazə vermir əgər child varsa. Error
NO ACTION	    Əgər bağlı child varsa silməyə icazə vermir. (defaultdur)
  */

/*Bu üsulla cədvəl yaradıldıqda artıq company cədvəlindən delete etdikdə bu cədvələ bağlı employeelərdə silinir
  Yəni parent silinirsə childdə silinir*/
CREATE TABLE employee
(
    id         INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(128) NOT NULL,
    last_name  VARCHAR(128) NOT NULL,
    salary     INTEGER,
    company_id INTEGER REFERENCES company (id) ON DELETE CASCADE,
    UNIQUE (first_name, last_name)
);

INSERT INTO employee (first_name, last_name, salary, company_id)
VALUES ('Ivan', 'Sidrov', 500, (SELECT id FROM company WHERE name = 'Google')),
       ('Ivan', 'Ivanov', 1000, (SELECT id FROM company WHERE name = 'Apple')),
       ('Petr', 'Petrov', 2000, (SELECT id FROM company WHERE name = 'Facebook')),
       ('Sveta', 'Svetikova', 1500, NULL),
       ('Arni', 'Paramonov', NULL, (SELECT id FROM company WHERE name = 'Apple'));



SELECT *
FROM employee;

SELECT *
FROM company;