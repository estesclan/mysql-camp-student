select * from individual where lastName="Jennings";
select ID, lastName from individual where deceasedDate is not null;
select ID, lastName, birthDate from individual where year (BirthDate)>1940;
select * from individual where ID in (1,3,5,7,9);

select * from band where name like  'The%';
select * from band where name like '%Stones';
select * from individual where firstName like '__ck';
select * from band where name like '% and %';
select * from individual where firstName like '_im';
