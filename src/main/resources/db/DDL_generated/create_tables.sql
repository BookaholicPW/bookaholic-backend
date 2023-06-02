CREATE DATABASE  IF NOT EXISTS `local_bookaholic` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `local_bookaholic`;

--
-- Table structure for table `users`
--
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
                         PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `author`
--
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
                        `id` binary(16) NOT NULL,
                        `cover` varchar(255) DEFAULT NULL,
                        `description` varchar(255) DEFAULT NULL,
                        `pages` int DEFAULT NULL,
                        `published` bigint DEFAULT NULL,
                        `title` varchar(255) NOT NULL,
                        `author_id` binary(16) DEFAULT NULL,
                        PRIMARY KEY (`id`),
                        CONSTRAINT FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genre`
--
CREATE TABLE `genre` (
                         `id` binary(16) NOT NULL,
                         `name` varchar(255) NOT NULL,
                         PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Table structure for table `book_genre`
--

CREATE TABLE `book_genre` (
                              `book_id` binary(16) NOT NULL,
                              `genre_id` binary(16) NOT NULL,
                              PRIMARY KEY (`book_id`,`genre_id`),
                              CONSTRAINT FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
                              CONSTRAINT FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_character`
--

CREATE TABLE `book_character` (
                                  `id` binary(16) NOT NULL,
                                  `name` varchar(255) DEFAULT NULL,
                                  `book_id` binary(16) DEFAULT NULL,
                                  PRIMARY KEY (`id`),
                                  CONSTRAINT FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


CREATE TABLE `matching` (
                            `id` binary(16) NOT NULL,
                            `first_user_liked` bit(1) DEFAULT NULL,
                            `second_user_liked` bit(1) DEFAULT NULL,
                            `first_user_id` binary(16) DEFAULT NULL,
                            `second_user_id` binary(16) DEFAULT NULL,
                            PRIMARY KEY (`id`),
                            CONSTRAINT FOREIGN KEY (`first_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
                            CONSTRAINT FOREIGN KEY (`second_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `users_authors` (
                                 `user_id` binary(16) NOT NULL,
                                 `authors_id` binary(16) NOT NULL,
                                 CONSTRAINT FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
                                 CONSTRAINT FOREIGN KEY (`authors_id`) REFERENCES `author` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `users_books` (
                               `user_id` binary(16) NOT NULL,
                               `books_id` binary(16) NOT NULL,
                               CONSTRAINT FOREIGN KEY (`books_id`) REFERENCES `book` (`id`),
                               CONSTRAINT FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `users_genres` (
                                `user_id` binary(16) NOT NULL,
                                `genres_id` binary(16) NOT NULL,
                                CONSTRAINT FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
                                CONSTRAINT FOREIGN KEY (`genres_id`) REFERENCES `genre` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
