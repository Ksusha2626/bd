-- В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы
-- данных. Переместите запись id = 1 из таблицы shop.users в таблицу
-- sample.users. Используйте транзакции.
START TRANSACTION;
INSERT into sample.users (id, name ) select id, firstname from  shop.users where id = 1;
COMMIT;

-- Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее название каталога name из таблицы catalogs.
Create or REPLACE view good_name as select p.name, c.name as catalog_name from db.products p
join catalogs c on p.catalog_id = c.id

-- (по желанию) Пусть имеется любая таблица с календарным полем created_at.
-- Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей.

DELETE FROM db.users
WHERE created_at NOT IN (
SELECT * FROM (SELECT created_at FROM db.users
ORDER BY created_at DESC LIMIT 5) AS selected);


***********************************************************************************************************************
-- Практическое задание по теме “Хранимые процедуры и функции, триггеры"
-- Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток.
-- С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
-- с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
DELIMITER //
DROP FUNCTION IF EXISTS hello//
CREATE FUNCTION  hello()
RETURNS TEXT DETERMINISTIC
BEGIN
	declare time int;
	SET time = time(now());
	CASE
        WHEN time BETWEEN 6 AND 12 THEN RETURN "Доброе утро";
        WHEN time BETWEEN 12 AND 18 THEN RETURN "Добрый день";
		WHEN time BETWEEN 18 AND 23 THEN RETURN "Добрый вечер";
        ELSE RETURN "Доброй ночи";
    END CASE;
END//

select hello()

--В таблице products есть два текстовых поля: name с названием товара и description с его описанием.
--Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема.
--Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены.
--При попытке присвоить полям NULL-значение необходимо отменить операцию.

DELIMITER //
DROP TRIGGER IF EXISTS check_insert//
CREATE TRIGGER check_insert BEFORE INSERT ON products
FOR EACH ROW
BEGIN
  IF NEW.name IS NULL AND NEW.description IS NULL THEN
  	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ошибка вставки значения';
  END IF;
END//