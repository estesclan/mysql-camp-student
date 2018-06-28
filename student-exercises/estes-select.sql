select * from individual where lastName="Jennings";
select ID, lastName from individual where deceasedDate is not null;
select ID, lastName, birthDate from individual where year (BirthDate)>1940;
select * from individual where ID in (1,3,5,7,9);