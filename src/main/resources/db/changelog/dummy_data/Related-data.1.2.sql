--liquibase formatted sql

--changeset Daria:3


--
-- Relations book - genre
--
insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "The Adventures of Tom Sawyer"),
        (select id from `genre` where name = "Adventures"));

insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "Treasure Island"),
        (select id from `genre` where name = "Adventures"));

insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "The Lord of the Rings"),
        (select id from `genre` where name = "Adventures"));

insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "Around the World in Eighty Days"),
        (select id from `genre` where name = "Adventures"));

insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "The Count of Monte Cristo"),
        (select id from `genre` where name = "Adventures"));
--
--
insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "Harry Potter and the Sorcerer's Stone"),
        (select id from `genre` where name = "Fantasy"));

insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "The Hobbit"),
        (select id from `genre` where name = "Fantasy"));

insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "The Chronicles of Narnia: The Lion, the Witch, and the Wardrobe"),
        (select id from `genre` where name = "Fantasy"));

--
--
insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "The Shining"),
        (select id from `genre` where name = "Horror"));

insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "It"),
        (select id from `genre` where name = "Horror"));

insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "Frankenstein"),
        (select id from `genre` where name = "Horror"));
--
--
insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "1984"),
        (select id from `genre` where name = "Science fiction"));

insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "Dune"),
        (select id from `genre` where name = "Science fiction"));

insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "Foundation"),
        (select id from `genre` where name = "Science fiction"));

--
--
insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "Pride and Prejudice"),
        (select id from `genre` where name = "Romantic"));

insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "Romeo and Juliet"),
        (select id from `genre` where name = "Romantic"));

insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "Jane Eyre"),
        (select id from `genre` where name = "Romantic"));

insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "Outlander"),
        (select id from `genre` where name = "Romantic"));

--
--
insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "The Girl on the Train"),
        (select id from `genre` where name = "Thriller"));

insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "The Bourne Identity"),
        (select id from `genre` where name = "Thriller"));

insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "The Silent Patient"),
        (select id from `genre` where name = "Thriller"));

insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "Gone Girl"),
        (select id from `genre` where name = "Thriller"));

--
--
insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "Pride and Prejudice"),
        (select id from `genre` where name = "Historical fiction"));

insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "The Great Gatsby"),
        (select id from `genre` where name = "Historical fiction"));

insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "The Kite Runner"),
        (select id from `genre` where name = "Historical fiction"));

--
--
insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "The Adventures of Sherlock Holmes"),
        (select id from `genre` where name = "Crime fiction"));

insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "Gone Girl"),
        (select id from `genre` where name = "Crime fiction"));

insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "The Adventures of Sherlock Holmes"),
        (select id from `genre` where name = "Detective"));

insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "Gone Girl"),
        (select id from `genre` where name = "Detective"));

--
--
insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "Becoming"),
        (select id from `genre` where name = "Biographies"));

insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "Born a Crime"),
        (select id from `genre` where name = "Biographies"));
--
--

insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "Harry Potter and the Sorcerer's Stone"),
        (select id from `genre` where name = "Fairy tale"));

insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "The Chronicles of Narnia: The Lion, the Witch, and the Wardrobe"),
        (select id from `genre` where name = "Fairy tale"));

insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "Alice''s Adventures in Wonderland"),
        (select id from `genre` where name = "Fairy tale"));

insert into `book_genre` (book_id, genre_id)
values ((select id from `book` where title = "The Little Prince"),
        (select id from `genre` where name = "Fairy tale"));

--
-- New book characters
--
INSERT INTO `book_character` (id, name, book_id)
VALUES (UUID_TO_BIN(UUID()), 'Tom Sawyer', (SELECT id FROM `book` where title = 'The Adventures of Tom Sawyer')),
       (UUID_TO_BIN(UUID()), 'Huckleberry Finn', (SELECT id FROM `book` where title = 'The Adventures of Tom Sawyer')),
       (UUID_TO_BIN(UUID()), 'Becky Thatcher', (SELECT id FROM `book` where title = 'The Adventures of Tom Sawyer'));

INSERT INTO `book_character` (id, name, book_id)
VALUES (UUID_TO_BIN(UUID()), 'Jim Hawkins', (SELECT id FROM `book` where title = 'Treasure Island')),
       (UUID_TO_BIN(UUID()), 'Long John Silver', (SELECT id FROM `book` where title = 'Treasure Island')),
       (UUID_TO_BIN(UUID()), 'Captain Flint', (SELECT id FROM `book` where title = 'Treasure Island'));

INSERT INTO `book_character` (id, name, book_id)
VALUES (UUID_TO_BIN(UUID()), 'Frodo Baggins', (SELECT id FROM `book` where title = 'The Lord of the Rings')),
       (UUID_TO_BIN(UUID()), 'Gandalf', (SELECT id FROM `book` where title = 'The Lord of the Rings')),
       (UUID_TO_BIN(UUID()), 'Aragorn', (SELECT id FROM `book` where title = 'The Lord of the Rings')),
       (UUID_TO_BIN(UUID()), 'Samwise Gamgee', (SELECT id FROM `book` where title = 'The Lord of the Rings'));

INSERT INTO `book_character` (id, name, book_id)
VALUES (UUID_TO_BIN(UUID()), 'Phileas Fogg', (SELECT id FROM `book` where title = 'Around the World in Eighty Days')),
       (UUID_TO_BIN(UUID()), 'Jean Passepartout', (SELECT id FROM `book` where title = 'Around the World in Eighty Days'));

INSERT INTO `book_character` (id, name, book_id)
VALUES (UUID_TO_BIN(UUID()), 'Edmond Dantès (The Count of Monte Cristo)', (SELECT id FROM `book` where title = 'The Count of Monte Cristo')),
       (UUID_TO_BIN(UUID()), 'Abbe Faria', (SELECT id FROM `book` where title = 'The Count of Monte Cristo')),
       (UUID_TO_BIN(UUID()), 'Mercedes de Morcerf', (SELECT id FROM `book` where title = 'The Count of Monte Cristo')),
       (UUID_TO_BIN(UUID()), 'Fernand Mondego', (SELECT id FROM `book` where title = 'The Count of Monte Cristo'));

INSERT INTO `book_character` (id, name, book_id)
VALUES (UUID_TO_BIN(UUID()), 'Harry Potter', (SELECT id FROM `book` where title = "Harry Potter and the Sorcerer's Stone")),
       (UUID_TO_BIN(UUID()), 'Hermione Granger', (SELECT id FROM `book` where title = "Harry Potter and the Sorcerer's Stone")),
       (UUID_TO_BIN(UUID()), 'Ron Weasley', (SELECT id FROM `book` where title = "Harry Potter and the Sorcerer's Stone")),
       (UUID_TO_BIN(UUID()), 'Albus Dumbledore', (SELECT id FROM `book` where title = "Harry Potter and the Sorcerer's Stone")),
       (UUID_TO_BIN(UUID()), 'Lord Voldemort', (SELECT id FROM `book` where title = "Harry Potter and the Sorcerer's Stone"));

INSERT INTO `book_character` (id, name, book_id)
VALUES (UUID_TO_BIN(UUID()), 'Lucy Pevensie', (SELECT id FROM `book` where title = 'The Chronicles of Narnia: The Lion, the Witch, and the Wardrobe')),
       (UUID_TO_BIN(UUID()), 'Edmund Pevensie', (SELECT id FROM `book` where title = 'The Chronicles of Narnia: The Lion, the Witch, and the Wardrobe')),
       (UUID_TO_BIN(UUID()), 'Susan Pevensie', (SELECT id FROM `book` where title = 'The Chronicles of Narnia: The Lion, the Witch, and the Wardrobe')),
       (UUID_TO_BIN(UUID()), 'Peter Pevensie', (SELECT id FROM `book` where title = 'The Chronicles of Narnia: The Lion, the Witch, and the Wardrobe')),
       (UUID_TO_BIN(UUID()), 'Aslan', (SELECT id FROM `book` where title = 'The Chronicles of Narnia: The Lion, the Witch, and the Wardrobe')),
       (UUID_TO_BIN(UUID()), 'White Witch', (SELECT id FROM `book` where title = 'The Chronicles of Narnia: The Lion, the Witch, and the Wardrobe'));

INSERT INTO `book_character` (id, name, book_id)
VALUES (UUID_TO_BIN(UUID()), 'Bilbo Baggins', (SELECT id FROM `book` where title = 'The Hobbit')),
       (UUID_TO_BIN(UUID()), 'Gandalf', (SELECT id FROM `book` where title = 'The Hobbit')),
       (UUID_TO_BIN(UUID()), 'Thorin Oakenshield', (SELECT id FROM `book` where title = 'The Hobbit')),
       (UUID_TO_BIN(UUID()), 'Smaug', (SELECT id FROM `book` where title = 'The Hobbit')),
       (UUID_TO_BIN(UUID()), 'Gollum', (SELECT id FROM `book` where title = 'The Hobbit'));

INSERT INTO `book_character` (id, name, book_id)
VALUES (UUID_TO_BIN(UUID()), 'Victor Frankenstein', (SELECT id FROM `book` where title = 'Frankenstein')),
       (UUID_TO_BIN(UUID()), 'The Creature', (SELECT id FROM `book` where title = 'Frankenstein'));

INSERT INTO `book_character` (id, name, book_id)
VALUES (UUID_TO_BIN(UUID()), 'Jack Torrance', (SELECT id FROM `book` where title = 'The Shining')),
       (UUID_TO_BIN(UUID()), 'Danny Torrance', (SELECT id FROM `book` where title = 'The Shining')),
       (UUID_TO_BIN(UUID()), 'Wendy Torrance', (SELECT id FROM `book` where title = 'The Shining')),
       (UUID_TO_BIN(UUID()), 'Dick Hallorann', (SELECT id FROM `book` where title = 'The Shining'));

INSERT INTO `book_character` (id, name, book_id)
VALUES (UUID_TO_BIN(UUID()), 'Pennywise the Dancing Clown', (SELECT id FROM `book` where title = 'It')),
       (UUID_TO_BIN(UUID()), 'Bill Denbrough', (SELECT id FROM `book` where title = 'It')),
       (UUID_TO_BIN(UUID()), 'Richie Tozier', (SELECT id FROM `book` where title = 'It')),
       (UUID_TO_BIN(UUID()), 'Beverly Marsh', (SELECT id FROM `book` where title = 'It')),
       (UUID_TO_BIN(UUID()), 'Mike Hanlon', (SELECT id FROM `book` where title = 'It'));

INSERT INTO `book_character` (id, name, book_id)
VALUES (UUID_TO_BIN(UUID()), 'Winston Smith', (SELECT id FROM `book` where title = '1984')),
       (UUID_TO_BIN(UUID()), 'Big Brother', (SELECT id FROM `book` where title = '1984')),
       (UUID_TO_BIN(UUID()), 'Julia', (SELECT id FROM `book` where title = '1984'));

INSERT INTO `book_character` (id, name, book_id)
VALUES (UUID_TO_BIN(UUID()), 'Paul Atreides', (SELECT id FROM `book` where title = 'Dune')),
       (UUID_TO_BIN(UUID()), 'Lady Jessica', (SELECT id FROM `book` where title = 'Dune')),
       (UUID_TO_BIN(UUID()), 'Baron Vladimir Harkonnen', (SELECT id FROM `book` where title = 'Dune')),
       (UUID_TO_BIN(UUID()), 'Emperor Shaddam IV', (SELECT id FROM `book` where title = 'Dune'));

INSERT INTO `book_character` (id, name, book_id)
VALUES (UUID_TO_BIN(UUID()), 'Hari Seldon', (SELECT id FROM `book` where title = 'Foundation')),
       (UUID_TO_BIN(UUID()), 'Salvor Hardin', (SELECT id FROM `book` where title = 'Foundation')),
       (UUID_TO_BIN(UUID()), 'Gaal Dornick', (SELECT id FROM `book` where title = 'Foundation')),
       (UUID_TO_BIN(UUID()), 'The Mule', (SELECT id FROM `book` where title = 'Foundation'));

INSERT INTO `book_character` (id, name, book_id)
VALUES (UUID_TO_BIN(UUID()), 'Rachel Watson', (SELECT id FROM `book` where title = 'The Girl on the Train')),
       (UUID_TO_BIN(UUID()), 'Megan Hipwell', (SELECT id FROM `book` where title = 'The Girl on the Train')),
       (UUID_TO_BIN(UUID()), 'Anna Watson', (SELECT id FROM `book` where title = 'The Girl on the Train')),
       (UUID_TO_BIN(UUID()), 'Tom Watson', (SELECT id FROM `book` where title = 'The Girl on the Train'));

INSERT INTO `book_character` (id, name, book_id)
VALUES (UUID_TO_BIN(UUID()), 'Jason Bourne', (SELECT id FROM `book` where title = 'The Bourne Identity')),
       (UUID_TO_BIN(UUID()), 'Marie St. Jacques', (SELECT id FROM `book` where title = 'The Bourne Identity')),
       (UUID_TO_BIN(UUID()), 'Alexander Conklin', (SELECT id FROM `book` where title = 'The Bourne Identity')),
       (UUID_TO_BIN(UUID()), 'Carlos the Jackal', (SELECT id FROM `book` where title = 'The Bourne Identity'));

INSERT INTO `book_character` (id, name, book_id)
VALUES (UUID_TO_BIN(UUID()), 'Alicia Berenson', (SELECT id FROM `book` where title = 'The Silent Patient')),
       (UUID_TO_BIN(UUID()), 'Theo Faber', (SELECT id FROM `book` where title = 'The Silent Patient')),
       (UUID_TO_BIN(UUID()), 'Gabriel Berenson', (SELECT id FROM `book` where title = 'The Silent Patient'));

INSERT INTO `book_character` (id, name, book_id)
VALUES (UUID_TO_BIN(UUID()), 'Elizabeth Bennet', (SELECT id FROM `book` where title = 'Pride and Prejudice')),
       (UUID_TO_BIN(UUID()), 'Mr. Darcy', (SELECT id FROM `book` where title = 'Pride and Prejudice')),
       (UUID_TO_BIN(UUID()), 'Jane Bennet', (SELECT id FROM `book` where title = 'Pride and Prejudice')),
       (UUID_TO_BIN(UUID()), 'Mr. Bingley', (SELECT id FROM `book` where title = 'Pride and Prejudice'));

INSERT INTO `book_character` (id, name, book_id)
VALUES (UUID_TO_BIN(UUID()), 'Jay Gatsby', (SELECT id FROM `book` where title = 'The Great Gatsby')),
       (UUID_TO_BIN(UUID()), 'Nick Carraway', (SELECT id FROM `book` where title = 'The Great Gatsby')),
       (UUID_TO_BIN(UUID()), 'Daisy Buchanan', (SELECT id FROM `book` where title = 'The Great Gatsby')),
       (UUID_TO_BIN(UUID()), 'Tom Buchanan', (SELECT id FROM `book` where title = 'The Great Gatsby'));

INSERT INTO `book_character` (id, name, book_id)
VALUES (UUID_TO_BIN(UUID()), 'Amir', (SELECT id FROM `book` where title = 'The Kite Runner')),
       (UUID_TO_BIN(UUID()), 'Hassan', (SELECT id FROM `book` where title = 'The Kite Runner')),
       (UUID_TO_BIN(UUID()), 'Baba', (SELECT id FROM `book` where title = 'The Kite Runner')),
       (UUID_TO_BIN(UUID()), 'Assef', (SELECT id FROM `book` where title = 'The Kite Runner'));

INSERT INTO `book_character` (id, name, book_id)
VALUES (UUID_TO_BIN(UUID()), 'Romeo Montague', (SELECT id FROM `book` where title = 'Romeo and Juliet')),
       (UUID_TO_BIN(UUID()), 'Juliet Capulet', (SELECT id FROM `book` where title = 'Romeo and Juliet')),
       (UUID_TO_BIN(UUID()), 'Mercutio', (SELECT id FROM `book` where title = 'Romeo and Juliet')),
       (UUID_TO_BIN(UUID()), 'Tybalt', (SELECT id FROM `book` where title = 'Romeo and Juliet'));

INSERT INTO `book_character` (id, name, book_id)
VALUES (UUID_TO_BIN(UUID()), 'Jane Eyre', (SELECT id FROM `book` where title = 'Jane Eyre')),
       (UUID_TO_BIN(UUID()), 'Edward Rochester', (SELECT id FROM `book` where title = 'Jane Eyre')),
       (UUID_TO_BIN(UUID()), 'St. John Rivers', (SELECT id FROM `book` where title = 'Jane Eyre')),
       (UUID_TO_BIN(UUID()), 'Mrs. Reed', (SELECT id FROM `book` where title = 'Jane Eyre'));

INSERT INTO `book_character` (id, name, book_id)
VALUES (UUID_TO_BIN(UUID()), 'Claire Randall', (SELECT id FROM `book` where title = 'Outlander')),
       (UUID_TO_BIN(UUID()), 'Jamie Fraser', (SELECT id FROM `book` where title = 'Outlander')),
       (UUID_TO_BIN(UUID()), 'Frank Randall', (SELECT id FROM `book` where title = 'Outlander')),
       (UUID_TO_BIN(UUID()), 'Black Jack Randall', (SELECT id FROM `book` where title = 'Outlander'));

INSERT INTO `book_character` (id, name, book_id)
VALUES (UUID_TO_BIN(UUID()), 'Sherlock Holmes', (SELECT id FROM `book` where title = 'The Adventures of Sherlock Holmes')),
       (UUID_TO_BIN(UUID()), 'Dr. John Watson', (SELECT id FROM `book` where title = 'The Adventures of Sherlock Holmes')),
       (UUID_TO_BIN(UUID()), 'Professor Moriarty', (SELECT id FROM `book` where title = 'The Adventures of Sherlock Holmes')),
       (UUID_TO_BIN(UUID()), 'Irene Adler', (SELECT id FROM `book` where title = 'The Adventures of Sherlock Holmes'));

INSERT INTO `book_character` (id, name, book_id)
VALUES (UUID_TO_BIN(UUID()), 'Nick Dunne', (SELECT id FROM `book` where title = 'Gone Girl')),
       (UUID_TO_BIN(UUID()), 'Amy Dunne', (SELECT id FROM `book` where title = 'Gone Girl')),
       (UUID_TO_BIN(UUID()), 'Detective Rhonda Boney', (SELECT id FROM `book` where title = 'Gone Girl')),
       (UUID_TO_BIN(UUID()), 'Desi Collings', (SELECT id FROM `book` where title = 'Gone Girl'));

INSERT INTO `book_character` (id, name, book_id)
VALUES (UUID_TO_BIN(UUID()), 'Michelle Obama', (SELECT id FROM `book` where title = 'Becoming')),
       (UUID_TO_BIN(UUID()), 'Barack Obama', (SELECT id FROM `book` where title = 'Becoming')),
       (UUID_TO_BIN(UUID()), 'Malia Obama', (SELECT id FROM `book` where title = 'Becoming')),
       (UUID_TO_BIN(UUID()), 'Sasha Obama', (SELECT id FROM `book` where title = 'Becoming'));

INSERT INTO `book_character` (id, name, book_id)
VALUES (UUID_TO_BIN(UUID()), 'Trevor Noah', (SELECT id FROM `book` where title = 'Born a Crime')),
       (UUID_TO_BIN(UUID()), 'Patricia Noah', (SELECT id FROM `book` where title = 'Born a Crime')),
       (UUID_TO_BIN(UUID()), 'Abel Noah', (SELECT id FROM `book` where title = 'Born a Crime')),
       (UUID_TO_BIN(UUID()), 'Richard Noah', (SELECT id FROM `book` where title = 'Born a Crime'));

INSERT INTO `book_character` (id, name, book_id)
VALUES (UUID_TO_BIN(UUID()), 'Alice', (SELECT id FROM `book` where title = "Alice's Adventures in Wonderland")),
       (UUID_TO_BIN(UUID()), 'The White Rabbit', (SELECT id FROM `book` where title = "Alice's Adventures in Wonderland")),
       (UUID_TO_BIN(UUID()), 'The Mad Hatter', (SELECT id FROM `book` where title = "Alice's Adventures in Wonderland")),
       (UUID_TO_BIN(UUID()), 'The Queen of Hearts', (SELECT id FROM `book` where title = "Alice's Adventures in Wonderland"));

INSERT INTO `book_character` (id, name, book_id)
VALUES (UUID_TO_BIN(UUID()), 'The Little Prince', (SELECT id FROM `book` where title = "The Little Prince")),
       (UUID_TO_BIN(UUID()), 'The Narrator', (SELECT id FROM `book` where title = "The Little Prince")),
       (UUID_TO_BIN(UUID()), 'The Rose', (SELECT id FROM `book` where title = "The Little Prince")),
       (UUID_TO_BIN(UUID()), 'The Fox', (SELECT id FROM `book` where title = "The Little Prince"));



