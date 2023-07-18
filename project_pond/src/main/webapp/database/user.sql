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