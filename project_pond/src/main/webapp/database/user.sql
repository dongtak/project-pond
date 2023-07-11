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
('FM002', 'admin', 'Full Moon Project 2', 'This is the second full moon project.', 800, 400, 0, 15),
('FM003', 'admin', 'Full Moon Project 3', 'This is the third full moon project.', 300, 150, 0, 5),
('FM004', 'admin', 'Full Moon Project 4', 'This is the fourth full moon project.', 700, 300, 0, 12),
('FM005', 'admin', 'Full Moon Project 5', 'This is the fifth full moon project.', 1000, 500, 0, 20),
('FM006', 'admin', 'Full Moon Project 6', 'This is the sixth full moon project.', 400, 200, 0, 8),
('FM007', 'admin', 'Full Moon Project 7', 'This is the seventh full moon project.', 600, 300, 0, 11),
('FM008', 'admin', 'Full Moon Project 8', 'This is the eighth full moon project.', 900, 450, 0, 18),
('FM009', 'admin', 'Full Moon Project 9', 'This is the ninth full moon project.', 250, 100, 0, 3),
('FM010', 'admin', 'Full Moon Project 10', 'This is the tenth full moon project.', 1200, 600, 0, 25),
('FM011', 'admin', 'Full Moon Project 11', 'This is the 11th full moon project.', 700, 350, 0, 14),
('FM012', 'admin', 'Full Moon Project 12', 'This is the 12th full moon project.', 500, 250, 0, 9),
('FM013', 'admin', 'Full Moon Project 13', 'This is the 13th full moon project.', 800, 400, 0, 16),
('FM014', 'admin', 'Full Moon Project 14', 'This is the 14th full moon project.', 300, 150, 0, 7),
('FM015', 'admin', 'Full Moon Project 15', 'This is the 15th full moon project.', 600, 300, 0, 13),
('FM016', 'admin', 'Full Moon Project 16', 'This is the 16th full moon project.', 900, 450, 0, 21),
('FM017', 'admin', 'Full Moon Project 17', 'This is the 17th full moon project.', 250, 100, 0, 5),
('FM018', 'admin', 'Full Moon Project 18', 'This is the 18th full moon project.', 1000, 500, 0, 19),
('FM019', 'admin', 'Full Moon Project 19', 'This is the 19th full moon project.', 700, 350, 0, 10),
('FM020', 'admin', 'Full Moon Project 20', 'This is the 20th full moon project.', 500, 250, 0, 8),
('FM021', 'admin', 'Full Moon Project 21', 'This is the 21st full moon project.', 800, 400, 0, 15),
('FM022', 'admin', 'Full Moon Project 22', 'This is the 22nd full moon project.', 300, 150, 0, 4),
('FM023', 'admin', 'Full Moon Project 23', 'This is the 23rd full moon project.', 600, 300, 0, 12),
('FM024', 'admin', 'Full Moon Project 24', 'This is the 24th full moon project.', 900, 450, 0, 20),
('FM025', 'admin', 'Full Moon Project 25', 'This is the 25th full moon project.', 250, 100, 0, 6),
('FM026', 'admin', 'Full Moon Project 26', 'This is the 26th full moon project.', 1200, 600, 0, 24),
('FM027', 'admin', 'Full Moon Project 27', 'This is the 27th full moon project.', 700, 350, 0, 11),
('FM028', 'admin', 'Full Moon Project 28', 'This is the 28th full moon project.', 500, 250, 0, 9),
('FM029', 'admin', 'Full Moon Project 29', 'This is the 29th full moon project.', 800, 400, 0, 17),
('FM030', 'admin', 'Full Moon Project 30', 'This is the 30th full moon project.', 300, 150, 0, 6),
('FM031', 'admin', 'Full Moon Project 31', 'This is the 31st full moon project.', 600, 300, 0, 14),
('FM032', 'admin', 'Full Moon Project 32', 'This is the 32nd full moon project.', 900, 450, 0, 22),
('FM033', 'admin', 'Full Moon Project 33', 'This is the 33rd full moon project.', 250, 100, 0, 7),
('FM034', 'admin', 'Full Moon Project 34', 'This is the 34th full moon project.', 1000, 500, 0, 20),
('FM035', 'admin', 'Full Moon Project 35', 'This is the 35th full moon project.', 700, 350, 0, 12),
('FM036', 'admin', 'Full Moon Project 36', 'This is the 36th full moon project.', 500, 250, 0, 10),
('FM037', 'admin', 'Full Moon Project 37', 'This is the 37th full moon project.', 800, 400, 0, 18),
('FM038', 'admin', 'Full Moon Project 38', 'This is the 38th full moon project.', 300, 150, 0, 5),
('FM039', 'admin', 'Full Moon Project 39', 'This is the 39th full moon project.', 600, 300, 0, 13),
('FM040', 'admin', 'Full Moon Project 40', 'This is the 40th full moon project.', 900, 450, 0, 21),
('FM041', 'admin', 'Full Moon Project 41', 'This is the 41st full moon project.', 250, 100, 0, 5),
('FM042', 'admin', 'Full Moon Project 42', 'This is the 42nd full moon project.', 1200, 600, 0, 23),
('FM043', 'admin', 'Full Moon Project 43', 'This is the 43rd full moon project.', 700, 350, 0, 10),
('FM044', 'admin', 'Full Moon Project 44', 'This is the 44th full moon project.', 500, 250, 0, 9),
('FM045', 'admin', 'Full Moon Project 45', 'This is the 45th full moon project.', 800, 400, 0, 16),
('FM046', 'admin', 'Full Moon Project 46', 'This is the 46th full moon project.', 300, 150, 0, 6),
('FM047', 'admin', 'Full Moon Project 47', 'This is the 47th full moon project.', 600, 300, 0, 15),
('FM048', 'admin', 'Full Moon Project 48', 'This is the 48th full moon project.', 900, 450, 0, 25),
('FM049', 'admin', 'Full Moon Project 49', 'This is the 49th full moon project.', 250, 100, 0, 7),
('FM050', 'admin', 'Full Moon Project 50', 'This is the 50th full moon project.', 1000, 500, 0, 21),
('FM051', 'admin', 'Full Moon Project 51', 'This is the 51st full moon project.', 700, 350, 0, 13),
('FM052', 'admin', 'Full Moon Project 52', 'This is the 52nd full moon project.', 500, 250, 0, 11),
('FM053', 'admin', 'Full Moon Project 53', 'This is the 53rd full moon project.', 800, 400, 0, 20),
('FM054', 'admin', 'Full Moon Project 54', 'This is the 54th full moon project.', 300, 150, 0, 8),
('FM055', 'admin', 'Full Moon Project 55', 'This is the 55th full moon project.', 600, 300, 0, 17),
('FM056', 'admin', 'Full Moon Project 56', 'This is the 56th full moon project.', 900, 450, 0, 28),
('FM057', 'admin', 'Full Moon Project 57', 'This is the 57th full moon project.', 250, 100, 0, 8),
('FM058', 'admin', 'Full Moon Project 58', 'This is the 58th full moon project.', 1200, 600, 0, 26),
('FM059', 'admin', 'Full Moon Project 59', 'This is the 59th full moon project.', 700, 350, 0, 12),
('FM060', 'admin', 'Full Moon Project 60', 'This is the 60th full moon project.', 500, 250, 0, 10),
('FM061', 'admin', 'Full Moon Project 61', 'This is the 61st full moon project.', 800, 400, 0, 19),
('FM062', 'admin', 'Full Moon Project 62', 'This is the 62nd full moon project.', 300, 150, 0, 7),
('FM063', 'admin', 'Full Moon Project 63', 'This is the 63rd full moon project.', 600, 300, 0, 16),
('FM064', 'admin', 'Full Moon Project 64', 'This is the 64th full moon project.', 900, 450, 0, 27),
('FM065', 'admin', 'Full Moon Project 65', 'This is the 65th full moon project.', 250, 100, 0, 9),
('FM066', 'admin', 'Full Moon Project 66', 'This is the 66th full moon project.', 1000, 500, 0, 24),
('FM067', 'admin', 'Full Moon Project 67', 'This is the 67th full moon project.', 700, 350, 0, 14),
('FM068', 'admin', 'Full Moon Project 68', 'This is the 68th full moon project.', 500, 250, 0, 12),
('FM069', 'admin', 'Full Moon Project 69', 'This is the 69th full moon project.', 800, 400, 0, 23),
('FM070', 'admin', 'Full Moon Project 70', 'This is the 70th full moon project.', 300, 150, 0, 9),
('FM071', 'admin', 'Full Moon Project 71', 'This is the 71st full moon project.', 600, 300, 0, 18),
('FM072', 'admin', 'Full Moon Project 72', 'This is the 72nd full moon project.', 900, 450, 0, 30),
('FM073', 'admin', 'Full Moon Project 73', 'This is the 73rd full moon project.', 250, 100, 0, 10),
('FM074', 'admin', 'Full Moon Project 74', 'This is the 74th full moon project.', 1200, 600, 0, 28),
('FM075', 'admin', 'Full Moon Project 75', 'This is the 75th full moon project.', 700, 350, 0, 13),
('FM076', 'admin', 'Full Moon Project 76', 'This is the 76th full moon project.', 500, 250, 0, 11),
('FM077', 'admin', 'Full Moon Project 77', 'This is the 77th full moon project.', 800, 400, 0, 22),
('FM078', 'admin', 'Full Moon Project 78', 'This is the 78th full moon project.', 300, 150, 0, 8),
('FM079', 'admin', 'Full Moon Project 79', 'This is the 79th full moon project.', 600, 300, 0, 19);

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
('FM001', 'admin', '유기견 후원센터 모금', '왈왈 멍멍'),
('FM002', 'admin', '어린이 봉사활동', '꺄르륵'),
('FM003', 'admin', '산불화재 모금', '타닥 화르르'),
('FM004', 'admin', '생필품 후원 모금', '모여봐요'),
('FM005', 'admin', '학대아동 지원 모금', '아이들을 지켜주세요'),
('FM006', 'admin', '어린이 봉사활동', '꺄르륵'),
('FM007', 'admin', '산불화재 모금', '타닥 화르르'),
('FM008', 'admin', '생필품 후원 모금', '모여봐요'),
('FM009', 'admin', '유기견 후원센터 모금', '왈왈 멍멍'),
('FM010', 'admin', '어린이 봉사활동', '꺄르륵'),
('FM011', 'admin', '산불화재 모금', '타닥 화르르'),
('FM012', 'admin', '생필품 후원 모금', '모여봐요'),
('FM013', 'admin', '학대아동 지원 모금', '아이들을 지켜주세요'),
('FM014', 'admin', '어린이 봉사활동', '꺄르륵'),
('FM015', 'admin', '산불화재 모금', '타닥 화르르'),
('FM016', 'admin', '생필품 후원 모금', '모여봐요'),
('FM017', 'admin', '유기견 후원센터 모금', '왈왈 멍멍'),
('FM018', 'admin', '어린이 봉사활동', '꺄르륵'),
('FM019', 'admin', '산불화재 모금', '타닥 화르르'),
('FM020', 'admin', '생필품 후원 모금', '모여봐요'),
('FM021', 'admin', '학대아동 지원 모금', '아이들을 지켜주세요'),
('FM022', 'admin', '어린이 봉사활동', '꺄르륵'),
('FM023', 'admin', '산불화재 모금', '타닥 화르르'),
('FM024', 'admin', '생필품 후원 모금', '모여봐요'),
('FM025', 'admin', '유기견 후원센터 모금', '왈왈 멍멍'),
('FM026', 'admin', '어린이 봉사활동', '꺄르륵'),
('FM027', 'admin', '산불화재 모금', '타닥 화르르'),
('FM028', 'admin', '생필품 후원 모금', '모여봐요'),
('FM029', 'admin', '학대아동 지원 모금', '아이들을 지켜주세요'),
('FM030', 'admin', '어린이 봉사활동', '꺄르륵'),
('FM031', 'admin', '산불화재 모금', '타닥 화르르'),
('FM032', 'admin', '생필품 후원 모금', '모여봐요'),
('FM033', 'admin', '유기견 후원센터 모금', '왈왈 멍멍'),
('FM034', 'admin', '어린이 봉사활동', '꺄르륵'),
('FM035', 'admin', '산불화재 모금', '타닥 화르르'),
('FM036', 'admin', '생필품 후원 모금', '모여봐요'),
('FM037', 'admin', '학대아동 지원 모금', '아이들을 지켜주세요'),
('FM038', 'admin', '어린이 봉사활동', '꺄르륵'),
('FM039', 'admin', '산불화재 모금', '타닥 화르르'),
('FM040', 'admin', '생필품 후원 모금', '모여봐요'),
('FM041', 'admin', '유기견 후원센터 모금', '왈왈 멍멍'),
('FM042', 'admin', '어린이 봉사활동', '꺄르륵'),
('FM043', 'admin', '산불화재 모금', '타닥 화르르'),
('FM044', 'admin', '생필품 후원 모금', '모여봐요'),
('FM045', 'admin', '학대아동 지원 모금', '아이들을 지켜주세요'),
('FM046', 'admin', '어린이 봉사활동', '꺄르륵'),
('FM047', 'admin', '산불화재 모금', '타닥 화르르'),
('FM048', 'admin', '생필품 후원 모금', '모여봐요'),
('FM049', 'admin', '유기견 후원센터 모금', '왈왈 멍멍'),
('FM050', 'admin', '어린이 봉사활동', '꺄르륵'),
('FM051', 'admin', '산불화재 모금', '타닥 화르르'),
('FM052', 'admin', '생필품 후원 모금', '모여봐요'),
('FM053', 'admin', '학대아동 지원 모금', '아이들을 지켜주세요'),
('FM054', 'admin', '어린이 봉사활동', '꺄르륵'),
('FM055', 'admin', '산불화재 모금', '타닥 화르르'),
('FM056', 'admin', '생필품 후원 모금', '모여봐요'),
('FM057', 'admin', '유기견 후원센터 모금', '왈왈 멍멍'),
('FM058', 'admin', '어린이 봉사활동', '꺄르륵'),
('FM059', 'admin', '산불화재 모금', '타닥 화르르'),
('FM060', 'admin', '생필품 후원 모금', '모여봐요'),
('FM061', 'admin', '학대아동 지원 모금', '아이들을 지켜주세요'),
('FM062', 'admin', '어린이 봉사활동', '꺄르륵'),
('FM063', 'admin', '산불화재 모금', '타닥 화르르'),
('FM064', 'admin', '생필품 후원 모금', '모여봐요'),
('FM065', 'admin', '유기견 후원센터 모금', '왈왈 멍멍'),
('FM066', 'admin', '어린이 봉사활동', '꺄르륵'),
('FM067', 'admin', '산불화재 모금', '타닥 화르르'),
('FM068', 'admin', '생필품 후원 모금', '모여봐요'),
('FM069', 'admin', '학대아동 지원 모금', '아이들을 지켜주세요'),
('FM070', 'admin', '어린이 봉사활동', '꺄르륵'),
('FM071', 'admin', '산불화재 모금', '타닥 화르르'),
('FM072', 'admin', '생필품 후원 모금', '모여봐요'),
('FM073', 'admin', '유기견 후원센터 모금', '왈왈 멍멍'),
('FM074', 'admin', '어린이 봉사활동', '꺄르륵'),
('FM075', 'admin', '산불화재 모금', '타닥 화르르'),
('FM076', 'admin', '생필품 후원 모금', '모여봐요'),
('FM077', 'admin', '학대아동 지원 모금', '아이들을 지켜주세요'),
('FM078', 'admin', '어린이 봉사활동', '꺄르륵'),
('FM079', 'admin', '산불화재 모금', '타닥 화르르');


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

truncate article;
select * from articleComment;






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




