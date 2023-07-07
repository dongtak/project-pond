CREATE database goodsGoods;
use goodsGoods;
drop database goodsGoods;

drop table `admin`;
create table `admin`(
	id VARCHAR(20) primary key,
	pwd VARCHAR(100) not null

);
insert into `admin` (id,pwd)
values ("admin", "pwd");

drop table `article`;
create table article(
	id VARCHAR(20) primary key,
    title VARCHAR(50) not null,
    content VARCHAR(3000) not null,
    createdAt timestamp default current_timestamp,
    modifiedAt timestamp default current_timestamp on update current_timestamp,
    adminId VARCHAR(20),
    
    foreign key(adminId) references `admin`(id)

);



insert into `article` (id, title,content,adminId)
values
("abc124", "유기견 후원센터 모금","왈왈 멍멍","admin"),
("abc125", "어린이 봉사활동","꺄르륵","admin"),
("abc126", "산불화재 모금","타닥 화르르","admin"),
("abc127", "생필품 후원 모금","모여봐요","admin")

;
select * from article;

drop table `fullmoon`;
create table fullmoon (

	moonNum VARCHAR(10) primary key,
    title VARCHAR(50) not null,
    content VARCHAR(50),
    createdAt timestamp default current_timestamp,
    goal int not null,
    donation int not null,
	donationId varchar(25) not null,
    adminId VARCHAR(20) not null,
    
    foreign key (adminId) references `admin`(id)
    
);

insert into fullmoon (moonNum, title, content, goal,donation,donationId,adminId)
values ("보름달번호123","보름달 제목입니다","보름달 내용입니다",256000,12200,"보름달결제번호","admin");
select * from fullmoon;


drop table `user`;
create table `user`(

	id VARCHAR(20) primary key,
	pwd VARCHAR(20) not null,
	`name` VARCHAR(25) not null,
    email VARCHAR(50) ,
   birth int not null,
   phone VARCHAR(20),
   address VARCHAR(100),
   `rank` int
);
insert into `user` (id,pwd,`name`,birth,phone,address)
values ("id","pwd", "성이름",977777,01012345678,"뉴욕시 맨해튼구 센트럴파크");
DELETE FROM user WHERE id="조장";
select * from `user`;

drop table donateList;
create table donateList(
	userId VARCHAR(20) primary key,
    moonNum VARCHAR(10) not null,
    
    foreign key (userId) references `user` (id),
    foreign key (moonNum) references fullmoon (moonNum)
);

insert into donateList(userId,moonNum)
values ("id","보름달번호123");
select * from donateList;

drop table articleComment;
create table articleComment(
	id int primary key auto_increment,
    articleId VARCHAR(20) ,
    userId VARCHAR(20) ,
    content VARCHAR(255),
	createdAt timestamp default current_timestamp,
    modifiedAt timestamp default current_timestamp ON UPDATE CURRENT_TIMESTAMP,
    
    foreign key (articleId) references article(id),
    foreign key (userId) references `user`(id)
    
);

INSERT INTO articleComment (articleId,userId,content)
VALUES ("abc123","id","내용");

    select * from articleComment;



drop table `payInfo`;
create table payInfo (
	userId VARCHAR(20) primary key,
    cardName VARCHAR(20) not null,
    cardNum VARCHAR(20) not null,
    cardPwd VARCHAR(2) not null,
    cardExpire VARCHAR(4) not null,
    
    foreign key (userId) references `user` (id)

);

drop table payment;
create table payment(
	userId VARCHAR(20) primary key,
    moonNum VARCHAR(10) not null,
    cost int not null,
    payday timestamp default current_timestamp,
    
    foreign key (userId) references `user` (id),
    foreign key (moonNum) references fullmoon (moonNum)
   
);

drop table message;
create table message(
	id VARCHAR(10) primary key,
    userId VARCHAR(20) not null,
    content VARCHAR(50) not null,
    msgDate timestamp default current_timestamp,

    
    foreign key (userId) references `user`(id)

);

insert into message (id,content,userId)
values ("mgs123", "내용","id");
select * from message;




