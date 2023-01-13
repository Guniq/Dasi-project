create table community(
  communityNo int auto_increment primary key
, communityTitle varchar(30) not null
, communityCategory varchar(20) not null
, communityContents varchar(200) not null
, communityImage varchar(200)
, communityWriter varchar(20) not null
, communityPw varchar(20) not null
, communityDate datetime default now() not null
);

drop table community;
select * from community;