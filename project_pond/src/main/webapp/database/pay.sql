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