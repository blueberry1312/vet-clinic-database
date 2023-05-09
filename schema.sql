/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL
);

ALTER TABLE public.animals
ADD species VARCHAR(100):

CREATE TABLE owners (
    id serial PRIMARY KEY NOT NULL,
    full_name VARCHAR(60) NOT NULL,
    age INT NOT NULL
);

CREATE TABLE species (
    id serial PRIMARY KEY NOT NULL,
    name VARCHAR(30) NOT NULL
);

--Remove column species

ALTER TABLE animals 
DROP COLUMN species;

--Add column species_id referencing species table.

ALTER TABLE animals
ADD COLUMN species_id INT;

ALTER TABLE animals
ADD CONSTRAINT fkey_species
FOREIGN KEY (species_id) REFERENCES species(id);

--Add column owner_id referencing owners table.

ALTER TABLE animals
ADD COLUMN owner_id INT;

ALTER TABLE animals
ADD CONSTRAINT fkey_owner
FOREIGN KEY (owner_id) REFERENCES owners(id);

---

CREATE TABLE vets (
    id SERIAL PRIMARY KEY NOT NULL,
	name VARCHAR(50) NOT NULL,
	age INT NOT NULL,
	date_of_graduation DATE NOT NULL
);

CREATE TABLE specializations (
    id SERIAL PRIMARY KEY NOT NULL,
	vet_id INT REFERENCES vets(id),
	specie_id INT REFERENCES species(id)
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY NOT NULL,
	vet_id INT REFERENCES vets(id),
	animal_id INT REFERENCES animals(id),
	date_of_visit DATE NOT NULL
);

--------------------------------------------------------

ALTER TABLE animals ADD COLUMN visits_counter INT;

CREATE INDEX vet_index ON visits(vet_id);