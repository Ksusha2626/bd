-- Пусть задан некоторый пользователь.
-- Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.

select from_user_id, count(*) as total
from messages where to_user_id = 1 and from_user_id in (

select initiator_user_id as user_id from friend_requests where (target_user_id = 1) and status = 'approved')

or from_user_id in (
select target_user_id as user_id from friend_requests where (initiator_user_id = 1) and status = 'approved'
)
GROUP by from_user_id order by total desc limit 1


-- Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.

select count(media_id) from likes l
join media m on m.id = l.media_id
join profiles p on m.user_id = p.user_id where p.birthday BETWEEN '2010-03-05' and CURRENT_TIMESTAMP()

-- Определить кто больше поставил лайков (всего) - мужчины или женщины?

select count(p.gender) as total, p.gender from likes l
join profiles p on l.user_id = p.user_id
GROUP by gender
ORDER by total desc limit 1