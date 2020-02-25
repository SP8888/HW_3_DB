

-- Создаём БД
DROP DATABASE vk;
CREATE DATABASE vk;

-- Делаем её текущей
USE vk;


-- Добавить необходимую таблицу/таблицы для того, 
-- чтобы можно было использовать лайки для медиафайлов, постов и пользователей.

CREATE TABLE likes (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	author_id INT UNSIGNED NOT NULL,
	id_type_content_like INT UNSIGNED NOT NULL, 
  	created_at DATETIME DEFAULT NOW(),
 	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW()
);

CREATE TABLE type_content_like (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_media INT UNSIGNED NOT NULL,
	id_users INT UNSIGNED NOT NULL,
	id_posts INT UNSIGNED NOT NULL
);


-- Привел в соответствие время создания и обновления

show tables;

SELECT * FROM users;

UPDATE users SET updated_at = created_at WHERE updated_at < created_at;


SELECT * FROM profiles;

UPDATE profiles SET updated_at = created_at WHERE updated_at < created_at;

SELECT * FROM friendship;

UPDATE friendship SET requested_at = confirmed_at WHERE requested_at > confirmed_at ;

SELECT * FROM likes;

UPDATE likes SET updated_at = created_at WHERE updated_at < created_at;


SELECT * FROM media;

UPDATE media SET updated_at = created_at WHERE updated_at < created_at;

SELECT * FROM posts ;

UPDATE posts SET updated_at = created_at WHERE updated_at < created_at;

-- Скорректировал типы статусов

SELECT * FROM friendship_statuses;

TRUNCATE friendship_statuses ;

INSERT INTO friendship_statuses (name) VALUES
  ('friend'),
  ('enemy');
 
 
 
SELECT * FROM media_types;

TRUNCATE media_types ;

INSERT INTO media_types (name) VALUES
  ('audio'),
  ('video'),
  ('photo');

 
 
 
 
-- Создаём таблицу пользователей
CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  email VARCHAR(120) NOT NULL UNIQUE,
  phone VARCHAR(15) NOT NULL UNIQUE,
  `password` VARCHAR(15),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Таблица профилей
CREATE TABLE profiles (
  user_id INT UNSIGNED NOT NULL PRIMARY KEY,
  birthdate DATE,
  sex CHAR(1) NOT NULL,
  hometown VARCHAR(100),
  country VARCHAR(100),
  photo_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Таблица сообщений
CREATE TABLE messages (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  from_user_id INT UNSIGNED NOT NULL,
  to_user_id INT UNSIGNED NOT NULL,
  body TEXT NOT NULL,
  is_important BOOLEAN,
  is_delivered BOOLEAN,
  created_at DATETIME DEFAULT NOW()
);

-- Таблица дружбы
CREATE TABLE friendship (
  user_id INT UNSIGNED NOT NULL,
  friend_id INT UNSIGNED NOT NULL,
  status_id INT UNSIGNED NOT NULL,
  requested_at DATETIME DEFAULT NOW(),
  confirmed_at DATETIME,
  PRIMARY KEY (user_id, friend_id)
);

-- Таблица статусов дружеских отношений
CREATE TABLE friendship_statuses (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150) NOT NULL UNIQUE
);


-- Таблица групп
CREATE TABLE communities (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150) NOT NULL UNIQUE
);

-- Таблица связи пользователей и групп
CREATE TABLE communities_users (
  community_id INT UNSIGNED NOT NULL,
  user_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (community_id, user_id)
);

-- Таблица медиафайлов
CREATE TABLE media (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  media_type_id INT UNSIGNED NOT NULL,
  user_id INT UNSIGNED NOT NULL,
  filename VARCHAR(255) NOT NULL,
  size INT NOT NULL,
  metadata JSON,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Таблица типов медиафайлов
CREATE TABLE media_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE
);


CREATE TABLE family_statuses (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO family_statuses (name) 
  VALUES 
  ('Single'),
  ('Married')
;
 
CREATE TABLE posts (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  author_id INT UNSIGNED NOT NULL,
  body TEXT NOT NULL,
  media_id INT UNSIGNED NOT NULL, 
  created_at DATETIME DEFAULT NOW(),
  updated_at DATETIME DEFAULT NOW() ON UPDATE NOW()
);





 

