--liquibase formatted sql

--changeset Daria:1



--
-- Table structure for table `users`
--
--CREATE TABLE IF NOT EXISTS `users` (
--                         `id` binary(16) NOT NULL,
--                         `avatar` varchar(255) DEFAULT NULL,
--                         `bio` varchar(255) DEFAULT NULL,
--                         `created_at` bigint DEFAULT NULL,
--                         `email` varchar(255) NOT NULL,
--                         `name` varchar(255) DEFAULT NULL,
--                         `password` varchar(255) NOT NULL,
--                         `updated_at` bigint DEFAULT NULL,
--                         `username_` varchar(255) DEFAULT NULL,
--                         PRIMARY KEY (`id`)
--);

--
-- Table structure for table `author`
--
CREATE TABLE IF NOT EXISTS `author` (
                          `id` binary(16) NOT NULL,
                          `avatar` varchar(255) DEFAULT NULL,
                          `born` bigint DEFAULT NULL,
                          `died` bigint DEFAULT NULL,
                          `name` varchar(255) NOT NULL,
                          `nationality` varchar(255) DEFAULT NULL,
                          `original_language` varchar(255) DEFAULT NULL,
                          PRIMARY KEY (`id`)
) ;
--
-- Table structure for table `book`
--

CREATE TABLE IF NOT EXISTS `book` (
                        `id` binary(16) NOT NULL,
                        `cover` varchar(255) DEFAULT NULL,
                        `description` varchar(255) DEFAULT NULL,
                        `pages` int DEFAULT NULL,
                        `published` bigint DEFAULT NULL,
                        `title` varchar(255) NOT NULL,
                        `author_id` binary(16) DEFAULT NULL,
                        PRIMARY KEY (`id`),
                        FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON DELETE CASCADE
) ;
--
-- Table structure for table `genre`
--
CREATE TABLE IF NOT EXISTS `genre` (
                         `id` binary(16) NOT NULL,
                         `name` varchar(255) NOT NULL,
                         PRIMARY KEY (`id`)
) ;
-- Table structure for table `book_genre`
--

CREATE TABLE IF NOT EXISTS `book_genre` (
                              `book_id` binary(16) NOT NULL,
                              `genre_id` binary(16) NOT NULL,
                              PRIMARY KEY (`book_id`,`genre_id`),
                              FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
                            FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`)
) ;
--
-- Table structure for table `book_character`
--

CREATE TABLE IF NOT EXISTS `book_character` (
                                  `id` binary(16) NOT NULL,
                                  `name` varchar(255) DEFAULT NULL,
                                  `book_id` binary(16) DEFAULT NULL,
                                  PRIMARY KEY (`id`),
                                   FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE
) ;