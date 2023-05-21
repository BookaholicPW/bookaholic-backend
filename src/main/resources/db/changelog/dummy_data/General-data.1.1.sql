--liquibase formatted sql

--changeset Daria:2

--
-- Add new genres
--
insert into `genre` (id, name)
values (UUID_TO_BIN(UUID()), "Fantasy");
insert into `genre` (id, name)
values (UUID_TO_BIN(UUID()), "Horror");
insert into `genre` (id, name)
values (UUID_TO_BIN(UUID()), "Science fiction");
insert into `genre` (id, name)
values (UUID_TO_BIN(UUID()), "Romantic");
insert into `genre` (id, name)
values (UUID_TO_BIN(UUID()), "Thriller");
insert into `genre` (id, name)
values (UUID_TO_BIN(UUID()), "Historical fiction");
insert into `genre` (id, name)
values (UUID_TO_BIN(UUID()), "Crime fiction");
insert into `genre` (id, name)
values (UUID_TO_BIN(UUID()), "Detective");
insert into `genre` (id, name)
values (UUID_TO_BIN(UUID()), "Biographies");
insert into `genre` (id, name)
values (UUID_TO_BIN(UUID()), "Fairy tale");

--
-- Add new authors
--
insert into `author` (id, avatar, born, died, name, nationality, original_language)
values (UUID_TO_BIN(UUID()),
        "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Robert_Louis_Stevenson_by_Henry_Walter_Barnett_bw.jpg/800px-Robert_Louis_Stevenson_by_Henry_Walter_Barnett_bw.jpg",
        3782697600, 2674940800, "Robert Louis Stevenson", "Scottish", "English");
insert into `author` (id, avatar, born, died, name, nationality, original_language)
values (UUID_TO_BIN(UUID()), "https://www.granice.pl/sys6/pliki/bio/profile_pic/1d780ff2c5bd8460a8fd0996c5c4d6e0.jpg",
        2840198400, 817929600, "J.R.R. Tolkien", "British", "English");
insert into `author` (id, avatar, born, died, name, nationality, original_language)
values (UUID_TO_BIN(UUID()),
        "https://upload.wikimedia.org/wikipedia/commons/7/77/F%C3%A9lix_Nadar_1820-1910_portraits_Jules_Verne.jpg",
        4953244800, 2065776000, "Jules Verne", "French", "French");
insert into `author` (id, avatar, born, died, name, nationality, original_language)
values (UUID_TO_BIN(UUID()),
        "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Alexandre_Dumas.jpg/483px-Alexandre_Dumas.jpg",
        5498380800, 3508598400, "Alexandre Dumas", "French", "French");
insert into `author` (id, avatar, born, name, nationality, original_language)
values (UUID_TO_BIN(UUID()), "https://s.lubimyczytac.pl/upload/texts/14400/14477/14477_1600167274_grafika800x600.jpg",
        188861600, "J.K. Rowling", "British", "English");
insert into `author` (id, born, died, name, nationality, original_language)
values (UUID_TO_BIN(UUID()), 2181696000, 276844800, "C.S. Lewis", "British", "English");
insert into `author` (id, born, name, nationality, original_language)
values (UUID_TO_BIN(UUID()), 702518400, "Stephen King", "American", "English");
insert into `author` (id, born, died, name, nationality, original_language)
values (UUID_TO_BIN(UUID()), 5454163200, 4538822400, "Mary Shelley", "British", "English");
insert into `author` (id, born, died, name, nationality, original_language)
values (UUID_TO_BIN(UUID()), 1975440000, 632390400, "George Orwell", "British", "English");
insert into `author` (id, born, died, name, nationality, original_language)
values (UUID_TO_BIN(UUID()), 1455584000, 507878400, "Frank Herbert", "American", "English");
insert into `author` (id, born, died, name, nationality, original_language)
values (UUID_TO_BIN(UUID()), 1458403200, 703056000, "Isaac Asimov", "American", "English");
insert into `author` (id, born, name, nationality, original_language)
values (UUID_TO_BIN(UUID()), 896524800, "Paula Hawkins", "British", "English");
insert into `author` (id, born, name, nationality, original_language)
values (UUID_TO_BIN(UUID()), 1309296000, "Robert Ludlum", "American", "English");
insert into `author` (id, name, nationality, original_language)
values (UUID_TO_BIN(UUID()), "Alex Michaelides", "British-Cypriot", "English");
insert into `author` (id, born, died, name, nationality, original_language)
values (UUID_TO_BIN(UUID()), 6106060800, 4807315200, "Jane Austen", "British", "English");
insert into `author` (id, born, died, name, nationality, original_language)
values (UUID_TO_BIN(UUID()), 2173958400, 946406400, "F. Scott Fitzgerald", "American", "English");
insert into `author` (id, name, nationality, original_language)
values (UUID_TO_BIN(UUID()), "Khaled Hosseini", "Afghan-American", "English");
insert into `author` (id, born, died, name, nationality, original_language)
values (UUID_TO_BIN(UUID()), 4739078400, 3887443200, "Charlotte Bronte", "British", "English");
insert into `author` (id, born, died, name, nationality, original_language)
values (UUID_TO_BIN(UUID()), 12555532800, 11411040000, "William Shakespeare", "English", "English");
insert into `author` (id, born, name, nationality, original_language)
values (UUID_TO_BIN(UUID()), 477830400, "Diana Gabaldon", "American", "English");
insert into `author` (id, born, died, name, nationality, original_language)
values (UUID_TO_BIN(UUID()), 3618624000, 1253884800, "Arthur Conan Doyle", "British", "English");
insert into `author` (id, born, name, nationality, original_language)
values (UUID_TO_BIN(UUID()), 354883200, "Gillian Flynn", "American", "English");
insert into `author` (id, born, name, nationality, original_language)
values (UUID_TO_BIN(UUID()), 445948800, "Trevor Noah", "South African", "English");
insert into `author` (id, born, name, nationality, original_language)
values (UUID_TO_BIN(UUID()), 102727200, "Michelle Obama", "American", "English");
insert into `author` (id, born, died, name, nationality, original_language)
values (UUID_TO_BIN(UUID()), 2208201600, 835084800, "Antoine de Saint-Exupery", "French", "French");
insert into `author` (id, born, died, name, nationality, original_language)
values (UUID_TO_BIN(UUID()), 4543056000, 3078110400, "Lewis Carroll", "English", "English");


--
-- Add new books
--

--
-- Adventure
--
insert into `book` (id, description, published, pages, title, author_id)
values (UUID_TO_BIN(UUID()),
        "Treasure Island tells the thrilling tale of young Jim Hawkins, who sets sail for a treasure hunt, encountering pirates, including the cunning Long John Silver and the legendary Captain Flint.",
        2944416000, 240, "Treasure Island",
        (select id from `author` where name = "Robert Louis Stevenson"));

insert into `book` (id, description, published, pages, title, author_id)
values (UUID_TO_BIN(UUID()),
        "The Lord of the Rings is a grand epic that follows Frodo and his companions, Gandalf, Aragorn, and Sam, on a perilous journey to destroy the One Ring and save Middle-earth.",
        534950400, 1200, "The Lord of the Rings",
        (select id from `author` where name = "J.R.R. Tolkien"));

insert into `book` (id, description, published, pages, title, author_id)
values (UUID_TO_BIN(UUID()),
        "In Around the World in Eighty Days, Phileas Fogg and his loyal valet, Passepartout, race against time to circumnavigate the globe, encountering captivating adventures and colorful characters.",
        3060988800, 192, "Around the World in Eighty Days",
        (select id from `author` where name = "Jules Verne"));

insert into `book` (id, description, published, pages, title, author_id)
values (UUID_TO_BIN(UUID()),
        "The Count of Monte Cristo portrays Edmond Dantès, who, after unjust imprisonment, seeks vengeance against those who wronged him. With the help of Abbe Faria, he transforms into the enigmatic Count, unraveling a tale of love, betrayal, and retribution.",
        4110672000, 1200, "The Count of Monte Cristo",
        (select id from `author` where name = "Alexandre Dumas"));
--
-- Fantasy
--
insert into `book` (id, description, published, pages, title, author_id)
values (UUID_TO_BIN(UUID()),
        "Harry Potter and the Sorcerer''s Stone introduces young Harry Potter and his friends Hermione and Ron as they navigate the magical world, facing challenges and uncovering the truth about Harry''s past and his fateful encounter with Lord Voldemort.",
        867715200, 320, "Harry Potter and the Sorcerer's Stone",
        (select id from `author` where name = "J.K. Rowling"));

insert into `book` (id, description, published, pages, title, author_id)
values (UUID_TO_BIN(UUID()),
        "The Chronicles of Narnia: The Lion, the Witch and the Wardrobe follows the Pevensie siblings as they enter a magical wardrobe and discover the enchanted world of Narnia, where they encounter the majestic lion Aslan and the villainous White Witch.",
        630691200, 206, "The Chronicles of Narnia: The Lion, the Witch, and the Wardrobe",
        (select id from `author` where name = "C.S. Lewis"));

insert into `book` (id, description, published, pages, title, author_id)
values (UUID_TO_BIN(UUID()),
        "The Hobbit takes readers on Bilbo Baggins unexpected adventure with the wizard Gandalf and a group of dwarves, as they journey to reclaim the lost dwarf kingdom from the fearsome dragon Smaug, encountering the enigmatic Gollum along the way.",
        1063584000, 310, "The Hobbit",
        (select id from `author` where name = "J.R.R. Tolkien"));

--
-- Horror
--
insert into `book` (id, published, title, author_id)
values (UUID_TO_BIN(UUID()), 223065600, "The Shining", (select id from `author` where name = "Stephen King"));

insert into `book` (id, published, title, author_id)
values (UUID_TO_BIN(UUID()), 527865600, "It", (select id from `author` where name = "Stephen King"));

insert into `book` (id, published, title, author_id)
values (UUID_TO_BIN(UUID()), 544281600, "Frankenstein", (select id from `author` where name = "Mary Shelley"));

--
-- Science fiction
--
insert into `book` (id, description, published, title, author_id)
values (UUID_TO_BIN(UUID()),
        "In a dystopian society, Winston Smith rebels against the oppressive regime led by Big Brother, finding forbidden love and challenging the totalitarian control in a chilling tale of surveillance and thought manipulation.",
        628416000, "1984", (select id from `author` where name = "George Orwell"));

insert into `book` (id, description, published, title, author_id)
values (UUID_TO_BIN(UUID()),
        "Set in a distant future, Paul Atreides battles for control over the desert planet Arrakis, confronting political intrigue, mystical powers, and giant sandworms in a gripping saga of power, religion, and ecology.",
        134140800, "Dune", (select id from `author` where name = "Frank Herbert"));

insert into `book` (id, description, published, title, author_id)
values (UUID_TO_BIN(UUID()),
        "Hari Seldon''s science of psychohistory predicts the fall of the Galactic Empire, prompting him to establish the Foundation to preserve knowledge and guide humanity''s future amidst political upheavals and existential threats.",
        599644800, "Foundation", (select id from `author` where name = "Isaac Asimov"));

--
-- Thriller
--
insert into `book` (id, published, title, author_id)
values (UUID_TO_BIN(UUID()), 1421126400, "The Girl on the Train",
        (select id from `author` where name = "Paula Hawkins"));

insert into `book` (id, published, title, author_id)
values (UUID_TO_BIN(UUID()), 318240000, "The Bourne Identity", (select id from `author` where name = "Robert Ludlum"));

insert into `book` (id, published, title, author_id)
values (UUID_TO_BIN(UUID()), 1549315200, "The Silent Patient",
        (select id from `author` where name = "Alex Michaelides"));

--
-- Historical fiction
--
insert into `book` (id, description, published, title, author_id)
values (UUID_TO_BIN(UUID()),
        "Set in 19th-century England, Pride and Prejudice follows the spirited Elizabeth Bennet as she navigates societal expectations, misunderstandings, and her changing feelings for the enigmatic Mr. Darcy.",
        486278400, "Pride and Prejudice", (select id from `author` where name = "Jane Austen"));

insert into `book` (id, description, published, title, author_id)
values (UUID_TO_BIN(UUID()),
        "In the dazzling and decadent 1920s, Jay Gatsby''s pursuit of the elusive Daisy Buchanan unfolds through the eyes of narrator Nick Carraway, exposing the dark underbelly of the American Dream.",
        1330358400, "The Great Gatsby",
        (select id from `author` where name = "F. Scott Fitzgerald"));

insert into `book` (id, description, published, title, author_id)
values (UUID_TO_BIN(UUID()),
        "Set against the backdrop of war-torn Afghanistan, The Kite Runner tells the story of Amir''s journey of guilt and redemption, exploring themes of friendship, betrayal, and the power of forgiveness.",
        1054137600, "The Kite Runner", (select id from `author` where name = "Khaled Hosseini"));

--
-- Romantic
--
insert into `book` (id, description, published, title, author_id)
values (UUID_TO_BIN(UUID()),
        "Shakespeare''s tragic tale of forbidden love between Romeo Montague and Juliet Capulet, their feuding families, and the tragic consequences that unfold in Verona.",
        11675808000, "Romeo and Juliet", (select id from `author` where name = "William Shakespeare"));

insert into `book` (id, description, published, title, author_id)
values (UUID_TO_BIN(UUID()),
        "Jane Eyre''s journey from a neglected orphan to a strong-willed governess, her complex relationship with Mr. Rochester, and her search for love and independence in Victorian England.",
        4574784000, "Jane Eyre",
        (select id from `author` where name = "Charlotte Bronte"));

insert into `book` (id, description, published, title, author_id)
values (UUID_TO_BIN(UUID()),
        "Claire Randall, a World War II nurse, time-travels to 18th-century Scotland, where she encounters adventure, romance, and the charismatic Highlander Jamie Fraser in this epic historical and fantasy blend.",
        675158400, "Outlander", (select id from `author` where name = "Diana Gabaldon"));

--
-- Crime fiction
--
insert into `book` (id, description, published, title, author_id)
values (UUID_TO_BIN(UUID()),
        "Join the brilliant detective Sherlock Holmes and his loyal companion Dr. John Watson as they unravel intricate mysteries, match wits with adversaries, and navigate the dark underbelly of Victorian London.",
        2830464000, "The Adventures of Sherlock Holmes", (select id from `author` where name = "Arthur Conan Doyle"));

insert into `book` (id, description, published, title, author_id)
values (UUID_TO_BIN(UUID()),
        "When Amy Dunne mysteriously disappears on her wedding anniversary, her husband Nick becomes the prime suspect. In this psychological thriller, secrets, lies, and twists abound, blurring the lines between truth and perception.",
        1338892800, "Gone Girl",
        (select id from `author` where name = "Gillian Flynn"));

--
-- Biographies
--
insert into `book` (id, description, published, title, author_id)
values (UUID_TO_BIN(UUID()),
        "Michelle Obama, former First Lady of the United States, shares her inspiring journey from the South Side of Chicago to the White House, highlighting her triumphs, challenges, and commitment to empowering others.",
        1542076800, "Becoming", (select id from `author` where name = "Michelle Obama"));

insert into `book` (id, description, published, title, author_id)
values (UUID_TO_BIN(UUID()),
        "Comedian Trevor Noah shares his remarkable memoir about growing up in South Africa during apartheid, navigating racial and cultural challenges, and finding humor and resilience in the face of adversity.",
        1479168000, "Born a Crime",
        (select id from `author` where name = "Trevor Noah"));

--
-- Fairy Tale
--
insert into `book` (id, description, published, title, author_id)
values (UUID_TO_BIN(UUID()),
        "Lewis Carroll''s whimsical tale follows Alice as she falls down a rabbit hole into a fantastical world filled with peculiar characters, nonsensical riddles, and imaginative adventures.",
        2887776000, "Alice''s Adventures in Wonderland", (select id from `author` where name = "Lewis Carroll"));

insert into `book` (id, description, published, title, author_id)
values (UUID_TO_BIN(UUID()),
        "Antoine de Saint-Exupéry''s beloved novella tells the story of a young prince who travels from planet to planet, encountering unique individuals and imparting profound insights about life, love, and friendship.",
        836784000, "The Little Prince",
        (select id from `author` where name = "Antoine de Saint-Exupery"));
