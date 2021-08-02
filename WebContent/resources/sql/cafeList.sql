create table cafeList (
		num int(10) not null
		id varchar(20) not null,
		name varchar(20) not null,
		pic1 varchar(30) not null,
		pic2 varchar(30) not null,
		pic3 varchar(30) not null,
		pic4 varchar(30) not null,
		cate varchar(10) not null,
		region varchar(10) not null,
		addr varchar(30) not null,
		phone varchar(20) not null,
		unitPrice varchar(10) not null,
		descrip TEXT not null,
		PRIMARY KEY (id)
)default CHARSET=utf8;
