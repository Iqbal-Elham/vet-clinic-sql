
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
CREATE TABLE specializations ( species_id int, vets_id int, primary key(species_id, vets_id), CONSTRAINT fk_species FOREIGN key(species_id) REFERENCES species(id), CONSTRAINT fk_vets FOREIGN key(vets_id) REFERENCES vets(id));
CREATE TABLE visits ( animals_id int, vets_id int, date_of_visit date,  CONSTRAINT fk_animals FOREIGN key(animals_id) REFERENCES animals(id), CONSTRAINT fk_vets FOREIGN key(vets_id) REFERENCES vets(id));
