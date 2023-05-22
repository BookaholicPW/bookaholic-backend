--liquibase formatted sql

--changeset Daria:1

insert into `genre` (id, name)
values (UUID_TO_BIN(UUID()), "Adventures");

insert into `author` (id, born, died, name, nationality, original_language)
values (UUID_TO_BIN(UUID()), 1657526400, 1271836800, "Mark Twain", "American", "English");

insert into `book` (id, published, title, author_id)
values (UUID_TO_BIN(UUID()), 204249600, "The Adventures of Tom Sawyer",
        (select id from `author` where name = "Mark Twain"));
