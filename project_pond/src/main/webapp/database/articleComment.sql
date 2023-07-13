drop table articleComment;
create table articleComment(
	comment_num VARCHAR(10) primary key,
	user_id VARCHAR(30) ,
    moon_num VARCHAR(10),
    comment_content VARCHAR(255) not null, 
	comment_createdAt timestamp default current_timestamp,
	comment_modifiedAt timestamp default current_timestamp ON UPDATE CURRENT_TIMESTAMP,
    `like` int,
    
    foreign key (user_id) references `user`(user_id) On delete set null,
   foreign key (moon_num) references fullmoon(moon_num) On delete set null
 
);

INSERT INTO articleComment(comment_num,user_id,moon_num,comment_content,`like`)
VALUES ("AC053","uid1","FM053","참여했습니다.",10);

select * from articleComment;