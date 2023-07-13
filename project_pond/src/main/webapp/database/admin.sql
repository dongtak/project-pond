drop table `admin`;
create table `admin`(
	admin_id VARCHAR(30) primary key,
	admin_pwd VARCHAR(30) not null,
    admin_name VARCHAR(10) not null,
    admin_auth VARCHAR(10) not null

);

insert into `admin` values ("admin", "pwd","동탁","moon");