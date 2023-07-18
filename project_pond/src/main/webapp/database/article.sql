drop table `article`;
create table article(
	moon_num VARCHAR(10) primary key,
    admin_id VARCHAR(30) not null,
    article_title VARCHAR(50) not null,
    article_content VARCHAR(3000) not null,
    article_createAt timestamp default current_timestamp,
    
    foreign key(admin_id) references `admin`(admin_id),
	foreign key(moon_num) references fullmoon(moon_num)
);

INSERT INTO article (moon_num, admin_id, article_title, article_content)
VALUES 
('FM001', 'admin', '유기견 후원센터 모금', '왈왈 멍멍')



select * from article;
