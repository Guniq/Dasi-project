create table member (
  memberNo int primary key auto_increment
, memberId varchar(20) not null
, memberPw varchar(100) not null
, memberImage varchar(200)
, memberName varchar(20) not null
, memberDate datetime default now()
, unique key(memberId)
);
drop table member;
select * from member;