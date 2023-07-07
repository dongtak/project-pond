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
    createdAt timestamp,
    modifiedAt timestamp,
    adminId VARCHAR(20),
    
    foreign key(adminId) references `admin`(id)

);



insert into `article` (id, title,content,adminId,createdAt,modifiedAt)
values ("abc123", "유기견 후원센터 모금","왈왈 멍멍","admin",sysdate(),sysdate());
select * from article;

drop table `fullmoon`;
create table fullmoon (

	moonNum VARCHAR(10) primary key,
    title VARCHAR(50) not null,
    content VARCHAR(50),
    createdAt timestamp,
    goal int not null,
    donation int not null,
	donationId varchar(25) not null,
    adminId VARCHAR(20) not null,
    
    foreign key (adminId) references `admin`(id)
    
);

insert into fullmoon (moonNum, title, content,createdAt, goal,donation,donationId,adminId)
values ("보름달번호123","보름달 제목입니다","보름달 내용입니다",sysdate(),256000,12200,"보름달결제번호","admin");
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

create table articleComment(
	id int primary key,
    articleId VARCHAR(20) not null,
    userId VARCHAR(20) not null,
    content VARCHAR(255),
	createdAt timestamp,
    modifiedAt timestamp,
    
    foreign key (articleId) references article(id),
    foreign key (userId) references `user`(id)
    
);

INSERT INTO articleComment (id,articleId,userId,content)
VALUES (1234,"abc123","id","내용");

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
    payday timestamp,
    
    foreign key (userId) references `user` (id),
    foreign key (moonNum) references fullmoon (moonNum)
   
);

drop table message;
create table message(
	id VARCHAR(10) primary key,
    userId VARCHAR(20) not null,
    content VARCHAR(50) not null,
    msgDate timestamp not null,
    
    foreign key (userId) references `user`(id)

);

insert into message (id,content,userId)
values ("mgs123", "내용","id");
select * from message;




