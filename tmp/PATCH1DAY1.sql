use online_cinema;


# Удаляем не нужоные таблицы.
drop table film_to_subscription;
drop table subscription_to_user;
drop table subscriptions;
drop table film_to_order;
drop table orders;
drop table films_tmp;


#Создаём таблицу для новостей. (Зачем - непонятно)
create table if not exists news (
id INT AUTO_INCREMENT PRIMARY KEY,
title varchar(80),
contain_text varchar(10000)
);

rename table genres_to_film To genres_to_games;
rename table studio_to_film to studio_to_games;
rename table films to games;

alter table genres_to_games RENAME column idfilm to idgame;
alter table studio_to_games rename column idfilm to idgame;

drop table productions;
drop table persons;

alter table critic_review rename column idfilm to idgame;
alter table ratings rename column idfilm to idgame;

alter table users ADD column isVerificied tinyint;
alter table news add column iduser INT;
alter table news ADD CONSTRAINT `fk_from_ver_users` 
FOREIGN KEY (`iduser`)
REFERENCES `users` (`iduser`);

drop table posts;

drop view films_of_genre;
drop view film_production;
drop view user_library;
drop view film_information;
drop database online_cinema;
