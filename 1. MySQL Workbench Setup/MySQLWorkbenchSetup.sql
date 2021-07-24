SELECT *
FROM users;
SELECT first_name, last_name
FROM users
WHERE first_name LIKE '%n';
INSERT INTO users (first_name,last_name) 
VALUES('Benjamin', 'Livingstone');
UPDATE users 
SET first_name = 'Michael', last_name='Jordan'
WHERE id=5;
SET SQL_SAFE_UPDATES = 0;
DELETE FROM users WHERE id=6;

SELECT * FROM information_schema.columns WHERE COLUMN_NAME like '%USER%' AND table_schema='twitter';
SELECT *
FROM tweets;
SELECT *
FROM faves;


