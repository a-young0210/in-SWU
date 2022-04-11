create table menu (
	-- 로그인한 아이디
	id char(15) not null,
	-- 룰렛 횟수
	roulette int not null ,
	-- 당첨된 포인트
	point int not null,
	-- 마지막 로그인 날짜 : 로그인 시 바로 페이지 이동을 위해
	last char(20),
	primary key(id)
);