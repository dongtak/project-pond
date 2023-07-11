CREATE database goodsGoods;
use goodsGoods;
drop database goodsGoods;

drop table `admin`;
create table `admin`(
	admin_id VARCHAR(30) primary key,
	admin_pwd VARCHAR(30) not null,
    admin_name VARCHAR(10) not null,
    admin_auth VARCHAR(10) not null

);

insert into `admin` values ("admin", "pwd","동탁","moon");


drop table `fullmoon`;
create table fullmoon (

	moon_num VARCHAR(10) primary key,
    admin_id VARCHAR(30) not null,
    moon_title VARCHAR(50) not null,
    moon_content VARCHAR(100) not null,
    moon_createAt timestamp default current_timestamp,
    moon_goal int not null,
    moon_donate int,
	moon_status int not null,
    message_cnt int,
	 
    foreign key (admin_id) references `admin`(admin_id)
    
);

INSERT INTO fullmoon (moon_num, admin_id, moon_title, moon_content, moon_goal, moon_donate, moon_status, message_cnt)
VALUES 
('FM001', 'admin', 'Full Moon Project 1', 'This is the first full moon project.', 500, 200, 1, 10),
('FM002', 'admin', 'Full Moon Project 2', 'This is the second full moon project.', 1000, 800, 0, 20),
('FM003', 'admin', 'Full Moon Project 3', 'This is the third full moon project.', 750, 600, 0, 5),
('FM004', 'admin', 'Full Moon Project 4', 'This is the fourth full moon project.', 300, 100, 0, 15);

select * from fullmoon;

drop table `article`;
create table article(
	moon_num VARCHAR(10) primary key,
    admin_id VARCHAR(30) not null,
    article_title VARCHAR(50) not null,
    article_content VARCHAR(3000) not null,
    article_createAt timestamp default current_timestamp,
    article_modifiedAt timestamp default current_timestamp on update current_timestamp,
    
    foreign key(admin_id) references `admin`(admin_id),
	foreign key(moon_num) references fullmoon(moon_num)
);

INSERT INTO article (moon_num, admin_id, article_title, article_content)
VALUES 
('FM001', 'admin', "유기견 후원센터 모금","왈왈 멍멍"),
('FM002', 'admin', "어린이 봉사활동","꺄르륵"),
('FM003', 'admin', "산불화재 모금","타닥 화르르"),
('FM004', 'admin', "생필품 후원 모금","모여봐요");

select * from article;


drop table `user`;
create table `user`(

	user_id VARCHAR(30) primary key,
	user_pwd VARCHAR(30) not null,
	user_name VARCHAR(20) not null,
    user_email VARCHAR(30) unique not null ,
	user_birth int not null,
	user_phone VARCHAR(20) unique not null,
	user_addr VARCHAR(100) not null
   
);

-- create
INSERT INTO `user` (user_id, user_pwd, user_name, user_email, user_birth, user_phone, user_addr)
VALUES ('uid1', 'pwd1', '유저1', 'uid1@gmail.com', 1999, '010-0000-0001', '서울시 강남구'),
       ('uid2', 'pwd2', '유저2', 'uid2@gmail.com', 1999, '010-0000-0002', '서울시 종로구'),
       ('uid3', 'pwd3', '유저3', 'uid3@gmail.com', 1999, '010-0000-0003', '부산시 해운대구'),
       ('uid4', 'pwd4', '유저4', 'uid4@gmail.com', 1999, '010-0000-0004', '인천시 남동구'),
       ('uid5', 'pwd5', '유저5', 'uid5@gmail.com', 1999, '010-0000-0005', '대구시 중구'),
       ('uid6', 'pwd6', '유저6', 'uid6@gmail.com', 1999, '010-0000-0006', '광주시 동구'),
       ('uid7', 'pwd7', '유저7', 'uid7@gmail.com', 1999, '010-0000-0007', '대전시 서구'),
       ('uid8', 'pwd8', '유저8', 'uid8@gmail.com', 1999, '010-0000-0008', '충청북도 청주시'),
       ('uid9', 'pwd9', '유저9', 'uid9@gmail.com', 1999, '010-0000-0009', '경상북도 포항시'),
       ('uid10', 'pwd10', '유저10', 'uid10@gmail.com', 1999, '010-0000-0010', '전라남도 목포시');

-- read
SELECT * FROM `user`;

-- update
UPDATE `user` SET user_name="홍길동" WHERE user_id="uid10";

-- delete
DELETE FROM `user` WHERE user_id="uid10";


drop table `cardInfo`;
create table cardInfo (
	card_num VARCHAR(30) primary key,
	user_id VARCHAR(30) not null,
    card_name VARCHAR(30) not null,
    card_pwd int not null,
    card_expire DATE not null,
    
    foreign key (user_id) references `user` (user_id)

);
-- create
INSERT INTO cardInfo VALUES('1000','uid1','신한',10,'2028-01-01');
INSERT INTO cardInfo VALUES('1001','uid2','국민',10,'2028-01-01');
INSERT INTO cardInfo VALUES('1002','uid3','하나',12,'2028-01-01');
INSERT INTO cardInfo VALUES('1003','uid4','농협',28,'2028-01-01');
INSERT INTO cardInfo VALUES('1004','uid5','신한',75,'2028-01-01');
INSERT INTO cardInfo VALUES('1005','uid6','하나',21,'2028-01-01');
INSERT INTO cardInfo VALUES('1006','uid7','카카오',55,'2028-01-01');
INSERT INTO cardInfo VALUES('1007','uid8','농협',64,'2028-01-01');
INSERT INTO cardInfo VALUES('1008','uid9','신한',17,'2028-01-01');
INSERT INTO cardInfo VALUES('1009','uid1','국민',95,'2028-01-01');

-- read
SELECT * FROM cardInfo;

-- update
UPDATE cardInfo SET card_name = "은행" WHERE card_num="1009";

-- delete
DELETE FROM cardInfo WHERE card_num="1009"; 

drop table pay;
create table pay(
	pay_num VARCHAR(10) primary key,
	card_num VARCHAR(30) ,
    user_id VARCHAR(30),
    moon_num VARCHAR(10) not null,
	`name` VARCHAR(20),
    message VARCHAR(100),
    pay_money int not null,
    pay_day timestamp default current_timestamp,
    
	foreign key (card_num) references `cardInfo` (card_num) on delete set null,
    foreign key (user_id) references `user` (user_id) on delete set null
   
);


drop table articleComment;
create table articleComment(
	comment_num VARCHAR(10) primary key,
	user_id VARCHAR(30) ,
    moon_num VARCHAR(10),
    comment_content VARCHAR(255) not null, 
	comment_createdAt timestamp default current_timestamp,
	comment_modifiedAt timestamp default current_timestamp ON UPDATE CURRENT_TIMESTAMP,
    `like` int,
    
    foreign key (user_id) references `user`(user_id) On delete set null
    
);

INSERT INTO articleComment VALUES ("abc124","id","내용");

truncate articleComment;
select * from articleComment;







--안쓰는거 

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




