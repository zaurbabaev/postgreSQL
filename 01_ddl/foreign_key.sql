/*Foreign key 2 üsulla yaratmaq olar
  1ci üsul ən çox istifadə olunan
*/
CREATE TABLE employee
(
    id         INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(128) NOT NULL,
    last_name  VARCHAR(128) NOT NULL,
    salary     INTEGER,
    company_id INTEGER REFERENCES company (id),
    UNIQUE (first_name, last_name)
);

/* 2ci üsul*/
CREATE TABLE employee
(
    id         INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(128) NOT NULL,
    last_name  VARCHAR(128) NOT NULL,
    salary     INTEGER,
    company_id INTEGER,
    UNIQUE (first_name, last_name),
    FOREIGN KEY (company_id) REFERENCES company (id)
);

INSERT INTO employee (first_name, last_name, salary, company_id)
VALUES ('Ivan', 'Sidrov', 500, (SELECT id FROM company WHERE name = 'Google')),
       ('Ivan', 'Ivanov', 1000, (SELECT id FROM company WHERE name = 'Facebook')),
       ('Petr', 'Petrov', 2000, (SELECT id FROM company WHERE name = 'Apple')),
       ('Sveta', 'Svetikova', 1500, (SELECT id FROM company WHERE name = 'Facebook')),
       ('Arni', 'Paramonov', NULL, (SELECT id FROM company WHERE name = 'Google'));


/*Subquery istifadə etməklə company_name-nin gətirilməsi*/
SELECT id,
       first_name,
       last_name,
       salary,
       (SELECT name FROM company WHERE id = company_id) company_name
FROM employee;

