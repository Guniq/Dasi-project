create table reply(
	replyNo int auto_increment primary key,
    communityNo int,
    replyWriter varchar(20) not null,
    replyContents varchar(200) not null,
    replyDate datetime default now(),
    
    foreign key(communityNo) references community(communityNo)    
);

drop table reply;
select * from reply;