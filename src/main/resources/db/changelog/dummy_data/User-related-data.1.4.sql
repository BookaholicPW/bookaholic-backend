--liquibase formatted sql

--changeset Daria:5

--
-- Add users favourite books
--


insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'emilyj'), (select id from `book` where title = 'The Adventures of Tom Sawyer'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'emilyj'), (select id from `book` where title = 'The Silent Patient'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'emilyj'), (select id from `book` where title = 'The Count of Monte Cristo'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'olivert'), (select id from `book` where title = 'The Chronicles of Narnia: The Lion, the Witch, and the Wardrobe'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'olivert'), (select id from `book` where title = 'Born a Crime'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'olivert'), (select id from `book` where title = '1984'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'sophiaw'), (select id from `book` where title = 'Alice''''s Adventures in Wonderland'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'sophiaw'), (select id from `book` where title = 'The Adventures of Tom Sawyer'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'sophiaw'), (select id from `book` where title = 'The Lord of the Rings'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'williamd'), (select id from `book` where title = "The Adventures of Tom Sawyer"));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'williamd'), (select id from `book` where title = "Harry Potter and the Sorcerer's Stone"));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'williamd'), (select id from `book` where title = "The Chronicles of Narnia: The Lion, the Witch, and the Wardrobe"));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'emmag'), (select id from `book` where title = '1984'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'emmag'), (select id from `book` where title = 'The Silent Patient'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'emmag'), (select id from `book` where title = 'The Little Prince'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'emmag'), (select id from `book` where title = 'The Bourne Identity'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'jamesm'), (select id from `book` where title = 'The Lord of the Rings'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'jamesm'), (select id from `book` where title = 'The Shining'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'jamesm'), (select id from `book` where title = 'The Great Gatsby'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'avaclark'), (select id from `book` where title = 'Jane Eyre'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'avaclark'), (select id from `book` where title = 'The Great Gatsby'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'avaclark'), (select id from `book` where title = 'The Bourne Identity'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'noaha'), (select id from `book` where title = 'Foundation'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'noaha'), (select id from `book` where title = 'Around the World in Eighty Days'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'noaha'), (select id from `book` where title = 'Alice''''s Adventures in Wonderland'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'charlottec'), (select id from `book` where title = 'Frankenstein'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'charlottec'), (select id from `book` where title = '1984'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'charlottec'), (select id from `book` where title = 'The Little Prince'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'charlottec'), (select id from `book` where title = 'The Girl on the Train'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'liamr'), (select id from `book` where title = 'The Lord of the Rings'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'liamr'), (select id from `book` where title = 'The Girl on the Train'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'liamr'), (select id from `book` where title = 'The Count of Monte Cristo'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'miat'), (select id from `book` where title = '1984'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'miat'), (select id from `book` where title = 'The Lord of the Rings'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'miat'), (select id from `book` where title = 'The Silent Patient'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'isabellah'), (select id from `book` where title = 'Gone Girl'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'isabellah'), (select id from `book` where title = 'The Adventures of Tom Sawyer'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'isabellah'), (select id from `book` where title = 'The Silent Patient'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'ethang'), (select id from `book` where title = 'The Adventures of Sherlock Holmes'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'ethang'), (select id from `book` where title = 'The Lord of the Rings'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'ethang'), (select id from `book` where title = 'Jane Eyre'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'averym'), (select id from `book` where title = "Harry Potter and the Sorcerer's Stone"));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'averym'), (select id from `book` where title = 'Frankenstein'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'averym'), (select id from `book` where title = 'The Girl on the Train'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'benjamins'), (select id from `book` where title = 'Romeo and Juliet'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'benjamins'), (select id from `book` where title = 'Born a Crime'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'benjamins'), (select id from `book` where title = 'Foundation'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'scarlettw'), (select id from `book` where title = 'The Chronicles of Narnia: The Lion, the Witch, and the Wardrobe'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'scarlettw'), (select id from `book` where title = 'Becoming'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'scarlettw'), (select id from `book` where title = 'Treasure Island'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'henryt'), (select id from `book` where title = 'Treasure Island'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'henryt'), (select id from `book` where title = "Harry Potter and the Sorcerer's Stone"));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'henryt'), (select id from `book` where title = 'The Hobbit'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'ameliar'), (select id from `book` where title = 'Becoming'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'ameliar'), (select id from `book` where title = 'Frankenstein'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'ameliar'), (select id from `book` where title = 'Outlander'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'danielf'), (select id from `book` where title = 'Around the World in Eighty Days'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'danielf'), (select id from `book` where title = 'Dune'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'danielf'), (select id from `book` where title = 'The Chronicles of Narnia: The Lion, the Witch, and the Wardrobe'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'jacobw'), (select id from `book` where title = 'Alice''''s Adventures in Wonderland'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'jacobw'), (select id from `book` where title = 'The Silent Patient'));
insert into `users_books` (user_id, books_id) values ((select id from `users` where username_ = 'jacobw'), (select id from `book` where title = "Harry Potter and the Sorcerer's Stone"));


--
-- Add users favourite genres
--


-- emilyj
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'emilyj'), (SELECT id FROM `genre` WHERE name = 'Adventures'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'emilyj'), (SELECT id FROM `genre` WHERE name = 'Thriller'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'emilyj'), (SELECT id FROM `genre` WHERE name = 'Biographies'));

-- olivert
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'olivert'), (SELECT id FROM `genre` WHERE name = 'Fairy tale'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'olivert'), (SELECT id FROM `genre` WHERE name = 'Biographies'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'olivert'), (SELECT id FROM `genre` WHERE name = 'Science fiction'));

-- sophiaw
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'sophiaw'), (SELECT id FROM `genre` WHERE name = 'Fairy tale'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'sophiaw'), (SELECT id FROM `genre` WHERE name = 'Adventures'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'sophiaw'), (SELECT id FROM `genre` WHERE name = 'Crime fiction'));

-- emmag
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'emmag'), (SELECT id FROM `genre` WHERE name = 'Thriller'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'emmag'), (SELECT id FROM `genre` WHERE name = 'Fairy tale'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'emmag'), (SELECT id FROM `genre` WHERE name = 'Romantic'));

-- jamesm
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'jamesm'), (SELECT id FROM `genre` WHERE name = 'Adventures'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'jamesm'), (SELECT id FROM `genre` WHERE name = 'Horror'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'jamesm'), (SELECT id FROM `genre` WHERE name = 'Historical fiction'));

-- avaclark
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'avaclark'), (SELECT id FROM `genre` WHERE name = 'Romantic'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'avaclark'), (SELECT id FROM `genre` WHERE name = 'Historical fiction'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'avaclark'), (SELECT id FROM `genre` WHERE name = 'Thriller'));

-- noaha
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'noaha'), (SELECT id FROM `genre` WHERE name = 'Science fiction'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'noaha'), (SELECT id FROM `genre` WHERE name = 'Adventures'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'noaha'), (SELECT id FROM `genre` WHERE name = 'Fairy tale'));

-- charlottec
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'charlottec'), (SELECT id FROM `genre` WHERE name = 'Horror'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'charlottec'), (SELECT id FROM `genre` WHERE name = 'Science fiction'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'charlottec'), (SELECT id FROM `genre` WHERE name = 'Fairy tale'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'charlottec'), (SELECT id FROM `genre` WHERE name = 'Thriller'));

-- liamr
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'liamr'), (SELECT id FROM `genre` WHERE name = 'Adventures'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'liamr'), (SELECT id FROM `genre` WHERE name = 'Thriller'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'liamr'), (SELECT id FROM `genre` WHERE name = 'Crime fiction'));

-- miat
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'miat'), (SELECT id FROM `genre` WHERE name = 'Science fiction'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'miat'), (SELECT id FROM `genre` WHERE name = 'Adventures'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'miat'), (SELECT id FROM `genre` WHERE name = 'Thriller'));

-- isabellah
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'isabellah'), (SELECT id FROM `genre` WHERE name = 'Detective'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'isabellah'), (SELECT id FROM `genre` WHERE name = 'Adventures'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'isabellah'), (SELECT id FROM `genre` WHERE name = 'Thriller'));

-- ethang
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'ethang'), (SELECT id FROM `genre` WHERE name = 'Detective'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'ethang'), (SELECT id FROM `genre` WHERE name = 'Fantasy'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'ethang'), (SELECT id FROM `genre` WHERE name = 'Romantic'));

-- averym
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'averym'), (SELECT id FROM `genre` WHERE name = 'Fantasy'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'averym'), (SELECT id FROM `genre` WHERE name = 'Horror'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'averym'), (SELECT id FROM `genre` WHERE name = 'Thriller'));

-- benjamins
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'benjamins'), (SELECT id FROM `genre` WHERE name = 'Romantic'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'benjamins'), (SELECT id FROM `genre` WHERE name = 'Biographies'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'benjamins'), (SELECT id FROM `genre` WHERE name = 'Science fiction'));


-- scarlettw
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'scarlettw'), (SELECT id FROM `genre` WHERE name = 'Fantasy'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'scarlettw'), (SELECT id FROM `genre` WHERE name = 'Biographies'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'scarlettw'), (SELECT id FROM `genre` WHERE name = 'Adventures'));

-- henryt
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'henryt'), (SELECT id FROM `genre` WHERE name = 'Adventures'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'henryt'), (SELECT id FROM `genre` WHERE name = 'Fantasy'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'henryt'), (SELECT id FROM `genre` WHERE name = 'Fairy tale'));

-- ameliar
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'ameliar'), (SELECT id FROM `genre` WHERE name = 'Biographies'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'ameliar'), (SELECT id FROM `genre` WHERE name = 'Horror'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'ameliar'), (SELECT id FROM `genre` WHERE name = 'Fantasy'));

-- danielf
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'danielf'), (SELECT id FROM `genre` WHERE name = 'Adventures'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'danielf'), (SELECT id FROM `genre` WHERE name = 'Science fiction'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'danielf'), (SELECT id FROM `genre` WHERE name = 'Fantasy'));

-- jacobw
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'jacobw'), (SELECT id FROM `genre` WHERE name = 'Fantasy'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'jacobw'), (SELECT id FROM `genre` WHERE name = 'Detective'));
INSERT INTO `users_genres` (user_id, genres_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'jacobw'), (SELECT id FROM `genre` WHERE name = 'Historical fiction'));



--
-- Add users favourite authors
--




-- Emily J
INSERT INTO `users_authors` (user_id, authors_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'emilyj'), (SELECT id FROM `author` WHERE name = 'Mark Twain'));
INSERT INTO `users_authors` (user_id, authors_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'emilyj'), (SELECT id FROM `author` WHERE name = 'Alex Michaelides'));
INSERT INTO `users_authors` (user_id, authors_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'emilyj'), (SELECT id FROM `author` WHERE name = 'Alexandre Dumas'));

-- Oliver T
INSERT INTO `users_authors` (user_id, authors_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'olivert'), (SELECT id FROM `author` WHERE name = 'C.S. Lewis'));
INSERT INTO `users_authors` (user_id, authors_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'olivert'), (SELECT id FROM `author` WHERE name = 'Trevor Noah'));
INSERT INTO `users_authors` (user_id, authors_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'olivert'), (SELECT id FROM `author` WHERE name = 'George Orwell'));

-- Sophia W
INSERT INTO `users_authors` (user_id, authors_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'sophiaw'), (SELECT id FROM `author` WHERE name = 'Lewis Carroll'));
INSERT INTO `users_authors` (user_id, authors_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'sophiaw'), (SELECT id FROM `author` WHERE name = 'Mark Twain'));
INSERT INTO `users_authors` (user_id, authors_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'sophiaw'), (SELECT id FROM `author` WHERE name = 'J.R.R. Tolkien'));

-- William D
INSERT INTO `users_authors` (user_id, authors_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'williamd'), (SELECT id FROM `author` WHERE name = 'Mark Twain'));
INSERT INTO `users_authors` (user_id, authors_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'williamd'), (SELECT id FROM `author` WHERE name = 'J.K. Rowling'));
INSERT INTO `users_authors` (user_id, authors_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'williamd'), (SELECT id FROM `author` WHERE name = 'C.S. Lewis'));

-- Emma G
INSERT INTO `users_authors` (user_id, authors_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'emmag'), (SELECT id FROM `author` WHERE name = 'George Orwell'));
INSERT INTO `users_authors` (user_id, authors_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'emmag'), (SELECT id FROM `author` WHERE name = 'Alex Michaelides'));
INSERT INTO `users_authors` (user_id, authors_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'emmag'), (SELECT id FROM `author` WHERE name = 'Antoine de Saint-Exupery'));
INSERT INTO `users_authors` (user_id, authors_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'emmag'), (SELECT id FROM `author` WHERE name = 'Robert Ludlum'));


-- James M
INSERT INTO `users_authors` (user_id, authors_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'jamesm'), (SELECT id FROM `author` WHERE name = 'J.R.R. Tolkien'));
INSERT INTO `users_authors` (user_id, authors_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'jamesm'), (SELECT id FROM `author` WHERE name = 'Stephen King'));
INSERT INTO `users_authors` (user_id, authors_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'jamesm'), (SELECT id FROM `author` WHERE name = 'F. Scott Fitzgerald'));

-- Ava Clark
INSERT INTO `users_authors` (user_id, authors_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'avaclark'), (SELECT id FROM `author` WHERE name = 'Charlotte Bronte'));
INSERT INTO `users_authors` (user_id, authors_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'avaclark'), (SELECT id FROM `author` WHERE name = 'F. Scott Fitzgerald'));
INSERT INTO `users_authors` (user_id, authors_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'avaclark'), (SELECT id FROM `author` WHERE name = 'Robert Ludlum'));

-- Noah A
INSERT INTO `users_authors` (user_id, authors_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'noaha'), (SELECT id FROM `author` WHERE name = 'Isaac Asimov'));
INSERT INTO `users_authors` (user_id, authors_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'noaha'), (SELECT id FROM `author` WHERE name = 'Jules Verne'));
INSERT INTO `users_authors` (user_id, authors_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'noaha'), (SELECT id FROM `author` WHERE name = 'Lewis Carroll'));

-- Charlotte C
INSERT INTO `users_authors` (user_id, authors_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'charlottec'), (SELECT id FROM `author` WHERE name = 'Mary Shelley'));
INSERT INTO `users_authors` (user_id, authors_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'charlottec'), (SELECT id FROM `author` WHERE name = 'George Orwell'));
INSERT INTO `users_authors` (user_id, authors_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'charlottec'), (SELECT id FROM `author` WHERE name = 'Antoine de Saint-Exupery'));
INSERT INTO `users_authors` (user_id, authors_id)
VALUES ((SELECT id FROM `users` WHERE username_ = 'charlottec'), (SELECT id FROM `author` WHERE name = 'Paula Hawkins'));


insert into `users_authors` (user_id, authors_id) values ((select id from `users` where username_ = 'liamr'), (select id from `author` where name = 'J.R.R. Tolkien'));
insert into `users_authors` (user_id, authors_id) values ((select id from `users` where username_ = 'liamr'), (select id from `author` where name = 'Paula Hawkins'));
insert into `users_authors` (user_id, authors_id) values ((select id from `users` where username_ = 'liamr'), (select id from `author` where name = 'Alexandre Dumas'));
insert into `users_authors` (user_id, authors_id) values ((select id from `users` where username_ = 'miat'), (select id from `author` where name = 'George Orwell'));
insert into `users_authors` (user_id, authors_id) values ((select id from `users` where username_ = 'miat'), (select id from `author` where name = 'J.R.R. Tolkien'));
insert into `users_authors` (user_id, authors_id) values ((select id from `users` where username_ = 'miat'), (select id from `author` where name = 'Alex Michaelides'));
insert into `users_authors` (user_id, authors_id) values ((select id from `users` where username_ = 'isabellah'), (select id from `author` where name = 'Gillian Flynn'));
insert into `users_authors` (user_id, authors_id) values ((select id from `users` where username_ = 'isabellah'), (select id from `author` where name = 'Mark Twain'));
insert into `users_authors` (user_id, authors_id) values ((select id from `users` where username_ = 'isabellah'), (select id from `author` where name = 'Alex Michaelides'));
insert into `users_authors` (user_id, authors_id) values ((select id from `users` where username_ = 'ethang'), (select id from `author` where name = 'Arthur Conan Doyle'));
insert into `users_authors` (user_id, authors_id) values ((select id from `users` where username_ = 'ethang'), (select id from `author` where name = 'J.R.R. Tolkien'));
insert into `users_authors` (user_id, authors_id) values ((select id from `users` where username_ = 'ethang'), (select id from `author` where name = 'Charlotte Bronte'));
insert into `users_authors` (user_id, authors_id) values ((select id from `users` where username_ = 'averym'), (select id from `author` where name = 'J.K. Rowling'));
insert into `users_authors` (user_id, authors_id) values ((select id from `users` where username_ = 'averym'), (select id from `author` where name = 'Mary Shelley'));

insert into `users_authors` (user_id, authors_id) values ((select id from `users` where username_ = 'scarlettw'), (select id from `author` where name = 'C.S. Lewis'));
insert into `users_authors` (user_id, authors_id) values ((select id from `users` where username_ = 'scarlettw'), (select id from `author` where name = 'Michelle Obama'));
insert into `users_authors` (user_id, authors_id) values ((select id from `users` where username_ = 'scarlettw'), (select id from `author` where name = 'Robert Louis Stevenson'));
insert into `users_authors` (user_id, authors_id) values ((select id from `users` where username_ = 'henryt'), (select id from `author` where name = 'Robert Louis Stevenson'));
insert into `users_authors` (user_id, authors_id) values ((select id from `users` where username_ = 'henryt'), (select id from `author` where name = 'J.K. Rowling'));
insert into `users_authors` (user_id, authors_id) values ((select id from `users` where username_ = 'henryt'), (select id from `author` where name = 'J.R.R. Tolkien'));
insert into `users_authors` (user_id, authors_id) values ((select id from `users` where username_ = 'ameliar'), (select id from `author` where name = 'Michelle Obama'));
insert into `users_authors` (user_id, authors_id) values ((select id from `users` where username_ = 'ameliar'), (select id from `author` where name = 'Mary Shelley'));
insert into `users_authors` (user_id, authors_id) values ((select id from `users` where username_ = 'ameliar'), (select id from `author` where name = 'Diana Gabaldon'));
insert into `users_authors` (user_id, authors_id) values ((select id from `users` where username_ = 'danielf'), (select id from `author` where name = 'Jules Verne'));
insert into `users_authors` (user_id, authors_id) values ((select id from `users` where username_ = 'danielf'), (select id from `author` where name = 'Frank Herbert'));
insert into `users_authors` (user_id, authors_id) values ((select id from `users` where username_ = 'danielf'), (select id from `author` where name = 'C.S. Lewis'));
insert into `users_authors` (user_id, authors_id) values ((select id from `users` where username_ = 'jacobw'), (select id from `author` where name = 'Lewis Carroll'));
insert into `users_authors` (user_id, authors_id) values ((select id from `users` where username_ = 'jacobw'), (select id from `author` where name = 'Alex Michaelides'));
insert into `users_authors` (user_id, authors_id) values ((select id from `users` where username_ = 'jacobw'), (select id from `author` where name = 'J.K. Rowling'));
