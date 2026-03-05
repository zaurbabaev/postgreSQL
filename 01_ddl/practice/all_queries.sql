CREATE DATABASE book_repository;

/*Author cədvəli parent olduğundan və book cədvəli onun primary keysini sağladığına görə
  ilk olaraq author cədvəli yaradırıq.*/

CREATE TABLE author
(
    id         INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(128) NOT NULL,
    last_name  VARCHAR(128) NOT NULL,
    UNIQUE (first_name, last_name)
);

CREATE TABLE book
(
    id                  INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title               VARCHAR(128) NOT NULL,
    year_of_publication SMALLINT     NOT NULL,
    page_count          SMALLINT     NOT NULL,
    author_id           INTEGER,
    FOREIGN KEY (author_id)
        REFERENCES author (id)
        ON DELETE SET NULL
);

INSERT INTO author (first_name, last_name)
VALUES ('Кей', 'Хорстманн'),
       ('Стивен', 'Кови'),
       ('Тони', 'Роббинс'),
       ('Наполеон', 'Хилл'),
       ('Роберт', 'Кийосаки'),
       ('Дейл', 'Карнеги');


INSERT INTO book (title, year_of_publication, page_count, author_id)
VALUES ('Java. Библиотеку профессионала. Том 1', 2010, 1102,
        (SELECT id FROM author WHERE last_name = 'Хорстманн')),
       ('Java. Библиотеку профессионала. Том 2', 2012, 954,
        (SELECT id FROM author WHERE last_name = 'Хорстманн')),
       ('Java SE 8. Вводный курс', 2015, 203, (SELECT id FROM author WHERE last_name = 'Хорстманн')),
       ('7 навыков высокоэффективных людей', 1989, 396, (SELECT id FROM author WHERE last_name = 'Кови')),
       ('Разбуди в себе исполина', 1991, 576, (SELECT id FROM author WHERE last_name = 'Роббинс')),
       ('Думай и богатей', 1937, 336, (SELECT id FROM author WHERE last_name = 'Хилл')),
       ('Богатый папа, бедный папа', 1997, 352, (SELECT id FROM author WHERE last_name = 'Кийосаки')),
       ('Квадрант денежного потока', 1998, 368, (SELECT id FROM author WHERE last_name = 'Кийосаки')),
       ('Как перестать беспокоиться и начать жить', 1948, 368,
        (SELECT id FROM author WHERE last_name = 'Карнеги')),
       ('Как завоевывать друзей и оказывать влияние на людей', 1936, 352,
        (SELECT id FROM author WHERE last_name = 'Карнеги'));


/* Написать запрос, выбирающий: название книги, год и имя автора, отсортированные по году издания книги в возрастающем порядке.
   Написать тот же запрос, но для убывающего порядка. */
SELECT b.title,
       b.year_of_publication,
       (SELECT a.first_name
        FROM author a
        WHERE a.id = b.author_id) author_name
FROM book b
ORDER BY b.year_of_publication;

/* Написать тот же запрос, но для убывающего порядка. */
SELECT b.title,
       b.year_of_publication,
       (SELECT a.first_name
        FROM author a
        WHERE a.id = b.author_id) author_name
FROM book b
ORDER BY b.year_of_publication DESC;

/* Написать запрос, выбирающий количество книг у заданного автора. */
SELECT COUNT(id)
FROM book
WHERE author_id IN
      (SELECT id FROM author WHERE first_name = 'Кей');

/* Написать запрос, выбирающий количество книг всех авторов */
SELECT a.id                               AS id,
       a.first_name || ' ' || a.last_name AS fullname,
       (SELECT COUNT(b.id)
        FROM book b
        WHERE b.author_id = a.id)            count_of_authors_book
FROM author a;

/* Написать запрос, выбирающий книги, у которых количество страниц больше среднего количества страниц по всем книгам */
SELECT b.title,
       b.page_count
FROM book b
WHERE b.page_count > (SELECT AVG(page_count) FROM book);


/* Написать запрос, выбирающий 5 самых старых книг */
SELECT title,
       year_of_publication
FROM book
ORDER BY year_of_publication
LIMIT 5;

/* Дополнить запрос и посчитать суммарное количество страниц среди этих книг */
SELECT SUM(page_count)
FROM (SELECT *
      FROM book
      ORDER BY year_of_publication
      LIMIT 5) sum_of_5_books;

/* Написать запрос, изменяющий количество страниц у одной из книг */
UPDATE book
SET page_count=750
WHERE id = 3;

UPDATE book
SET page_count= page_count + 5
WHERE id = 3;


/* Написать запрос, удаляющий автора, который написал самую большую книгу*/

SELECT author_id
FROM book
WHERE page_count = (SELECT MAX(book.page_count) FROM book);

DELETE
FROM author a
WHERE id = (SELECT author_id
            FROM book
            WHERE page_count = (SELECT MAX(book.page_count) FROM book));

SELECT *
FROM book;

SELECT *
FROM author;


