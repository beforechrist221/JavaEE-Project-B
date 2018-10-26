drop database if exists db_b;
create database db_b;

-- user table
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

-- user_info table
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
  updateIp   varchar(255) comment 'last sign in IP address',
  userId     int comment 'user id FK'
)
  comment 'user info table';

-- product table
drop table if exists db_b.product;
create table db_b.product (
  id             int                     auto_increment primary key
  comment 'id PK',
  title          varchar(255)   not null
  comment '名称 NN',
  `desc`         text comment '描述',
  price          decimal(10, 2) not null
  comment '价格 NN',
  coverPicture   varchar(255)   not null
  comment '封面图片 NN',
  slidePictures  text           not null
  comment '幻灯图片组 NN',
  detailPictures text           not null
  comment '详情图片组 NN',
  spec           varchar(255)   not null
  comment '规格 NN',
  stock          int            not null
  comment '库存数量 NN',
  status         int            not null default 0
  comment '状态：0- 1- 2-',
  createTime     datetime       not null
  comment '创建时间 NN',
  updateTime     datetime comment '更新时间'
)
  comment 'product table';

-- category table
drop table if exists db_b.category;
create table db_b.category (
  id         int auto_increment primary key
  comment 'id PK',
  title      varchar(255) not null
  comment 'title NN',
  `desc`     varchar(255) not null
  comment 'describe NN',
  parentId   int comment 'parent category id NULL-',
  stutus     int default 0
  comment 'status 0-; 1-',
  createTime datetime     not null
  comment 'create time NN',
  updateTime datetime comment '更新时间'
)
  comment 'category table';

alter table db_b.user_info
  add constraint
  user_info_fk_userId
foreign key (userId)
references db_b.user (id);

select *
from db_b.user;

select *
from db_b.user_info;

select *
from db_b.product;

select *
from db_b.category;

select now();

-- String title, String desc, double price, String coverPicture, String slidePictures, String detailPictures, String spec, int stock, int status, String createTime, String updateTime