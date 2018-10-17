drop database if exists db_b;
create database db_b;

drop table if exists db_b.user;
create table db_b.user (
  id       int auto_increment primary key
  comment 'id PK',
  email    varchar(255) not null unique
  comment 'email NN UN',
  password varchar(64)  not null
  comment 'password NN'
)
  comment 'user table';

drop table if exists db_b.user_info;
create table db_b.user_info (
  id         int          auto_increment primary key
  comment 'id PK',
  username   varchar(255) comment 'username',
  avatar     varchar(255) default 'default.png'
  comment 'avatar',
  mobile     varchar(255) comment 'mobile',
  createTime datetime comment 'sign up time',
  updateTime datetime comment 'last sign in time',
  userId     int comment 'user id FK'
)
  comment 'user info table';

alter table db_b.user_info
  add constraint
  user_info_fk_userId
foreign key (userId)
references db_b.user (id);

select *
from db_b.user;

select *
from db_b.user_info;