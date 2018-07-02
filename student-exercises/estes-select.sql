select * from individual where lastName="Jennings";
select ID, lastName from individual where deceasedDate is not null;
select ID, lastName, birthDate from individual where year (BirthDate)>1940;
select * from individual where ID in (1,3,5,7,9);

select * from band where name like  'The%';
select * from band where name like '%Stones';
select * from individual where firstName like '__ck';
select * from band where name like '% and %';
select * from individual where firstName like '_im';

select individual.lastName as 'Rocker', birthDate 
from individual 
where lastName like'C%' 
order by birthDate desc;

SELECT count(band.name)
FROM band
WHERE yearFormed = 1960;

SELECT count(band.name) as 'Bands Still Together'
FROM band
WHERE isTogether = 1;

SELECT genre, count(*) as 'count'
FROM band
GROUP BY genre
ORDER BY count desc;

SELECT band.name, count(individualBand.bandID) as 'Number of Band Members'
FROM individualBand INNER JOIN band 
ON individualBand.bandID = band.ID
GROUP BY band.name
ORDER BY band.name;

SELECT concat(firstName, ' ', lastName) as 'Full Name'
FROM individual;








