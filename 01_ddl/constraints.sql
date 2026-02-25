CREATE TABLE company
(
    id   INT PRIMARY KEY,
    name VARCHAR(128) UNIQUE,
    date DATE NOT NULL CHECK ( date > '1995-01-01' AND date < '2020-01-01')

    /*PRIMARY KEY (id), constaraintləri belədə elan edə bilərik. sütun adı və tipi
    verdikdən sonra son olaraq hər bir sütuna müvafiq constraint verə bilərik.
    UNIQUE (name), burada name uniquedir və ya
    UNIQUE (name, date) burada isə name+date birlikdə uniquedir. bu zaman eyni adlı
    companiya yarada bilərik lakin tarixlər fərqli olmalıdır.
    */
);

DROP TABLE company;

/*CONSTRAINTS
    NOT NULL - mütləq olaraq dəyər verilməlidir null ola bilməz
    UNIQUE - təkrarlana bilməz
    CHECK - hansısa şərtə əməl olunmaldır. Yuxarıda tarix 1995-dən böyük 2020-dən kiçik olmalıdır.
    PRIMARY KEY - hər bir cədvəldə mütləq olmalı constraintdir. O həm UNİQUE həmdə NOT NULL-dur. Bir cədvəldə 1-dən çox primary key ola bilməz.
    FOREIGN KEY - xarici açardır. CHILD cədvəldə saxlanılan və PARENT cədvəlin primary key-sinə istinad edən sütundur.
*/
