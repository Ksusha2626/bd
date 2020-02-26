-- i. Заполнить все таблицы БД vk данными (по 10-100 записей в каждой таблице)

use vk;


INSERT INTO users (firstname, lastname, email, phone, is_deleted)
VALUES
('Reuben', 'Nienow', 'arlo515@example.org', 1345678933, 0),
('Reuben', 'Nienow', 'arlo516@example.org', 2345678944, 0),
('Reuben', 'Nienow', 'arlo517@example.org', 4567432166, 0),
('Reuben', 'Nienow', 'arlo518@example.org', 3435656778, 0),
('Reuben', 'Nienow', 'arlo519@example.org', 5657686867, 0),
('Reuben', 'Nienow', 'arlo5110@example.org', NULL, 0),
('Reuben', 'Nienow', 'arlo5111@example.org', NULL, 0),
('Reuben', 'Nienow', 'arlo5112@example.org', NULL, 0),
('Reuben', 'Nienow', 'arlo5113@example.org', NULL, 0),
('Reuben', 'Nienow', 'arlo5114@example.org', NULL, 0)

INSERT INTO profiles (user_id, gender, photo_id, hometown )
VALUES
(1, 'F', 10, 'Minsk'),
(2, 'M', 2, 'Moscow'),
(3, 'F', 3, 'Minsk'),
(4, 'M', 4, 'Moscow'),
(5, 'F', 5, 'Minsk'),
(6, 'M', 6, 'Moscow'),
(7, 'F', 7, 'Minsk'),
(8, 'M', 8, 'Moscow'),
(9, 'F', 9, 'Minsk'),
(10, 'M', 10, 'Moscow')

INSERT INTO communities (name)
VALUES
('group_1'),('group_2'), ('group_3'), ('group_4'), ('group_5'),
('group_6'),('group_7'), ('group_8'), ('group_9'), ('group_10')

INSERT INTO users_communities (user_id, community_id )
VALUES
(1, 1),(2, 2), (3, 3), (4, 4), (5, 5),
(6, 6),(7, 7), (8, 8), (9, 9), (10, 10)

INSERT INTO friend_requests (initiator_user_id, target_user_id, status, confirmed_at )
VALUES
(1, 2, 'requested', now()),
(2, 3, 'unfriended', now()),
(4, 5, 'requested', now()),
(5, 6, 'unfriended', now()),
(6, 7, 'approved', now()),
(7, 8, 'declined', now()),
(8, 9, 'requested', now()),
(10, 1, 'approved', now()),
(2, 1, 'approved', now()),
(3, 1, 'declined', now())


INSERT INTO media_types (name)
VALUES
('media_1'),('media_2'), ('media_3'), ('media_4'), ('media_5'),
('media_6'),('media_7'), ('media_8'), ('media_9'), ('media_10')

INSERT INTO media (media_type_id, user_id, body)
VALUES
(1, 1, 'text'),(2, 2, 'text'), (3, 3, 'text'), (4, 4, 'text'), (5, 5, 'text'),
(6, 6, 'text'),(7, 6, 'text'), (8, 7, 'text'), (9, 8, 'text'), (10, 9, 'text')


INSERT INTO likes (user_id, media_id)
VALUES
(1, 3),(2, 5), (3, 4), (5, 8), (6, 5),
(7, 1),(3, 1), (4, 7), (6, 9), (10, 1)

INSERT INTO messages (from_user_id, to_user_id, body)
VALUES
(1, 2, 'text'),(2, 3, 'text'),(3, 4, 'text'),(4, 5, 'text'), (8, 6, 'text'),
(5, 6, 'text'),(4, 7, 'text'),(5, 7, 'text'),(6, 5, 'text'), (4, 6, 'text')

INSERT INTO music_albums (name , user_id)
VALUES
('music_1', 1),('music_2', 2), ('music_3', 3), ('music_5', 4), ('music_6', 5),
('music_7', 6),('text', 7), ('text', 8), ('text', 9), ('text', 10)

INSERT INTO music (name, album_id)
VALUES
('music_1', 1),('music_2', 1), ('music_3', 2), ('music_5', 2), ('music_6', 5),
('music_7', 5),('music_8', 6), ('music_9', 6), ('music_10', 9), ('music_4', 10)

INSERT INTO notes (user_id, body)
VALUES
(1, 'aaaa'),(2, 'bbbb'),(3, 'vvvv'),(4, 'cccc'), (8, 'dddd'),
(1, 'eeee'),(4, 'ffff'),(3, 'gggg'),(5, 'hhhh'), (8, 'iiii'),

INSERT INTO photo_albums (name , user_id)
VALUES
('photos_1', 1),('photos_2', 2), ('photos_3', 3), ('photos_5', 4), ('photos_6', 5),
('photos_7', 6),('photos', 7), ('photos', 8), ('photos', 9), ('photos', 10)

INSERT INTO photos (album_id, media_id)
VALUES
(1, 3),(2, 5), (3, 4), (5, 8), (6, 5),
(7, 1),(3, 1), (4, 7), (6, 9), (10, 1)


-- ii. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке
SELECT firstname FROM users u GROUP BY  firstname ORDER BY firstname

-- iii. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false).
--      Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)

ALTER table profiles add is_active bit DEFAULT 1

UPDATE profiles SET is_active = 0 WHERE birthday > '2002.02.26'

-- iv. Написать скрипт, удаляющий сообщения «из будущего»

DELETE FROM messages WHERE created_at > now()
