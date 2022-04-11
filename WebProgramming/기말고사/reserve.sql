create table reserve (
	num int not null auto_increment,
	choice varchar(20),
	adult int,
	child int,
	price int,
	regist_day date,
	primary key(num)
);