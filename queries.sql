SELECT *
FROM readers
WHERE EXTRACT(YEAR FROM birth_date) = 1990
  AND address LIKE 'Шипиловская%';

SELECT last_name, phone
FROM readers
WHERE LEFT(last_name, 1) IN ('А', 'Б', 'В')
  AND phone IS NOT NULL;

DROP TABLE IF EXISTS readers_1990;
CREATE TABLE readers_1990 AS
SELECT *
FROM readers r
WHERE EXTRACT(YEAR FROM r.birth_date) = 1990
  AND r.address LIKE 'Шипиловская%'
  AND NOT EXISTS (SELECT 1 FROM abonement a WHERE a.reader_id = r.reader_id);

SELECT * FROM readers_1990 ORDER BY reader_id;

INSERT INTO readers_1990
SELECT *
FROM readers r
WHERE r.phone IS NULL
  AND r.reader_id NOT IN (SELECT reader_id FROM readers_1990);

SELECT * FROM readers_1990 ORDER BY reader_id;

UPDATE readers_1990
SET address = REPLACE(address, 'Домодедовская ул.', 'Борисовский проезд')
WHERE address LIKE 'Домодедовская%';

SELECT * FROM readers_1990 ORDER BY reader_id;

DELETE FROM readers_1990
WHERE passport IS NULL;

SELECT * FROM readers_1990 ORDER BY reader_id;

SELECT r.reader_id,
       r.last_name || ' ' || r.first_name AS reader,
       COUNT(a.loan_id) AS books_taken
FROM readers r
LEFT JOIN abonement a ON a.reader_id = r.reader_id
GROUP BY r.reader_id, r.last_name, r.first_name
ORDER BY r.reader_id;
