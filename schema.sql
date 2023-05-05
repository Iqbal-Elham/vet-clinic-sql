
CREATE TABLE animals (
    id int GENERATED ALWAYS AS IDENTITY, 
    name varchar(30), 
    date_of_birth date, 
    escape_attempt int, 
    neutered boolean, 
    weight_kg float
);

ALTER TABLE animals ADD species VARCHAR(50);

CREATE TABLE owners (id int primary key generated always as identity, full_name varchar(50), age int);
CREATE TABLE species (id int primary key generated always as identity,name varchar(50));

ALTER TABLE animals DROP column species;
ALTER TABLE animals ADD column species_id int;
ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id);
ALTER TABLE animals ADD column owner_id int;
ALTER TABLE animals ADD CONSTRAINT fk_owners FOREIGN KEY(owner_id) REFERENCES owners(id);

CREATE TABLE vets (id int primary key generated always as identity, name varchar(50), age int, date_of_graduation date);