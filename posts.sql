use backend;

create table user (
	id int primary key AUTO_INCREMENT,
    username varchar(100) unique,
    password varchar(100),
    firstname varchar(40),
    lastname varchar(40)
);

create table todos (
	id int primary key AUTO_INCREMENT,
    user_id int ,
    todo varchar(100),
    deadline datetime,
    checks boolean,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

-- 2
create database banking;
use banking;
create table user (
    id int primary key AUTO_INCREMENT,
    username varchar(40) unique not null,
    password varchar(40) not null
);
create table types (
    id int primary key AUTO_INCREMENT,
    type varchar(40) not null unique
);
create table wallet (
    id int primary key AUTO_INCREMENT,
    user_id int ,
    FOREIGN key (user_id) REFERENCES user(id),
    name_wallet varchar(40) not null,
    type_id int,
    FOREIGN key (type_id) REFERENCES types(id)
);
create table giver_and_recipient (
    id int primary key AUTO_INCREMENT,
    giver_id int ,
    FOREIGN key (giver_id) REFERENCES wallet(id),
    recipient_id int,
    FOREIGN key (recipient_id) REFERENCES wallet(id)
);

create table statement (
    id int primary key AUTO_INCREMENT,
    wallet_id int ,
    FOREIGN key (wallet_id) REFERENCES wallet(id),
    revenue int not null,
    expenses int not null,
    remaining int not null,
    create_at datetime,
    giver_and_recipient_id int,
    FOREIGN key (giver_and_recipient_id) REFERENCES giver_and_recipient(id)
)
ALTER TABLE `banking`.`statement` 
CHANGE COLUMN `create_at` `create_at` DATETIME NULL DEFAULT DEFAULT 'CURRENT_TIMESTAMP' ;

 