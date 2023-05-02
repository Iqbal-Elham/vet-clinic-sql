

select * from animals where name like '%mon%';
select name from animals where date_of_birth between '2016-01-01' and '2019-12-30';
select name from animals where neutered = true and escape_attempt < 3;
select date_of_birth from animals where name in ('Agumon', 'Pikachu');
select name, escape_attempt from animals where weight_kg > 10.5;
select * from animals where neutered = 'true';
select * from animals where name != 'Gabumon';
select * from animals where weight_kg between 10.3 and 17.4;