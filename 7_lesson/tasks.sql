-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

SELECT u.id, name from users u join orders o on u.id = o.user_id
GROUP by o.user_id

-- Выведите список товаров products и разделов catalogs, который соответствует товару.
SELECT p.name, c.name as catalog_name FROM products p join catalogs c on p.catalog_id = c.id

-- (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name).
-- Поля from, to и label содержат английские названия городов, поле name — русское.
-- Выведите список рейсов flights с русскими названиями городов.

SELECT c.name as `from`, c2.name as `to` from flight f
left join cities c on c.label = f.`from`
left join cities c2 on c2.label = f.`to`

