DROP TABLE IF EXISTS abonement CASCADE;
DROP TABLE IF EXISTS books CASCADE;
DROP TABLE IF EXISTS readers CASCADE;

CREATE TABLE readers (
    reader_id   integer PRIMARY KEY,
    last_name   varchar(40) NOT NULL,
    first_name  varchar(40) NOT NULL,
    patronymic  varchar(40),
    birth_date  date        NOT NULL,
    address     varchar(100) NOT NULL,
    phone       varchar(20),
    passport    varchar(20)
);

CREATE TABLE books (
    book_id    integer PRIMARY KEY,
    title      varchar(100) NOT NULL,
    author     varchar(80)  NOT NULL,
    publisher  varchar(60),
    pub_year   integer,
    pages      integer
);

CREATE TABLE abonement (
    loan_id     integer PRIMARY KEY,
    reader_id   integer NOT NULL,
    book_id     integer NOT NULL,
    issue_date  date    NOT NULL,
    return_date date,
    CONSTRAINT fk_abonement_reader FOREIGN KEY (reader_id) REFERENCES readers (reader_id),
    CONSTRAINT fk_abonement_book   FOREIGN KEY (book_id)   REFERENCES books (book_id)
);

INSERT INTO readers VALUES
 (1,  'Абрамов',   'Иван',     'Петрович',     '1990-03-14', 'Шипиловская ул., д. 12',   '89151110001', '4510 123456'),
 (2,  'Белова',    'Анна',     'Сергеевна',    '1990-07-02', 'Шипиловская ул., д. 7',    '89151110002', '4510 234567'),
 (3,  'Воронин',   'Дмитрий',  'Алексеевич',   '1990-11-23', 'Шипиловская ул., д. 30',   '89151110003', '4511 345678'),
 (4,  'Громова',   'Ольга',    'Игоревна',     '1990-01-30', 'Шипиловская ул., д. 3',    NULL,          '4511 456789'),
 (5,  'Дроздов',   'Павел',    'Андреевич',    '1985-05-19', 'Домодедовская ул., д. 8',  NULL,          NULL),
 (6,  'Егорова',   'Мария',    'Николаевна',   '1992-09-09', 'Домодедовская ул., д. 15', '89151110006', '4512 567890'),
 (7,  'Зайцев',    'Кирилл',   'Олегович',     '1990-04-05', 'Борисовский пр., д. 2',    NULL,          NULL),
 (8,  'Беляев',    'Сергей',   'Викторович',   '1979-12-01', 'Каширское ш., д. 44',      '89151110008', '4513 678901'),
 (9,  'Иванова',   'Татьяна',  'Юрьевна',      '1995-02-17', 'Домодедовская ул., д. 21', NULL,          '4514 789012'),
 (10, 'Волков',    'Артём',    'Денисович',    '1988-08-25', 'Ореховый б-р, д. 10',      '89151110010', NULL),
 (11, 'Смирнова',  'Елена',    'Павловна',     '1990-06-11', 'Шипиловская ул., д. 19',   '89151110011', '4515 890123'),
 (12, 'Козлов',    'Николай',  'Фёдорович',    '1975-10-30', 'Шипиловская ул., д. 25',   '89151110012', '4516 901234');

INSERT INTO books VALUES
 (1, 'Мастер и Маргарита',    'Булгаков М.А.',   'Эксмо',        2010, 480),
 (2, 'Война и мир',           'Толстой Л.Н.',    'АСТ',          2015, 1300),
 (3, 'Преступление и наказание','Достоевский Ф.М.','Азбука',      2012, 560),
 (4, 'Двенадцать стульев',    'Ильф И., Петров Е.','Москва-Книга', 2008, 400),
 (5, 'Евгений Онегин',        'Пушкин А.С.',     'Просвещение',  2005, 240);

INSERT INTO abonement VALUES
 (1, 1,  1, '2026-09-01', '2026-09-15'),
 (2, 2,  2, '2026-09-03', NULL),
 (3, 3,  3, '2026-09-10', '2026-09-24'),
 (4, 1,  4, '2026-10-02', NULL),
 (5, 6,  5, '2026-10-05', '2026-10-19'),
 (6, 8,  1, '2026-10-07', NULL),
 (7, 8,  2, '2026-10-12', NULL),
 (8, 10, 3, '2026-10-15', '2026-10-29'),
 (9, 11, 4, '2026-10-20', NULL),
 (10, 12, 5, '2026-10-21', NULL),
 (11, 3,  1, '2026-11-01', NULL);
