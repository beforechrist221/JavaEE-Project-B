drop database if exists db_b;
create database db_b;

drop table if exists db_b.user;
create table db_b.user (
  id       int auto_increment primary key
  comment 'id PK',
  email    varchar(255) not null unique
  comment 'email NN UN',
  username varchar(255) not null
  comment 'username NN',
  password varchar(255) not null
  comment 'password NN'
)
  comment 'user table';

select *
from db_b.user;