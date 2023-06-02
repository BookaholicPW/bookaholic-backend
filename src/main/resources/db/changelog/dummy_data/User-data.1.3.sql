--liquibase formatted sql

--changeset Daria:4

--
-- Add new users
--


INSERT INTO `users` (id, avatar, bio, created_at, email, name, password, username_)
VALUES (UUID_TO_BIN(UUID()), "https://cdn4.iconfinder.com/data/icons/Birdies_by_arrioch/png%20128/pidgin.png",
        "Book lover. Enjoys hiking and painting.", 1677721600, "test0@gmail.com", "Emily Johnson",
        "$2a$10$xZviNHFiiTHh9rJsDIF2HeFUA.magKh8XqoTAoBLpuRtOCBs78Uxe", "emilyj");

INSERT INTO `users` (id, avatar, bio, created_at, email, name, password, username_)
VALUES (UUID_TO_BIN(UUID()),
        "https://cdn3.iconfinder.com/data/icons/animals-squad-1/128/animal_avatar_pet_creature_pig_character_cartoon-64.png",
        "Passionate reader. Enjoys playing guitar and cooking.", 1677808000, "test1@gmail.com", "Oliver Thompson",
        "$2a$10$jjmP6WsCE8YpT8USf39k9.SjUBklXKCQnzT7.SvV0qcPHb5ChVohq", "olivert");

INSERT INTO `users` (id, avatar, bio, created_at, email, name, password, username_)
VALUES (UUID_TO_BIN(UUID()),
        "https://cdn0.iconfinder.com/data/icons/avatar-basic-colors-doodle-1/91/Avatar__Basic_Doodle_C-66-64.png",
        "Loves reading and writing. Enjoys playing basketball and swimming.", 1677894400, "test2@gmail.com",
        "Sophia Wilson", "$2a$10$TqdozOdVC/7aMwlc1f74J.1ewB.gzh9iMOHwauMqR3rjCoVKaCdvC", "sophiaw");

INSERT INTO `users` (id, avatar, bio, created_at, email, name, password, username_)
VALUES (UUID_TO_BIN(UUID()),
        "https://cdn3.iconfinder.com/data/icons/animals-squad-1/128/gorilla_monkey_animal_pet_creature_avatar_character-64.png",
        "Bookworm. Enjoys painting and playing the piano.", 1677980800, "test3@gmail.com", "William Davis",
        "$2a$10$nBHLRfQuGcL45KLIOEWL1uvXlDJ5eqrw8lqzD9muvqBtZdw6wH0y.", "williamd");

INSERT INTO `users` (id, avatar, bio, created_at, email, name, password, username_)
VALUES (UUID_TO_BIN(UUID()), "https://cdn2.iconfinder.com/data/icons/animals-48/135/_monkey-64.png",
        "Loves reading mystery novels. Enjoys playing chess and hiking.", 1678067200, "test4@gmail.com", "Emma Garcia",
        "$2a$10$vh.iAjdIPJq2g42bG/7rn.Ik8dWwZabuAOfj5JuVYQud9kztVjf9S", "emmag");

INSERT INTO `users` (id, avatar, bio, created_at, email, name, password, username_)
VALUES (UUID_TO_BIN(UUID()), "https://cdn2.iconfinder.com/data/icons/animals-48/135/_wolf-64.png",
        "Enthusiastic reader. Enjoys cycling, painting, and photography.", 1678153600, "test5@gmail.com",
        "James Martinez", "$2a$10$x0hIoTc8aopQQqOFfreBx.2/PCtiSDe67WNEVLksSHzMesnYGC8uC", "jamesm");

INSERT INTO `users` (id, avatar, bio, created_at, email, name, password, username_)
VALUES (UUID_TO_BIN(UUID()), "https://example.com/avatar7.jpg",
        "Loves reading fantasy books. Enjoys playing video games.", 1678240000, "test6@gmail.com", "Ava Clark",
        "$2a$10$3GldfWV6ydh8d2o4KegYjeuLh4etALHvTjcRUKxyis/6CJvKhSX4O", "avaclark");

INSERT INTO `users` (id, avatar, bio, created_at, email, name, password, username_)
VALUES (UUID_TO_BIN(UUID()), "https://cdn2.iconfinder.com/data/icons/animals-48/135/_giraffe-64.png",
        "Book enthusiast. Enjoys painting and playing the guitar.", 1678326400, "test7@gmail.com", "Noah Adams",
        "$2a$10$VmrJd37gW5L95tcKb41gvemybhggzNr50eH3OQn6LoDjGuPxto91K", "noaha");

INSERT INTO `users` (id, avatar, bio, created_at, email, name, password, username_)
VALUES (UUID_TO_BIN(UUID()), "https://cdn4.iconfinder.com/data/icons/Birdies_by_arrioch/png%20128/firebird.png",
        "Passionate about literature. Enjoys writing short stories.", 1678412800, "test8@gmail.com",
        "Charlotte Collins", "$2a$10$t70eKK1lmmKQFH.5DOjgj.d044c1Hx.F4uyOB4PWSt/kNWFdiKr.m", "charlottec");

INSERT INTO `users` (id, avatar, bio, created_at, email, name, password, username_)
VALUES (UUID_TO_BIN(UUID()),
        "https://cdn1.iconfinder.com/data/icons/animal-avatars-1/60/Giraffe-animals-nature-wildlife-animal-avatars-64.png",
        "Bookworm. Enjoys hiking and playing the piano.", 1678499200, "test9@gmail.com", "Liam Rodriguez",
        "$2a$10$glXFVyxFLy57XT/k8PTV9OyKFEe2v3eso1cEu4pjkJH5qhJg2MBcy", "liamr");

INSERT INTO `users` (id, avatar, bio, created_at, email, name, password, username_)
VALUES (UUID_TO_BIN(UUID()),
        "https://cdn0.iconfinder.com/data/icons/funny-owl/90/funny_owlowlcute_owlfowlbirdanimal-29-64.png",
        "Loves reading and writing. Enjoys playing basketball and swimming.", 1678585600, "test10@gmail.com",
        "Mia Thomas", "$2a$10$2mdK7h3eBLEyfkTRKdsftOaxm.dEvy32sGiieqITt1iPcXodBaINa", "miat");

INSERT INTO `users` (id, avatar, bio, created_at, email, name, password, username_)
VALUES (UUID_TO_BIN(UUID()), "https://cdn2.iconfinder.com/data/icons/animals-48/135/_beaver-64.png",
        "Book lover. Enjoys hiking and painting.", 1678672000, "test11@gmail.com", "Jacob Walker",
        "$2a$10$oI5gFdNX.SC5zeAtMe2WPe1zHNzFqc57XSn7LmX6Mgxz7Odc6Ykjq", "jacobw");

INSERT INTO `users` (id, avatar, bio, created_at, email, name, password, username_)
VALUES (UUID_TO_BIN(UUID()), "https://cdn3.iconfinder.com/data/icons/cat-power-premium/120/cat_slippers-64.png",
        "Passionate reader. Enjoys playing guitar and cooking.", 1678758400, "test12@gmail.com", "Isabella Hill",
        "$2a$10$3l17DncwgZEAufQ2YSKrZOm69BSwnM2PS0cRN1UKYWyltzpyNmIK2", "isabellah");

INSERT INTO `users` (id, avatar, bio, created_at, email, name, password, username_)
VALUES (UUID_TO_BIN(UUID()), "https://cdn0.iconfinder.com/data/icons/strong-owl/675/owl-bird-08-11-64.png",
        "Loves reading and writing. Enjoys playing basketball and swimming.", 1678844800, "test13@gmail.com",
        "Ethan Green", "$2a$10$Umoo.ELNPe7Fc1Munwjgq.v7cyeuzRoZ3bvOjJZhLm1gPNHWfEccm", "ethang");

INSERT INTO `users` (id, avatar, bio, created_at, email, name, password, username_)
VALUES (UUID_TO_BIN(UUID()), "https://cdn4.iconfinder.com/data/icons/cartoon-animals-2/128/3-64.png",
        "Bookworm. Enjoys painting and playing the piano.", 1678931200, "test14@gmail.com", "Avery Mitchell",
        "$2a$10$JjFCVt8grmeG2f2VhGCLXuAGhXnlf/IR5f7bct29piVqL06ItOnBq", "averym");

INSERT INTO `users` (id, avatar, bio, created_at, email, name, password, username_)
VALUES (UUID_TO_BIN(UUID()),
        "https://cdn1.iconfinder.com/data/icons/animal-avatars-1/60/Cow-animals-nature-wildlife-animal-avatars-64.png",
        "Loves reading mystery novels. Enjoys playing chess and hiking.", 1679017600, "test15@gmail.com",
        "Benjamin Scott", "$2a$10$2zY6WYxKs/7q1s3oIEHRXeA3wVU0ayl2m13juN/6V2kvNRMpo52CO", "benjamins");

INSERT INTO `users` (id, avatar, bio, created_at, email, name, password, username_)
VALUES (UUID_TO_BIN(UUID()),
        "https://cdn4.iconfinder.com/data/icons/countoured-dachshound-dogs/100/dachshund_hunch-64.png",
        "Enthusiastic reader. Enjoys cycling, painting, and photography.", 1679104000, "test16@gmail.com",
        "Scarlett Wood", "$2a$10$py4vm61ZZIxPm1uWspE2juu/7GeDQ5k2rPgTSSsaPFmROMPltgQrW", "scarlettw");

INSERT INTO `users` (id, avatar, bio, created_at, email, name, password, username_)
VALUES (UUID_TO_BIN(UUID()), "https://cdn3.iconfinder.com/data/icons/cute-animals-2-1/50/91-64.png",
        "Loves reading fantasy books. Enjoys playing video games.", 1679190400, "test17@gmail.com", "Henry Turner",
        "$2a$10$GtBa2X9L.7s/2hF7SRJAYOmzsVGBXYXtl4uMqMqXXVsamcbo/dazm", "henryt");

INSERT INTO `users` (id, avatar, bio, created_at, email, name, password, username_)
VALUES (UUID_TO_BIN(UUID()),
        "https://cdn4.iconfinder.com/data/icons/countoured-dachshound-dogs/100/dachshund_run-64.png",
        "Book enthusiast. Enjoys painting and playing the guitar.", 1679276800, "test18@gmail.com", "Amelia Rogers",
        "$2a$10$QIhR8eSMlQG8b3.MDTBCK.tjD8F3eWnnnQAKG3d6OkUeiRVcbCrOi", "ameliar");

INSERT INTO `users` (id, avatar, bio, created_at, email, name, password, username_)
VALUES (UUID_TO_BIN(UUID()), "https://cdn3.iconfinder.com/data/icons/cat-power-premium/120/cat_foodlove-64.png",
        "Passionate about literature. Enjoys writing short stories.", 1679363200, "test19@gmail.com", "Daniel Foster",
        "$2a$10$vw.GtZlHHHnKJFvd873vauPE2qGzVPEeHFMeNQD44ZOl4peqRpkkm", "danielf");


