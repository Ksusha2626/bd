--Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.

UPDATE users SET created_at = NOW() and updated_at  = NOW()

-- Таблица users была неудачно спроектирована.
-- Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10".
-- Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.

ALTER TABLE users MODIFY created_at DATETIME,
                  MODIFY updated_at DATETIME


-- В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры:
-- 0, если товар закончился и выше нуля, если на складе имеются запасы.
-- Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value.
-- Однако, нулевые запасы должны выводиться в конце, после всех записей.

select * from storehouses_products order by if(value = 0, 1, 0);

-- (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs WHERE id IN (5, 1, 2);
-- Отсортируйте записи в порядке, заданном в списке IN.


SELECT * FROM catalogs WHERE id IN (5, 1, 2)
ORDER BY CASE
		WHEN id = 5 THEN 0
		WHEN id = 1 THEN 1
		WHEN id = 2 THEN 2
END;


--  “Агрегация данных”

-- Подсчитайте средний возраст пользователей в таблице users
-- P.S у меня дни рождения в таблице profiles
SELECT AVG(FLOOR((TO_DAYS(NOW())- TO_DAYS(birthday))/ 365.25)) FROM profiles

-- Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.
SELECT
    DAYNAME(CONCAT(YEAR(NOW()), '-', SUBSTRING(birthday, 7, 10))) AS week_day,
    COUNT(*) AS amount
FROM
    profiles
GROUP BY
    week_day


-- (по желанию) Подсчитайте произведение чисел в столбце таблицы
SELECT ROUND(exp(SUM(log(id))), 0) AS factorial FROM users;

