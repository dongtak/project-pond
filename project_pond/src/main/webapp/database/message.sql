drop table message;
create table message(
	id VARCHAR(10) primary key,
    userId VARCHAR(20) ,
    content VARCHAR(50) not null,
    msgDate timestamp default current_timestamp,
	moonNum VARCHAR(10) not null,
    
    foreign key (userId) references `user`(id) On delete set null,
	foreign key(moonNum) references fullmoon(moonNum)
);

insert into message (id,content,userId)
values ("mgs123", "내용","id");
select * from message;