--liquibase formatted sql

--changeset Daria:1

CREATE TABLE `users` (
  `id` binary(16) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `bio` varchar(255) DEFAULT NULL,
  `created_at` bigint DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `updated_at` bigint DEFAULT NULL,
  `username_` varchar(255) DEFAULT NULL,
  `verified` bit(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6mum7kywpx2cqnkxlxuabtu` (`username_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `author` (
  `id` binary(16) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `born` bigint DEFAULT NULL,
  `died` bigint DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `original_language` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `book` (
  `id` binary(16) NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `pages` int DEFAULT NULL,
  `published` bigint DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `author_id` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsytpuhl67g1174cx7iqlw6os9` (`author_id`),
  CONSTRAINT `FKsytpuhl67g1174cx7iqlw6os9` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `genre` (
  `id` binary(16) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `matching` (
  `id` binary(16) NOT NULL,
  `first_user_liked` bit(1) DEFAULT NULL,
  `second_user_liked` bit(1) DEFAULT NULL,
  `first_user_id` binary(16) DEFAULT NULL,
  `second_user_id` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKle6cjolgfvbjxvf3uywkbvhbs` (`first_user_id`),
  KEY `FKs4p8nny0o0r1nhw4enym3xwr4` (`second_user_id`),
  CONSTRAINT `FKle6cjolgfvbjxvf3uywkbvhbs` FOREIGN KEY (`first_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKs4p8nny0o0r1nhw4enym3xwr4` FOREIGN KEY (`second_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `verification_token` (
  `id` binary(16) NOT NULL,
  `confirmed_at` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `expires_at` datetime(6) NOT NULL,
  `token` varchar(255) NOT NULL,
  `user_id` binary(16) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKp7mlped6h62v5k8o1mitdy5i8` (`user_id`),
  CONSTRAINT `FKp7mlped6h62v5k8o1mitdy5i8` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users_authors` (
  `user_id` binary(16) NOT NULL,
  `authors_id` binary(16) NOT NULL,
  KEY `FKk8tvusxgej4d1nwpddnkvv94w` (`authors_id`),
  KEY `FK8xt2wywm5ck1l5tbl39smj3lc` (`user_id`),
  CONSTRAINT `FK8xt2wywm5ck1l5tbl39smj3lc` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKk8tvusxgej4d1nwpddnkvv94w` FOREIGN KEY (`authors_id`) REFERENCES `author` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users_books` (
  `user_id` binary(16) NOT NULL,
  `books_id` binary(16) NOT NULL,
  KEY `FKroa7ss4s0ax2cwt9etnlhfjjn` (`books_id`),
  KEY `FK5kuu4q8t9qj8adjvjgw5lllj6` (`user_id`),
  CONSTRAINT `FK5kuu4q8t9qj8adjvjgw5lllj6` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKroa7ss4s0ax2cwt9etnlhfjjn` FOREIGN KEY (`books_id`) REFERENCES `book` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users_genres` (
  `user_id` binary(16) NOT NULL,
  `genres_id` binary(16) NOT NULL,
  KEY `FKllhxglewi1v1r6y030wl33n70` (`genres_id`),
  KEY `FK41kkovqjdyhxslqfusgk7uyf3` (`user_id`),
  CONSTRAINT `FK41kkovqjdyhxslqfusgk7uyf3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKllhxglewi1v1r6y030wl33n70` FOREIGN KEY (`genres_id`) REFERENCES `genre` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `book_character` (
  `id` binary(16) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `book_id` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7jca5t2n88nlu67opt8gm7e7g` (`book_id`),
  CONSTRAINT `FK7jca5t2n88nlu67opt8gm7e7g` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `book_genre` (
  `book_id` binary(16) NOT NULL,
  `genre_id` binary(16) NOT NULL,
  PRIMARY KEY (`book_id`,`genre_id`),
  KEY `FKt8we15a66nkehlgncvl8qm1dy` (`genre_id`),
  CONSTRAINT `FKclmlyua3d5iu4ryf24x4g2qao` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  CONSTRAINT `FKt8we15a66nkehlgncvl8qm1dy` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `chat_message` (
  `id` binary(16) NOT NULL,
  `content` varchar(255) NOT NULL,
  `time` bigint NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `sender_id` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKarh8yih0mkalim5ca5i0l0ggi` (`sender_id`),
  CONSTRAINT `FKarh8yih0mkalim5ca5i0l0ggi` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `chat` (
  `id` binary(16) NOT NULL,
  `seen` bit(1) DEFAULT NULL,
  `first_user_id` binary(16) DEFAULT NULL,
  `last_chat_message_id` binary(16) DEFAULT NULL,
  `second_user_id` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKl8u6600fkgjlcv4tayphbujtx` (`first_user_id`),
  KEY `FKrjgi1quvcb3hq3urla6nwoqnx` (`last_chat_message_id`),
  KEY `FKgenwp216pekfosphumkgkhy42` (`second_user_id`),
  CONSTRAINT `FKgenwp216pekfosphumkgkhy42` FOREIGN KEY (`second_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKl8u6600fkgjlcv4tayphbujtx` FOREIGN KEY (`first_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKrjgi1quvcb3hq3urla6nwoqnx` FOREIGN KEY (`last_chat_message_id`) REFERENCES `chat_message` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE `chat_message`
  ADD COLUMN chat_id binary(16) DEFAULT NULL,
  ADD FOREIGN KEY (`chat_id`) REFERENCES chat(id) ON DELETE CASCADE;
