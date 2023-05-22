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
                        KEY `FKsytpuhl67g1174cx7iqlw6os9` (`author_id`),
                        CONSTRAINT `FKsytpuhl67g1174cx7iqlw6os9` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON DELETE CASCADE
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
                              KEY `FKt8we15a66nkehlgncvl8qm1dy` (`genre_id`),
                              CONSTRAINT `FKclmlyua3d5iu4ryf24x4g2qao` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
                              CONSTRAINT `FKt8we15a66nkehlgncvl8qm1dy` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`)
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
                                  KEY `FK7jca5t2n88nlu67opt8gm7e7g` (`book_id`),
                                  CONSTRAINT `FK7jca5t2n88nlu67opt8gm7e7g` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
