create schema tableau
;


create table football_standings
	(
	some_id integer
	,team_name varchar(14)
	,gameweek_number integer
	,points integer
	,goal_difference integer
	)
;

insert into football_standings
	values ('17','LIVERPOOL','1','3','4'),
	('18','CHELSEA','1','0','-3'),
	('19','MANCHESTERCITY','1','0','-1'),
	('20','ARSENAL','1','3','2'),
	('21','LIVERPOOL','2','6','5'),
	('22','CHELSEA','2','1','-2'),
	('23','MANCHESTERCITY','2','3','2'),
	('24','ARSENAL','2','4','2'),
	('25','LIVERPOOL','3','7','5'),
	('26','CHELSEA','3','2','-2'),
	('27','MANCHESTERCITY','3','6','4'),
	('28','ARSENAL','3','4','-3')
;
