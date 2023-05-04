
-- First Project

select * from animals where name like '%mon%';
select name from animals where date_of_birth between '2016-01-01' and '2019-12-30';
select name from animals where neutered = true and escape_attempt < 3;
select date_of_birth from animals where name in ('Agumon', 'Pikachu');
select name, escape_attempt from animals where weight_kg > 10.5;
select * from animals where neutered = 'true';
select * from animals where name != 'Gabumon';
select * from animals where weight_kg between 10.3 and 17.4;


-- Second Project

begin;
update animals set species = 'unspecified';
select * from animals;

rollback;
select * from animals;

UPDATE animals 
SET species = 'digimon'
WHERE name like '%mon%' ;
select * from animals;

UPDATE animals 
SET species = 'pokemon'
WHERE species is null;
select * from animals;

commit;

-- Transactions --

begin;
delete from animals;
select * from animals;

rollback;
select * from animals;

begin;
delete from animals 
where date_of_birth > '2022-01-01';

savepoint delete2022;

update animals set weight_kg = weight_kg * (-1);

rollback to delete2022;

update animals set weight_kg = weight_kg * (-1) where weight_kg < 0;
select * from animals;
commit ;

-- Aggregations -- 

select count(*) from animals;
select count (escape_attempt) from animals where escape_attempt = 0;
select avg(weight_kg) from animals;
select neutered, sum(escape_attempt) from animals group by neutered;
select species, min(weight_kg), max(weight_kg) from animals group by species;
select species, avg(escape_attempt) from animals where date_of_birth between '1990-01-01' AND '2000-12-31' group by species;

-- Joins --

select * from animals  join owners o on animals.owner_id = o.id and o.full_name='Melody Pond';
select * from animals join species s on animals.species_id = s.id and s.name='Pokemon';
select o.full_name, a.name from owners o left join animals a on a.owner_id =  o.id;
select s.name,  count(a.id) from animals a join species s on a.species_id = s.id group by s.name;
select a.name from  animals a join owners o on o.id = a.owner_id and o.full_name = 'Jennifer Orwell' join species s on o.id = a.species_id and s.name='Digimon';
select a.* from animals a join owners o on o.id = a.owner_id and o.full_name = 'Dean Winchester' and a.escape_attempt = 0;
select o.full_name, count(a.id) from animals a left join owners o on a.owner_id = o.id group by o.full_name order by count(a.id) desc limit 1;