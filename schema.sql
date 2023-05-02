
CREATE TABLE animals (
    id int GENERATED ALWAYS AS IDENTITY, 
    name varchar(30), 
    date_of_birth date, 
    escape_attempt int, 
    neutered boolean, 
    weight_kg float
);

ALTER TABLE animals ADD species VARCHAR(50);