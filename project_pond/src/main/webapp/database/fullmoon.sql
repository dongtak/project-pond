drop table `fullmoon`;
create table fullmoon (

	moon_num VARCHAR(10) primary key,
    admin_id VARCHAR(30) not null,
    moon_title VARCHAR(50) not null,
    moon_createAt timestamp default current_timestamp,
    moon_goal int not null,
    moon_donate int,
	moon_status int not null,
    message_cnt int,
	
    foreign key (admin_id) references `admin`(admin_id)
    
);



select * from fullmoon;