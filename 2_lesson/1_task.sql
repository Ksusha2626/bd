DROP TABLE IF EXISTS music_albums;
CREATE TABLE music_albums (
	id SERIAL PRIMARY KEY,
   	`name` varchar(255) DEFAULT NULL,
    `user_id` BIGINT UNSIGNED DEFAULT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS music;
CREATE TABLE music (
	id SERIAL PRIMARY KEY,
    `album_id` BIGINT UNSIGNED NOT NULL,

    FOREIGN KEY (album_id) REFERENCES music_albums(id)
);

DROP TABLE IF EXISTS notes;
CREATE TABLE notes (
	id SERIAL PRIMARY KEY,
    `user_id` BIGINT UNSIGNED DEFAULT NULL,
	body text,
	created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	
    INDEX notes_by_user_id (user_id),
	FOREIGN KEY (user_id) REFERENCES users(id)
);