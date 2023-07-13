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