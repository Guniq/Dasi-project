create table shop(
  shopNo int auto_increment primary key
, shopName varchar(20) not null
, shopLink varchar(200) not null
, shopImage varchar(200) 
, shopDate datetime default now()
);

drop table shop;
select * from shop;