create table member (
	name varchar(10) not null,
	email varchar(30) not null,
	password1 varchar(10),
	password2 varchar(10) not null
	primary key(email)
) default CHARSET=utf-8;