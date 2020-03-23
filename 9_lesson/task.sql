-- 1. В базе данных Redis подберите коллекцию для подсчета посещений с определенных IP-адресов.

SADD ip '127.0.0.1' '127.0.0.2'  '79.172.107.112'
SMEMBERS ip
SCARD ip


-- 2. При помощи базы данных Redis решите задачу поиска имени пользователя по электронному адресу и наоборот, поиск электронного адреса пользователя по его имени

set kseni@gmail.com ksu
set ksu kseni@gmail.com

get kseni@gmail.com
get ksu

-- 3. Организуйте хранение категорий и товарных позиций учебной базы данных shop в СУБД MongoDB.


use products
db.products.insertMany([
	{"name": "Кукла", "description": "Кукла Barbie", "price": "1200.00", "catalog_id": "Куклы", "created_at": new Date(), "updated_at": new Date()},
	{"name": "Торт", "description": "Вкусный тортик", "price": "700.00", "catalog_id": "Сладкое", "created_at": new Date(), "updated_at": new Date()}])
use catalogs
db.catalogs.insertMany([{"name": "Куклы"}, {"name": "Еда"}])
