create table trash(
   trashNo int auto_increment primary key
 , trashCategory varchar(20) not null
 , trashImage varchar(200) not null
 , trashName varchar(20) not null
 , trashHit int default 0
 , trashContents varchar(200) not null
 , trashDate datetime default now()
);

drop table trash;
select * from trash;